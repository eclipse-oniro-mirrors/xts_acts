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
let render1: ESObject;
let render2: ESObject;
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
  MUSIC: renderInfoChild,
  RINGTONE: renderInfoChild,
  VOICE_ASSISTANT: renderInfoChild,
  ALARM: renderInfoChild,
  ACCESSIBILITY: renderInfoChild,
  MOVIE: renderInfoChild,
  GAME: renderInfoChild,
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

export default function audioInterrupterTest() {
  describe('audioInterrupterTest', async () => {
    let Tag: string = 'audioInterrupterTest';
    let sleep = (ms: number): Promise<ESObject> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    beforeAll(async () => {
      console.info('TestLog: Start Testing AudioPlaybackCapturer Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag} AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(async () => {
      if (render1.state !== audio.AudioState.STATE_RELEASED) {
        await render1.release()
        console.info(`${Tag} AudioFrameworkTest: afterEach: render1 release success`);
      }
      if (render2.state !== audio.AudioState.STATE_RELEASED) {
        await render2.release()
        console.info(`${Tag} AudioFrameworkTest: afterEach: render2 release success`);
      }
      await sleep(1000)
      console.info(`${Tag} AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      console.info(`${Tag} AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
    })
    let renderInfo: renderInfoType = {
      MUSIC: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0,
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
      MOVIE: {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      GAME: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
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

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INTERRUPT_TEST_0100
     * @tc.name      : test[AudioRedner MUSIC INTERRUPT GAME]
     * @tc.desc      : AudioRedner in INDEPENDENT_MODE  MUSIC interrupt GAME action play both
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1= await createAudioRenderer(renderInfo.GAME, streamInfo.A16000, done)
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1.start()
        render1.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0100 come in render1.on：" + JSON.stringify(interruptEvent))
          listeningFlag01 = true;
        })
        render2 = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2.start()
        render2.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0100 come in render2.on：" + JSON.stringify(interruptEvent))
          listeningFlag02 = true;
        })
        expect(listeningFlag01 == false && listeningFlag02 == false).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue()
      }
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INTERRUPT_TEST_0200
     * @tc.name      : test[AudioRedner ALARM INTERRUPT MOVIE]
     * @tc.desc      : AudioRedner in INDEPENDENT_MODE ALARM interrupt ALARM action PAUSE already exists
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1.start()
        render1.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          if (interruptEvent.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            console.log("TEST_0200 come in INTERRUPT_TYPE_BEGIN：" + JSON.stringify(interruptEvent))
            listeningFlag01 = true
            expect(interruptEvent.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE);
          } else if (interruptEvent.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            console.log("TEST_0200 come in INTERRUPT_TYPE_END：" + JSON.stringify(interruptEvent))
            listeningFlag02 = true
            expect(interruptEvent.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME);
          } else {
            console.log("TEST_0200 come in Fail：" + JSON.stringify(interruptEvent))
            expect(false).assertTrue();
          }
        })
        render2 = await createAudioRenderer(renderInfo.ALARM, streamInfo.A16000, done)
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2.start()
        render2.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0200 come in render2.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue();
        })
        await sleep(500)
        //先释放触发render2 触发render1.on返回参数INTERRUPT_HINT_RESUME
        await renderRelease(render2, done)
        await sleep(500)
        await renderRelease(render1, done)
        expect(listeningFlag01 && listeningFlag02).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue();
      }
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INTERRUPT_TEST_0300
     * @tc.name      : test[AudioRedner RING INTERRUPT ALARM]
     * @tc.desc      : AudioRedner  in INDEPENDENT_MODE RING interrupt ALARM action STOP already exists
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        let listeningFlag01 = false;
        render1 = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1.start()
        render1.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          if (interruptEvent.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            console.log("TEST_0300 come in INTERRUPT_TYPE_BEGIN" + JSON.stringify(interruptEvent))
            listeningFlag01 = true
            expect(interruptEvent.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP);
          } else {
            console.log("TEST_0300 come in fail" + JSON.stringify(interruptEvent))
            expect(false).assertTrue();
          }
        })
        render2 = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A16000, done)
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2.start()
        render2.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0300 come in render2.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue();
        })
        await sleep(500)
        await renderRelease(render2, done)
        await sleep(500)
        await renderRelease(render1, done)
        expect(listeningFlag01).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue()
      }
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INTERRUPT_TEST_0400
     * @tc.name      : test[AudioRedner ACCESSIBILITY INTERRUPT MOVIE]
     * @tc.desc      : AudioRedner in INDEPENDENT_MODE ACCESSIBILITY interrupt MOVIE action DUCK already exists
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1.start()
        render1.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          if (interruptEvent.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
            console.log("TEST_0400 come in INTERRUPT_TYPE_BEGIN" + JSON.stringify(interruptEvent))
            listeningFlag01 = true
            expect(interruptEvent.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK);
          } else if (interruptEvent.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
            console.log("TEST_0400 come in INTERRUPT_TYPE_END" + JSON.stringify(interruptEvent))
            listeningFlag02 = true
            expect(interruptEvent.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK);
          } else {
            console.log("TEST_0400 come in fail" + JSON.stringify(interruptEvent))
            expect(false).assertTrue();
          }
        })
        render2 = await createAudioRenderer(renderInfo.ACCESSIBILITY, streamInfo.A16000, done)
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2.start()
        render2.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0400 come in render2.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue();
        })
        await sleep(500)
        //先释放触发render2 触发render1.on返回参数INTERRUPT_HINT_UNDUCK
        await renderRelease(render2, done)
        await sleep(500)
        await renderRelease(render1, done)
        expect(listeningFlag01 && listeningFlag02).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue()
      }
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INTERRUPT_TEST_0500
     * @tc.name      : test[AudioRedner VOICE_ASSISTANT INTERRUPT RINGTONE]
     * @tc.desc      : AudioRedner in INDEPENDENT_MODE VOICE_ASSISTANT interrupt RINGTONE action DENY  coming
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        render1 = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1.start()
        render1.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0100 come in render1.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue()
        })
        render2 = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A48000, done)
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2.start()
        expect(false).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(err.code).assertEqual(6800301)
      }
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_INTERRUPT_TEST_0600
     * @tc.name      : test[AudioRedner MUSIC INTERRUPT MUSIC]
     * @tc.desc      : AudioRedner in INDEPENDENT_MODE MUSIC interrupt MUSIC action play both
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
        await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        await render1.start()
        render1.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0600 come in render1.on：" + JSON.stringify(interruptEvent))
          listeningFlag01 = true;
        })
        render2 = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A16000, done)
        await render2.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        await render2.start()
        render2.on("audioInterrupt", async (interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0600 come in render2.on：" + JSON.stringify(interruptEvent))
          listeningFlag02 = true;
        })
        expect(listeningFlag01 == false && listeningFlag02 == false ).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue()
      }
      done()
    })

  })
}