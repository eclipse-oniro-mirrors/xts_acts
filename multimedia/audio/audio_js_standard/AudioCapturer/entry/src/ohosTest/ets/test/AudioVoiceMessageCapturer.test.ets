/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let testContext: common.UIAbilityContext;

interface childType {
  source: number,
  capturerFlags: number
}

interface capturerInfoType {
  MIC: childType,
  VOICE_RECOGNITION: childType,
  VOICE_COMMUNICATION: childType,
  PLAYBACK_CAPTURE: childType,
  VOICE_MESSAGE: childType
}

interface renderInfoChild {
  content: number,
  usage: number,
  rendererFlags: number
}

interface renderInfoType {
  // ULTRASONIC:renderInfoChild,
  MUSIC: renderInfoChild,
  VOICE_CALL: renderInfoChild,
  RINGTONE: renderInfoChild,
  VOICE_ASSISTANT: renderInfoChild,

  // 'ULTRASONIC':renderInfoChild,
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

interface streamInfoChild {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface streamInfoType {
  A16000: streamInfoChild,
  A44100: streamInfoChild,
  A48000: streamInfoChild
}

export default function audioCapturerVoiceMessage() {
  describe('audioCapturerVoiceMessage', async () => {
    let Tag: string = 'audioCapturerVoiceMessage';
    let dirPath: string;
    let bufferSize: ESObject;
    let LE24: number = -1;
    let LE32: number = -1;
    let sleep = (ms: number): Promise<ESObject> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
    let isTrueOrFalse = (flag1: boolean, flag2: boolean) => {
      let resBool: boolean = false
      if (flag1 === true && flag2 === false) {
        resBool = true
      }
      return resBool
    }
    let getFd = async (fileName: string) => {
      dirPath = testContext.filesDir + '/' + fileName;
      console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
    }
    let getPermission = () => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      atManager.requestPermissionsFromUser(testContext, permissions,
        (err: BusinessError, data: PermissionRequestResult) => {
          console.info("request success permission" + JSON.stringify(data));
          console.info('getPermissiongetPermission', JSON.stringify(err))
        })
    }
    let driveFn = async () => {
      let dr = Driver.create();
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await power?.click();
      await sleep(2000);
    }
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      // await getPermission();
      await driveFn();
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

    let recPromise =
      async (AudioCapturerOptions: audio.AudioCapturerOptions, AudioRendererOptions: audio.AudioRendererOptions,
        done: Function) => {
        let audioCap: audio.AudioCapturer;
        try {
          audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        } catch (err) {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
          LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
          LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
          let sampleFormat: ESObject = AudioRendererOptions.streamInfo.sampleFormat;
          if ((sampleFormat === LE24 || sampleFormat === LE32) && err.code === 202) {
            done();
            return;
          }
          expect(false).assertTrue();
          done();
          return;
        }

        try {
          let audioParamsGet: ESObject = await audioCap.getStreamInfo();
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
          let bufferSize: number = await audioCap.getBufferSize();
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
          let fd = fileio.openSync(dirPath, 0o102, 0o777);
          console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
          if (fd !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
            expect(false).assertTrue();
          }

          fd = fileio.openSync(dirPath, 0o2002, 0o666);
          console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
          if (fd !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
            expect(false).assertTrue();
          }

          let numBuffersToCapture = 45;
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
    let capturerInfo: capturerInfoType = {
      MIC: {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0,
      },
      VOICE_RECOGNITION: {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0,
      },
      VOICE_COMMUNICATION: {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0,
      },
      PLAYBACK_CAPTURE: {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0,
      },
      VOICE_MESSAGE: {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0,
      }
    }
    let renderInfo: renderInfoType = {
      MUSIC: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0,
      },
      VOICE_CALL: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      },
      RINGTONE: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0,
      },
      VOICE_ASSISTANT: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      },
      // ULTRASONIC: {
      //     content: audio.ContentType.CONTENT_TYPE_ULTRASONIC,
      //     usage: audio.StreamUsage.STREAM_USAGE_SYSTEM,
      //     rendererFlags: 0
      // },
      ALARM: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      },
      ACCESSIBILITY: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      },
      SPEECH: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      MOVIE: {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      UNKNOW: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      },
      VOICE_MESSAGE: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      },
      GAME: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      },
      NAVIGATION: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      },
      NOTIFICATION: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
    }
    let streamInfo: streamInfoType = {
      A16000: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
      A44100: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
      A48000: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
    }

    let createAudioRenderer =
      async (AudioRendererInfo: audio.AudioRendererInfo, AudioStreamInfo: audio.AudioStreamInfo, done: Function) => {
        let render: ESObject;
        let AudioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo
        }
        try {
          render = await audio.createAudioRenderer(AudioRendererOptions)
          console.log("createAudioRenderer success.")
        } catch (err) {
          console.log("createAudioRenderer err:" + JSON.stringify(err))
          expect(false).assertEqual(true)
          done()
        }
        return render
      }

    let renderStart = async (render: ESObject, done: Function) => {
      try {
        await render.start()
        console.log("renderStart success.")
      } catch (err) {
        await renderRelease(render, done)
        console.log("renderStart err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
    }
    let renderRelease = async (render: ESObject, done: Function) => {
      if (render.state === audio.AudioState.STATE_RELEASED) {
        console.log("renderRelease render state: " + render.state)
        return
      }
      try {
        await render.release()
        console.log("renderRelease success.")
      } catch (err) {
        console.log("renderRelease err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
    }

    let createAudioCapturer =
      async (AudioCapturerInfo: audio.AudioCapturerInfo, AudioStreamInfo: audio.AudioStreamInfo, done: Function) => {
        console.info('createAudioCapturer come in')
        let capturer: ESObject = null;
        let AudioCapturerOptions: audio.AudioCapturerOptions = {
          streamInfo: AudioStreamInfo,
          capturerInfo: AudioCapturerInfo
        }
        try {
          capturer = await audio.createAudioCapturer(AudioCapturerOptions)
          console.log("createAudioCapturer success.")
        } catch (err) {
          console.log("createAudioCapturer err:" + JSON.stringify(err))
          expect(false).assertEqual(true)
          done()
        }
        return capturer
      }

    let capturerStart = async (capturer: ESObject, done: Function) => {
      console.info('capturerStart come in')
      try {
        await capturer.start()
        console.log("capturerStart success.")
      } catch (err) {
        await capturerRelease(capturer, done)
        console.log("capturerStart err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
    }

    let capturerRelease = async (capturer: ESObject, done: Function) => {
      if (capturer.state === audio.AudioState.STATE_RELEASED) {
        console.log("capturerRelease current state: " + capturer.state)
        return
      }
      try {
        await capturer.release()
        console.log("capturerRelease success.")
      } catch (err) {
        console.log("capturerRelease err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_12000
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_CALL]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_CALL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_CALL, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("120 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("120 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_0100
     * @tc.name      : test[AudioCapturer function with voice message sourcetype]
     * @tc.desc      : AudioCapturer with parameter set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
      await getFd("capture_js-44100-2C-16B_voice_message.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9700
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("097 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("097 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9800
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT RINGTONE]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT RINGTONE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("098 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("098 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9900
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT MUSIC]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT MUSIC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("099 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("099 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10000
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT MOVIE]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT MOVIE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("100 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("100 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10100
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT GAME]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT GAME
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("101 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("101 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10200
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT SPEECH]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT SPEECH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("102 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("102 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10300
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT NAVIGATION]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT NAVIGATION
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("103 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("103 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10400
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT ALARM]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT ALARM
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("104 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("104 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10500
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT NOTIFICATION]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT NOTIFICATION
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("_10500 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("_10500 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10600
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_ASSISTANT]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("106 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("106 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10700
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT ACCESSIBILITY]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT ACCESSIBILITY
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("107 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("107 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10900
     * @tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("109 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("109 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11000
     * @tc.name      : test[AudioCapturer RINGTONE INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer RINGTONE INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("110 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("110 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11100
     * @tc.name      : test[AudioCapturer MUSIC INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer MUSIC INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("111 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("111 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11200
     * @tc.name      : test[AudioCapturer MOVIE INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer MOVIE INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("112 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("112 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11300
     * @tc.name      : test[AudioCapturer GAME INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer GAME INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("113 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("113 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11400
     * @tc.name      : test[AudioCapturer SPEECH INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer SPEECH INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("114 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("114 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11500
     * @tc.name      : test[AudioCapturer NAVIGATION INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer NAVIGATION INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("115 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("115 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11600
     * @tc.name      : test[AudioCapturer ALARM INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer ALARM INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("116 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("116 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11700
     * @tc.name      : test[AudioCapturer NOTIFICATION INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer NOTIFICATION INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("_11700 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("_11700 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11800
     * @tc.name      : test[AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("118 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("118 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11900
     * @tc.name      : test[AudioCapturer ACCESSIBILITY INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer ACCESSIBILITY INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("119 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("119 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10800
     * @tc.name      : test[AudioCapturer VOICE_CALL INTERRUPT VOICE_MESSAGE]
     * @tc.desc      : AudioCapturer VOICE_CALL INTERRUPT VOICE_MESSAGE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.VOICE_MESSAGE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("108 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_CALL, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("108 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })
  })
}