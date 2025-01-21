/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility';
import * as env from './Const.ets';

export default function audioRendererEnhanceTest() {
  describe('SetVolumeWithRampTest', function () {
    let Tag = "SetVolumeWithRampTest";
    let audioRen;
    beforeAll(function () {
      console.info(`${Tag}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async function () {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try{
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
          audioRen = data;
          console.info(`${Tag}: AudioRender Created : Success : Stream Type: SUCCESS data state: ` + Object.keys(data));
          console.info(`${Tag}: AudioRender Created : Success : Stream Type: SUCCESS data value: ` + JSON.stringify(data));
        }).catch((err) => {
          console.info(`${Tag}: AudioRender Created : ERROR : ` + err.message);
        });
      }catch (error){
        console.info(`${Tag}: AudioRender Created : catch ERROR : ` + error.code + error.message);
      }
    })
    afterEach(async function () {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      await sleep(2000);
      await audioRen.release().then(() => {
        console.info(`${Tag}: Renderer release : SUCCESS`);
      }).catch((err) => {
        console.info(`${Tag}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async function () {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    })
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    let filePath;
    async function renderPlay() {
      let bufferSize
      try {
        bufferSize = await audioRen.getBufferSize()
        console.info( `audioRenderer getBufferSize success,bufferSize:${bufferSize} \n`);
        await audioRen.start();
        console.info(`audioRenderer start success\n`);
      } catch (err) {
        console.info(`audioRenderer start : Error: ${JSON.stringify(err)}\n`);
        return;
      }

      var context = featureAbility.getContext();
      await context.getFilesDir().then((data) => {
        console.error('#####app file: '+ data);
        filePath = data;
        console.error('#####app filePath: '+ filePath);
      }).catch((Error) => {
        console.error('####app file err: ' + Error.message);
      })

      let path = filePath + '/StarWars10s-1C-8000-2SW.wav';
      console.info(`path:${path}\n`);
      try {
        let len;
        try {
          let stat = await fs.stat(path);
          console.info(`stat:${JSON.stringify(stat)}\n`);
          console.info(`size:${stat.size}\n`);
          len = stat.size % bufferSize == 0 ? Math.floor(stat.size / bufferSize) : Math.floor(stat.size / bufferSize + 1);
          console.info(`len:${len}\n`);
        }catch (error) {
          console.info(`#######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`fd:${file.fd}\n`);

        let buf = new ArrayBuffer(bufferSize);
        console.info(`audioRenderer write start.......... \n`);

        for (let i = 0; i < len; i++) {
          let options = {
            offset: i * bufferSize,
            length: bufferSize
          }
          let readsize = await fs.read(file.fd, buf, options);
          let writeSize = await audioRen.write(buf);
        }
        console.info(`audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0100
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(0->1)_Duration(1000 ms)
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(0->1)_Duration(1000 ms)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0100', 0, async function (done) {
      try {
        await audioRen.setVolume(0);
        console.info(`${Tag}: setVolume 0: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(1, 1000);
        console.info(`${Tag}: setVolumeWithRamp 1,1000 :SUCCESS`);
        expect(true).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: setVolumeWithRamp catch error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0200
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(1->0)_Duration(100 ms)
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(1->0)_Duration(100 ms)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0200', 0, async function (done) {
      try {
        await audioRen.setVolume(1);
        console.info(`${Tag}: setVolume 1: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(0, 100)
        console.info(`${Tag}: setVolumeWithRamp 0,100 : SUCCESS`);
        expect(true).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp catch error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0300
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(1->0.5)_Duration(10 ms)
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(1->0.5)_Duration(10 ms)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0300', 0, async function (done) {
      try {
        await audioRen.setVolume(1);
        console.info(`${Tag}: setVolume 1: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(0.5, 10)
        console.info(`${Tag}: setVolumeWithRamp 0.5,10 : SUCCESS`);
        expect(true).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp catch error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0400
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(0->0.5)_Duration(10 ms)
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(0->0.5)_Duration(10 ms)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0400', 0, async function (done) {
      try {
        await audioRen.setVolume(0);
        console.info(`${Tag}: setVolume 0: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(0.5, 10)
        console.info(`${Tag}: setVolumeWithRamp 0.5,10 : SUCCESS`);
        expect(true).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp catch error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0500
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(0->0)_Duration(10 ms)
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(0->0)_Duration(10 ms)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0500', 0, async function (done) {
      try {
        await audioRen.setVolume(0);
        console.info(`${Tag}: setVolume 0: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(0, 10)
        console.info(`${Tag}: setVolumeWithRamp 0,10 : SUCCESS`);
        expect(true).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp catch error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0600
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(1->-1)_Duration(1000 ms)_Test 6800101
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(1->-1)_Duration(1000 ms)_Test 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0600', 0, async function (done) {
      try {
        await audioRen.setVolume(1);
        console.info(`${Tag}: setVolume 1: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(-1, 1000);
        console.info(`${Tag}: setVolumeWithRamp -1,1000: SUCCESS`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: setVolumeWithRamp -1,1000 : error.code:${error.code}, error.message:${error.message}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0700
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(1->1.2)_Duration(1000 ms)_Test 6800101
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(1->1.2)_Duration(1000 ms)_Test 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0700', 0, async function (done) {
      try {
        await audioRen.setVolume(1);
        console.info(`${Tag}: setVolume 1: SUCCESS`);
      } catch (error) {
        console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
      }
      try{
        await audioRen.setVolumeWithRamp(1.2, 1000);
        console.info(`${Tag}: setVolumeWithRamp 1.2,1000: SUCCESS`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: setVolumeWithRamp 1.2,1000 : error.code:${error.code}, error.message:${error.message}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0800
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume('1')_Duration(1000 ms)_Test 401
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume('1')_Duration(1000 ms)_Test 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0800', 0, async function (done) {
      try{
        await audioRen.setVolumeWithRamp('1', 1000)
        console.info(`${Tag}: setVolumeWithRamp '1',1000: SUCCESS`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: setVolumeWithRamp '1',1000: error.code:${error.code}, error.message:${error.message}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0900
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume(1)_Duration('1000' ms)_Test 401
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume(1)_Duration('1000' ms)_Test 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_0900', 0, async function (done) {
      try{
        await audioRen.setVolumeWithRamp(1, '1000');
        console.info(`${Tag}: setVolumeWithRamp 1,'1000': SUCCESS`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: setVolumeWithRamp 1,'1000': error.code:${error.code}, error.message:${error.message}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1000
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Volume()_Duration()_Test 401
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Volume()_Duration()_Test 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1000', 0, async function (done) {
      try{
        await audioRen.setVolumeWithRamp();
        console.info(`${Tag}: setVolumeWithRamp no input: SUCCESS`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}: setVolumeWithRamp no input: error.code:${error.code}, error.message:${error.message}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1100
     * @tc.name      : AudioRenderer - setVolumeWithRamp - On Error State_Stopped Use - Test 6800103
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - On Error State_Stopped Use - Test 6800103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1100', 0, async function (done) {
      try{
        await audioRen.start();
        await audioRen.stop();
        try {
          await audioRen.setVolumeWithRamp(0, 1);
          console.info(`${Tag}: attachVolumeRamp after stop: SUCCESS`);
          expect(false).assertTrue();
          done();
        }catch (err){
          console.log(`${Tag}: attachVolumeRamp after stop: error.code:${err.code}, error.message:${err.message}`);
          expect(Number(err.code)).assertEqual(env.UNSUPORTED_OPTION_6800103);
          done();
        }
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp no unkown: error.code:${error.code}, error.message:${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1200
     * @tc.name      : AudioRenderer - setVolumeWithRamp - On Error State_Released Use - Test 6800103
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - On Error State_Released Use - Test 6800103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1200', 0, async function (done) {
      try{
        await audioRen.release();
        try {
          await audioRen.setVolumeWithRamp(0, 1);
          console.info(`${Tag}: attachVolumeRamp after stop: SUCCESS`);
          expect(false).assertTrue();
          done();
        }catch (err){
          console.log(`${Tag}: attachVolumeRamp after stop: error.code:${err.code}, error.message:${err.message}`);
          expect(Number(err.code)).assertEqual(env.UNSUPORTED_OPTION_6800103);
          done();
        }
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp no unkown: error.code:${error.code}, error.message:${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1300
     * @tc.name      : AudioRenderer - setVolumeWithRamp - ALL StreamUsage
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - ALL StreamUsage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1300', 0, async function (done) {
      try {
        for (let index = 0; index < env.StreamUsage.length; index++) {
          let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: env.StreamUsage[index],
            rendererFlags: 0
          }
          let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          let audioRender;
          await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRender = data;
            console.info(`${Tag}: createAudioRenderer : ${env.StreamUsage[index]} success`);
          }).catch((err) => {
            console.info(`${Tag}: createAudioRenderer : ${env.StreamUsage[index]} ERROR : ${err.message}, ${err.code}`);
          });
          try {
            await audioRen.setVolume(1);
            console.info(`${Tag}: setVolume 1: SUCCESS`);
          } catch (error) {
            console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
          }
          try {
            await audioRen.setVolumeWithRamp(0, 1000);
            console.info(`${Tag}: setVolumeWithRamp : ${env.StreamUsage[index]} success`);
            await sleep(20);
          } catch (error) {
            console.info(`${Tag}: setVolumeWithRamp : ${env.StreamUsage[index]} ERROR : ${error.message}, ${error.code}`);
            expect(false).assertTrue();
            done();
          }
          if (audioRender != null) {
            await audioRender.release().then(() => {
              audioRender = null;
            }).catch((err) => {
              console.info(`${Tag}: setVolumeWithRamp Renderer release :fail :${err.message}`);
            });
          }
          await sleep(20);
        }
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag} setVolumeWithRamp : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1400
     * @tc.name      : AudioRenderer - setVolumeWithRamp - Play a misic
     * @tc.desc      : AudioRenderer - setVolumeWithRamp - Play a misic
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETVOLUMEWITHRAMP_1400', 0, async function (done) {
      try{
        await renderPlay();
        try {
          try {
            await audioRen.setVolume(1);
            console.info(`${Tag}: setVolume 1: SUCCESS`);
          } catch (error) {
            console.log(`${Tag}: setVolume catch error: ${error.code}, ${error.message}`);
          }
          await audioRen.setVolumeWithRamp(0, 1);
          console.info(`${Tag}: attachVolumeRamp renderPlay: SUCCESS`);
          expect(true).assertTrue();
          done();
        }catch (err){
          console.log(`${Tag}: attachVolumeRamp on renderPlay: error.code:${err.code}, error.message:${err.message}`);
          expect(false).assertTrue();
          done();
        }
      }catch(error){
        console.log(`${Tag}: attachVolumeRamp no unkown: error.code:${error.code}, error.message:${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

  })
}
