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
import audio from '@ohos.multimedia.audio';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import Utils from './Util.test';

let render1: audio.AudioRenderer | undefined;
let render2: audio.AudioRenderer | undefined;
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
  MUSIC: audio.AudioRendererInfo,
  RINGTONE: audio.AudioRendererInfo,
  VOICE_ASSISTANT: audio.AudioRendererInfo,
  ALARM: audio.AudioRendererInfo,
  ACCESSIBILITY: audio.AudioRendererInfo,
  MOVIE: audio.AudioRendererInfo,
  GAME: audio.AudioRendererInfo,
}

interface streamInfoChild {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface streamInfoType {
  A16000: audio.AudioStreamInfo,
  A44100: audio.AudioStreamInfo,
  A48000: audio.AudioStreamInfo
}

export default function audioInterrupterTest() {
  describe('audioInterrupterTest', () => {
    let Tag: string = 'audioInterrupterTest';

    beforeAll(async () => {
      console.info('TestLog: Start Testing AudioPlaybackCapturer Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag} AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
    })

    afterEach(async () => {
      if (render1!.state !== audio.AudioState.STATE_RELEASED) {
        await render1!.release()
        console.info(`${Tag} AudioFrameworkTest: afterEach: render1 release success`);
      }
      if (render2!.state !== audio.AudioState.STATE_RELEASED) {
        await render2!.release()
        console.info(`${Tag} AudioFrameworkTest: afterEach: render2 release success`);
      }
      await Utils.msSleep(1000)
      console.info(`${Tag} AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      console.info(`${Tag} AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
    })
    let renderInfo: renderInfoType = {
      MUSIC: {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
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
      MOVIE: {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      },
      GAME: {
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
      async (AudioRendererInfo: audio.AudioRendererInfo, AudioStreamInfo: audio.AudioStreamInfo, done: () => void): Promise<audio.AudioRenderer> => {
        let render: audio.AudioRenderer | null = null;
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
        return render!
      }
    let renderRelease = async (render: audio.AudioRenderer, done: () => void) => {
      if (render.state === audio.AudioState.STATE_RELEASED) {
        console.log("renderRelease render state: " + render.state)
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        })
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0100
     * @tc.desc   AudioRedner in INDEPENDENT_MODE  MUSIC interrupt GAME action play both
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.GAME, streamInfo.A16000, done)
        await render1!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1!.start()
        render1!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0100 come in render1.on：" + JSON.stringify(interruptEvent))
          listeningFlag01 = true;
        })
        render2 = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
        await render2!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2!.start()
        render2!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0200
     * @tc.desc   AudioRedner in INDEPENDENT_MODE ALARM interrupt ALARM action PAUSE already exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
        await render1!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1!.start()
        render1!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
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
        await render2!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2!.start()
        render2!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0200 come in render2.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue();
        })
        await Utils.msSleep(500)
        //先释放触发render2 触发render1.on返回参数INTERRUPT_HINT_RESUME
        await renderRelease(render2!, done)
        await Utils.msSleep(500)
        await renderRelease(render1!, done)
        expect(listeningFlag01 && listeningFlag02).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue();
      }
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0300
     * @tc.desc   AudioRedner  in INDEPENDENT_MODE RING interrupt ALARM action STOP already exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let listeningFlag01 = false;
        render1 = await createAudioRenderer(renderInfo.ALARM, streamInfo.A44100, done)
        await render1!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1!.start()
        render1!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
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
        await render2!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2!.start()
        render2!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0300 come in render2.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue();
        })
        await Utils.msSleep(500)
        await renderRelease(render2!, done)
        await Utils.msSleep(500)
        await renderRelease(render1!, done)
        expect(listeningFlag01).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue()
      }
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0400
     * @tc.desc   AudioRedner in INDEPENDENT_MODE ACCESSIBILITY interrupt MOVIE action DUCK already exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.MOVIE, streamInfo.A44100, done)
        await render1!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1!.start()
        render1!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
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
        await render2!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2!.start()
        render2!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0400 come in render2.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue();
        })
        await Utils.msSleep(500)
        //先释放触发render2 触发render1.on返回参数INTERRUPT_HINT_UNDUCK
        await renderRelease(render2!, done)
        await Utils.msSleep(500)
        await renderRelease(render1!, done)
        expect(listeningFlag01 && listeningFlag02).assertTrue()
      } catch (err) {
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(false).assertTrue()
      }
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0500
     * @tc.desc   AudioRedner in INDEPENDENT_MODE VOICE_ASSISTANT interrupt RINGTONE action DENY  coming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        render1 = await createAudioRenderer(renderInfo.RINGTONE, streamInfo.A44100, done)
        await render1!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render1!.start()
        render1!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0100 come in render1.on：" + JSON.stringify(interruptEvent))
          expect(false).assertTrue()
        })
        render2 = await createAudioRenderer(renderInfo.VOICE_ASSISTANT, streamInfo.A48000, done)
        await render2!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await render2!.start()
        expect(false).assertTrue()
      } catch (err) {
        err = err as BusinessError;
        console.log("INTERRUPTER_TEST err:" + JSON.stringify(err))
        expect(err.code).assertEqual(6800301)
      }
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0600
     * @tc.desc   AudioRedner in INDEPENDENT_MODE MUSIC interrupt MUSIC action play both
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_INTERRUPTER_TEST_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let listeningFlag01 = false;
        let listeningFlag02 = false;
        render1 = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A44100, done)
        await render1!.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        await render1!.start()
        render1!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.log("TEST_0600 come in render1.on：" + JSON.stringify(interruptEvent))
          listeningFlag01 = true;
        })
        render2 = await createAudioRenderer(renderInfo.MUSIC, streamInfo.A16000, done)
        await render2!.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        await render2!.start()
        render2!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
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
