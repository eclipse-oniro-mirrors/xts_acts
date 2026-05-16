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
import fileio from '@ohos.fileio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {  Driver, ON, MatchPattern } from '@ohos.UiTest'
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import fs from '@ohos.file.fs'

let testContext: common.UIAbilityContext;
let audioManager: audio.AudioManager;
let TagFrmwk: string = "AudioPlaybackCapturerTest";

async function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export default function audioCapturer() {

  describe('AudioPlaybackCapturer', () => {
    let Tag: string = 'AudioPlaybackCapturerTest';
    const PLAY_FILE:string = 'pcm_48ksr_32kbr_2ch.wav';
    let file_to_play:ESObject;
    let filePath: string;
    let dirPath: string;
    let LE24 = -1;
    let LE32 = -1;
    let sleep = (ms: number): Promise<ESObject> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
    beforeAll(async () => {
      await getAudioManager();
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      await getFullFilePath(PLAY_FILE);
      console.info('TestLog: Start Testing AudioPlaybackCapturer Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag} AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(() => {
      console.info(`${Tag} AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      console.info(`${Tag} AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
    })
    let closeFileDescriptor = async (fileName: string) => {
      try {
        testContext.resourceManager.closeRawFdSync(fileName);
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`closeRawFd failed, error code: ${code}, message: ${message}.`);
      }
    }
    let getFd = async (fileName: string) => {
      dirPath = testContext.filesDir + '/' + fileName;
      console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
    }
    let getFullFilePath = async (filename:string)=> {
      file_to_play =  testContext.filesDir + '/' + filename;
      console.info(`${Tag} file_to_play: `+ file_to_play);
    }
    let playbackPromise = async (AudioRendererOptions: ESObject, pathName: string) => {
      let resultFlag = false;
      let audioRen: ESObject;
      let isPass = false;
      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag}: AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioRender Created : ERROR : ${err.message}`);
        resultFlag = false;
      });
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      console.info(`${Tag}: AudioRenderer : STATE : ${audioRen.state}`);

      await audioRen.start().then(() => {
        console.info(`${Tag}: renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${Tag}: AudioRenderer : STATE : ${audioRen.state}`);

      let bufferSize: ESObject;
      await audioRen.getBufferSize().then((data: ESObject) => {
        console.info(`${Tag}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });
      let musicFile = fs.openSync(file_to_play, fs.OpenMode.READ_ONLY);
      let ss = fileio.fdopenStreamSync(musicFile.fd, 'r');
      console.info(`${Tag}:case 2:AudioFrameworkRenderLog: File Path: ${JSON.stringify(ss)}`);
      let discardHeader = new ArrayBuffer(44);
      console.info(`${Tag}:case 2-1:AudioFrameworkRenderLog: File Path: `);
      ss.readSync(discardHeader);
      console.info(`${Tag}:case 2-2:AudioFrameworkRenderLog: File Path: `);
      let totalSize = fs.statSync(musicFile.fd).size;
      console.info(`${Tag}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${Tag}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let readSync = 0
      while (rlen < totalSize) {
        let buf = new ArrayBuffer(bufferSize);
        readSync = ss.readSync(buf);
        if (readSync <= 0) {
          console.info(`${Tag}:BufferAudioFramework: readSync: ${readSync}`);
          break;
        }
        rlen += readSync;
        console.info(`${Tag}:BufferAudioFramework: bytes read from file: ${rlen}`);
        await audioRen.write(buf);
      }
      fs.closeSync(musicFile);
      ss.closeSync();
      console.info(`${Tag}: Renderer after read`);
      await audioRen.drain().then(() => {
        console.info(`${Tag}: Renderer drained : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.error(`${Tag}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${Tag}: AudioRenderer : STATE : ${audioRen.state}`);

      await audioRen.stop().then(() => {
        console.info(`${Tag}: Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${Tag}: AudioRenderer : STATE : ${audioRen.state}`);

      await audioRen.release().then(() => {
        console.info(`${Tag}: Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${Tag}: AudioRenderer : STATE : ${audioRen.state}`);
      return resultFlag;
    }
    let recPromise =
      async (AudioCapturerOptions: audio.AudioCapturerOptions, AudioRendererOptions: audio.AudioRendererOptions,
        pathName: string, done: Function) => {
        let audioCap: audio.AudioCapturer;
        try {
          audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        } catch (err) {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
          LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
          LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
          let sampleFormat: ESObject = AudioCapturerOptions.streamInfo.sampleFormat;
          if ((sampleFormat === LE24 || sampleFormat === LE32) && err.code === 202) {
            done();
            return;
          }
          expect(false).assertTrue();
          done();
          return;
        }

        try {
          let audioParamsGet: audio.AudioStreamInfo = await audioCap.getStreamInfo();
          if (audioParamsGet != undefined && audioParamsGet != null) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap.start();
          console.log(`${Tag} start ok`);
          await playbackPromise(AudioRendererOptions, pathName);

          let bufferSize: number = await audioCap.getBufferSize();
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
          let capturerFile = fs.openSync(dirPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND | fs.OpenMode.CREATE);
          let fd = capturerFile.fd;
          console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
          if (fd !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
            expect(false).assertTrue();
          }
          let numBuffersToCapture = 20;
          while (numBuffersToCapture) {
            console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
            let buffer: ESObject = await audioCap.read(bufferSize, true);
            console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
            let number = fileio.writeSync(fd, buffer);
            console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
            numBuffersToCapture--;
          }
          console.log(`${Tag} read ok`);
          await audioCap.stop();
          console.log(`${Tag} stop ok`);
        } catch (err) {
          console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap.release();
          console.log(`${Tag} release ok`);
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        done();
      }
    let recPromise1 =
      async (AudioCapturerOptions: ESObject, AudioRendererOptions1: ESObject, AudioRendererOptions2: ESObject,
        pathName: string, done: Function) => {
        let audioCap: audio.AudioCapturer;
        try {
          audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        } catch (err) {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
          LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
          LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
          let sampleFormat: ESObject = AudioCapturerOptions.streamInfo.sampleFormat;
          if ((sampleFormat === LE24 || sampleFormat == LE32) && err.code === 202) {
            done();
            return;
          }
          expect(false).assertTrue();
          done();
          return;
        }

        try {
          let audioParamsGet = await audioCap.getStreamInfo();
          if (audioParamsGet != undefined && audioParamsGet != null) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }

        try {
          let audioParamsGet = await audioCap.getCapturerInfo();
          if (audioParamsGet != undefined) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap.start();
          console.log(`${Tag} start ok`);
          playbackPromise(AudioRendererOptions1, pathName);
          playbackPromise(AudioRendererOptions2, pathName);

          let bufferSize = await audioCap.getBufferSize();
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
          let capturerFile = fs.openSync(dirPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND | fs.OpenMode.CREATE);
          let fd = capturerFile.fd;
          console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
          if (fd !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
            expect(false).assertTrue();
          }
          let numBuffersToCapture = 20;
          while (numBuffersToCapture) {
            console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
            let buffer = await audioCap.read(bufferSize, true);
            console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
            let number = fileio.writeSync(fd, buffer);
            console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
            numBuffersToCapture--;
          }
          console.log(`${Tag} read ok`);
          await audioCap.stop();
          console.log(`${Tag} stop ok`);
        } catch (err) {
          console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap.release();
          console.log(`${Tag} release ok`);
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        done();
      }
    let recPromise2 = async (AudioCapturerOptions: ESObject, pathName: string, done: Function) => {
      let audioCap: audio.AudioCapturer;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
      } catch (err) {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat: ESObject = AudioCapturerOptions.streamInfo.sampleFormat;
        if ((sampleFormat === LE24 || sampleFormat == LE32) && err.code === 202) {
          done();
          return;
        }
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let audioParamsGet = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let audioParamsGet = await audioCap.getCapturerInfo();
        if (audioParamsGet != undefined) {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap.start();
        console.log(`${Tag} start ok`);
        let bufferSize = await audioCap.getBufferSize();
        console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
        let capturerFile = fs.openSync(dirPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND | fs.OpenMode.CREATE);
        let fd = capturerFile.fd;
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 20;
        while (numBuffersToCapture) {
          console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
          let buffer = await audioCap.read(bufferSize, true);
          console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
          let number = fileio.writeSync(fd, buffer);
          console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
          numBuffersToCapture--;
        }
        console.log(`${Tag} read ok`);
        await audioCap.stop();
        console.log(`${Tag} stop ok`);
      } catch (err) {
        console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCap.release();
        console.log(`${Tag} release ok`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    }
    let recPromise3 = async (AudioCapturerOptions: ESObject, AudioRendererOptions: ESObject, done: Function) => {
      let audioCap: audio.AudioCapturer;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
      } catch (err) {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat: ESObject = AudioCapturerOptions.streamInfo.sampleFormat;
        if ((sampleFormat === LE24 || sampleFormat == LE32) && err.code === 202) {
          done();
          return;
        }
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let audioParamsGet = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }

      try {
        let audioParamsGet = await audioCap.getCapturerInfo();
        if (audioParamsGet != undefined) {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCap.start();
        console.log(`${Tag} start ok`);
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
          let audioRen = data;
          console.log(`${Tag} audioRen Create Success: ${JSON.stringify(audioRen)}`);
        }).catch((err: BusinessError) => {
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
          expect(false).assertTrue();
          done();
        })
        let bufferSize = await audioCap.getBufferSize();
        console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
        let capturerFile = fs.openSync(dirPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND | fs.OpenMode.CREATE);
        let fd = capturerFile.fd;
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 20;
        while (numBuffersToCapture) {
          console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
          let buffer = await audioCap.read(bufferSize, true);
          console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
          let number = fileio.writeSync(fd, buffer);
          console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
          numBuffersToCapture--;
        }
        console.log(`${Tag} read ok`);
        await audioCap.stop();
        console.log(`${Tag} stop ok`);
      } catch (err) {
        console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCap.release();
        console.log(`${Tag} release ok`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVACY_TYPE_PUBLIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MEDIA]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions, AudioRendererOptions, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0200
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVACY_TYPE_PUBLIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MOVIE]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PRIVATE
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-44100-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions, AudioRendererOptions, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0300
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_PUBLIC&PUBLIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MUSIC, audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo1: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo1: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType1: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions1: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo1,
        rendererInfo: AudioRendererInfo1,
        privacyType: AudioPrivacyType1
      }

      let AudioStreamInfo2: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo2: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }
      let AudioPrivacyType2: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions2: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo2,
        rendererInfo: AudioRendererInfo2,
        privacyType: AudioPrivacyType2
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-44100-2C-1S32LE_2.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0400
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_PUBLIC&PRIVATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_ALARM, audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo1: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo1: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }
      let AudioPrivacyType1: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions1: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo1,
        rendererInfo: AudioRendererInfo1,
        privacyType: AudioPrivacyType1
      }

      let AudioStreamInfo2: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo2: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }
      let AudioPrivacyType2: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PRIVATE
      }

      let AudioRendererOptions2: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo2,
        rendererInfo: AudioRendererInfo2,
        privacyType: AudioPrivacyType2
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-44100-2C-1S32LE_3.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0500
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVATE&PRIVATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_RINGTONE, audio.StreamUsage.STREAM_USAGE_NOTIFICATION]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo1: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo1: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }
      let AudioPrivacyType1: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PRIVATE
      }

      let AudioRendererOptions1: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo1,
        rendererInfo: AudioRendererInfo1,
        privacyType: AudioPrivacyType1
      }

      let AudioStreamInfo2: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo2: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let AudioPrivacyType2: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PRIVATE
      }

      let AudioRendererOptions2: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo2,
        rendererInfo: AudioRendererInfo2,
        privacyType: AudioPrivacyType2
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-44100-2C-1S32LE_4.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0600
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_RINGTONE]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo1: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo1: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      let AudioPrivacyType1: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions1: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo1,
        rendererInfo: AudioRendererInfo1,
        privacyType: AudioPrivacyType1
      }
      let AudioStreamInfo2: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo2: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let AudioPrivacyType2: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions2: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo2,
        rendererInfo: AudioRendererInfo2,
        privacyType: AudioPrivacyType2
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-44100-2C-1S32LE_5.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0700
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_NO_Renderer_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MEDIA]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise2(audioCapturerOptions, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0800
     * @tc.desc   SOURCE_TYPE_PLAYBACK_CAPTURER_NO_Renderer_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MEDIA]
        }
      }
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig,
      }

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }

      let flag: boolean = false;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          flag = true;
          expect(flag).assertEqual(true);
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise3(audioCapturerOptions, AudioRendererOptions, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0001
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: []
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0002
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_MONO
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_UNKNOWN]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0003
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0003
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MEDIA]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0004
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0004
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MUSIC]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0005
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0005
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0006
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0006
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0007
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0007
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_SURROUND
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_ALARM]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0008
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0008
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0009
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0009
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0010
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0010
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_RINGTONE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0011
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0011
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_NOTIFICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0012
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0012
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0013
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0013
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MOVIE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0014
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0014
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_GAME]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0015
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0015
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_NAVIGATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0016
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0016
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0017
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0017
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0018
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0018
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0019
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0019
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0020
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0020
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0021
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0021
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0022
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0022
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0023
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0023
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0024
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0024
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0025
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0025
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0026
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0026
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0027
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0027
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0028
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0028
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0029
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0029
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0030
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0030
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0031
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0031
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0032
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0032
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0033
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0033
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0034
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0034
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0035
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0035
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0036
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0036
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0037
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0037
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0038
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0038
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0039
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0039
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0040
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0040
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0041
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0041
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0042
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0042
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_10POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0043
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0043
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0044
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0044
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0045
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0045
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0046
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0046
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0047
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0047
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0048
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0048
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

        /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0049
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0049
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_AUDIOBOOK]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          done();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0050
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0050
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: []
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0051
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0051
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_MONO
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_UNKNOWN]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0052
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0052
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MEDIA]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0053
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0053
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MUSIC]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0054
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0054
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0055
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0055
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {  
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
         console.log(`${Tag} error code: ${err.code} ,message:${err.message}`); 
         expect(Number(err.code)).assertEqual(501);
         done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0056
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0056
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_SURROUND
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_ALARM]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
         console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0057
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0057
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0058
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0058
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0059
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0059
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_RINGTONE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0060
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0060
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_NOTIFICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0061
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0061
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_MOVIE]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0062
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0062
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0063
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0063
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_GAME]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0064
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0064
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_NAVIGATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0065
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0065
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0066
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0066
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0067
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0067
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0068
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0068
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0069
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0069
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0070
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0070
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0071
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0071
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0072
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0072
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0073
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0073
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0074
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0074
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0075
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0075
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0076
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0076
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0077
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0077
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0078
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0078
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0079
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0079
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0080
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0080
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0081
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0081
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0082
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0082
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0083
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0083
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0084
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0084
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0085
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0085
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0086
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0086
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0087
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0087
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0088
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0088
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0089
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0089
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0090
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0090
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0091
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0091
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_10POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0092
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0092
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0093
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0093
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0094
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0094
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0095
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0095
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0096
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0096
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0097
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0097
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
         expect(Number(err.code)).assertEqual(501);
        done();
      }

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0098
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0098
     * @tc.desc   CreateAudioCapturer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let playbackCaptureConfig: audio.AudioPlaybackCaptureConfig = {
        filterOptions: {
          usages: [audio.StreamUsage.STREAM_USAGE_AUDIOBOOK]
        }
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo,
        playbackCaptureConfig: playbackCaptureConfig
      }
      let audioCapPromise: ESObject = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.error(`AudioCapturer Created : Error: ${err}`);
            done();
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data.release();
            done();
          }
          done();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(501);
        done();
      }
      done();
    })
  })
}