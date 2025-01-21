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
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { Component, Driver, ON } from '@ohos.UiTest';

let rateValue: number = 48000;
let channelCount: number = 2;
let encodingType: number = 0;
let latencyMode: number = 1;
let frameSizeValue: number = 240;
let sampleFormat: number = 0;

let sleep500: number = 500;
let sleep1000: number = 1000;
let sleep3000: number = 3000;

let channelTwo: number = 2;

let AUDIOSTREAM_TYPE_CAPTURER: number = 1;
let AUDIOSTREAM_TYPE_RENDERER: number = 0;

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

let numberTwo: number = 2;
let numberThree: number = 3;
let numberFour: number = 4;
let numberFive: number = 5;
let numberSeven: number = 7;
let numberEight: number = 8;
let numberNine: number = 9;
let numberTen: number = 10;
let numberNinety: number = 90;

let number1500: number = 1500;
let number44100: number = 44100;
let number48000: number = 48000;

let CODE_SUCCESS: number = 200;
let AUDIOSTREAM_SUCCESS: number = 0;
let AUDIOSTREAM_ERROR_ILLEGAL_STATE: number = 2;
let AUDIOSTREAM_ERROR_INVALID_PARAM: number = 1;

let AUDIOSTREAM_SOURCE_TYPE_INVALID: number = (-1);
let AUDIOSTREAM_SOURCE_TYPE_MIC: number = 0;
let AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION: number = 1;
let AUDIOSTREAM_SOURCE_TYPE_PLAYBACK_CAPTURE: number = 2;
let AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION: number = 7;
function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

function getAudioCapturerParam(hasTimestamp: boolean = true): boolean {
  let rerult = true;
  let re: number = testStreamBuilder.OHAudioCapturerGetCapturerInfo();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetChannelCount();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetEncodingType();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetFrameSizeInCallback();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetFramesRead();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetLatencyMode();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetSampleFormat();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetSamplingRate();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetStreamId();
  if (re < 0) {
    rerult = false;
  }
  if (hasTimestamp) {
    re = testStreamBuilder.OHAudioCapturerGetFramePosition();
    if (re < 0) {
      rerult = false;
    }
    re = testStreamBuilder.OHAudioCapturerGetTimestamp();
    if (re < 0) {
      rerult = false;
    }
  }
  return rerult;
}

function verifyCapturerProperties(): boolean {
  let rerult = true;
  let re: number = testStreamBuilder.OHAudioCapturerGetCapturerInfo();
  if (re < 0) {
    rerult = false;
  }

  re = testStreamBuilder.OHAudioCapturerGetChannelCount();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(channelCount);
  }
  re = testStreamBuilder.OHAudioCapturerGetEncodingType();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(AUDIOSTREAM_ENCODING_TYPE_RAW);
  }
  re = testStreamBuilder.OHAudioCapturerGetFrameSizeInCallback();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(frameSizeValue);
  }

  re = testStreamBuilder.OHAudioCapturerGetFramesRead();
  if (re < 0) {
    rerult = false;
  }

  re = testStreamBuilder.OHAudioCapturerGetLatencyMode();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(latencyMode);
  }
  re = testStreamBuilder.OHAudioCapturerGetSampleFormat();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(sampleFormat);
  }
  re = testStreamBuilder.OHAudioCapturerGetSamplingRate();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(rateValue);
  }

  re = testStreamBuilder.OHAudioCapturerGetStreamId();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetFramePosition();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetTimestamp();
  if (re < 0) {
    rerult = false;
  }
  return rerult;
}

function creatPcmFile(): boolean {
  let pcmList: string[] = ['S16LE.pcm', 'S16LE_1_8000.pcm', 'S16LE_1_16000.pcm', 'S16LE_1_22050.pcm', 'S16LE_1_24000.pcm', 'S32LE.pcm', 'S32LE_2.pcm'];

  for (let i: number = 0; i < pcmList.length; i++) {
    let fileName: string = pcmList[i];
    try {
      let context = getContext();
      let dir = context.filesDir + '/';
      let ml_face_model_file = dir + fileName;
      context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
        if (error) {
          console.log(
            `[pcmfile_copy_to_sandbox] S16LE.pcm is
              copy failed:${error.code}, message: ${error.message}.`
          );
        } else {
          let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log(`[pcmfile_copy_to_sandbox] ${fileName} is copy success`);
        }
      });
      console.info('[pcmfile_copy_to_sandbox] sandbox path:' + dir);
    } catch (error) {
      console.info('[pcmfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
    }
  }
  return true;
}

export default function OhCapturerTest() {
  let aff = async (done: Function) => {
    let context = AppStorage.get('context') as Context;
    console.log('getPermission beforeAll');
    let list: Array<Permissions> = ['ohos.permission.MICROPHONE'];
    let atManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(context, list, (err, result) => {
      if (err) {
        console.log(`getPermission err ${JSON.stringify(err)}`);
      } else {
        console.log(`getPermission success`);
      }
      done();
    });
    const driver: Driver = Driver.create();
    await driver.delayMs(number1500);
    const AllowBtn: Component = await driver.findComponent(ON.text('允许'));
    if (AllowBtn) {
      await AllowBtn.click();
    }
  };

  describe('OHCaptureTest',() => {
    beforeAll(async (done: Function) => {
      aff(done);
      await Utils.sleep(sleep3000);
      done();
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(async (done: Function) => {
      console.info('afterAll case');
      let re: number = testStreamBuilder.CloseAudioCapture();
      if (re === CODE_SUCCESS || re === AUDIOSTREAM_SUCCESS) {
        console.log('[capturer] Close：', re);
      }
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERCREATE_0100
     * @tc.name   ：testOHAudioStreamBuilderCreate001
     * @tc.desc   ：Create an audio stream constructor of input or output type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderCreate001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderCreate001 test start `);
      let re: number | null = await testStreamBuilder.OHAudioStreamBuilderCreate(AUDIOSTREAM_TYPE_CAPTURER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderCreate001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERCREATE_0200
     * @tc.name   ：testOHAudioStreamBuilderCreate002
     * @tc.desc   ：Create an audio stream constructor of input or output type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderCreate002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderCreate002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderCreate(AUDIOSTREAM_TYPE_RENDERER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderCreate002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERGENERATERENDERER_0100
     * @tc.name   ：testOHAudioStreamBuilderGenerateRenderer001
     * @tc.desc   ：Create an output audio stream instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderGenerateRenderer001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderGenerateRenderer001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderGenerateRenderer();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderGenerateRenderer001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERGENERATECAPTURER_0100
     * @tc.name   ：testOHAudioStreamBuilderGenerateCapturer001
     * @tc.desc   ：Create an input audio stream instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderGenerateCapturer001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderGenerateCapturer001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderGenerateCapturer();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderGenerateCapturer001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERCALLBACK_0100
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerCallback001
     * @tc.desc   ：Set the callback for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetCapturerCallback001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0100
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount001
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0200
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount002
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_CAPTURER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0300
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount003
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0400
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount004
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberEight);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0500
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount005
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberNine);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetChannelCount005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0600
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount006
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount006 test start `);
      testStreamBuilder.CreateAudioCapturerRecorder(indexOne);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_CAPTURER, numberEight);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount006 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0700
     * @tc.name   ：testOHAudioStreamBuilderSetChannelCount007
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount007', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount007 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_CAPTURER, numberNine);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetChannelCount007 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0100
     * @tc.name   ：testOHAudioStreamBuilderSetEncodingType001
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_ENCODING_TYPE_OTHER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0200
     * @tc.name   ：testOHAudioStreamBuilderSetEncodingType002
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_ENCODING_INVALID);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0300
     * @tc.name   ：testOHAudioStreamBuilderSetEncodingType003
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_ENCODING_TYPE_RAW);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0400
     * @tc.name   ：testOHAudioStreamBuilderSetEncodingType004
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_ENCODING_TYPE_RAW);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0500
     * @tc.name   ：testOHAudioStreamBuilderSetEncodingType005
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_ENCODING_INVALID);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0100
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback001
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, 0);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0200
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback002
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_RENDERER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0300
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback003
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_RENDERER, numberThree);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0400
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback004
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_RENDERER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0500
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback005
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, 0);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0600
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback006
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback006 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, 1);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback006 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0700
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback007
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback007', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback007 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback007 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0800
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback008
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback008', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback008 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, numberThree);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback008 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0900
     * @tc.name   ：testOHAudioStreamBuilderSetFrameSizeInCallback009
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback009', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback009 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback009 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0100
     * @tc.name   ：testOHAudioStreamBuilderSetLatencyMode001
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_LATENCY_MODE_NORMAL);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0200
     * @tc.name   ：testOHAudioStreamBuilderSetLatencyMode002
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_LATENCY_MODE_FAST);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0300
     * @tc.name   ：testOHAudioStreamBuilderSetLatencyMode003
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_RENDERER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0400
     * @tc.name   ：testOHAudioStreamBuilderSetLatencyMode004
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_LATENCY_MODE_FAST);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0500
     * @tc.name   ：testOHAudioStreamBuilderSetLatencyMode005
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_CAPTURER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERCALLBACK_0100
     * @tc.name   ：testOHAudioStreamBuilderSetRendererCallback001
     * @tc.desc   ：Set the callback for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetRendererCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererCallback001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0100
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat001
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_U8);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0200
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat002
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_S16LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0300
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat003
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_S24LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0400
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat004
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_S32LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0500
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat005
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0600
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat006
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat006 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_SAMPLE_U8);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat006 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0700
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat007
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat007', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat007 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_SAMPLE_S24LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat007 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0800
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat008
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat008', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat008 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_SAMPLE_S32LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat008 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0900
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat009
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat009', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat009 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, numberNinety);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat009 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0100
     * @tc.name   ：testOHAudioStreamBuilderSetSamplingRate001
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_CAPTURER , number44100);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0200
     * @tc.name   ：testOHAudioStreamBuilderSetSamplingRate002
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_CAPTURER , -1);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetSamplingRate002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0300
     * @tc.name   ：testOHAudioStreamBuilderSetSamplingRate003
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_RENDERER, number44100);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0400
     * @tc.name   ：testOHAudioStreamBuilderSetSamplingRate004
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_RENDERER, number48000);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0500
     * @tc.name   ：testOHAudioStreamBuilderSetSamplingRate005
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_RENDERER, -1);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetSamplingRate005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDEREROUTPUTDEVICECHANGECALLBACK_0100
     * @tc.name   ：testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback001
     * @tc.desc   ：Set input stream device callback function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetRendererOutputDeviceChangeCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0200
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerInfo002
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo002', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo002 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_INVALID);
      expect(re).assertEqual(AUDIOSTREAM_ERROR_INVALID_PARAM);
      console.log(`testOHAudioStreamBuilderSetCapturerInfo002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0300
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerInfo003
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo003', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo003 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_MIC);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioStreamBuilderSetCapturerInfo003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0400
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerInfo004
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo004', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo004 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioStreamBuilderSetCapturerInfo004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0500
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerInfo005
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo005', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo005 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_PLAYBACK_CAPTURE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetCapturerInfo005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0600
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerInfo006
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo006 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetCapturerInfo006 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0100
     * @tc.name   ：testOHAudioStreamBuilderSetCapturerInfo001
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo001', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo001 test start `);
      let re: number = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_MIC);
      expect(re === AUDIOSTREAM_SUCCESS).assertTrue();
      console.log(`testOHAudioStreamBuilderSetCapturerInfo001 test end `);
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0600
     * @tc.name   ：testOHAudioStreamBuilderSetEncodingType006
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType006 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_ENCODING_TYPE_OTHER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType006 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0600
     * @tc.name   ：testOHAudioStreamBuilderSetLatencyMode006
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode006 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_LATENCY_MODE_NORMAL);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode006 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_1000
     * @tc.name   ：testOHAudioStreamBuilderSetSampleFormat010
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat010', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat010 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, 1);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat010 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0600
     * @tc.name   ：testOHAudioStreamBuilderSetSamplingRate006
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate006', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate006 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_CAPTURER , number48000);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate006 test end `);
      done();
    });
  });

  describe('OhAudioCapturerRunTest', () => {
    beforeAll(async (done: Function) => {
      await creatPcmFile();
      await aff(done);
      await Utils.sleep(sleep3000);
      done();
    });
    beforeEach(async (done: Function) => {
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      done();
    });
    afterAll(async (done: Function) => {
      console.info('afterAll case');
      await testStreamBuilder.CloseAudioCapture();
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0100
     * @tc.name   ：testOHAudioCapturerGetCurrentState001
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState001 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      expect(re).assertEqual(CODE_SUCCESS);
      re = await testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      console.log(`testOHAudioCapturerGetCurrentState001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERSTART_0100
     * @tc.name   ：testOHAudioCapturerStart001
     * @tc.desc   ：Start obtaining audio data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerStart001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerStart001 test start `);
      let re: number = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioCapturerStart001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0200
     * @tc.name   ：testOHAudioCapturerGetCurrentState002
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState002', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState002 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      console.log(`testOHAudioCapturerGetCurrentState002 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETSAMPLEFORMAT_0100
     * @tc.name   ：testOHAudioCapturerGetSampleFormat001
     * @tc.desc   ：Query the current input audio stream sampling format.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetSampleFormat001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSampleFormat001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetSampleFormat();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED || re === numberTwo || re === numberThree).assertTrue();
      console.log(`testOHAudioCapturerGetSampleFormat001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERPAUSE_0100
     * @tc.name   ：testOHAudioCapturerPause001
     * @tc.desc   ：Pause input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerPause001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerPause001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioCapturerPause001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0300
     * @tc.name   ：testOHAudioCapturerGetCurrentState003
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState003', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState003 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED || re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      console.log(`testOHAudioCapturerGetCurrentState003 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCHANNELCOUNT_0100
     * @tc.name   ：testOHAudioCapturerGetChannelCount001
     * @tc.desc   ：Query the current number of audio channels.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetChannelCount001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetChannelCount001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetChannelCount();
      expect(re).assertEqual(channelCount); // 正确结果：2
      console.log(`testOHAudioCapturerGetChannelCount001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCAPTURERINFO_0100
     * @tc.name   ：testOHAudioCapturerGetCapturerInfo001
     * @tc.desc   ：Query the current audio streaming workspace type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCapturerInfo001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCapturerInfo001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCapturerInfo();
      expect(re === 0 || re === 1 || re === numberTwo || re === numberSeven).assertTrue(); // 正确结果：0、1、2、7
      console.log(`testOHAudioCapturerGetCapturerInfo001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETENCODINGTYPE_0100
     * @tc.name   ：testOHAudioCapturerGetEncodingType001
     * @tc.desc   ：Query the current audio stream encoding type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetEncodingType001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetEncodingType001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetEncodingType();
      expect(re).assertEqual(encodingType);
      console.log(`testOHAudioCapturerGetEncodingType001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETFRAMESIZEINCALLBACK_0100
     * @tc.name   ：testOHAudioCapturerGetFrameSizeInCallback001
     * @tc.desc   ：Query the frame size in the callback, which is the fixed length of the buffer returned by each callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetFrameSizeInCallback001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFrameSizeInCallback001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetFrameSizeInCallback();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetFrameSizeInCallback001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETFRAMESREAD_0100
     * @tc.name   ：testOHAudioCapturerGetFramesRead001
     * @tc.desc   ：Query the number of frames read since self created streaming.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetFramesRead001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFramesRead001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetFramesRead();
      expect(re).assertLarger(-1);
      console.log(`testOHAudioCapturerGetFramesRead001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETLATENCYMODE_0200
     * @tc.name   ：testOHAudioCapturerGetLatencyMode002
     * @tc.desc   ：Query the current audio stream delay mode.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetLatencyMode002', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetLatencyMode002 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetLatencyMode();
      expect(re === AUDIOSTREAM_LATENCY_MODE_NORMAL || re === AUDIOSTREAM_LATENCY_MODE_FAST ).assertTrue();
      console.log(`testOHAudioCapturerGetLatencyMode002 test end `);
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETSAMPLINGRATE_0100
     * @tc.name   ：testOHAudioCapturerGetSamplingRate001
     * @tc.desc   ：Query the current input audio stream sampling rate.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetSamplingRate001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSamplingRate001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetSamplingRate();
      expect(re).assertEqual(rateValue);
      console.log(`testOHAudioCapturerGetSamplingRate001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETSTREAMID_0100
     * @tc.name   ：testOHAudioCapturerGetStreamId001
     * @tc.desc   ：Query the current input audio stream ID.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetStreamId001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetStreamId001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetStreamId();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetStreamId001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETTIMESTAMP_0100
     * @tc.name   ：testOHAudioCapturerGetTimestamp001
     * @tc.desc   ：Obtain input audio stream timestamp and location information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetTimestamp001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetTimestamp001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetTimestamp();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetTimestamp001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETFRAMEPOSITION_0100
     * @tc.name   ：testOHAudioCapturerGetFramePosition001
     * @tc.desc   ：Obtain input audio stream timestamp and location information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetFramePosition001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFramePosition001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetFramePosition();
      expect(re).assertLarger(-1);
      console.log(`testOHAudioCapturerGetFramePosition001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERSTOP_0100
     * @tc.name   ：testOHAudioCapturerStop001
     * @tc.desc   ：Stop input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerStop001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerStop001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioCapturerStop001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETLATENCYMODE_0100
     * @tc.name   ：testOHAudioCapturerGetLatencyMode001
     * @tc.desc   ：Query the current audio stream delay mode.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetLatencyMode001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetLatencyMode001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetLatencyMode();
      expect(re === AUDIOSTREAM_LATENCY_MODE_NORMAL  || re === AUDIOSTREAM_LATENCY_MODE_FAST ).assertTrue();
      console.log(`testOHAudioCapturerGetLatencyMode001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0400
     * @tc.name   ：testOHAudioCapturerGetCurrentState004
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState004', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState004 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue(); // 正确结果：0、1、2、3、4、5
      console.log(`testOHAudioCapturerGetCurrentState004 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0500
     * @tc.name   ：testOHAudioCapturerGetCurrentState005
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState005', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState005 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED || re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED || re === numberFour || re === AUDIOSTREAM_STATE_PAUSED)
        .assertTrue(); // 正确结果：0、1、2、3、4、5
      console.log(`testOHAudioCapturerGetCurrentState005 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERFLUSH_0100
     * @tc.name   ：testOHAudioCapturerFlush001
     * @tc.desc   ：Discard the obtained audio data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerFlush001', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerFlush001 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerFlush();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioCapturerFlush001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0600
     * @tc.name   ：testOHAudioCapturerGetCurrentState006
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState006', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState006 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_INVALID).assertTrue(); // 正确结果：0、1、2、3、4、5
      console.log(`testOHAudioCapturerGetCurrentState006 test end `);
      done();
    });
  });

  describe('OhAudioCapturerStateTest', () => {
    beforeAll(async (done: Function) => {
      await creatPcmFile();
      aff(done);
      await Utils.sleep(sleep3000);
      done();
    });
    beforeEach(async (done: Function) => {
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      done();
    });
    afterAll(async (done: Function) => {
      console.info('afterAll case');
      done();
    });

    /**
     * start - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0100
     * @tc.name   ：testCreateAudioCapturerRecorder001
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder001', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder001 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      Utils.sleep(500);
      console.log(`testCreateAudioCapturerRecorder001 test end `);
      done();
    });

    /**
     * start- pause - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0200
     * @tc.name   ：testCreateAudioCapturerRecorder002
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder002', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder002 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexOne);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_RUNNING);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      Utils.sleep(sleep500);
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder002 test end `);
      done();
    });

    /**
     * start- release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0300
     * @tc.name   ：testCreateAudioCapturerRecorder003
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder003', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder003 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexTwo);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      getAudioCapturerParam(false);

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      getAudioCapturerParam();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      getAudioCapturerParam(false);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      Utils.sleep(500);

      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder003 test end `);
      done();
    });

    /**
     * release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0400
     * @tc.name   ：testCreateAudioCapturerRecorder004
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder004', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder004 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexThree);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      Utils.sleep(500);

      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder004 test end `);
      done();
    });

    /**
     * start - pause - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0500
     * @tc.name   ：testCreateAudioCapturerRecorder005
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder005', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder005 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexFour);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder005 test end `);
      done();
    });

    /**
     * start - stop - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0600
     * @tc.name   ：testCreateAudioCapturerRecorder006
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder006', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder006 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexFive);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder006 test end `);
      done();
    });

    /**
     * start - pause - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0700
     * @tc.name   ：testCreateAudioCapturerRecorder007
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder007', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder007 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder007 test end `);
      done();
    });
    /**
     * start - pause - stop - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0800
     * @tc.name   ：testCreateAudioCapturerRecorder008
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder008', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder008 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder008 test end `);
      done();
    });
    /**
     * start - pause - start - stop - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0900
     * @tc.name   ：testCreateAudioCapturerRecorder009
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder009', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder009 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder009 test end `);
      done();
    });

    /**
     * start - stop - start - pause - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_1000
     * @tc.name   ：testCreateAudioCapturerRecorder010
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder010', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder010 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder010 test end `);
      done();
    });
    /**
     * start - pause - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_1100
     * @tc.name   ：testCreateAudioCapturerRecorder011
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder011', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder011 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder011 test end `);
      done();
    });

    /**
     * start - stop - pause - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0100
     * @tc.name   ：testAbnormalOperationCapturer001
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer001', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer001 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer001 test end `);
      done();
    });

    /**
     * stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0200
     * @tc.name   ：testAbnormalOperationCapturer002
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer002', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer002 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer002 test end `);
      done();
    });
    /**
     * pause - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0300
     * @tc.name   ：testAbnormalOperationCapturer003
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer003', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer003 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer003 test end `);
      done();
    });

    /**
     * release - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0400
     * @tc.name   ：testAbnormalOperationCapturer004
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer004', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer004 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer004 test end `);
      done();
    });

    /**
     * pause - pause
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0500
     * @tc.name   ：testAbnormalOperationCapturer005
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer005', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer005 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioCapturerStart();

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer005 test end `);
      done();
    });

    /**
     * start - start
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0600
     * @tc.name   ：testAbnormalOperationCapturer006
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer006', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer006 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer006 test end `);
      done();
    });

    /**
     * stop - stop
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0700
     * @tc.name   ：testAbnormalOperationCapturer007
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer007', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer007 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer007 test end `);
      done();
    });

    /**
     * Capturer attribute get test
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0100
     * @tc.name   ：testCapturerRecorderAttribute001
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute001', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute001 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(1);

      let result: boolean = getAudioCapturerParam(false);
      expect(result).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      result = getAudioCapturerParam(false);
      expect(result).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        result = getAudioCapturerParam();
        expect(result).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      result = getAudioCapturerParam();
      expect(result).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      result = getAudioCapturerParam(false);
      expect(result).assertFalse();
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute001 test end `);
      done();
    });

    /**
     * Capturer properties verification  test
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0200
     * @tc.name   ：testCapturerRecorderAttribute002
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute002', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute002 test start `);

      rateValue = 48000;
      channelCount = 2;
      encodingType = 0;
      latencyMode = 0;
      frameSizeValue = 960;
      sampleFormat = 0;

      let re: number = await testStreamBuilder.CreatCapturerRecorderWithParam(rateValue, channelCount, frameSizeValue, latencyMode, sampleFormat);
      expect(re).assertEqual(CODE_SUCCESS);
      Utils.sleep(sleep1000);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      let verify = verifyCapturerProperties();
      expect(verify).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute002 test end `);
      done();
    });

    /**
     * Capturer properties verification  test latencyMode = 1
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0300
     * @tc.name   ：testCapturerRecorderAttribute003
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute003', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute003 test start `);

      rateValue = 48000;
      channelCount = 2;
      encodingType = 0;
      latencyMode = 0;
      frameSizeValue = 960;
      sampleFormat = 0;

      let re: number = await testStreamBuilder.CreatCapturerRecorderWithParam(rateValue, channelCount, frameSizeValue, latencyMode, sampleFormat);
      expect(re).assertEqual(CODE_SUCCESS);
      Utils.sleep(sleep1000);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      let verify = verifyCapturerProperties();
      expect(verify).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute003 test end `);
      done();
    });

    /**
     * Capturer properties verification  test frameSizeValue = 240
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0400
     * @tc.name   ：testCapturerRecorderAttribute004
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute004', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute004 test start `);

      rateValue = 48000;
      channelCount = 2;
      encodingType = 0;
      latencyMode = 0;
      frameSizeValue = 960;
      sampleFormat = 0;

      let re: number = await testStreamBuilder.CreatCapturerRecorderWithParam(rateValue, channelCount, frameSizeValue, latencyMode, sampleFormat);
      expect(re).assertEqual(CODE_SUCCESS);
      Utils.sleep(sleep1000);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      let verify = verifyCapturerProperties();
      expect(verify).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute004 test end `);
      done();
    });
  });
}
