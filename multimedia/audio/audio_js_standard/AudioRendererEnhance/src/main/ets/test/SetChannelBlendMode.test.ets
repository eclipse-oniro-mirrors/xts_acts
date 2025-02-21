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
import * as env from './Const.ets';
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';

export default function audioRendererTest() {
  describe('setChannelBlendMode', function () {
    let Tag = "audioRendererEnhanceTest";
    let audioRen;
    console.info(`${Tag}: Create AudioManger Object JS Framework`);
    beforeAll(function () {
      console.info(`${Tag}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async function () {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
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
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });
      }catch (error){
        console.info('AudioFrameworkRenderLog: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async function () {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
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

        let inputVolume = 0.5;
        await audioRen.setVolume(inputVolume).then(() => {
          console.info(`${Tag}: setVolume to 0.5 : Success`);
        }).catch((err) => {
          console.info(`${Tag}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
        });

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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0100
     * @tc.name      : AudioRenderer - setChannelBlendMode-MDOE_INPUT_DEFAULT
     * @tc.desc      : AudioRenderer - setChannelBlendMode-MDOE_INPUT_DEFAULT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0100', 2, async function (done) {
      try {
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_DEFAULT)
        console.info(`${Tag}: setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag} setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0200
     * @tc.name      : AudioRenderer - setChannelBlendMode-MODE_LEFT_RIGHT
     * @tc.desc      : AudioRenderer - setChannelBlendMode-MODE_LEFT_RIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0200', 2, async function (done) {
      try {
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_BLEND_LR)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0300
     * @tc.name      : AudioRenderer - setChannelBlendMode-MODE_ALL_LEFT
     * @tc.desc      : AudioRenderer - setChannelBlendMode-MODE_ALL_LEFT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0300', 2, async function (done) {
      try {
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_ALL_LEFT)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0400
     * @tc.name      : AudioRenderer - setChannelBlendMode-MODE_ALL_RIGHT
     * @tc.desc      : AudioRenderer - setChannelBlendMode-MODE_ALL_RIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0400', 2, async function (done) {
      try {
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_ALL_RIGHT)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0500
     * @tc.name      : AudioRenderer - setChannelBlendMode-ERROR-INPUT_NUMBER_PARAMETER
     * @tc.desc      : AudioRenderer - setChannelBlendMode-ERROR-INPUT_NUMBER_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0500', 2, async function (done) {
      try{
        //unsupported option, 6800104
        await audioRen.setChannelBlendMode(env.INPUT_PARAMETER_TYPE_NUMBER);
        console.log(`${Tag}  setChannelBlendMode success test fail!`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0600
     * @tc.name      : AudioRenderer - setChannelBlendMode-ERROR-INPUT_NUMBER_PARAMETER
     * @tc.desc      : AudioRenderer - setChannelBlendMode-ERROR-INPUT_NUMBER_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0600', 2, async function (done) {
      try{
        //unsupported option, 6800104
        await audioRen.setChannelBlendMode(env.INPUT_PARAMETER_TYPE_NUMBER_4);
        console.log(`${Tag}  setChannelBlendMode success test fail!`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0700
     * @tc.name      : AudioRenderer - setChannelBlendMode-ERROR-INPUT_STRING_PARAMETER
     * @tc.desc      : AudioRenderer - setChannelBlendMode-ERROR-INPUT_STRING_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0700', 2, async function (done) {
      try{
        //invalid parameter, 6800101
        await audioRen.setChannelBlendMode(env.INVALID_PARAMETER_STRING);
        console.log(`${Tag}  setChannelBlendMode success test fail!`);
        expect(false).assertTrue();
        done();
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0800
     * @tc.name      : AudioRenderer - setChannelBlendMode - USE_ALL_STREAMTYPE 
     * @tc.desc      : AudioRenderer - setChannelBlendMode - USE_ALL_STREAMTYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0800', 2, async function (done) {
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
          }).catch((err) => {
            console.info(`${Tag}: createAudioRenderer : ${env.StreamUsage[index]} ERROR : ${err.message}, ${err.code}`);
          });
          try {
            for (let key in audio.ChannelBlendMode) {
              await audioRender.setChannelBlendMode(Number(audio.ChannelBlendMode[key]))
              await sleep(20);
            }
          } catch (error) {
            console.log(`setChannelBlendMode : ${env.StreamUsage[index]} error ${error.message}, ${error.code}`);
            expect(false).assertTrue();
            done();
          }
          if (audioRender != null) {
            await audioRender.release().then(() => {
              audioRender = null;
            }).catch((err) => {
              console.info(`${Tag}: setChannelBlendMode Renderer release :fail :${err.message}`);
            });
          }
          await sleep(20);
        }
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag} setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0900
     * @tc.name      : AudioRenderer - setChannelBlendMode-RUNNING-STATE-MODE_LR
     * @tc.desc      : AudioRenderer - setChannelBlendMode-RUNNING-STATE-MODE_LR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0900', 0, async function (done) {
      try {
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_BLEND_LR)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        await renderPlay();
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}