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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import {  Driver, ON, MatchPattern } from '@ohos.UiTest'
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import fs from '@ohos.file.fs'

let testContext: common.UIAbilityContext;

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
        expect(true).assertTrue();
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
          expect(true).assertTrue();
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
          expect(true).assertTrue();
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
          expect(true).assertTrue();
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
        expect(true).assertTrue();
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
          expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVACY_TYPE_PUBLIC
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVACY_TYPE_PUBLIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0100', 2, async (done: Function) => {
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
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions, AudioRendererOptions, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0200
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVACY_TYPE_PUBLIC
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVACY_TYPE_PUBLIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0200', 2, async (done: Function) => {
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
      await getFd("capture_js-44100-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions, AudioRendererOptions, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0300
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_PUBLIC&PUBLIC
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_PUBLIC&PUBLIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0300', 2, async (done: Function) => {
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
      await getFd("capture_js-44100-2C-1S32LE_2.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0400
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_PUBLIC&PRIVATE
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_PUBLIC&PRIVATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0400', 2, async (done: Function) => {
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
      await getFd("capture_js-44100-2C-1S32LE_3.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0500
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVATE&PRIVATE
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_PRIVATE&PRIVATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0500', 2, async (done: Function) => {
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
      await getFd("capture_js-44100-2C-1S32LE_4.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0600
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_RINGTONE
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0600', 2, async (done: Function) => {
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
      await getFd("capture_js-44100-2C-1S32LE_5.pcm");
      await recPromise1(audioCapturerOptions, AudioRendererOptions1, AudioRendererOptions2, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0700
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_NO_Renderer_Create
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_NO_Renderer_Create
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0700', 2, async (done: Function) => {
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

      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise2(audioCapturerOptions, filePath, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0800
     * @tc.name      : SOURCE_TYPE_PLAYBACK_CAPTURER_NO_Renderer_Start
     * @tc.desc      : SOURCE_TYPE_PLAYBACK_CAPTURER_NO_Renderer_Start
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_INNER_CAPTURER_PROMISE_0800', 2, async (done: Function) => {
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
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise3(audioCapturerOptions, AudioRendererOptions, done);
      await sleep(100);
      await closeFileDescriptor(PLAY_FILE);
      done();
    })
  })
}