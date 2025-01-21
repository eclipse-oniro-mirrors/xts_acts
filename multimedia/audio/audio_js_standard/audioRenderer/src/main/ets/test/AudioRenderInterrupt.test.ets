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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

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
      'VOICE_CALL': {
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
      // 'ULTRASONIC': {
      //     content: audio.ContentType.CONTENT_TYPE_ULTRASONIC,
      //     usage: audio.StreamUsage.STREAM_USAGE_SYSTEM,
      //     rendererFlags: 0
      // },
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0200
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0200', 0, async function (done) {
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0300
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0400
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0600
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0700', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0800
     * @tc.name      : AudioRender  SPEECH INTERRUPT MUSIC
     * @tc.desc      : AudioRender  SPEECH INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0900
     * @tc.name      : AudioRender  MOVIE INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MOVIE INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT MUSIC
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100
     * @tc.name      : AudioRender  MUSIC INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  MUSIC INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1300', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1400
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1400', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1600
     * @tc.name      : AudioRender  ALARM INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  ALARM INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1600', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1700', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1800
     * @tc.name      : AudioRender  SPEECH INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  SPEECH INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1800', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1900
     * @tc.name      : AudioRender  MOVIE INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  MOVIE INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1900', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2000', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2100
     * @tc.name      : AudioRender  MUSIC INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  MUSIC INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2200', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("16.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2300', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2400
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2400', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2600
     * @tc.name      : AudioRender  ALARM INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  ALARM INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2600', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render2.on("audioInterrupt", async (eventAction) => {
        console.log("26_2.eventAction=" + JSON.stringify(eventAction))
        if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
        } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
          expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
        } else { }
      })
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2800
     * @tc.name      : AudioRender  SPEECH INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  SPEECH INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2900
     * @tc.name      : AudioRender  MOVIE INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  MOVIE INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_2900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3100
     * @tc.name      : AudioRender  MUSIC INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  MUSIC INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3200', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("23.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3400
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3600
     * @tc.name      : AudioRender  ALARM INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  ALARM INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3800
     * @tc.name      : AudioRender  SPEECH INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  SPEECH INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3900
     * @tc.name      : AudioRender  MOVIE INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  MOVIE INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5100
     * @tc.name      : AudioRender  MUSIC INTERRUPT ALARM
     * @tc.desc      : AudioRender  MUSIC INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT ALARM
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5200', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("37.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT ALARM
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5400
     * @tc.name      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.desc      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5600
     * @tc.name      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.desc      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT ALARM
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5800
     * @tc.name      : AudioRender  SPEECH INTERRUPT ALARM
     * @tc.desc      : AudioRender  SPEECH INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5900
     * @tc.name      : AudioRender  MOVIE INTERRUPT ALARM
     * @tc.desc      : AudioRender  MOVIE INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_5900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT ALARM
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6100
     * @tc.name      : AudioRender  MUSIC INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  MUSIC INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6100', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6200', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6400
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6400', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6600
     * @tc.name      : AudioRender  ALARM INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  ALARM INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6800
     * @tc.name      : AudioRender  SPEECH INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  SPEECH INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6800', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6900
     * @tc.name      : AudioRender  MOVIE INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  MOVIE INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_6900', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7000', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100
     * @tc.name      : AudioRender  MUSIC INTERRUPT SPEECH
     * @tc.desc      : AudioRender  MUSIC INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT SPEECH
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7200', 0, async function (done) {
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT SPEECH
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7400
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT SPEECH
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7600
     * @tc.name      : AudioRender  ALARM INTERRUPT SPEECH
     * @tc.desc      : AudioRender  ALARM INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT SPEECH
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7700', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7800
     * @tc.name      : AudioRender  SPEECH INTERRUPT SPEECH
     * @tc.desc      : AudioRender  SPEECH INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7900
     * @tc.name      : AudioRender  MOVIE INTERRUPT SPEECH
     * @tc.desc      : AudioRender  MOVIE INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT SPEECH
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8100
     * @tc.name      : AudioRender  MUSIC INTERRUPT MOVIE
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8200
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT MOVIE
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8200', 0, async function (done) {
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8300
     * @tc.name      : AudioRender  RINGTONE INTERRUPT MOVIE
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8400
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT MOVIE
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8600
     * @tc.name      : AudioRender  ALARM INTERRUPT MOVIE
     * @tc.desc      : AudioRender  ALARM INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8700
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT MOVIE
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8700', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8800
     * @tc.name      : AudioRender  SPEECH INTERRUPT MOVIE
     * @tc.desc      : AudioRender  SPEECH INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8900
     * @tc.name      : AudioRender  MOVIE INTERRUPT MOVIE
     * @tc.desc      : AudioRender  MOVIE INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_8900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT MOVIE
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9100
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9200
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9200', 0, async function (done) {
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9300
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9400
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9600
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9700
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9700', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("7.eventAction=" + JSON.stringify(eventAction))
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9800
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9900
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_9900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10000
     * @tc.name      : AudioRender  UNKNOW INTERRUPT UNKNOW
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT UNKNOW
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10100
     * @tc.name      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10200
     * @tc.name      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10300
     * @tc.name      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_10300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7100', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17200
     * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17500
     * @tc.name      : AudioRender  RING INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  RING INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17500', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_19100
     * @tc.name      : AudioRender  MUSIC INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  MUSIC INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_19100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18300
     * @tc.name      : AudioRender  MOVIE INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  MOVIE INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18400
     * @tc.name      : AudioRender  GAME INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  GAME INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17400
     * @tc.name      : AudioRender  SPEECH INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  SPEECH INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18200
     * @tc.name      : AudioRender  NAVIGATION INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  NAVIGATION INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18600
     * @tc.name      : AudioRender  ALARM INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  ALARM INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18600', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
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

      let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18100
     * @tc.name      : AudioRender  NOTIFICATION INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18100', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await startFail(render2, done, render1)
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17300
     * @tc.name      : AudioRender  TTS INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  TTS INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_17300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18700
     * @tc.name      : AudioRender  ACCESSIBLITY INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  ACCESSIBLITY INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_18700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14400
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT GAME
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14400', 0, async function (done) {
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render2, done)
      await sleep(500)
      await release(render1, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14300
     * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT GAME
     * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14300', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'],done)
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15000
     * @tc.name      : AudioRender  RING INTERRUPT GAME
     * @tc.desc      : AudioRender  RING INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4100
     * @tc.name      : AudioRender  MOVIE INTERRUPT GAME
     * @tc.desc      : AudioRender  MOVIE INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4200
     * @tc.name      : AudioRender  GAME INTERRUPT GAME
     * @tc.desc      : AudioRender  GAME INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14900
     * @tc.name      : AudioRender  SPEECH INTERRUPT GAME
     * @tc.desc      : AudioRender  SPEECH INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000
     * @tc.name      : AudioRender  NAVIGATION INTERRUPT GAME
     * @tc.desc      : AudioRender  NAVIGATION INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_3000', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4700
     * @tc.name      : AudioRender  ALARM INTERRUPT GAME
     * @tc.desc      : AudioRender  ALARM INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13700
     * @tc.name      : AudioRender  NOTIFICATION INTERRUPT GAME
     * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14600
     * @tc.name      : AudioRender  TTS INTERRUPT GAME
     * @tc.desc      : AudioRender  TTS INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4900
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT GAME
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_4900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12700
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12700', 0, async function (done) {
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

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })
    //7149    duck inproc            VOICE_MESSAGE
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15100
     * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13300
     * @tc.name      : AudioRender  RING INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  RING INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13600
     * @tc.name      : AudioRender  MUSIC INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  MUSIC INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13800
     * @tc.name      : AudioRender  MOVIE INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  MOVIE INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13900
     * @tc.name      : AudioRender  GAME INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  GAME INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13200
     * @tc.name      : AudioRender  SPEECH INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  SPEECH INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13500
     * @tc.name      : AudioRender  NAVIGATION INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  NAVIGATION INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13500', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14100
     * @tc.name      : AudioRender  ALARM INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  ALARM INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13400
     * @tc.name      : AudioRender  NOTIFICATION INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_13400', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12900
     * @tc.name      : AudioRender  TTS INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  TTS INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_12900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14200
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_14200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16700
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16700', 0, async function (done) {
      let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'],done)
      await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      render1.on("audioInterrupt", async (eventAction) => {
        console.log("1.eventAction=" + JSON.stringify(eventAction))
        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
      })
      await start(render1, done)

      let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'],done)
      await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
      await start(render2, done)
      await sleep(500)
      await release(render1, done)
      await release(render2, done)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16800
     * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16100
     * @tc.name      : AudioRender  RING INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  RING INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16100', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15700
     * @tc.name      : AudioRender  MUSIC INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  MUSIC INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15700', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15600
     * @tc.name      : AudioRender  MOVIE INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  MOVIE INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15600', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15500
     * @tc.name      : AudioRender  GAME INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  GAME INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15500', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16200
     * @tc.name      : AudioRender  SPEECH INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  SPEECH INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16200', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15800
     * @tc.name      : AudioRender  NAVIGATION INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  NAVIGATION INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15800', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15300
     * @tc.name      : AudioRender  ALARM INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  ALARM INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15300', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15900
     * @tc.name      : AudioRender  NOTIFICATION INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15900', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16500
     * @tc.name      : AudioRender  TTS INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  TTS INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_16500', 0, async function (done) {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15200
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_15200', 0, async function (done) {
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