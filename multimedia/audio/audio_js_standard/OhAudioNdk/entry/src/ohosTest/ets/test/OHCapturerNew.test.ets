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
     * @tc.name   testOHAudioCapturerGetCurrentState001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETCURRENTSTATE_0100
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetCurrentState001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState001 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      console.log(`testOHAudioCapturerGetCurrentState001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetSampleFormat001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETSAMPLEFORMAT_0100
     * @tc.desc   ：Query the current output audio stream sampling format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetSampleFormat001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSampleFormat001 test start `);
      let sampleFormat: number | null = testStreamBuilder.OHAudioRendererGetSampleFormat();
      expect(sampleFormat).assertEqual(0);
      console.log(`testOHAudioCapturerGetSampleFormat001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetSamplingRate001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETSAMPLINGRATE_0100
     * @tc.desc   ：Query the current output audio stream sampling rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetSamplingRate001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSamplingRate001 test start `);
      let samplingRate: number | null = testStreamBuilder.OHAudioRendererGetSamplingRate();
      expect(samplingRate).assertEqual(number48000);
      console.log(`testOHAudioCapturerGetSamplingRate001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetStreamId001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETSTREAMID_0100
     * @tc.desc   ：Query the current output audio stream ID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetStreamId001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetStreamId001 test start `);
      let re: number = testStreamBuilder.OHAudioRendererGetStreamId();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetStreamId001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetSpeed001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETSPEED_0100
     * @tc.desc   ：Get playback speed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetSpeed001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSpeed001 test start `);
      let speed: number | null = testStreamBuilder.OHAudioRendererGetSpeed();
      expect(speed).assertEqual(1);
      console.log(`testOHAudioCapturerGetSpeed001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetChannelCount001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETCHANNELCOUNT_0100
     * @tc.desc   ：Query the current number of output audio channels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetChannelCount001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetChannelCount001 test start `);
      let channelCount: number | null = testStreamBuilder.OHAudioRendererGetChannelCount();
      expect(channelCount).assertEqual(numberTwo);
      console.log(`testOHAudioCapturerGetChannelCount001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetEncodingType001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETENCODINGTYPE_0100
     * @tc.desc   ：Query the current output audio stream encoding type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetEncodingType001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetEncodingType001 test start `);
      let encodingType: number | null = testStreamBuilder.OHAudioRendererGetEncodingType();
      expect(encodingType).assertEqual(AUDIOSTREAM_ENCODING_TYPE_RAW);
      console.log(`testOHAudioCapturerGetEncodingType001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetFrameSizeInCallback001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETFRAMESIZEINCALLBACK_0100
     * @tc.desc   ：Query the frame size in the callback, which is a fixed length that fills the flow every time the callback is performed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetFrameSizeInCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFrameSizeInCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioCapturerGetFrameSizeInCallback001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetFramesWritten001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETFRAMESWRITTEN_0100
     * @tc.desc   ：Query the number of frames written since self created streaming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetFramesWritten001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFramesWritten001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererGetFramesWritten();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioCapturerGetFramesWritten001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetLatencyMode001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETLATENCYMODE_0100
     * @tc.desc   ：Query the current output audio stream delay mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetLatencyMode001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetLatencyMode001 test start `);
      let mode: number | null = testStreamBuilder.OHAudioRendererGetLatencyMode();
      expect(mode).assertEqual(AUDIOSTREAM_LATENCY_MODE_NORMAL);
      console.log(`testOHAudioCapturerGetLatencyMode001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetCapturerInfo001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETCapturerINFO_0100
     * @tc.desc   ：Query the current output audio stream workspace type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetCapturerInfo001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCapturerInfo001 test start `);
      let usage: number | null = testStreamBuilder.OHAudioRendererGetRendererInfo();
      expect(usage).assertEqual(AUDIOSTREAM_USAGE_MUSIC );
      console.log(`testOHAudioCapturerGetCapturerrInfo001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerStart001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerSTART_0100
     * @tc.desc   ：Start outputting audio data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerStart001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerStart001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererStart();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      expect(state).assertEqual(AUDIOSTREAM_STATE_RUNNING);
      console.log(`testOHAudioCapturerStart001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetTimestamp001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETTIMESTAMP_0100
     * @tc.desc   ：Stop outputting audio stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetTimestamp001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerrGetTimestamp001 test start `);
      let state: number = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state > AUDIOSTREAM_STATE_PREPARED) {
        let re: number | null = testStreamBuilder.OHAudioRendererGetTimestamp();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      }
      console.log(`testOHAudioCapturerGetTimestamp001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerPause001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDICapturerPAUSE_0100
     * @tc.desc   ：Release the output audio stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerPause001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerPause001 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state === AUDIOSTREAM_STATE_RUNNING) {
        let re: number | null = testStreamBuilder.OHAudioRendererPause();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        expect(state).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }
      console.log(`testOHAudioCapturerPause001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerStop001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerSTOP_0100
     * @tc.desc   ：Stop outputting audio stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerStop001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerStop001 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state === AUDIOSTREAM_STATE_STOPPED || state === AUDIOSTREAM_STATE_RUNNING) {
        let re: number | null = testStreamBuilder.OHAudioRendererStop();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        expect(state).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }
      console.log(`testOHAudioCapturerStop001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerFlush001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerFLUSH_0100
     * @tc.desc   ：Discard audio data that has already been written.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerFlush001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerFlush001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererFlush();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioCapturerFlush001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerSetSpeed001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerSETSPEED_0100
     * @tc.desc   ：Set playback speed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerSetSpeed001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerSetSpeed001 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererSetSpeed(numberFloute);
      let speed: number | null = testStreamBuilder.OHAudioRendererGetSpeed();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      expect(speed).assertEqual(numberTwo);
      console.log(`testOHAudioCapturerSetSpeed001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetCurrentState001
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETCURRENTSTATE_0200
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetCurrentState001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState001 test start `);
      testStreamBuilder.OHAudioRendererStart();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_RUNNING);
      console.log(`testOHAudioCapturerGetCurrentState001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetCurrentState003
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETCURRENTSTATE_0300
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetCurrentState003', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState003 test start `);
      testStreamBuilder.OHAudioRendererPause();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      console.log(`testOHAudioCapturerGetCurrentState003 test end `);
      done();
    });

    /**
     * @tc.name   testOHAudioCapturerGetCurrentState004
     * @tc.number SUB_MULTIMEDIA_AUDIO_OHAUDIOCapturerGETCURRENTSTATE_0400
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testOHAudioCapturerGetCurrentState004', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState004 test start `);
      let state: number = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state > AUDIOSTREAM_STATE_PREPARED) {
        testStreamBuilder.OHAudioRendererStop();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(state).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }
      console.log(`testOHAudioCapturerGetCurrentState004 test end `);
      done();
    });
  });

  describe('OhAudioCapturerTest', () => {
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
     * @tc.name   testCreatCapturerAudioPlayer001
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATCapturerAUDIOPLAYER_0100
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatCapturerAudioPlayer001', 0, async (done: Function) => {
      console.log(`testCreatCapturerAudioPlayer001 test start `);

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

      console.log(`testCreatCapturerAudioPlayer001 test end `);
      done();
    });

    /**
     * @tc.name   testCreatCapturerrAudioPlayer002
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATCapturerAUDIOPLAYER_0200
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatCapturerrAudioPlayer002', 0, async (done: Function) => {
      console.log(`testCreatCapturerrAudioPlayer002 test start `);

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

      console.log(`testCreatCapturerAudioPlayer002 test end `);
      done();
    });

    /**
     * @tc.name   testCreatCapturerAudioPlayer003
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATCapturerAUDIOPLAYER_0300
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatCapturerAudioPlayer003', 0, async (done: Function) => {
      console.log(`testCreatCapturerAudioPlayer003 test start `);

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

      console.log(`testCreatCapturerAudioPlayer003 test end `);
      done();
    });

    /**
     * @tc.name   testCreatCapturerAudioPlayer004
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATCapturerAUDIOPLAYER_0400
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatCapturerAudioPlayer004', 0, async (done: Function) => {
      console.log(`testCreatCapturerAudioPlayer004 test start `);

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

      console.log(`testCreatCapturerAudioPlayer004 test end `);
      done();
    });

    /**
     * @tc.name   testCreatCapturerAudioPlayer005
     * @tc.number SUB_MULTIMEDIA_AUDIO_CREATCapturerAUDIOPLAYER_0500
     * @tc.desc   ：The state change of the state machine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('testCreatCapturerAudioPlayer005', 0, async (done: Function) => {
      console.log(`testCreatCapturerAudioPlayer005 test start `);

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

      console.log(`testCreatCapturerAudioPlayer005 test end `);
      done();
    });
  });
}
