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
  PLAYBACK_CAPTURE: childType
}

interface renderInfoChild {
  content: number,
  usage: number,
  rendererFlags: number
}

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

export default function audioRenderCapturerInterrupt() {
  describe("AudioRenderCapturerInterruptUnitTest", () => {
    let isTrueOrFalse = (flag1: boolean, flag2: boolean) => {
      let resBool: boolean = false
      if (flag1 === true && flag2 === false) {
        resBool = true
      }
      return resBool
    }
    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      await power?.click();
      await sleep(2000);
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
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      // await getPermission();
      await driveFn();
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
        console.info('createAudioCapturer come in  ')


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

    let capturerStartFail = async (capturer: ESObject, done: Function, capturer1: ESObject) => {
      try {
        await capturer.start()
        console.log("capturerStartFail success.")
      } catch (err) {
        console.log("capturerStartFail err:" + JSON.stringify(err))
        await capturerRelease(capturer, done)
        await capturerRelease(capturer1, done)
        expect(true).assertEqual(true)
        done()
      }
    }
    let capturerStartFailForRenderer = async (capturer: ESObject, done: Function, renderer: ESObject) => {
      try {
        await capturer.start()
        console.log("capturerStartFail success.")
      } catch (err) {
        console.log("capturerStartFail err:" + JSON.stringify(err))
        await capturerRelease(capturer, done)
        await renderRelease(renderer, done)
        expect(true).assertEqual(true)
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

    let sleep = (ms: number): Promise<ESObject> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1100
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      await render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("011 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      await capture.on("audioInterrupt", async (eventAction) => {
        console.log("011 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      console.info('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1100flag1flag2',flag1,flag2)
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9400
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("094 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("094 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8500
     * @tc.desc   AudioCapturer  MIC INTERRUPT VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_CALL, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("085 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStartFailForRenderer(capture, done, render)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("085 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9100
     * @tc.desc   AudioCapturer  MIC INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("091 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("091 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8800
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_CALL, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("088 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("088 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0100
     * @tc.desc   AudioCapturer  MIC INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("001 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("001 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0200
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("002 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("002 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0400
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("004 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("004 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0500
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("005 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("005 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0700
     * @tc.desc   AudioCapturer  MIC INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("007 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("007 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0800
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("008 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("008 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1000
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("010 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("010 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1900
     * @tc.desc   AudioCapturer  MIC INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("019 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("019 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2000
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("020 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("020 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2200
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("022 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("022 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2300
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("023 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("023 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2500
     * @tc.desc   AudioCapturer  MIC INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("025 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("025 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2600
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("026 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("026 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2800
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("028 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("028 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2900
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("029 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("029 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3100
     * @tc.desc   AudioCapturer  MIC INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("031 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("031 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3200
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("032 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("032 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3400
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("034 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("034 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3500
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("035 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("035 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3700
     * @tc.desc   AudioCapturer  MIC INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("037 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("037 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3800
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("038 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("038 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4000
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("040 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("040 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4100
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("041 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("041 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4300
     * @tc.desc   AudioCapturer  MIC INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("043 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("043 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4400
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("044 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("044 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4600
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("046 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("046 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      console.info('46004600',flag1,flag2)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4700
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("047 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("047 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4900
     * @tc.desc   AudioCapturer  MIC INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("_4900 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("_4900 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      while (flag1) {
        if(flag1 === true){
          expect(isTrueOrFalse(flag1, flag2)).assertTrue()
        }
      }
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5000
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("050 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("050 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5200
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("052 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("052 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      console.info('052 capture flag1 flag2',flag1,flag2)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5300
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("053 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("053 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      console.info('053 capture flag1 flag2',flag1,flag2)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5500
     * @tc.desc   AudioCapturer  MIC INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("055 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("055 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })


      await sleep(500)
      console.info('055 capture flag1 flag2',flag1,flag2)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5600
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("056 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("056 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5800
     * @tc.desc   AudioCapturer  VOICE_COMMUNICATION INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("058 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("058 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5900
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("059 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("059 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)

      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8600
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_CALL, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("086 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("086 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9200
     * @tc.desc   AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("092 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("092 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9500
     * @tc.desc   AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("095 render.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("095 capture.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await renderRelease(render, done)
      await capturerRelease(capture, done)
      done()
    })
  })
}