import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';

export default function audioGetRendererInfoTest() {

  describe('audioRendererGetRendererInfo', () => {
    const Tag: string = 'AudioRendererGetRendererInfo';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_USAGE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_USAGE_001
     * @tc.desc   AudioRenderer getRendererInfo usage property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_USAGE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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

      let audioRenderer: audio.AudioRenderer | null = null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let rendererInfo = await audioRenderer!.getRendererInfo();
        console.info(`${Tag} getRendererInfo result: ${JSON.stringify(rendererInfo)}`);
        expect(rendererInfo.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`${Tag} usage property test PASS`);
      } catch (err) {
        console.log(`${Tag} getRendererInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_RENDERERFLAGS_002
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_RENDERERFLAGS_002
     * @tc.desc   AudioRenderer getRendererInfo rendererFlags property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_RENDERERFLAGS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 1
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null = null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let rendererInfo = await audioRenderer!.getRendererInfo();
        console.info(`${Tag} 111111111111111111111111getRendererInfo result: ${JSON.stringify(rendererInfo)}`);
        expect(rendererInfo.rendererFlags).assertLargerOrEqual(0);
        console.info(`${Tag} rendererFlags property test PASS`);
      } catch (err) {
        console.log(`${Tag} getRendererInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });

  describe('audioRendererGetRendererInfoSync', () => {
    const Tag: string = 'AudioRendererGetRendererInfoSync';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_SYNC_USAGE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_SYNC_USAGE_001
     * @tc.desc   AudioRenderer getRendererInfoSync usage property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_RENDERER_INFO_SYNC_USAGE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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

      let audioRenderer: audio.AudioRenderer | null = null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let rendererInfo = audioRenderer!.getRendererInfoSync();
        console.info(`${Tag} getRendererInfoSync result: ${JSON.stringify(rendererInfo)}`);
        expect(rendererInfo.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`${Tag} usage property test PASS`);
      } catch (err) {
        console.log(`${Tag} getRendererInfoSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });

  describe('audioRendererGetStreamInfo', () => {
    const Tag: string = 'AudioRendererGetStreamInfo';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_STREAM_INFO_SAMPLINGRATE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_STREAM_INFO_SAMPLINGRATE_001
     * @tc.desc   AudioRenderer getStreamInfo samplingRate property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_STREAM_INFO_SAMPLINGRATE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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

      let audioRenderer: audio.AudioRenderer | null = null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let streamInfo = await audioRenderer!.getStreamInfo();
        console.info(`${Tag} getStreamInfo result: ${JSON.stringify(streamInfo)}`);
        expect(streamInfo.samplingRate).assertEqual(audio.AudioSamplingRate.SAMPLE_RATE_44100);
        console.info(`${Tag} samplingRate property test PASS`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });

  describe('audioRendererGetStreamInfoSync', () => {
    const Tag: string = 'AudioRendererGetStreamInfoSync';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_STREAM_INFO_SYNC_SAMPLINGRATE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_STREAM_INFO_SYNC_SAMPLINGRATE_001
     * @tc.desc   AudioRenderer getStreamInfoSync samplingRate property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_STREAM_INFO_SYNC_SAMPLINGRATE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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

      let audioRenderer: audio.AudioRenderer | null = null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let streamInfo = audioRenderer!.getStreamInfoSync();
        console.info(`${Tag} getStreamInfoSync result: ${JSON.stringify(streamInfo)}`);
        expect(streamInfo.samplingRate).assertEqual(audio.AudioSamplingRate.SAMPLE_RATE_44100);
        console.info(`${Tag} samplingRate property test PASS`);
      } catch (err) {
        console.log(`${Tag} getStreamInfoSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });

  describe('audioRendererGetAudioTimestampInfoSync', () => {
    const Tag: string = 'AudioRendererGetAudioTimestampInfoSync';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GET_AUDIO_TIMESTAMP_INFO_SYNC_FRAMEPOS_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GET_AUDIO_TIMESTAMP_INFO_SYNC_FRAMEPOS_001
     * @tc.desc   AudioRenderer getAudioTimestampInfoSync framePos property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_RENDERER_GET_AUDIO_TIMESTAMP_INFO_SYNC_FRAMEPOS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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

      let audioRenderer: audio.AudioRenderer | null = null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        await audioRenderer!.start();
        console.info(`${Tag} audioRenderer start success`);
      } catch (err) {
        console.log(`${Tag} audioRenderer start err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        let timestampInfo = audioRenderer!.getAudioTimestampInfoSync();
        console.info(`${Tag} getAudioTimestampInfoSync result: ${JSON.stringify(timestampInfo)}`);
        console.info(`${Tag} framePos value: ${timestampInfo.framePos}`);
        expect(timestampInfo.framePos).assertLargerOrEqual(0);
        console.info(`${Tag} framePos property test PASS`);
      } catch (err) {
        console.error(`${Tag} getAudioTimestampInfoSync err: ${JSON.stringify(err)}`);
        console.error(`${Tag} Error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.stop();
        console.info(`${Tag} audioRenderer stop success`);
      } catch (err) {
        console.log(`${Tag} audioRenderer stop err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioRenderer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });

  describe('audioRendererOnOutputDeviceChangeWithInfo', () => {
    const Tag: string = 'AudioRendererOnOutputDeviceChangeWithInfo';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_ON_OUTPUT_DEVICE_CHANGE_WITH_INFO_TYPE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_ON_OUTPUT_DEVICE_CHANGE_WITH_INFO_TYPE_001
     * @tc.desc   AudioRenderer on outputDeviceChangeWithInfo type property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_ON_OUTPUT_DEVICE_CHANGE_WITH_INFO_TYPE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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

      let audioRenderer: audio.AudioRenderer | null = null;
      let outputDeviceChangeWithInfoReceived: boolean = false;

      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);

        audioRenderer!.on('outputDeviceChangeWithInfo', (audioStreamDeviceChangeInfo) => {
          console.info(`${Tag} outputDeviceChangeWithInfo event received: ${JSON.stringify(audioStreamDeviceChangeInfo)}`);
          expect(audioStreamDeviceChangeInfo.devices).assertLargerOrEqual(0);
          expect(audioStreamDeviceChangeInfo.changeReason).assertLessOrEqual(0);
          outputDeviceChangeWithInfoReceived = true;
        });
      } catch (err) {
        console.log(`${Tag} on outputDeviceChangeWithInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      done();
    });
  });
  let Tag: string = 'AudioRendererOnOutputDeviceChangeWithInfo';
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_INVALID_063
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_INVALID_063
     * @tc.desc   AudioRenderer createAudioRenderer callback sampleFormat SAMPLE_FORMAT_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_INVALID_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(audioRen == null).assertEqual(true)
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_U8_064
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_U8_064
     * @tc.desc   AudioRenderer createAudioRenderer callback sampleFormat SAMPLE_FORMAT_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_U8_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_S24LE_065
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_S24LE_065
     * @tc.desc   AudioRenderer createAudioRenderer callback sampleFormat SAMPLE_FORMAT_S24LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_S24LE_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_S32LE_066
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_S32LE_066
     * @tc.desc   AudioRenderer createAudioRenderer callback sampleFormat SAMPLE_FORMAT_S32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_S32LE_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_F32LE_067
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_F32LE_067
     * @tc.desc   AudioRenderer createAudioRenderer callback sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_SAMPLE_FORMAT_F32LE_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_ENCODING_TYPE_INVALID_068
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_ENCODING_TYPE_INVALID_068
     * @tc.desc   AudioRenderer createAudioRenderer callback encodingType ENCODING_TYPE_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_ENCODING_TYPE_INVALID_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(audioRen == null).assertEqual(true)
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_UNKNOWN_069
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_UNKNOWN_069
     * @tc.desc   AudioRenderer createAudioRenderer callback content CONTENT_TYPE_UNKNOWN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_UNKNOWN_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_MUSIC_070
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_MUSIC_070
     * @tc.desc   AudioRenderer createAudioRenderer callback content CONTENT_TYPE_MUSIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_MUSIC_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_MOVIE_071
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_MOVIE_071
     * @tc.desc   AudioRenderer createAudioRenderer callback content CONTENT_TYPE_MOVIE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_MOVIE_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_SONIFICATION_072
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_SONIFICATION_072
     * @tc.desc   AudioRenderer createAudioRenderer callback content CONTENT_TYPE_SONIFICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_SONIFICATION_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_RINGTONE_073
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_RINGTONE_073
     * @tc.desc   AudioRenderer createAudioRenderer callback content CONTENT_TYPE_RINGTONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_CONTENT_RINGTONE_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_UNKNOWN_074
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_UNKNOWN_074
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_UNKNOWN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_UNKNOWN_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_MEDIA_075
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_MEDIA_075
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_MEDIA test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_MEDIA_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VOICE_ASSISTANT_076
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VOICE_ASSISTANT_076
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_VOICE_ASSISTANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VOICE_ASSISTANT_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_ALARM_077
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_ALARM_077
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_ALARM_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VOICE_MESSAGE_078
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VOICE_MESSAGE_078
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_VOICE_MESSAGE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VOICE_MESSAGE_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_NOTIFICATION_079
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_NOTIFICATION_079
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_NOTIFICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_NOTIFICATION_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_RINGTONE_080
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_RINGTONE_080
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_RINGTONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_RINGTONE_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_ACCESSIBILITY_081
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_ACCESSIBILITY_081
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_ACCESSIBILITY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_ACCESSIBILITY_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_MOVIE_082
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_MOVIE_082
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_MOVIE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_MOVIE_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_GAME_083
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_GAME_083
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_GAME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_GAME_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_AUDIOBOOK_084
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_AUDIOBOOK_084
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_AUDIOBOOK test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_AUDIOBOOK_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_NAVIGATION_085
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_NAVIGATION_085
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_NAVIGATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_NAVIGATION_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VIDEO_COMMUNICATION_086
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VIDEO_COMMUNICATION_086
     * @tc.desc   AudioRenderer createAudioRenderer callback usage STREAM_USAGE_VIDEO_COMMUNICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CALLBACK_USAGE_VIDEO_COMMUNICATION_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_INVALID_087
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_INVALID_087
     * @tc.desc   AudioRenderer createAudioRenderer promise sampleFormat SAMPLE_FORMAT_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_INVALID_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(audioRen == null).assertEqual(true)
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_F32LE_088
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_F32LE_088
     * @tc.desc   AudioRenderer createAudioRenderer promise sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level    LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_F32LE_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_UNKNOWN_089
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_UNKNOWN_089
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_UNKNOWN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_UNKNOWN_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_MEDIA_090
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_MEDIA_090
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_MEDIA test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_MEDIA_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VOICE_ASSISTANT_091
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VOICE_ASSISTANT_091
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_VOICE_ASSISTANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VOICE_ASSISTANT_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_ALARM_092
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_ALARM_092
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_ALARM_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VOICE_MESSAGE_093
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VOICE_MESSAGE_093
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_VOICE_MESSAGE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VOICE_MESSAGE_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_NOTIFICATION_094
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_NOTIFICATION_094
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_NOTIFICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_NOTIFICATION_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_RINGTONE_095
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_RINGTONE_095
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_RINGTONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_RINGTONE_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_ACCESSIBILITY_096
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_ACCESSIBILITY_096
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_ACCESSIBILITY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_ACCESSIBILITY_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_MOVIE_097
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_MOVIE_097
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_MOVIE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_MOVIE_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_GAME_098
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_GAME_098
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_GAME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_GAME_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_AUDIOBOOK_099
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_AUDIOBOOK_099
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_AUDIOBOOK test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_AUDIOBOOK_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_NAVIGATION_100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_NAVIGATION_100
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_NAVIGATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_NAVIGATION_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VIDEO_COMMUNICATION_101
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VIDEO_COMMUNICATION_101
     * @tc.desc   AudioRenderer createAudioRenderer promise usage STREAM_USAGE_VIDEO_COMMUNICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_USAGE_VIDEO_COMMUNICATION_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_F32LE_101
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_F32LE_101
     * @tc.desc   AudioRenderer createAudioRenderer promise sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_SAMPLE_FORMAT_F32LE_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_ENCODING_TYPE_INVALID_102
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_ENCODING_TYPE_INVALID_102
     * @tc.desc   AudioRenderer createAudioRenderer promise encodingType ENCODING_TYPE_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_PROMISE_ENCODING_TYPE_INVALID_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(audioRen == null).assertEqual(true)
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });
  

  describe('audioCreateAudioRenderer', () => {
    const Tag: string = 'AudioCreateAudioRenderer';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_11025_002
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_11025_002
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_11025 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_11025_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_12000_003
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_12000_003
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_12000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_12000_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_16000_004
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_16000_004
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_16000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_16000_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_22050_005
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_22050_005
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_22050 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_22050_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_24000_006
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_24000_006
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_24000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_24000_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_32000_007
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_32000_007
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_32000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_32000_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_64000_008
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_64000_008
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_64000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_64000_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_88200_009
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_88200_009
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_88200 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_88200_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_96000_010
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_96000_010
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_96000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_96000_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_176400_011
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_176400_011
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_176400 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_176400_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_192000_012
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_192000_012
     * @tc.desc   AudioRenderer createAudioRenderer samplingRate SAMPLE_RATE_192000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_SAMPLING_RATE_192000_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_1_013
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_1_013
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_3_014
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_3_014
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_3 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_4_015
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_4_015
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_4 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_5_016
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_5_016
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_5 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_5_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_6_017
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_6_017
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_6 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_6_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_7_018
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_7_018
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_7 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_7_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_8_019
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_8_019
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_8_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_9_020
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_9_020
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_9 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_9_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_10_021
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_10_021
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_10 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_10_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_12_022
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_12_022
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_12 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_12_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_14_023
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_CHANNELS_14_023
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_14 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_14_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_16_024
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_16_024
     * @tc.desc   AudioRenderer createAudioRenderer channels CHANNEL_16 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_channels_16_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_U8_025
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_U8_025
     * @tc.desc   AudioRenderer createAudioRenderer sampleFormat SAMPLE_FORMAT_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_U8_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_S24LE_026
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_S24LE_026
     * @tc.desc   AudioRenderer createAudioRenderer sampleFormat SAMPLE_FORMAT_S24LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_S24LE_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_S32LE_027
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_S32LE_027
     * @tc.desc   AudioRenderer createAudioRenderer sampleFormat SAMPLE_FORMAT_S32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_S32LE_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_F32LE_028
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_F32LE_028
     * @tc.desc   AudioRenderer createAudioRenderer sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_sample_format_F32LE_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_unknown_029
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_unknown_029
     * @tc.desc   AudioRenderer createAudioRenderer content CONTENT_TYPE_UNKNOWN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_unknown_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_music_030
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_music_030
     * @tc.desc   AudioRenderer createAudioRenderer content CONTENT_TYPE_MUSIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_music_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_movie_031
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_movie_031
     * @tc.desc   AudioRenderer createAudioRenderer content CONTENT_TYPE_MOVIE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_movie_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_sonification_032
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_sonification_032
     * @tc.desc   AudioRenderer createAudioRenderer content CONTENT_TYPE_SONIFICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_sonification_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_ringtone_033
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_ringtone_033
     * @tc.desc   AudioRenderer createAudioRenderer content CONTENT_TYPE_RINGtone test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_content_ringtone_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_media_034
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_media_034
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_MEDIA test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_media_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_communication_035
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_communication_035
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_VOICE_communication test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_communication_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_assistant_036
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_assistant_036
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_voice_assistant test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_assistant_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_alarm_037
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_alarm_037
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_alarm_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_message_038
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_message_038
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_voice_message test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_voice_message_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_notification_039
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_notification_039
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_notification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_notification_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_ringtone_040
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_ringtone_040
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_ringtone test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_ringtone_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_accessibility_041
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_accessibility_041
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_accessibility test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_accessibility_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_movie_042
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_movie_042
     * @tc.desc   AudioRenderer createAudioRenderer usage STREAM_USAGE_movie test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_RENDERER_usage_movie_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      };

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRen: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} createAudioRenderer success`);
        expect(audioRen !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioRenderer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioRen !== null) {
        try {
          await audioRen.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });
  });
}
