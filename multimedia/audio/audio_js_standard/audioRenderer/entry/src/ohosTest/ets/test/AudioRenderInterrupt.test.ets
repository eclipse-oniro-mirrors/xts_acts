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
import hilog from '@ohos.hilog';
import audio from '@ohos.multimedia.audio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function AudioRendererInterruptUnitTest() {
  describe('AudioRendererInterruptUnitTest', function () {
    beforeAll(async function () {
      // input testsuit setup step, setup invoked before all testcases
      console.info('beforeAll called')
    })

    afterAll(function () {

      // input testsuit teardown step, teardown invoked after all testcases
      console.info('afterAll called')
    })

    beforeEach(function () {

      // input testcase setup step, setup invoked before each testcases
      console.info('beforeEach called')
    })

    afterEach(function () {

      // input testcase teardown step, teardown invoked after each testcases
      console.info('afterEach called')
    })

    let renderInfo = {
      'MUSIC': {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0,
      },
      'VOICE_COMMUNICATION': {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      },
      'RINGTONE': {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0,
      },
      'VOICE_ASSISTANT': {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      },
      'ALARM': {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      },
      'ACCESSIBILITY': {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      },
      'SPEECH': {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      'MOVIE': {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      'UNKNOW': {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      },
      'VOICE_MESSAGE': {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      },
      'GAME': {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      },
      'NAVIGATION': {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      },
      'NOTIFICATION': {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      },
    }

    let streamInfo = {
      '44100': {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
      '48000': {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
    }

    async function createAudioRenderer(AudioRendererInfo, AudioStreamInfo, done) {
      let render = null;

      var AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try {
        render = await audio.createAudioRenderer(AudioRendererOptions)
        console.log(" createAudioRenderer success.")
      } catch (err) {
        console.log(" createAudioRenderer err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
      return render
    }

    async function start(render, done) {
      console.info('come in start')
      try {
        await render.start()
        console.log(" start success.")
      } catch (err) {
        await release(render, done)
        console.log(" start err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
    }


    async function startFail(render, done, render1) {
      try {
        await render.start()
        console.log(" start success.")
      } catch (err) {
        console.log(" start err:" + JSON.stringify(err))
        await release(render, done)
        await release(render1, done)
        expect(true).assertEqual(true)
        done()
      }
    }


    async function stop(render, done) {
      try {
        await render.stop()
        console.log(" stop success.")
      } catch (err) {
        console.log(" stop err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        await release(render, done)
        done()
      }
    }

    async function release(render, done) {
      if (render.state == audio.AudioState.STATE_RELEASED) {
        console.log(" release render state: " + render.state)
        return
      }
      try {
        await render.release()
        console.log(" release success.")
      } catch (err) {
        console.log(" release err:" + JSON.stringify(err))
        expect(false).assertEqual(true)
        done()
      }
    }

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100 come in ')
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
        console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100 render1 is ' + render1)
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100  111111111111')
        render1.on("audioInterrupt", async (eventAction) => {
          console.log("1.eventAction=" + JSON.stringify(eventAction))
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
      }
      catch (err) {
        console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100 err is ' + err.message)
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0200
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0300
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("3.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0400
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("4.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0600
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("6.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0800
     * @tc.desc   AudioRender  SPEECH INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0900
     * @tc.desc   AudioRender  MOVIE INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100
     * @tc.desc   AudioRender  MUSIC INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100 fail")
            expect(false).assertTrue();
          }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1200.eventAction=" + JSON.stringify(eventAction))

        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else {
          console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200 fail")
          expect(false).assertTrue();
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let flag1 = false;
      let flag2 = false;
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("13 render1.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("13 render2.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await start(render2, done)

      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      expect(flag1 == false && flag2 == false).assertTrue()
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1400
     * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1600
     * @tc.desc   AudioRender  ALARM INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("13-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("14.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1800
     * @tc.desc   AudioRender  SPEECH INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1900
     * @tc.desc   AudioRender  MOVIE INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2100
     * @tc.desc   AudioRender  MUSIC INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("15-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("16.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let flag1 = false;
      let flag2 = false;
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("23 render1.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("23 render2.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await start(render2, done)

      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      expect(flag1 == false && flag2 == false).assertTrue()
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2400
     * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2600
     * @tc.desc   AudioRender  ALARM INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let flag1 = false;
      let flag2 = false;
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("26 render1.eventAction:" + JSON.stringify(eventAction))
        flag1 = true;
      })

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("26 render2.eventAction:" + JSON.stringify(eventAction))
        flag2 = true;
      })
      await start(render2, done)

      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      expect(flag1 == false && flag2 == false).assertTrue()
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2800
     * @tc.desc   AudioRender  SPEECH INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("15-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2900
     * @tc.desc   AudioRender  MOVIE INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("15-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("15-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3100
     * @tc.desc   AudioRender  MUSIC INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("22.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("23.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("24.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3400
     * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("25.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3600
     * @tc.desc   AudioRender  ALARM INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("27.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("28.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3800
     * @tc.desc   AudioRender  SPEECH INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("22.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3900
     * @tc.desc   AudioRender  MOVIE INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("22.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("22.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5100
     * @tc.desc   AudioRender  MUSIC INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("36.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)
      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("37.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("38.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5400
     * @tc.desc   AudioRender  ALARM INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("39.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5600
     * @tc.desc   AudioRender  ALARM INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("41.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("42.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5800
     * @tc.desc   AudioRender  SPEECH INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("36.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)
      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5900
     * @tc.desc   AudioRender  MOVIE INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("36.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)
      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("36.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)
      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6100
     * @tc.desc   AudioRender  MUSIC INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("44_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("44_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("45.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6400
     * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("64.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)


      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)

      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6600
     * @tc.desc   AudioRender  ALARM INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("48_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("49.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6800
     * @tc.desc   AudioRender  SPEECH INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      render2.on("audioInterrupt", async(eventAction) => {
        console.log("68_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6900
     * @tc.desc   AudioRender  MOVIE INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async(eventAction) => {
        console.log("69_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async(eventAction) => {
        console.log("70_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100
     * @tc.desc   AudioRender  MUSIC INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("3.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7400
     * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("4.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7600
     * @tc.desc   AudioRender  ALARM INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("6.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7800
     * @tc.desc   AudioRender  SPEECH INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7900
     * @tc.desc   AudioRender  MOVIE INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8100
     * @tc.desc   AudioRender  MUSIC INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8200
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8300
     * @tc.desc   AudioRender  RINGTONE INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("3.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8400
     * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("4.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8600
     * @tc.desc   AudioRender  ALARM INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("6.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8700
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8800
     * @tc.desc   AudioRender  SPEECH INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8900
     * @tc.desc   AudioRender  MOVIE INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9100
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9200
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9300
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("3.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9400
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("4.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9600
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("6.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9700
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9800
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9900
     * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10000
     * @tc.desc   AudioRender  UNKNOW INTERRUPT UNKNOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10100
     * @tc.desc   AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1_callback = false
      let render2_callback = false
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("50.eventAction=" + JSON.stringify(eventAction))
        render1_callback = true
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.SHARE_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("50_2.eventAction=" + JSON.stringify(eventAction))
        render1_callback = true
      })
      await start(render2, done)
      await sleep(500)
      console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
      expect(render1_callback == false && render2_callback == false).assertTrue()
      await sleep(100)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10200
     * @tc.desc   AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1_callback = false
      let render2_callback = false
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE,done)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("51.eventAction=" + JSON.stringify(eventAction))
        render1_callback = true
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE,done)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("51_2.eventAction=" + JSON.stringify(eventAction))
        render2_callback == true
      })
      await start(render2, done)
      await sleep(500)
      console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
      expect(render1_callback).assertTrue();
      expect(!render2_callback).assertTrue()

      await sleep(100)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10300
     * @tc.desc   AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1_callback = false
      let render2_callback = false
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("52.eventAction=" + JSON.stringify(eventAction))
        render1_callback = true
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("52_2.eventAction=" + JSON.stringify(eventAction))
        render2_callback = true
      })
      await start(render2, done)
      await sleep(500)
      console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
      expect(render1_callback).assertTrue();
      expect(!render2_callback).assertTrue()
      await sleep(100)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17200
     * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17500
     * @tc.desc   AudioRender  RING INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_19100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_19100
     * @tc.desc   AudioRender  MUSIC INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_19100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18300
     * @tc.desc   AudioRender  MOVIE INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18400
     * @tc.desc   AudioRender  GAME INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("14.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17400
     * @tc.desc   AudioRender  SPEECH INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18200
     * @tc.desc   AudioRender  NAVIGATION INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18600
     * @tc.desc   AudioRender  ALARM INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18100
     * @tc.desc   AudioRender  NOTIFICATION INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("181.eventAction=" + JSON.stringify(eventAction))//1
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)

      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17300
     * @tc.desc   AudioRender  TTS INTERRUPT RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18700
     * @tc.desc   AudioRender  ACCESSIBLITY INTERRUPT VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBLITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })




    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14400
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14300
     * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("14.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15000
     * @tc.desc   AudioRender  RING INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })




    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4100
     * @tc.desc   AudioRender  MOVIE INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4200
     * @tc.desc   AudioRender  GAME INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14900
     * @tc.desc   AudioRender  SPEECH INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000
     * @tc.desc   AudioRender  NAVIGATION INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4700
     * @tc.desc   AudioRender  ALARM INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13700
     * @tc.desc   AudioRender  NOTIFICATION INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14600
     * @tc.desc   AudioRender  TTS INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4900
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else { }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12700
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        } else {
            expect(false).assertTrue()
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    //7149    duck inproc            VOICE_MESSAGE
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15100
     * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("21.eventAction=" + JSON.stringify(eventAction))//1
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })




    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13300
     * @tc.desc   AudioRender  RING INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("14.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13600
     * @tc.desc   AudioRender  MUSIC INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13800
     * @tc.desc   AudioRender  MOVIE INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13900
     * @tc.desc   AudioRender  GAME INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13200
     * @tc.desc   AudioRender  SPEECH INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("8-2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
          } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
          } else {
          }
        }
      })
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13500
     * @tc.desc   AudioRender  NAVIGATION INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14100
     * @tc.desc   AudioRender  ALARM INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("14.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13400
     * @tc.desc   AudioRender  NOTIFICATION INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("14.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
        } else {
        }
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12900
     * @tc.desc   AudioRender  TTS INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14200
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16700
     * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16800
     * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16100
     * @tc.desc   AudioRender  RING INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15700
     * @tc.desc   AudioRender  MUSIC INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15600
     * @tc.desc   AudioRender  MOVIE INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15500
     * @tc.desc   AudioRender  GAME INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16200
     * @tc.desc   AudioRender  SPEECH INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15800
     * @tc.desc   AudioRender  NAVIGATION INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      expect(true).assertEqual(true);
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15300
     * @tc.desc   AudioRender  ALARM INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15900
     * @tc.desc   AudioRender  NOTIFICATION INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16500
     * @tc.desc   AudioRender  TTS INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15200
     * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })



  })
}