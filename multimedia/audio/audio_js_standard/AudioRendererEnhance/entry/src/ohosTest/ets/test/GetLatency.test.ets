/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';

interface AudioStreamInfo {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface AudioRendererInfo {
  content: number,
  usage: number,
  rendererFlags: 0
}

interface AudioRendererOptions {
  streamInfo: AudioStreamInfo,
  rendererInfo: AudioRendererInfo
}

export default function audioRendererTest() {
  describe('AudioRendererLatency', () => {
    const TagFrmwkRender = 'audioRendererEnhanceLatency';
    const stringParameter = 'invalid_parameter';

    let sleep = (ms: number): Promise<void> => {
      return new Promise((resolve) => {
        setTimeout(() => resolve(), ms);
      });
    }

    let createMovieRenderer = async (): Promise<audio.AudioRenderer> => {
      let audioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }

      let audioRendererOptions: AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      return await audio.createAudioRenderer(audioRendererOptions);
    }

    let releaseRenderer = async (audioRenderer?: audio.AudioRenderer) => {
      if (!audioRenderer) {
        return;
      }
      try {
        await audioRenderer.stop();
      } catch (err) {
        console.info(`${TagFrmwkRender}: stop renderer error: ${JSON.stringify(err)}`);
      }
      try {
        await audioRenderer.release();
      } catch (err) {
        console.info(`${TagFrmwkRender}: release renderer error: ${JSON.stringify(err)}`);
      }
    }

    beforeAll(() => {
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(async () => {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0100
     * @tc.desc   AudioRenderer-getLatency with LATENCY_TYPE_ALL using movie stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let audioRenderer: audio.AudioRenderer | undefined;
      try {
        audioRenderer = await createMovieRenderer();
        await audioRenderer.start();
        let otLatency = 0;
        let latency = audioRenderer.getLatency(audio.AudioLatencyType.LATENCY_TYPE_ALL);
        console.info(`${TagFrmwkRender}: getLatency ALL: ${latency}`);
        expect(latency).assertLargerOrEqual(otLatency);
      } catch (error) {
        console.info(`${TagFrmwkRender}: getLatency all error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
      }
      await releaseRenderer(audioRenderer);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0200
     * @tc.desc   AudioRenderer-getLatency with software and hardware latency types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let audioRenderer: audio.AudioRenderer | undefined;
      try {
        audioRenderer = await createMovieRenderer();
        await audioRenderer.start();
        let softLatency = 0;
        let hardLatency = 0;
        let swLatency = audioRenderer.getLatency(audio.AudioLatencyType.LATENCY_TYPE_SOFTWARE);
        let hwLatency = audioRenderer.getLatency(audio.AudioLatencyType.LATENCY_TYPE_HARDWARE);
        console.info(`${TagFrmwkRender}: getLatency software: ${swLatency}, hardware: ${hwLatency}`);
        expect(swLatency).assertLargerOrEqual(softLatency);
        expect(hwLatency).assertLargerOrEqual(hardLatency);
      } catch (error) {
        console.info(`${TagFrmwkRender}: getLatency subtype error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
      }
      await releaseRenderer(audioRenderer);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0300
     * @tc.desc   AudioRenderer-getLatency invalid parameter check.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let audioRenderer: audio.AudioRenderer | undefined;
      let erreParam: number = 6800101;
      let errParam: number = -10;
      let errorCode = 0;
      try {
        audioRenderer = await createMovieRenderer();
        await audioRenderer.start();
        audioRenderer.getLatency(errParam);
        expect(false).assertTrue();
      } catch (error) {
        let businessErr = error as BusinessError;
        errorCode = Number(businessErr.code);
        console.info(`${TagFrmwkRender}: getLatency invalid param error: ${JSON.stringify(error)}`);
      }
      await releaseRenderer(audioRenderer);
      expect(errorCode).assertEqual(erreParam);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0400
     * @tc.desc   AudioRenderer-getLatency Released state check.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let audioRenderer: audio.AudioRenderer | undefined;
      let errStatus: number = 6800103;
      let errorCode = 0;
      try {
        audioRenderer = await createMovieRenderer();
        await audioRenderer.start();
        await releaseRenderer(audioRenderer);
        audioRenderer.getLatency(audio.AudioLatencyType.LATENCY_TYPE_ALL);
        expect(false).assertTrue();
      } catch (error) {
        let businessErr = error as BusinessError;
        errorCode = Number(businessErr.code);
        console.info(`${TagFrmwkRender}: getLatency invalid param error: ${JSON.stringify(error)}`);
      }
      expect(errorCode).assertEqual(errStatus);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0500
     * @tc.desc   AudioRenderer-Latency types check.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_LATENCY_0500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1,
    async (done: Function) => {
      let allLatency = 0;
      let swLatency = 1;
      let hdLatency = 2;
      try {
        expect(audio.AudioLatencyType.LATENCY_TYPE_ALL).assertEqual(allLatency);
        console.info('allLatency type match the expect type. ${audio.AudioLatencyType.LATENCY_TYPE_ALL}');
        expect(audio.AudioLatencyType.LATENCY_TYPE_SOFTWARE).assertEqual(swLatency);
        console.info('allLatency type match the expect type. ${audio.AudioLatencyType.LATENCY_TYPE_SOFTWARE}');
        expect(audio.AudioLatencyType.LATENCY_TYPE_HARDWARE).assertEqual(hdLatency);
        console.info('allLatency type match the expect type. ${audio.AudioLatencyType.LATENCY_TYPE_HARDWARE}');
      } catch (error) {
        console.info("obtained delay type does not match the enumeration value.");
      }
      done();
    })
  })
}
