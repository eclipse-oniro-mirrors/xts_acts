/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import testStreamBuilder from 'libohaudiondk.so';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import Utils from './Utils';

let sleep500: number = 500;
let sleep1000: number = 1000;
let sleep2000: number = 2000;
let sleep5000: number = 5000;
let numberTwo: number = 2;

let AUDIOSTREAM_LATENCY_MODE_NORMAL: number = 0;
let AUDIOSTREAM_LATENCY_MODE_FAST: number = 1;

let AUDIOSTREAM_SAMPLE_U8: number = 0;
let AUDIOSTREAM_SAMPLE_S16LE: number = 1;
let AUDIOSTREAM_SAMPLE_S24LE: number = 2;
let AUDIOSTREAM_SAMPLE_S32LE: number = 3;

let AUDIOSTREAM_ENCODING_INVALID: number = (-1);
let AUDIOSTREAM_ENCODING_TYPE_RAW: number = 0;
let AUDIOSTREAM_ENCODING_TYPE_OTHER: number = 1;

let AUDIOSTREAM_STATE_INVALID: number = (-1);
let AUDIOSTREAM_STATE_NEW: number = 0;
let AUDIOSTREAM_STATE_PREPARED: number = 1;
let AUDIOSTREAM_STATE_RUNNING: number = 2;
let AUDIOSTREAM_STATE_STOPPED: number = 3;
let AUDIOSTREAM_STATE_PAUSED: number = 5;

let indexZero: number = 0;
let indexOne: number = 1;
let indexTwo: number = 2;
let indexThree: number = 3;
let indexFour: number = 4;
let indexFive: number = 5;

let numberThree: number = 3;
let numberFour: number = 4;
let numberFive: number = 5;
let numberSix: number = 6;
let numberSeven: number = 7;
let numberEight: number = 8;
let numberTen: number = 10;
let numberEleven: number = 11;
let numberTwelve: number = 12;
let numberThirteen: number = 13;

let number200: number = 200;
let number500: number = 500;
let number48000: number = 48000;

let numberFloute: number = 2.0;

let CODE_SUCCESS: number = 200;
let AUDIOSTREAM_SUCCESS: number = 0;
let AUDIOSTREAM_ERROR_ILLEGAL_STATE: number = 2;


let AUDIOSTREAM_USAGE_UNKNOWN: number = 0;

let AUDIOSTREAM_USAGE_MUSIC: number = 1;

let AUDIOSTREAM_USAGE_VOICE_COMMUNICATION: number = 2;

let AUDIOSTREAM_USAGE_VOICE_ASSISTANT: number = 3;

let AUDIOSTREAM_USAGE_ALARM: number = 4;

let AUDIOSTREAM_USAGE_VOICE_MESSAGE: number = 5;

let AUDIOSTREAM_USAGE_RINGTONE: number = 6;

let AUDIOSTREAM_USAGE_NOTIFICATION: number = 7;

let AUDIOSTREAM_USAGE_ACE: number = 8;

let AUDIOSTREAM_USAGE_MOVIE: number = 10;

let AUDIOSTREAM_USAGE_GAME: number = 11;

let AUDIOSTREAM_USAGE_AUDIOBOOK: number = 12;

let AUDIOSTREAM_USAGE_NAVIGATION: number = 13;

let fileList: string[] = [
  'Believer.wav',
  'Believer60s.wav',
  'file_example_WAV_1MG.wav',
  'safe_and_sound_32.wav',
  'StarWars10s-1C-8000-2SW.wav',
  'StarWars10s-1C-16000-2SW.wav',
  'StarWars10s-1C-32000-1SW.wav',
  'StarWars10s-1C-44100-2SW.wav',
  'StarWars10s-1C-64000-3SW.wav',
  'StarWars10s-1C-96000-4SW.wav',
  'StarWars10s-2C-11025-1SW.wav',
  'StarWars10s-2C-12000-2SW.wav',
  'StarWars10s-2C-16000-3SW.wav',
  'StarWars10s-2C-22050-2SW.wav',
  'StarWars10s-2C-24000-3SW.wav',
  'StarWars10s-2C-48000-4SW.wav',
  'test_44100_2.wav',
  'vorbis_48000_32_1.wav'
];

let paramList: Map<string, number>[] = Array<Map<string, number>>();

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

function getAudioRendererParam(): boolean {
  let rerult = true;
  let rendererParamMap: Map<string, number> = new Map<string, number>();
  let re: number = testStreamBuilder.OHAudioRendererGetRendererInfo();
  if (re < AUDIOSTREAM_USAGE_UNKNOWN ) {
    rerult = false;
  } else {
    rendererParamMap.set('RendererInfo', re);
  }
  re = testStreamBuilder.OHAudioRendererGetChannelCount();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('ChannelCount', re);
  }
  re = testStreamBuilder.OHAudioRendererGetEncodingType();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('EncodingType', re);
  }
  re = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('FrameSize', re);
  }
  re = testStreamBuilder.OHAudioRendererGetFramesWritten();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('FramesWritten', re);
  }
  re = testStreamBuilder.OHAudioRendererGetLatencyMode();
  if (re < AUDIOSTREAM_LATENCY_MODE_NORMAL) {
    rerult = false;
  } else {
    rendererParamMap.set('LatencyMode', re);
  }
  re = testStreamBuilder.OHAudioRendererGetSampleFormat();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('SampleFormat', re);
  }
  re = testStreamBuilder.OHAudioRendererGetSamplingRate();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('SamplingRate', re);
  }
  paramList.push(rendererParamMap);
  re = testStreamBuilder.OHAudioRendererGetStreamId();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioRendererGetTimestamp();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioRendererGetSpeed();
  if (re < 0) {
    rerult = false;
  }
  return rerult;
}

function verifyRendererProperties(tempMap: Map<string, number>): boolean {
  let result: boolean = true;
  let re: number = testStreamBuilder.OHAudioRendererGetRendererInfo();
  if (re < AUDIOSTREAM_USAGE_UNKNOWN ) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('RendererInfo'));
  }

  re = testStreamBuilder.OHAudioRendererGetChannelCount();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('ChannelCount'));
  }
  re = testStreamBuilder.OHAudioRendererGetEncodingType();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('EncodingType'));
  }

  re = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('FrameSize'));
  }

  re = testStreamBuilder.OHAudioRendererGetFramesWritten();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('FramesWritten'));
  }
  re = testStreamBuilder.OHAudioRendererGetLatencyMode();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('LatencyMode'));
  }
  re = testStreamBuilder.OHAudioRendererGetSampleFormat();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('SampleFormat'));
  }
  re = testStreamBuilder.OHAudioRendererGetSamplingRate();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('SamplingRate'));
  }
  re = testStreamBuilder.OHAudioRendererGetStreamId();
  if (re < 0) {
    result = false;
  }
  re = testStreamBuilder.OHAudioRendererGetTimestamp();
  if (re < 0) {
    result = false;
  }
  re = testStreamBuilder.OHAudioRendererGetSpeed();
  if (re < 0) {
    result = false;
  }
  return result;
}

function copyAllWavFile(): boolean {
  for (let i: number = 0; i < fileList.length; i++) {
    let fileName: string = fileList[i];
    try {
      let context = getContext();
      let dir = context.filesDir + '/';
      let ml_face_model_file = dir + fileName;
      context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
        if (error) {
          console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy failed:${error.code}, message: ${error.message}.`);
        } else {
          let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy success`);
        }
      });
      console.info('[rawfile_copy_to_sandbox] sandbox path:' + dir);
    } catch (error) {
      console.info('[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
    }
  }
  return true;
}

export default function OhRendererTest() {

  describe('OhRendererTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + '/';
      try {
        let ml_face_model_file = dir + 'Believer60s.wav';
        context.resourceManager.getRawFileContent('Believer60s.wav', (error, model_buffer) => {
          if (error) {
            console.log(
              `[wavfile_copy_to_sandbox] Believer60s.wav is
              copy failed:${error.code}, message: ${error.message}.`
            );
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log('[wavfile_copy_to_sandbox] Believer60s.wav is copy success');
          }
        });
      } catch (error) {
        console.info('[wavfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
      }
      testStreamBuilder.CreatRendererAudioPlayer();
      console.info('[wavfile_copy_to_sandbox] sandbox path:' + dir);
      await Utils.sleep(sleep2000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      testStreamBuilder.CloseAudioRender();
      console.info('afterAll case ');
    });

    /**
     * @tc.name   testOHAudioRendererGetCurrentState001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0100
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetCurrentState001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState001 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      console.log(`testOHAudioRendererGetCurrentState001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetSampleFormat001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSAMPLEFORMAT_0100
     * @tc.desc   ：Query the current output audio stream sampling format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetSampleFormat001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetSampleFormat001 test start `);
      let sampleFormat: number | null = testStreamBuilder.OHAudioRendererGetSampleFormat();
      expect(sampleFormat).assertEqual(0);
      console.log(`testOHAudioRendererGetSampleFormat001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetSamplingRate001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSAMPLINGRATE_0100
     * @tc.desc   ：Query the current output audio stream sampling rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetSamplingRate001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetSamplingRate001 test start `);
      let samplingRate: number | null = testStreamBuilder.OHAudioRendererGetSamplingRate();
      expect(samplingRate).assertEqual(number48000);
      console.log(`testOHAudioRendererGetSamplingRate001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetStreamId001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSTREAMID_0100
     * @tc.desc   ：Query the current output audio stream ID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetStreamId001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetStreamId001 test start `);
      let re: number = testStreamBuilder.OHAudioRendererGetStreamId();
      expect(re).assertLarger(0);
      console.log(`testOHAudioRendererGetStreamId001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetSpeed001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSPEED_0100
     * @tc.desc   ：Get playback speed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetSpeed001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetSpeed001 test start `);
      let speed: number | null = testStreamBuilder.OHAudioRendererGetSpeed();
      expect(speed).assertEqual(1);
      console.log(`testOHAudioRendererGetSpeed001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetChannelCount001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCHANNELCOUNT_0100
     * @tc.desc   ：Query the current number of output audio channels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetChannelCount001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetChannelCount001 test start `);
      let channelCount: number | null = testStreamBuilder.OHAudioRendererGetChannelCount();
      expect(channelCount).assertEqual(numberTwo);
      console.log(`testOHAudioRendererGetChannelCount001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetEncodingType001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETENCODINGTYPE_0100
     * @tc.desc   ：Query the current output audio stream encoding type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetEncodingType001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetEncodingType001 test start `);
      let encodingType: number | null = testStreamBuilder.OHAudioRendererGetEncodingType();
      expect(encodingType).assertEqual(AUDIOSTREAM_ENCODING_TYPE_RAW);
      console.log(`testOHAudioRendererGetEncodingType001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetFrameSizeInCallback001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETFRAMESIZEINCALLBACK_0100
     * @tc.desc   ：Query the frame size in the callback, which is a fixed length that fills the flow every time the callback is performed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetFrameSizeInCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetFrameSizeInCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioRendererGetFrameSizeInCallback001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetFramesWritten001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETFRAMESWRITTEN_0100
     * @tc.desc   ：Query the number of frames written since self created streaming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetFramesWritten001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetFramesWritten001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererGetFramesWritten();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioRendererGetFramesWritten001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetLatencyMode001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETLATENCYMODE_0100
     * @tc.desc   ：Query the current output audio stream delay mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetLatencyMode001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetLatencyMode001 test start `);
      let mode: number | null = testStreamBuilder.OHAudioRendererGetLatencyMode();
      expect(mode).assertEqual(AUDIOSTREAM_LATENCY_MODE_NORMAL);
      console.log(`testOHAudioRendererGetLatencyMode001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetRendererInfo001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETRENDERERINFO_0100
     * @tc.desc   ：Query the current output audio stream workspace type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetRendererInfo001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetRendererInfo001 test start `);
      let usage: number | null = testStreamBuilder.OHAudioRendererGetRendererInfo();
      expect(usage).assertEqual(AUDIOSTREAM_USAGE_MUSIC );
      console.log(`testOHAudioRendererGetRendererInfo001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererStart001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERSTART_0100
     * @tc.desc   ：Start outputting audio data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererStart001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererStart001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererStart();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      expect(state).assertEqual(AUDIOSTREAM_STATE_RUNNING);
      console.log(`testOHAudioRendererStart001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetTimestamp001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETTIMESTAMP_0100
     * @tc.desc   ：Stop outputting audio stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetTimestamp001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetTimestamp001 test start `);
      let state: number = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state > AUDIOSTREAM_STATE_PREPARED) {
        let re: number | null = testStreamBuilder.OHAudioRendererGetTimestamp();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      }
      console.log(`testOHAudioRendererGetTimestamp001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererPause001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERPAUSE_0100
     * @tc.desc   ：Release the output audio stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererPause001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererPause001 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state === AUDIOSTREAM_STATE_RUNNING) {
        let re: number | null = testStreamBuilder.OHAudioRendererPause();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        expect(state).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }
      console.log(`testOHAudioRendererPause001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererStop001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERSTOP_0100
     * @tc.desc   ：Stop outputting audio stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererStop001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererStop001 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state === AUDIOSTREAM_STATE_STOPPED || state === AUDIOSTREAM_STATE_RUNNING) {
        let re: number | null = testStreamBuilder.OHAudioRendererStop();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        expect(state).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }
      console.log(`testOHAudioRendererStop001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererFlush001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERFLUSH_0100
     * @tc.desc   ：Discard audio data that has already been written.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererFlush001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererFlush001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererFlush();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioRendererFlush001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererSetSpeed001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERSETSPEED_0100
     * @tc.desc   ：Set playback speed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererSetSpeed001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererSetSpeed001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererSetSpeed(numberFloute);
      let speed: number | null = testStreamBuilder.OHAudioRendererGetSpeed();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      expect(speed).assertEqual(numberTwo);
      console.log(`testOHAudioRendererSetSpeed001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetCurrentState001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0200
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetCurrentState001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState001 test start `);
      testStreamBuilder.OHAudioRendererStart();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_RUNNING);
      console.log(`testOHAudioRendererGetCurrentState001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetCurrentState003
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0300
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetCurrentState003', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState003 test start `);
      testStreamBuilder.OHAudioRendererPause();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      console.log(`testOHAudioRendererGetCurrentState003 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioRendererGetCurrentState004
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0400
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioRendererGetCurrentState004', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState004 test start `);
      let state: number = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state > AUDIOSTREAM_STATE_PREPARED) {
        testStreamBuilder.OHAudioRendererStop();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(state).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }
      console.log(`testOHAudioRendererGetCurrentState004 test end `);
      done();
    });
  });

  describe('OhAudioRendererTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + '/';
      try {
        let ml_face_model_file = dir + 'Believer60s.wav';
        context.resourceManager.getRawFileContent('Believer60s.wav', (error, model_buffer) => {
          if (error) {
            console.log(
              `[wavfile_copy_to_sandbox] Believer60s.wav is
              copy failed:${error.code}, message: ${error.message}.`
            );
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log('[wavfile_copy_to_sandbox] Believer60s.wav is copy success');
          }
        });
      } catch (error) {
        console.info('[wavfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
      }
      console.info('[wavfile_copy_to_sandbox] sandbox path:' + dir);
      await Utils.sleep(sleep2000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await Utils.sleep(sleep500);
    });
    afterAll(async () => {
      console.info('afterAll case ');
      await testStreamBuilder.CloseAudioRender();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer001
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0100
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer001', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer001 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer001 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer002
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0200
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer002', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer002 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer002 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer003
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0300
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer003', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer003 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer003 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer004
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0400
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer004', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer004 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer004 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer005
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0500
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer005', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer005 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer005 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer006
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0600
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer006', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer006 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer006 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer007
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0700
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer007', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer007 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer007 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer008
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0800
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer008', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer008 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer008 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer009
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0900
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer009', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer009 test start `);
      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer009 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer010
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1000
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer010', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer010 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer010 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer011
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1100
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer011', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer011 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_RUNNING);

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer011 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer012
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1200
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer012', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer012 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer012 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer013
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1300
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer013', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer013 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer013 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer014
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1400
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer014', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer014 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer014 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer015
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1500
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer015', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer015 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer015 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer016
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1600
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer016', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer016 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer016 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer017
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1700
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer017', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer017 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertFalse();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer017 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer018
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1800
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer018', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer018 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer018 test end `);
      done();
    });
    /**
     * @tc.name   testCreatRendererAudioPlayer019
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1900
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer019', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer019 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer019 test end `);
      done();
    });

    /**
     * @tc.name   testCreatRendererAudioPlayer020
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_2000
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatRendererAudioPlayer020', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer020 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer020 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0100
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo001 test start `);
      let re: number = await testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_UNKNOWN);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo002
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0200
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo002 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_VOICE_COMMUNICATION);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo002 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo003
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0300
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo003 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_VOICE_ASSISTANT);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo003 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo004
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0400
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo004 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_ALARM);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo004 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo005
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0500
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo005 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_MOVIE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo005 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo006
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0600
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo006 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_GAME);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo006 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo007
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0700
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo007', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo007 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_AUDIOBOOK);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo007 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo008
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0800
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo008', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo008 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_NAVIGATION);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo008 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo009
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0900
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo009', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo009 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_VOICE_MESSAGE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo009 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo010
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1000
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo010', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo010 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_RINGTONE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo010 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo011
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1100
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo011', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo011 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_NOTIFICATION);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo011 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo012
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1200
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo012', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo012 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_ACE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo012 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioStreamBuilderSetRendererInfo013
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1300
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioStreamBuilderSetRendererInfo013', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo013 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_MUSIC);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo013 test end `);
      done();
    });
  });

}
