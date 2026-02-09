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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs'
import { Hypium } from '../../../hypium/index';
import { WriteOptions, ReadOptions } from '@ohos.file.fs'
import { Callback } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'

let audioManager: audio.AudioManager;
let testContext: common.UIAbilityContext | undefined;

interface renderInfoType {
  MUSIC: renderInfoChild,
  VOICE_CALL: renderInfoChild,
  RINGTONE: renderInfoChild,
  VOICE_ASSISTANT: renderInfoChild,
  ALARM: renderInfoChild,
  ACCESSIBILITY: renderInfoChild,
  SPEECH: renderInfoChild,
  MOVIE: renderInfoChild,
  UNKNOW: renderInfoChild,
  VOICE_MESSAGE: renderInfoChild,
  GAME: renderInfoChild,
  NAVIGATION: renderInfoChild,
  NOTIFICATION: renderInfoChild,
}

interface renderInfoChild {
  usage: number,
  rendererFlags: number
}

export default function audioCapturer() {
  describe('audioCapturer', () => {
    let Tag: string = 'AudioCapturer';
    let dirPath: string = "";
    let bufferSize: long;
    let LE24: number = -1;
    let LE32: number = -1;
    let markReachState: string = 'unknow';
    let periodReachState: string = 'unknow';
    const CREATE_EVENT: string = 'create';
    const START_EVENT: string = 'start';
    const GET_BUFFERSIZE_EVENT: string = 'get_buffersize';
    const READ_EVENT: string = 'read';
    const STOP_EVENT: string = 'stop';
    const RELEASE_EVENT: string = 'release';
    const STATE_CHANGE_EVENT: string = 'on_state_change';
    const MARK_REACH_EVENT: string = 'on_mark_reach';
    const OFF_MARK_REACH_EVENT: string = 'off_mark_reach'
    const PERIODR_REACH_EVENT: string = 'on_period_reach';
    const OFF_PERIODR_REACH_EVENT: string = 'off_period_reach';
    const END_EVENT: string = 'end';
    const GET_AUDIOTIME_EVENT: string = 'getAudioTime';
    const GET_CAPTURERINFO_EVENT: string = 'getCapturerInfo';
    const GET_STREAMINFO_EVENT: string = 'getStreamInfo';
    const GET_AUDIOSCENE_EVENT: string = 'getAudioScene';
    const ERROR_EVENT: string = 'error';
    const AUDIOMANAGERREC = audio.getAudioManager()

    let renderInfo: renderInfoType = {
      MUSIC: {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
      },
      VOICE_CALL: {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      },
      RINGTONE: {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0,
      },
      VOICE_ASSISTANT: {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      },
      ALARM: {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      },
      ACCESSIBILITY: {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      },
      SPEECH: {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      },
      MOVIE: {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      },
      UNKNOW: {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      },
      VOICE_MESSAGE: {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      },
      GAME: {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      },
      NAVIGATION: {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      },
      NOTIFICATION: {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
    }

    let getFd = async (fileName: string) => {
      dirPath = testContext!.filesDir + '/' + fileName;
      console.info(`${Tag} getFd dirPath is  ${JSON.stringify(dirPath)}`);
    }

    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      console.info('beforeAll called')
    })
    afterAll(() => {
      console.info('afterAll called')
    })

    beforeEach(() => {
      console.info('beforeEach called')
    })

    afterEach(() => {
      console.info('afterEach called')
    })

    let recPromise =
      async (AudioCapturerOptions: audio.AudioCapturerOptions, AudioRendererOptions: audio.AudioRendererOptions, done: () => void) => {
        let audioCap: audio.AudioCapturer | null = null;
        try {
          audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
           console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        } catch (err) {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
          LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
          LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
          let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
          if ((sampleFormat === LE24 || sampleFormat === LE32) && err.code === 202) {
            done();
            return new Promise<void>((resolve, reject) => {
              resolve(undefined);
            });
          }
          expect(false).assertTrue();
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
        try {
          let audioParamsGet = await audioCap!.getStreamInfo();
          if (audioParamsGet != undefined && audioParamsGet != null) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }

        try {
          let audioParamsGet = await audioCap!.getCapturerInfo();
          if (audioParamsGet != undefined) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap!.start();
          console.log(`${Tag} start ok`);
          let bufferSize = await audioCap!.getBufferSize();
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
          let fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          console.log(`${fileSync} fd: ${JSON.stringify(fileSync)}`);
          if (fileSync !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
            expect(false).assertTrue();
          }

          fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
          console.log(`${Tag} fd-re: ${JSON.stringify(fileSync)}`);
          if (fileSync !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
            expect(false).assertTrue();
          }
          await audioCap!.stop();
          console.log(`${Tag} stop ok`);
        } catch (err) {
          console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap!.release();
          console.log(`${Tag} release ok`);
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        done();
      }

    let recCapturerPromise4 = async (AudioCapturerOptions: audio.AudioCapturerOptions, fileName: string, done: () => void) => {
      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} recCapturerPromise4 Created : Success`);
      } catch (err) {
        console.info(`${Tag} recCapturerPromise4 Created : ERROR :  ${JSON.stringify(err.message)}`);
        let S16LE = audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE;
        let S24LE = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let S32LE = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let F32LE = audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE;
        let sampleFormat = AudioCapturerOptions.streamInfo.sampleFormat;
        if ((sampleFormat === S16LE || sampleFormat == S24LE || sampleFormat == S32LE || sampleFormat == F32LE)
          && err.code === 202) {
          console.info(`${Tag} recCapturerPromise4 err.code === 202`);
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
        // expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      try {
        let capturerDirPath = testContext!.filesDir + '/' + fileName;
        console.info(`${Tag} recCapturerPromise4 capturerDirPath is  ${JSON.stringify(capturerDirPath)}`);
        let capturerFile = fs.openSync(capturerDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

        let fd = capturerFile.fd;
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} recCapturerPromise4: file fd created`);
          expect(true).assertTrue();
        } else {
          console.info(`${Tag} recCapturerPromise4: Capturer start : ERROR `);
          expect(false).assertTrue();
          fs.close(capturerFile);
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }

        let bufferSize: long = 0;
        let readDataCallback = (buffer: ArrayBuffer) => {
          let options: WriteOptions = {
            offset: bufferSize,
            length: buffer.byteLength
          }
          fs.writeSync(fd, buffer, options);
          bufferSize += buffer.byteLength;
        };
        audioCap!.onReadData(readDataCallback);

        if (audioCap === undefined) {
          console.info(`${Tag} recCapturerPromise4: audioCap is undefined`);
          expect(false).assertTrue();
          fs.close(capturerFile);
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }

        try {
          await audioCap!.start();
          console.log(`${Tag} recCapturerPromise4 start ok`);

          await Utils.msSleep(2000);
          console.log(`${Tag} recCapturerPromise4 sleep end`);

          await audioCap!.stop();
          console.log(`${Tag} recCapturerPromise4 stop ok`);

          await audioCap!.release();
          console.log(`${Tag} recCapturerPromise4 release ok`);
        } catch (err) {
          console.log(`${Tag} recCapturerPromise4 release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        } finally {
          fs.close(capturerFile);
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
      } catch (err) {
        console.log(`${Tag} recCapturerPromise4 on err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
    }

    let resRendererPromise5 = async (AudioRendererOptions: audio.AudioRendererOptions, fileName: string) => {
      let audioRen: audio.AudioRenderer | null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag}: resRendererPromise5 Created : Success`);

        let rendererDirPath = testContext!.filesDir + '/' + fileName;
        console.info(`${Tag} resRendererPromise5 rendererDirPath: `+ rendererDirPath);
        let musicFile = fs.openSync(rendererDirPath, fs.OpenMode.READ_ONLY);

        let bufferSize: long = 0;
        let writeDataCallback = (buffer: ArrayBuffer) => {
          let options: ReadOptions = {
            offset: bufferSize,
            length: buffer.byteLength
          };

          try {
            fs.readSync(musicFile.fd, buffer, options);
            bufferSize += buffer.byteLength;
            // 系统会判定buffer有效，正常播放。
            return audio.AudioDataCallbackResult.VALID;
          } catch (error) {
            console.error('resRendererPromise5 Error reading file:', error);
            // 系统会判定buffer无效，不播放。
            return audio.AudioDataCallbackResult.INVALID;
          }
        };

        audioRen!.onWriteData(writeDataCallback);
        console.info(`${Tag}: resRendererPromise5 on function : SUCCESS`);

        try {
          await audioRen!.start();
          console.log(`${Tag} resRendererPromise5 start ok`);

          await Utils.msSleep(2000);
          console.log(`${Tag} resRendererPromise5 sleep end`);

          await audioRen!.stop();
          console.log(`${Tag} resRendererPromise5 stop ok`);

          await audioRen!.release();
          console.log(`${Tag} resRendererPromise5 release ok`);
        } catch (err) {
          console.log(`${Tag} resRendererPromise5 err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        } finally {
          fs.close(musicFile);
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
      } catch (err) {
        console.info(`${Tag}: resRendererPromise5 : ERROR : ${err.message}`);
        expect(false).assertTrue();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_STATIC_0200
     * @tc.desc   AudioCapturer - getOverflowCountSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data: audio.AudioCapturer | null) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          let OverflowCOuntSync = audioCapPromise!.getOverflowCountSync();
          console.info(`${Tag}: overflowCOuntSync : Converted: ${OverflowCOuntSync}`);
          expect(OverflowCOuntSync as number).assertLargerOrEqual(0.0);
        }).catch((err: Error) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      await audioCapPromise!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED_STATIC_0100
     * @tc.desc   AudioCapturer - setWillMuteWhenInterrupted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          audioCapPromise!.setWillMuteWhenInterrupted(true);
          expect(true).assertTrue();
        }).catch((err: Error) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      await audioCapPromise!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED_STATIC_0200
     * @tc.desc   AudioCapturer - setWillMuteWhenInterrupted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_SET_WILL_MUTE_WHEN_INTERRUPTED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          audioCapPromise!.start();
          console.info('AudioCapturer start : Success : Stream Type: SUCCESS');
          audioCapPromise!.setWillMuteWhenInterrupted(true);
        }).catch((err: Error) => {
          console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
          expect(err.code).assertEqual(6800103);
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      await audioCapPromise!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_STATIC_0100
     * @tc.desc   AudioCapturer with state prepared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(audioCapPromise!.state == 1).assertTrue();
      } catch (err) {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_STATIC_0100
     * @tc.desc   AudioCapturer with state running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise!.start();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(audioCapPromise!.state == 2).assertTrue();
        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_STATIC_0100
     * @tc.desc   AudioCapturer with state stopped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise!.start();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RUNNING);
        await audioCapPromise!.stop();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_STOPPED);
        expect(audioCapPromise!.state == 3).assertTrue();
        await audioCapPromise!.release()
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_STATIC_0100
     * @tc.desc   AudioCapturer with state released
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise!.start();
        await audioCapPromise!.stop();
        await audioCapPromise!.release();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RELEASED);
        expect(audioCapPromise!.state == 4).assertTrue();
      } catch (err) {
        console.log(`${Tag} err : ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_SYNC_STATIC_0100
     * @tc.desc   AudioCapturer with state stopped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
      try {
        await audioCapPromise!.start();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RUNNING);
        let bufferSize = audioCapPromise!.getBufferSizeSync();
        console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
      } catch (err) {
        console.log(`${Tag} start-getBufferSizeSync err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.release();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_STATIC_0100
     * @tc.desc   AudioCapturer with state stopped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
      try {
        await audioCapPromise!.start();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RUNNING);
        let bufferSize = audioCapPromise!.getBufferSize();
        console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
      } catch (err) {
        console.log(`${Tag} start-getBufferSize err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.release();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_STATIC_0100
     * @tc.desc   AudioCapturer with read buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkpromisereadbuffer.pcm");
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
      try {
        await audioCapPromise!.start();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RUNNING);
        bufferSize = await audioCapPromise!.getBufferSize();
        console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
      } catch (err) {
        console.log(`${Tag} start-getBufferSize err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }

      let fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      if (fileSync !== null) {
        console.info(`${Tag} AudioFrameworkRecLog: file fd created, dirPath: ${JSON.stringify(dirPath)}`);
      } else {
        console.info(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
        expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
      if (fileSync !== null) {
        console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
      } else {
        console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
        expect(false).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
      try {
        await audioCapPromise!.release();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0100
     * @tc.desc   AudioCapturer with parameter set 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-2C-16B.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0100
     * @tc.desc   AudioCapturer with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-2C-16B.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0200
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0200
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0300
     * @tc.desc   record audio with parameter set 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo96000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo96000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let audioCapturerOptions96000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo96000,
        capturerInfo: audioCapturerInfo96000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo96000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-96000-1C-S24LE.pcm");
      await recPromise(audioCapturerOptions96000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0300
     * @tc.desc   record audio with parameter set 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo96000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo96000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions96000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo96000,
        capturerInfo: audioCapturerInfo96000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo96000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-96000-1C-S24LE.pcm");
      await recPromise(audioCapturerOptions96000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0400
     * @tc.desc   record audio with parameter set 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo48000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo48000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions48000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo48000,
        capturerInfo: audioCapturerInfo48000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo48000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions48000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0400
     * @tc.desc   record audio with parameter set 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo48000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo48000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions48000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo48000,
        capturerInfo: audioCapturerInfo48000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo48000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions48000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0500
     * @tc.desc   record audio with parameter set 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo8000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo8000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions8000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo8000,
        capturerInfo: audioCapturerInfo8000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo8000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-8000-1C-8B.pcm");
      await recPromise(audioCapturerOptions8000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0500
     * @tc.desc   record audio with parameter set 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo8000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo8000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions8000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo8000,
        capturerInfo: audioCapturerInfo8000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo8000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-8000-1C-8B.pcm");
      await recPromise(audioCapturerOptions8000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0600
     * @tc.desc   record audio with parameter set 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo11025: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo11025: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions11025: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo11025,
        capturerInfo: audioCapturerInfo11025,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo11025,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-11025-2C-16B.pcm");
      await recPromise(audioCapturerOptions11025, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0600
     * @tc.desc   record audio with parameter set 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo11025: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo11025: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions11025: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo11025,
        capturerInfo: audioCapturerInfo11025,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo11025,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-11025-2C-16B.pcm");
      await recPromise(audioCapturerOptions11025, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0700
     * @tc.desc   record audio with parameter set 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo12000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo12000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions12000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo12000,
        capturerInfo: audioCapturerInfo12000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo12000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-12000-1C-24B.pcm");
      await recPromise(audioCapturerOptions12000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0800
     * @tc.desc   record audio with parameter set 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo16000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo16000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions16000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo16000,
        capturerInfo: audioCapturerInfo16000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo16000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-16000-2C-32B.pcm");
      await recPromise(audioCapturerOptions16000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0800
     * @tc.desc   record audio with parameter set 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo16000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo16000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions16000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo16000,
        capturerInfo: audioCapturerInfo16000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo16000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-16000-2C-32B.pcm");
      await recPromise(audioCapturerOptions16000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0900
     * @tc.desc   record audio with parameter set 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo22050: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo22050: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions22050: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo22050,
        capturerInfo: audioCapturerInfo22050,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo22050,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-22050-1C-8B.pcm");
      await recPromise(audioCapturerOptions22050, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0900
     * @tc.desc   record audio with parameter set 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo22050: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo22050: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions22050: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo22050,
        capturerInfo: audioCapturerInfo22050,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo22050,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-22050-1C-8B.pcm");
      await recPromise(audioCapturerOptions22050, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1000
     * @tc.desc   record audio with parameter set 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo24000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo24000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions24000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo24000,
        capturerInfo: audioCapturerInfo24000,
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo24000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-24000-2C-16B.pcm");
      await recPromise(audioCapturerOptions24000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1000
     * @tc.desc   record audio with parameter set 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo24000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo24000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions24000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo24000,
        capturerInfo: audioCapturerInfo24000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo24000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-24000-2C-16B.pcm");
      await recPromise(audioCapturerOptions24000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1100
     * @tc.desc   record audio with parameter set 010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo32000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo32000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions32000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo32000,
        capturerInfo: audioCapturerInfo32000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo32000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-32000-1C-24B.pcm");
      await recPromise(audioCapturerOptions32000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1100
     * @tc.desc   record audio with parameter set 010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo32000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo32000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions32000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo32000,
        capturerInfo: audioCapturerInfo32000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo32000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-32000-1C-24B.pcm");
      await recPromise(audioCapturerOptions32000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1200
     * @tc.desc   record audio with parameter set 011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo64000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo64000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions64000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo64000,
        capturerInfo: audioCapturerInfo64000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo64000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-64000-2C-32B.pcm");
      await recPromise(audioCapturerOptions64000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1200
     * @tc.desc   record audio with parameter set 011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo64000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo64000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions64000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo64000,
        capturerInfo: audioCapturerInfo64000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo64000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-64000-2C-32B.pcm");
      await recPromise(audioCapturerOptions64000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1300
     * @tc.desc   record audio with parameter set 011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo64000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo64000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let audioCapturerOptions64000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo64000,
        capturerInfo: audioCapturerInfo64000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo64000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-64000-2C-32B.pcm");
      await recPromise(audioCapturerOptions64000, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_STATIC_0100
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_STATIC_0100
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_STATIC_0100
     * @tc.desc   AudioCapturer GET_AUDIO_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
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

      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.log(`${Tag} createAudioCapturer ok`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise!.start();
        console.log(`${Tag} start ok`);
        let audioTime = await audioCapPromise!.getAudioTime();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`);
        expect(audioTime as number).assertLarger(0.0);

        let bufferSize = await audioCapPromise!.getBufferSize();
        console.log(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
        let fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        console.log(`${Tag} fd: ${JSON.stringify(fileSync)}`);
        if (fileSync !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd created`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
          expect(false).assertTrue();
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
        fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
        console.log(`${Tag} fd1: ${JSON.stringify(fileSync)}`);
        if (fileSync !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
        let audioTime2 = await audioCapPromise!.getAudioTime();
        console.log(`${Tag} audioTime2: ${JSON.stringify(audioTime2)}`);
        expect(audioTime2 as number).assertLarger(0.0);
      } catch (err) {
        console.log(`${Tag} start-getAudioTime-getBufferSize-read-getAudioTimein- err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_STATIC_0100
     * @tc.desc   AudioCapturer GET_AUDIO_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
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

      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.log(`${Tag} createAudioCapturer ok`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise!.start();
        console.log(`${Tag} start ok`);
        let audioTime = await audioCapPromise!.getAudioTime();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`);
        expect(audioTime as number).assertLarger(0.0);

        let bufferSize = await audioCapPromise!.getBufferSize();
        console.log(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
        let fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        console.log(`${Tag} fd: ${JSON.stringify(fileSync)}`);
        if (fileSync !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd created`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
          expect(false).assertTrue();
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
        fileSync = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.APPEND);
        console.log(`${Tag} fd1: ${JSON.stringify(fileSync)}`);
        if (fileSync !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
          done();
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        }
      } catch (err) {
        console.log(`${Tag} start-getAudioTime-getBufferSize-read-getAudioTimein- err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.stop();
        let audioTime2 = await audioCapPromise!.getAudioTime();
        console.log(`${Tag} audioTime2: ${JSON.stringify(audioTime2)}`);
        expect(audioTime2 as number).assertLarger(0.0);
      } catch (err) {
        console.log(`${Tag} stop-getAudioTimein- err: ${JSON.stringify(err)}`);
        expect(true).assertTrue();
      }

      try {
        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_STATIC_0100
     * @tc.desc   AudioCapturer GET_AUDIO_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCapPromise!.start();
        let audioTime = await audioCapPromise!.getAudioTime();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`)
        expect(audioTime as number).assertLarger(0.0);
      } catch (err) {
        console.log(`${Tag} start-getAudioTime err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_SYNC_STATIC_0100
     * @tc.desc   AudioCapturer GET_AUDIO_TIME_SYNC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCapPromise!.start();
        let audioTime = audioCapPromise!.getAudioTimeSync();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`)
        expect(audioTime as number).assertLarger(0.0);
      } catch (err) {
        console.log(`${Tag} start-getAudioTimeSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_TIMESTAMP_INFO_SYNC_STATIC
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_TIMESTAMP_INFO_SYNC_STATIC
     * @tc.desc   AudioCapturer GET_AUDIO_TIMESTAMP_INFO_SYNC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_TIMESTAMP_INFO_SYNC_STATIC',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

        let audioCapPromise: audio.AudioCapturer | null = null;
        try {
          audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        } catch (err) {
          console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        try {
          await audioCapPromise!.start();
          let audioTimestampInfo: audio.AudioTimestampInfo = audioCapPromise!.getAudioTimestampInfoSync();
          console.log(`${Tag} framePos: ${JSON.stringify(audioTimestampInfo.framePos)},
          timestamp: ${JSON.stringify(audioTimestampInfo.timestamp)}`)
          expect(audioTimestampInfo.timestamp != 0).assertTrue();
        } catch (err) {
          console.log(`${Tag} start-getAudioTimestampInfoSync err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCapPromise!.release();
        } catch (err) {
          console.log(`${Tag} err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_STATIC_0100
     * @tc.desc   AudioCapturer createAudioCapturer->stop->release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.log(`${Tag} createAudioCapturer ok`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise!.start();
        console.log(`${Tag} start ok`);
      } catch (err) {
        console.log(`${Tag} start err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.stop();
        console.log(`${Tag} stop ok`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${Tag} stop err: ${JSON.stringify(err)}`);
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_STATIC_0100
     * @tc.desc   AudioCapturer GET_AUDIO_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise!.release();
        expect(audioCapPromise!.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} re-release err: ${JSON.stringify(err)}`);
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_SYNC_STATIC_0100
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: audio.AudioStreamInfo = audioCap!.getStreamInfoSync();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfoSync:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfoSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_STATIC_0100
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: audio.AudioStreamInfo = await audioCap!.getStreamInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_STATIC_0100
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: audio.AudioStreamInfo = await audioCap!.getStreamInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        console.log(`${Tag} audioCap.state: ${JSON.stringify(audioCap!.state)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_STATIC_0200
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: audio.AudioStreamInfo = await audioCap!.getStreamInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      audioCap!.release((err: BusinessError<void> | null) => {
        if (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
          return;
        }
        expect(audioCap!.state).assertEqual(audio.AudioState.STATE_RELEASED);
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_STATIC_0300
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet = await audioCap!.getCapturerInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_STATIC_0300
     * @tc.desc   record audio with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet = await audioCap!.getCapturerInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO__SYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO__SYNC_STATIC_0400
     * @tc.desc   getCapturerInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO__SYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet = audioCap!.getCapturerInfoSync();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_STATIC_0100
     * @tc.desc   AudioCapturer - getAudioStreamId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        audioCapPromise!.getAudioStreamId((err: BusinessError<void> | null, data: long | undefined) => {
          if (err) {
            console.info(`${Tag}: getAudioStreamId : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
            console.info(`${Tag}: getAudioStreamId : Converted: ${data}`);
          }
          audioCapPromise!.release();
        });
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_STATIC_0200
     * @tc.desc   AudioCapturer - getAudioStreamId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
        let audioCapPromise: audio.AudioCapturer | null = await audio.createAudioCapturer(AudioCapturerOptions);
        try {
          let data = await audioCapPromise!.getAudioStreamId();
          expect(true).assertTrue();
          audioCapPromise!.release();
          console.info(`${Tag}: getAudioStreamId : Converted: ${data}`);
        } catch (err) {
          expect(true).assertTrue();
          audioCapPromise!.release();
          console.error(`${Tag}: getAudioStreamId : ERROR : ${err.message}`);
        }
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_SYNC_STATIC_0300
     * @tc.desc   AudioCapturer - getAudioStreamIdSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_SYNC_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
      let audioCapPromise: audio.AudioCapturer | null = null;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
        let StreamIdSync: long = audioCapPromise!.getAudioStreamIdSync();
          console.info(`${Tag}: getAudioStreamId : Converted: ${StreamIdSync}`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      await audioCapPromise!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_STATIC_0100
     * @tc.desc   AudioCapturer - getOverflowCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
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
        let audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise!.getOverflowCount().then((data: long) => {
          expect(data as number).assertLargerOrEqual(0.0);
          console.info(`${Tag}: getOverflowCount : Converted: ${data}`);
        }).catch((err: Error) => {
          expect(true).assertTrue();
          console.error(`${Tag}: getOverflowCount : ERROR : ${err}`);
        });

        await audioCapPromise!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_STATIC_0100
     * @tc.desc   AudioCapturer with parameter set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC;
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-2C-16B_voice_message.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0100
     * @tc.desc   CAPTURER_RENDERER_FORMAT_F32LE_Test_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0100";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);

        await Utils.msSleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0200
     * @tc.desc   CAPTURER_RENDERER_FORMAT_F32LE_Test_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0200";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);

        await Utils.msSleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0300
     * @tc.desc   CAPTURER_RENDERER_FORMAT_F32LE_Test_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0300";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);

        await Utils.msSleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0400
     * @tc.desc   CAPTURER_RENDERER_FORMAT_F32LE_Test_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0400";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);

        await Utils.msSleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0500
     * @tc.desc   CAPTURER_RENDERER_FORMAT_F32LE_Test_0500 with PRIVACY_TYPE_PRIVATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioPrivacyType = audio.AudioPrivacyType.PRIVACY_TYPE_PRIVATE;

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo,
        privacyType: AudioPrivacyType
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_STATIC_0500";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);

        await Utils.msSleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_STATIC_0100
     * @tc.number SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_STATIC_0100
     * @tc.desc   AudioCapturer ON MARKREACH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioCapturer: audio.AudioCapturer | null = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<long> = () => {
        console.info('Current callback is cb1');
      }
      let flag : boolean =false;
      try {
        let para1: long = 0;
        audioCapturer!.onMarkReach(para1, cb1);
      } catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_STATIC_0100
     * @tc.number SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_STATIC_0100
     * @tc.desc   AudioCapturer ON PERIODREACH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioCapturer: audio.AudioCapturer | null = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<long> =() =>{
        console.info('Current callback is cb1');
      }
      let flag: boolean =false;
      try {
        let para1: long = 0;
        audioCapturer!.onPeriodReach(para1, cb1);
      } catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOCAPTURE_SOURCETYPE_UNPROCESSED_STATIC_0100
     * @tc.number SUB_AUDIO_AUDIOCAPTURE_SOURCETYPE_UNPROCESSED_STATIC_0100
     * @tc.desc   SOURCETYPE_UNPROCESSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_SOURCETYPE_UNPROCESSED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        let audioCapturer: audio.AudioCapturer | null = await audio.createAudioCapturer(AudioCapturerOptions);
        done();
      } catch (error) {
        console.log(`error : ${error.message},Code:${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_FRAMEWORK_LIVE_FUNCTION_TEST_STATIC_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_FRAMEWORK_LIVE_FUNCTION_TEST_STATIC_001
     * @tc.desc   SourceType Live
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_FRAMEWORK_LIVE_FUNCTION_TEST_STATIC_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
          channels: audio.AudioChannel.CHANNEL_2, // 通道。
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
        },
        capturerInfo: {
          source: audio.SourceType.SOURCE_TYPE_LIVE, // 音源类型
          capturerFlags: 0 // 音频采集器标志。
        }
      };

      let audioManager = audio.getAudioManager().getStreamManager();
      let isSupportAEC = audioManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_LIVE);

      if (isSupportAEC) {
        audioCapturerOptions.capturerInfo.source = audio.SourceType.SOURCE_TYPE_LIVE;
      } else {
        audioCapturerOptions.capturerInfo.source = audio.SourceType.SOURCE_TYPE_MIC;
      }

      try {
        audio.createAudioCapturer(audioCapturerOptions, (err: BusinessError | null, data: audio.AudioCapturer | undefined | null) => {
          if (err) {
            expect(false).assertTrue();
            done();
            console.error(`AudioCapturer Created : Error: ${err}`);
          } else {
            console.info('AudioCapturer Created : Success : SUCCESS');
            data?.release();
            done();
          }
          done();
        });
      } catch (err) {
        expect(false).assertTrue();
        done();
      }
    })

  })
}