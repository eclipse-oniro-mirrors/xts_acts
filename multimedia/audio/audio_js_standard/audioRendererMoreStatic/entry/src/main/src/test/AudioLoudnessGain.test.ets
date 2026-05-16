/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';

export default function audioLoudnessGainTest() {

  const TAG = "[AudioLoudnessGainJsTest]";

  describe("AudioLoudnessGainJsTest", () => {

    beforeAll(async () => {
      console.info(TAG + "beforeAll called");
    })

    afterAll(() => {
      console.info(TAG + 'afterAll called')
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach called')
    })

    afterEach(() => {
      console.info(TAG + 'afterEach called')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_001
     * @tc.desc   right test, set number is -90.0, streamtype is music,expect -89.9 < loudnessGain < -90.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = -90.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - (-90.0)) < 1).assertTrue();
        } catch (error) {
          console.error('createAudioRenderer Fail!');
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_002
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_002
     * @tc.desc   right test, set number is -89.9, streamtype is music,expect -89.8 < loudnessGain < -90.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = -89.9;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - (-89.9)) < 1).assertTrue();
        } catch (error) {
          console.error('createAudioRenderer Fail!');
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_003
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_003
     * @tc.desc   right test, set number is 24.0, streamtype is movie,expect loudnessGain = 24.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          console.error('createAudioRenderer Fail!');
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_004
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_004
     * @tc.desc   right test, set number is 23.9, streamtype is audiobook,expect 23.8 < loudnessGain < 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 23.9;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 23.9) < 1).assertTrue();
        } catch (error) {
          console.error('createAudioRenderer Fail!');
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_005
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_005
     * @tc.desc   back test, set number is -90.1,expect error.code = 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = -90.1;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          console.error(TAG, `setLoudnessGain Fail: ${error.code}`);
          expect(6800101 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_006
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_006
     * @tc.desc   back test, set number is 24.1,expect error.code = 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.1;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          console.error(TAG, `setLoudnessGain Fail: ${error.code}`);
          expect(6800101 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_009
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_009
     * @tc.desc   back test, set streamtype is STREAM_USAGE_UNKNOWN,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_010
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_010
     * @tc.desc   back test, set streamtype is STREAM_USAGE_VOICE_COMMUNICATION,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_011
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_011
     * @tc.desc   back test, set streamtype is STREAM_USAGE_VOICE_COMMUNICATION,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_012
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_012
     * @tc.desc   back test, set streamtype is STREAM_USAGE_VOICE_ALARM,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_013
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_013
     * @tc.desc   back test, set streamtype is STREAM_USAGE_VOICE_MESSAGE,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_014
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_014
     * @tc.desc   back test, set streamtype is STREAM_USAGE_NOTIFICATION,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_016
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_016
     * @tc.desc   back test, set streamtype is STREAM_USAGE_GAME,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_017
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_017
     * @tc.desc   back test, set streamtype is STREAM_USAGE_NAVIGATION,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_018
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_018
     * @tc.desc   back test, set streamtype is STREAM_USAGE_VIDEO_COMMUNICATION,expect error.code = 6800104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_STATIC_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);

      let loudnessGainFloatTen = 24.0;
      if (audioRenderer) {
        try {
          await audioRenderer!.setLoudnessGain(loudnessGainFloatTen);
          let loudnessGain = audioRenderer!.getLoudnessGain();
          console.info(TAG, `setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          expect(Math.abs(loudnessGain - 24) < 1).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          expect(6800104 == error.code).assertTrue();
        }
      } else {
        console.error('createAudioRenderer Fail');
      }
      done();
    })
  })
}