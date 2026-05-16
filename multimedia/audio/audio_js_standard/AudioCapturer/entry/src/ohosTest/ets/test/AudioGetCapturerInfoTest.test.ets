import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import audioHaptic from '@ohos.multimedia.audioHaptic';
import common from '@ohos.app.ability.common';

export default function audioGetCapturerInfoTest() {
  describe('audioCapturerGetCapturerInfo', () => {
    const Tag: string = 'AudioCapturerGetCapturerInfo';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_CAPTURER_INFO_SOURCE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_CAPTURER_INFO_SOURCE_001
     * @tc.desc   AudioCapturer getCapturerInfo source property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_CAPTURER_INFO_SOURCE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCapturer: audio.AudioCapturer | null = null;
      try {
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let capturerInfo = await audioCapturer!.getCapturerInfo();
        console.info(`${Tag} getCapturerInfo result: ${JSON.stringify(capturerInfo)}`);
        expect(capturerInfo.source).assertEqual(audio.SourceType.SOURCE_TYPE_MIC);
        console.info(`${Tag} source property test PASS`);
      } catch (err) {
        console.log(`${Tag} getCapturerInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCapturer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_CAPTURER_INFO_CAPTURERFLAGS_002
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_CAPTURER_INFO_CAPTURERFLAGS_002
     * @tc.desc   AudioCapturer getCapturerInfo capturerFlags property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_CAPTURER_INFO_CAPTURERFLAGS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0,
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCapturer: audio.AudioCapturer | null = null;
      try {
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let capturerInfo = await audioCapturer!.getCapturerInfo();
        console.info(`${Tag} getCapturerInfo result: ${JSON.stringify(capturerInfo)}`);
        expect(capturerInfo.capturerFlags).assertLargerOrEqual(0);
        console.info(`${Tag} capturerFlags property test PASS`);
      } catch (err) {
        console.log(`${Tag} getCapturerInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCapturer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });

  describe('audioCapturerGetStreamInfo', () => {
    const Tag: string = 'AudioCapturerGetStreamInfo';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_STREAM_INFO_SAMPLINGRATE_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_STREAM_INFO_SAMPLINGRATE_001
     * @tc.desc   AudioCapturer getStreamInfo samplingRate property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_STREAM_INFO_SAMPLINGRATE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCapturer: audio.AudioCapturer | null = null;
      try {
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let streamInfo = await audioCapturer!.getStreamInfo();
        console.info(`${Tag} getStreamInfo result: ${JSON.stringify(streamInfo)}`);
        expect(streamInfo.samplingRate).assertEqual(audio.AudioSamplingRate.SAMPLE_RATE_44100);
        console.info(`${Tag} samplingRate property test PASS`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCapturer!.release();
        console.info(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });
  });
  describe('audioCreateAudioCapturer', () => {
    const Tag: string = 'AudioCreateAudioCapturer';

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_8000_001
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_8000_001
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_8000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_8000_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_11025_002
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_11025_002
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_11025 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_11025_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_12000_003
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_12000_003
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_12000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_12000_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_16000_004
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_16000_004
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_16000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_16000_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_22050_005
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_22050_005
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_22050 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_22050_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_24000_006
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_24000_006
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_24000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_24000_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_32000_007
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_32000_007
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_32000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_32000_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_64000_008
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_64000_008
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_64000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_64000_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_88200_009
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_88200_009
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_88200 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_88200_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_96000_010
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_96000_010
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_96000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_96000_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_176400_011
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_176400_011
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_176400 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_176400_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_192000_012
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_192000_012
     * @tc.desc   AudioCapturer createAudioCapturer samplingRate SAMPLE_RATE_192000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLING_RATE_192000_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_1_013
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_1_013
     * @tc.desc   AudioCapturer createAudioCapturer channels CHANNEL_1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_3_014
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_3_014
     * @tc.desc   AudioCapturer createAudioCapturer channels CHANNEL_3 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_4_015
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_4_015
     * @tc.desc   AudioCapturer createAudioCapturer channels CHANNEL_4 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_5_016
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_5_016
     * @tc.desc   AudioCapturer createAudioCapturer channels CHANNEL_5 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_5_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_6_017
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_6_017
     * @tc.desc   AudioCapturer createAudioCapturer channels CHANNEL_6 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CHANNELS_6_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_U8_025
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_U8_025
     * @tc.desc   AudioCapturer createAudioCapturer sampleFormat SAMPLE_FORMAT_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_U8_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_S24LE_026
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_S24LE_026
     * @tc.desc   AudioCapturer createAudioCapturer sampleFormat SAMPLE_FORMAT_S24LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_S24LE_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_S32LE_027
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_S32LE_027
     * @tc.desc   AudioCapturer createAudioCapturer sampleFormat SAMPLE_FORMAT_S32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_S32LE_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_F32LE_028
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_F32LE_028
     * @tc.desc   AudioCapturer createAudioCapturer sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SAMPLE_FORMAT_F32LE_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SOURCE_voice_recognition_029
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SOURCE_voice_recognition_029
     * @tc.desc   AudioCapturer createAudioCapturer source SOURCE_TYPE_VOICE_recognition test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_SOURCE_voice_recognition_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_voice_communication_030
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_voice_communication_030
     * @tc.desc   AudioCapturer createAudioCapturer source SOURCE_TYPE_VOICE_communication test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_voice_communication_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_voice_message_031
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_voice_message_031
     * @tc.desc   AudioCapturer createAudioCapturer source SOURCE_TYPE_voice_message test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_voice_message_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_camcorder_032
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_camcorder_032
     * @tc.desc   AudioCapturer createAudioCapturer source SOURCE_TYPE_camcorderater test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_camcorder_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_unprocessed_033
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_unprocessed_033
     * @tc.desc   AudioCapturer createAudioCapturer source SOURCE_TYPE_unprocessed test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_source_unprocessed_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_callback_success_034
     * @tc.number SUB SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_callback_success_034
     * @tc.desc   AudioCapturer createAudioCapturer callback success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_callback_success_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audio.createAudioCapturer(AudioCapturerOptions, (err, data) => {
          if (err) {
            console.log(`${Tag} 2222222createAudioCapturer callback err: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done();
            return;
          } else {
            console.log(`${Tag} 1111111createAudioCapturer callback success`);
            audioCap = data;
            audioCap.release();
            expect(audioCap !== null).assertEqual(true);
            done();
          }
        });
      } catch (err) {
        console.log(`${Tag} 3333333createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_INVALID_035
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_INVALID_035
     * @tc.desc   AudioCapturer createAudioCapturer callback sampleFormat SAMPLE_FORMAT_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_INVALID_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} 23232323createAudioCapturer success`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${Tag} 232323232createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(audioCap == null).assertEqual(true);
        done();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_U8_036
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_U8_036
     * @tc.desc   AudioCapturer createAudioCapturer callback sampleFormat SAMPLE_FORMAT_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_U8_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_S24LE_037
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_S24LE_037
     * @tc.desc   AudioCapturer createAudioCapturer callback sampleFormat SAMPLE_FORMAT_S24LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_S24LE_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_S32LE_038
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_S32LE_038
     * @tc.desc   AudioCapturer createAudioCapturer callback sampleFormat SAMPLE_FORMAT_S32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_S32LE_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_F32LE_039
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_F32LE_039
     * @tc.desc   AudioCapturer createAudioCapturer callback sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SAMPLE_FORMAT_F32LE_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_ENCODING_TYPE_INVALID_040
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_ENCODING_TYPE_INVALID_040
     * @tc.desc   AudioCapturer createAudioCapturer callback encodingType ENCODING_TYPE_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_ENCODING_TYPE_INVALID_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = { source: audio.SourceType.SOURCE_TYPE_MIC, capturerFlags: 0 };

      let AudioCapturerOptions: audio.AudioCapturerOptions = { streamInfo: audioStreamInfo, capturerInfo: audioCapturerInfo };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(audioCap == null).assertEqual(true)
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_INVALID_041
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_INVALID_041
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_INVALID_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(audioCap == null).assertEqual(true)
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_MIC_042
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_MIC_042
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_MIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_MIC_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_RECOGNITION_043
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_RECOGNITION_043
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_VOICE_RECOGNITION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_RECOGNITION_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_PLAYBACK_CAPTURE_044
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_PLAYBACK_CAPTURE_044
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_PLAYBACK_CAPTURE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_PLAYBACK_CAPTURE_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_COMMUNICATION_045
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_COMMUNICATION_045
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_VOICE_COMMUNICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_COMMUNICATION_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_MESSAGE_046
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_MESSAGE_046
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_VOICE_MESSAGE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_VOICE_MESSAGE_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_CAMCORDER_047
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_CAMCORDER_047
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_CAMCORDER test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_CAMCORDER_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_UNPROCESSED_048
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_UNPROCESSED_048
     * @tc.desc   AudioCapturer createAudioCapturer callback source SOURCE_TYPE_UNPROCESSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_CALLBACK_SOURCE_UNPROCESSED_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_INVALID_049
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_INVALID_049
     * @tc.desc   AudioCapturer createAudioCapturer promise sampleFormat SAMPLE_FORMAT_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_INVALID_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(audioCap == null).assertEqual(true)
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_U8_050
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_U8_050
     * @tc.desc   AudioCapturer createAudioCapturer promise sampleFormat SAMPLE_FORMAT_U8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_U8_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_S24LE_051
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_S24LE_051
     * @tc.desc   AudioCapturer createAudioCapturer promise sampleFormat SAMPLE_FORMAT_S24LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_S24LE_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_S32LE_052
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_S32LE_052
     * @tc.desc   AudioCapturer createAudioCapturer promise sampleFormat SAMPLE_FORMAT_S32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_S32LE_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_F32LE_053
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_F32LE_053
     * @tc.desc   AudioCapturer createAudioCapturer promise sampleFormat SAMPLE_FORMAT_F32LE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SAMPLE_FORMAT_F32LE_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_ENCODING_TYPE_INVALID_054
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_ENCODING_TYPE_INVALID_054
     * @tc.desc   AudioCapturer createAudioCapturer promise encodingType ENCODING_TYPE_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_ENCODING_TYPE_INVALID_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(audioCap == null).assertEqual(true)
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_INVALID_055
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_INVALID_055
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_INVALID_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(false).assertTrue();
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(audioCap == null).assertEqual(true)
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_MIC_056
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_MIC_056
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_MIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_MIC_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_RECOGNITION_057
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_RECOGNITION_057
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_VOICE_RECOGNITION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_RECOGNITION_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_PLAYBACK_CAPTURE_058
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_PLAYBACK_CAPTURE_058
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_PLAYBACK_CAPTURE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_PLAYBACK_CAPTURE_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_COMMUNICATION_059
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_COMMUNICATION_059
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_VOICE_COMMUNICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_COMMUNICATION_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_MESSAGE_060
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_MESSAGE_060
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_VOICE_MESSAGE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_VOICE_MESSAGE_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_CAMCORDER_061
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_CAMCORDER_061
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_CAMCORDER test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_CAMCORDER_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_UNPROCESSED_062
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_UNPROCESSED_062
     * @tc.desc   AudioCapturer createAudioCapturer promise source SOURCE_TYPE_UNPROCESSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CREATE_CAPTURER_PROMISE_SOURCE_UNPROCESSED_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      };

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCap: audio.AudioCapturer | null = null;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} createAudioCapturer success`);
        expect(audioCap !== null).assertEqual(true)
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      if (audioCap !== null) {
        try {
          await audioCap.release();
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        }
      }
      done();
    });
  });
}
