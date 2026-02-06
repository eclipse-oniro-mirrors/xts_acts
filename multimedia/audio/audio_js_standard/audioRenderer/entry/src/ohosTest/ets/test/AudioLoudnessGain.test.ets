/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver } from '@ohos.UiTest';



export default function audioLoudnessGainTest() {

  const TAG = "[AudioLoudnessGainJsTest]";
  const stringParameter: ESObject = 'stringParameter';
  const params: ESObject = '';
  const numberParameter = 12345678;

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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_001
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_001
     * @tc.desc      : right test, set number is -90.0, streamtype is music,expect loudnessGain = -90.0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_001", Level.LEVEL0, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = -90.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(loudnessGain).assertEqual(-90.0);
          }catch(error){
            console.error('createAudioRenderer Fail!');
          }
          done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_002
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_002
     * @tc.desc      : right test, set number is -89.9, streamtype is music,expect -89.8 < loudnessGain < -90.0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_002", Level.LEVEL0, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = -89.9;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - (-89.9)) < 0.1).assertTrue();
          }catch(error){
            console.error('createAudioRenderer Fail!');
          }
          done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_003
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_003
     * @tc.desc      : right test, set number is 24.0, streamtype is movie,expect loudnessGain = 24.0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_003", Level.LEVEL0, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            console.error('createAudioRenderer Fail!');
          }
          done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_004
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_004
     * @tc.desc      : right test, set number is 23.9, streamtype is audiobook,expect 23.8 < loudnessGain < 24
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_004", Level.LEVEL0, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 23.9;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 23.9) < 0.1).assertTrue();
          }catch(error){
            console.error('createAudioRenderer Fail!');
          }
          done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_005
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_005
     * @tc.desc      : back test, set number is -90.1,expect error.code = 6800101
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_005", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = -90.1;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            console.error(TAG,`setLoudnessGain Fail: ${error.code}`);
            expect(6800101 == error.code).assertTrue();
          }
          
        }else{
            console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_006
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_006
     * @tc.desc      : back test, set number is 24.1,expect error.code = 6800101
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_006", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.1;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            console.error(TAG,`setLoudnessGain Fail: ${error.code}`);
            expect(6800101 == error.code).assertTrue();
          }
          
        }else{
            console.error('createAudioRenderer Fail');
        }
        done();
    })
    

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_007
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_007
     * @tc.desc      : back test, set numgber is undefined,expect error.code = 401 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_007", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(undefined);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          }catch(error){
            expect(401 == error.code).assertTrue();
          }
          done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_008
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_008
     * @tc.desc      : back test, set numgber is null,expect error.code = 401 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_008", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(null);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
          }catch(error){
            expect(401 == error.code).assertTrue();
          }
          done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_009
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_009
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_UNKNOWN,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_009", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_010
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_010
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_VOICE_COMMUNICATION,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_010", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_011
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_011
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_VOICE_COMMUNICATION,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_011", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_012
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_012
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_VOICE_ALARM,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_012", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_013
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_013
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_VOICE_MESSAGE,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_013", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_014
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_014
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_NOTIFICATION,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_014", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_016
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_016
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_GAME,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_016", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_017
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_017
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_NAVIGATION,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_017", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_018
     * @tc.name      : SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_018
     * @tc.desc      : back test, set streamtype is STREAM_USAGE_VIDEO_COMMUNICATION,expect error.code = 6800104
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_LOUDNESS_GAIN_INTERFACE_TEST_018", Level.LEVEL2, async (done: Function) => {
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

        let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

        let loudnessGainFloatTen = 24.0;
        if(audioRenderer){
          try{
            await audioRenderer.setLoudnessGain(loudnessGainFloatTen);
            let loudnessGain = audioRenderer.getLoudnessGain();
            console.info(TAG,`setLoudnessGain and getLoudnessGain Success!, loudness is ${loudnessGain}`);
            expect(Math.abs(loudnessGain - 24) < 0.1).assertTrue();
          }catch(error){
            expect(6800104 == error.code).assertTrue();
          }
          
        }else{
          console.error('createAudioRenderer Fail');
        }
        done();
    })




  })
}