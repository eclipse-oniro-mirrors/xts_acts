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
// import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import { MatchPattern, ON, Driver } from '@ohos.UiTest'
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
  VOICE_COMMUNICATION: renderInfoChild,
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

export default function audioCapturerInterrupt() {
  describe("AudioCapturerInterruptUnitTest", () => {
    let isTrueOrFalse = (flag1: boolean, flag2: boolean) => {
      let resBool: boolean = false
      if (flag1 === true && flag2 === false) {
        resBool = true
      }
      return resBool
    }
    let isFlage = (flag1: boolean, flag2: boolean) => {
      let resBool: boolean = false
      if (flag1 === false && flag2 === true) {
        resBool = true
      }
      return resBool
    }
    let getPermission = () => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      atManager.requestPermissionsFromUser(testContext, permissions).then((data: PermissionRequestResult) => {
        console.info('datassss:' + JSON.stringify(data))
        console.info('data permissions:' + data.permissions)
      }).catch((err: BusinessError) => {
        console.info('data:' + JSON.stringify(err))
      })
    }
    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      await power?.click();
      await sleep(2000);
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
      VOICE_COMMUNICATION: {
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
    let renderStartFail = async (render: ESObject, done: Function) => {
      try {
        await render.start()
        console.log("renderStart success.")
        expect(false).assertEqual(true)
        done()
      } catch (err) {
        await renderRelease(render, done)
        console.log("renderStart err:" + JSON.stringify(err))
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100
     * @tc.desc   AudioCapturer MIC INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
      let flag1 = false;
      let flag2 = false;
      console.info('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100 come in  ')
      let capture1: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)

      console.info('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100 capture1 is ' + capture1)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction: audio.InterruptEvent) => {
        flag1 = true;
        console.log("01 capture1.eventAction:" + JSON.stringify(eventAction))
      })
      let capture2: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      console.info('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100 capture2 is ' + JSON.stringify(capture2))
      console.info('flag1flag1flag1One', flag1)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction: audio.InterruptEvent) => {
        flag2 = true;
        console.log("01 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
      }
      catch (err) {
        console.info('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0100 err is ' + err.message)
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0200
     * @tc.desc   AudioCapturer VOICE_RECOGNITION INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      console.log('capturerInfo.MIC', JSON.stringify(capturerInfo.MIC))
      console.log('streamInfo.A16000', JSON.stringify(streamInfo.A16000))
      let capture1: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("02 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("02 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0300
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capture1: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        console.log("03 capture1.eventAction:" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture2, done)
      await sleep(500)
      await capturerRelease(capture2, done)
      await capturerRelease(capture1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0400
     * @tc.desc   AudioCapturer MUSIC INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("04 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("04 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0500
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("05 capture.eventAction:" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_COMMUNICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)

      await sleep(500)
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0600
     * @tc.desc   AudioCapturer RING INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let render:ESObject;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("06 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: streamInfo.A44100,
        rendererInfo: renderInfo.RINGTONE
      }
      await audio.createAudioRenderer(AudioRendererOptions).then(async (data:ESObject)=>{
        render = data
        await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await renderStart(render, done)
        render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
          console.log("06 render.eventAction:" + JSON.stringify(eventAction))
          flag2 = true;
        })
        await sleep(500)
        if(flag1 === false && flag2 === false){
          expect(flag1 === false && flag2 === false).assertTrue()
          await capturerRelease(capture, done)
          await renderRelease(render, done)
          done()
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0700
     * @tc.desc   AudioCapturer VOICE_ASSISTANT INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("07 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("07 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0900
     * @tc.desc   AudioCapturer ALARM INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("10 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("10 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1000
     * @tc.desc   AudioCapturer ACCESSIBILITY INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("09 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("09 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1100
     * @tc.desc   AudioCapturer SPEECH INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("31 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("31 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1200
     * @tc.desc   AudioCapturer MOVIE INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("32 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("32 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1300
     * @tc.desc   AudioCapturer UNKNOW INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("33 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.UNKNOW, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("33 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1400
     * @tc.desc   AudioCapturer MIC INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("11 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction: audio.InterruptEvent) => {
        flag2 = true;
        console.log("11 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1500
     * @tc.desc   AudioCapturer VOICE_RECOGNITION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("12 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction: audio.InterruptEvent) => {
        flag2 = true;
        console.log("12 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1600
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        console.log("20 capture1.eventAction:" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture2, done)
      await sleep(500)
      await capturerRelease(capture2, done)
      await capturerRelease(capture1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1700
     * @tc.desc   AudioCapturer MUSIC INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("13 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("13 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1800
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("14 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_COMMUNICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("14 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1900
     * @tc.desc   AudioCapturer RING INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2000
     * @tc.desc   AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("16 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("16 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2200
     * @tc.desc   AudioCapturer ALARM INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        if (eventAction.hintType === audio.InterruptHint.INTERRUPT_HINT_STOP) {
          console.log("19 PC capture.eventAction:" + JSON.stringify(eventAction))
        } else {
          flag1 = true;
          console.log("19 capture.eventAction:" + JSON.stringify(eventAction))
        }
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("19 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2300
     * @tc.desc   AudioCapturer MIC INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("18 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("18 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2400
     * @tc.desc   AudioCapturer SPEECH INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("34 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("34 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2500
     * @tc.desc   AudioCapturer MOVIE INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("35 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("35 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2600
     * @tc.desc   AudioCapturer UNKNOW INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("36 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.UNKNOW, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("36 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2700
     * @tc.desc   AudioCapturer MIC INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("021 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction: audio.InterruptEvent) => {
        flag2 = true;
        console.log("021 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2800
     * @tc.desc   AudioCapturer VOICE_RECOGNITION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("22 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction: audio.InterruptEvent) => {
        flag2 = true;
        console.log("22 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2900
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("23 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("23 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3000
     * @tc.desc   AudioCapturer MUSIC INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("24 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("24 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3100
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("25 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_COMMUNICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("25 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3200
     * @tc.desc   AudioCapturer RING INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("26 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("26 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3300
     * @tc.desc   AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("27 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("27 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3500
     * @tc.desc   AudioCapturer ALARM INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("30 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("30 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3600
     * @tc.desc   AudioCapturer ACCESSIBILITY INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("29 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("29 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3700
     * @tc.desc   AudioCapturer SPEECH INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("37 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("37 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3800
     * @tc.desc   AudioCapturer MOVIE INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("38 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("38 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3900
     * @tc.desc   AudioCapturer UNKNOW INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("39 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.UNKNOW, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("39 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5400
     * @tc.desc   AudioCapturer MIC INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("081  capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("081 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5500
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("081  capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("081 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5600
     * @tc.desc   AudioCapturer VOICE_RECOGNITION INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("081  capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("081 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5700
     * @tc.desc   AudioCapturer PLAYBACK_CAPTURE INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("081  capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("081 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5800
     * @tc.desc   AudioCapturer ALARM INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        if (eventAction.hintType == audio.InterruptHint.INTERRUPT_HINT_STOP) {
          console.log("15 PC capture.eventAction:" + JSON.stringify(eventAction))
        } else {
          flag1 = true;
          console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        }
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5900
     * @tc.desc   AudioCapturer ACCESSIBILITY INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6000
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6000
     * @tc.desc   AudioCapturer MOVIE INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6100
     * @tc.desc   AudioCapturer MUSIC INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6200
     * @tc.desc   AudioCapturer RINGTONE INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        if (eventAction.hintType == audio.InterruptHint.INTERRUPT_HINT_STOP) {
          console.log("62 PC capture.eventAction:" + JSON.stringify(eventAction))
        } else {
          flag1 = true;
          console.log("62 capture.eventAction:" + JSON.stringify(eventAction))
        }
      })

      let render: ESObject = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6300
     * @tc.desc   AudioCapturer SPEECH INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.SPEECH, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6500
     * @tc.desc   AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6600
     * @tc.desc   AudioCapturer VOICE_COMMUNICATION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_COMMUNICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(isTrueOrFalse(flag1, flag2)).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6700
     * @tc.desc   AudioCapturer UNKNOW INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.UNKNOW, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("15 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6900
     * @tc.desc   AudioCapturer NOTIFICATION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("_6900 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("_6900 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8100
     * @tc.desc   AudioCapturer PLAYBACK_CAPTURE INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("081  capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("081 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8500
     * @tc.desc   AudioCapturer PLAYBACK_CAPTURE INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("085 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("085 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8800
     * @tc.desc   AudioCapturer PLAYBACK_CAPTURE INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture1: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture1, done)
      capture1.on("audioInterrupt", async (eventAction) => {
        flag1 = true;
        console.log("88 capture1.eventAction:" + JSON.stringify(eventAction))
      })

      let capture2: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStartFail(capture2, done, capture1)
      capture2.on("audioInterrupt", async (eventAction) => {
        flag2 = true;
        console.log("88 capture2.eventAction:" + JSON.stringify(eventAction))
      })
      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture1, done)
      await capturerRelease(capture2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_9900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_9900
     * @tc.desc   AudioCapturer VOICE_MESSAGE INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("099 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("099 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10100
     * @tc.desc   AudioCapturer GAME INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0101 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0101 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10200
     * @tc.desc   AudioCapturer NAVIGATION INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0102 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0102 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10300
     * @tc.desc   AudioCapturer NOTIFICATION INTERRUPT MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer = await createAudioCapturer(capturerInfo.MIC, streamInfo.A16000, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0103 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })
      await capturerStart(capture, done)

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0103 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await renderStartFail(render, done)

      await sleep(500)
      expect(isFlage(flag1, flag2)).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10700
     * @tc.desc   AudioCapturer VOICE_MESSAGE INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0107 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0107 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10800
     * @tc.desc   AudioCapturer GAME INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0108 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0108 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10900
     * @tc.desc   AudioCapturer NAVIGATION INTERRUPT PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.PLAYBACK_CAPTURE, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0109 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0109 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12100
     * @tc.desc   AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0121 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0121 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12300
     * @tc.desc   AudioCapturer GAME INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0123 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0123 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12400
     * @tc.desc   AudioCapturer NAVIGATION INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0124 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0124 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12500
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12500
     * @tc.desc   AudioCapturer NOTIFICATION INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_COMMUNICATION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("_12500 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("_12500 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12900
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12900
     * @tc.desc   AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0129 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.VOICE_MESSAGE, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0129 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13100
     * @tc.desc   AudioCapturer GAME INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0131 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.GAME, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0131 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13200
     * @tc.desc   AudioCapturer NAVIGATION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("0132 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NAVIGATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("0132 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13300
     * @tc.desc   AudioCapturer NOTIFICATION INTERRUPT VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_INTERRUPT_13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag1 = false;
      let flag2 = false;
      let capture: audio.AudioCapturer =
        await createAudioCapturer(capturerInfo.VOICE_RECOGNITION, streamInfo.A16000, done)
      await capturerStart(capture, done)
      capture.on("audioInterrupt", async (eventAction) => {
        console.log("_13300 capture.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render: ESObject = await createAudioRenderer(renderInfo.NOTIFICATION, streamInfo.A44100, done)
      await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await renderStart(render, done)
      render.on("audioInterrupt", async (eventAction: audio.InterruptAction) => {
        console.log("_13300 render.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })

      await sleep(500)
      expect(flag1 === false && flag2 === false).assertTrue()
      await capturerRelease(capture, done)
      await renderRelease(render, done)
      done()
    })
  })
}