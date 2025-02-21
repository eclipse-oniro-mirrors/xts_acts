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

export default function audioRendererTest() {
  describe('getUnderflowCount', function () {
    let TagFrmwkRender = "audioRendererEnhanceTest";
    let audioRen;
    console.info(`${TagFrmwkRender}: Create AudioManger Object JS Framework`);
    beforeAll(function () {
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async function () {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try{
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
          audioRen = data;
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err) => {
          console.info('audioRendererEnhanceTest: AudioRender Created : ERROR : ' + err.message);
        });
      }catch (error){
        console.info('audioRendererEnhanceTest: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async function () {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
      await audioRen.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async function () {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
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
        console.error(' app file: '+ data);
        filePath = data;
        console.error(' app filePath: '+ filePath);
      }).catch((Error) => {
        console.error(' app file err: ' + Error.message);
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
        }catch (error) {
          console.info(` audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
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
            //构建欠载音频帧
            if(i == len - 1){
              await sleep(2000);
            }
            if(i == len - 5){
              await sleep(2000);
            }
            if(i == len - 6){
              await sleep(2000);
            }
            if(i == len - 10){
              await sleep(2000);
            }
            if(i == len - 15){
              await sleep(2000);
            }
            if(i == len - 16){
              await sleep(2000);
            }
          }
        console.info(`audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
  }

 /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_0100
     * @tc.name      : AudioRenderer -getUnderflowCountSync_COUNT
     * @tc.desc      : AudioRenderer - getUnderflowCountSync_COUNT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
 it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_0100', 0, async function (done) {
  try {
    let value = await audioRen.getUnderflowCountSync();
    console.info(`${TagFrmwkRender}:getUnderflowCount :SUCCESS ${value}`);
      expect(value).assertEqual(env.OUTPUT_NUMBER_0);
      done();
  } catch (err) {
    console.log("${TagFrmwkRender}:getUnderflowCount : error = " + err);
      expect(false).assertTrue();
      done();
  }

});

/**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_0200
     * @tc.name      : AudioRenderer - getUnderflowCountSync_COUNT_RENDER_PLAY
     * @tc.desc      : AudioRenderer - getUnderflowCountSync_COUNT_RENDER_PLAY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_0200', 0, async function (done) {

  try {
    await renderPlay();
    let value = await audioRen.getUnderflowCountSync();
    console.info(`${TagFrmwkRender}:getUnderflowCount :SUCCESS ${value}`);
    expect(value).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
    await audioRen.drain().then(() => {
      audioRen.stop().then(() => {
        expect(true).assertTrue();
        done();
      }).catch((err) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
    }).catch((err) => {
      console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      expect(false).assertTrue();
      done();
    });
  } catch (err) {
    console.log("${TagFrmwkRender}:getUnderflowCount : error = " + err);
      expect(false).assertTrue();
      done();
  }

});

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_0100
     * @tc.name      : AudioRenderer -getUnderflowCount "unit_32" - COUNT_PROMISE
     * @tc.desc      : AudioRenderer - getUnderflowCount "unit_32" - COUNT_PROMISE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_0100', 0, async function (done) {
      try{
        await audioRen.getUnderflowCount().then((data) => {
          console.info(`${TagFrmwkRender}:getUnderflowCount :SUCCESS ${data}`);
          expect(data).assertEqual(env.OUTPUT_NUMBER_0);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}:getUnderflowCount : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("GETUNDERFLOWCOUNT catch unknown error = " + error);
        expect(false).assertTrue();
        done();
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_0200
     * @tc.name      : AudioRenderer -getUnderflowCount "unit_32" - COUNT_RENDER_PLAY_PROMISE
     * @tc.desc      : AudioRenderer - getUnderflowCount "unit_32" - COUNT_RENDER_PLAY_PROMISE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_0200', 0, async function (done) {
      try {
        await renderPlay();
        await audioRen.getUnderflowCount().then((data) => {
          console.log(`getUnderflowCount :SUCCESS ${data}`);
          expect(data).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
          audioRen.drain().then(() => {
            audioRen.stop().then(() => {
              expect(true).assertTrue();
              done();
            }).catch((err) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch((error) => {
          console.log("${TagFrmwkRender}: getUnderflowCount : error = " + error);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("GETUNDERFLOWCOUNT catch unknown error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_0300
     * @tc.name      : AudioRenderer -getUnderflowCount "unit_32" - ALL_STREAM_TYPE_PROMISE
     * @tc.desc      : AudioRenderer - getUnderflowCount "unit_32" - ALL_STREAM_TYPE_PROMISE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_0300', 0, async function (done) {
      try {
        for (let index = 0; index < env.StreamUsage.length; index++) {
          let audioRender;
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
          try {
            await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
              audioRender = data;
              console.info(`${TagFrmwkRender}: AudioRender Created : Stream Type: ${env.StreamUsage[index]} success`);
            }).catch((err) => {
              console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ` + err.code + err.message);
            });
          } catch (error) {
            console.info(`${TagFrmwkRender}: AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          await audioRender.getUnderflowCount().then((data) => {
            console.info(`${TagFrmwkRender}: getUnderflowCount SUCCESS! ${env.StreamUsage[index]}  data ${data}:, now release audiorender`);
            expect(data).assertEqual(env.OUTPUT_NUMBER_0);
          }).catch((error) => {
            console.info(`${TagFrmwkRender}: getUnderflowCount: ERROR : code: ${error.code}, mesage: ${error.message}`);
            expect(false).assertTrue();
            done();
          });
          sleep(1000);
          await audioRender.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer ${env.StreamUsage[index]} release  SUCCESS! `);
          }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release ERROR: ${err.message}`);
          });
        }
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_0100
     * @tc.name      : AudioRenderer - getUnderflowCount "uint_32" - COUNT_CALLBACK
     * @tc.desc      : AudioRenderer - getUnderflowCount "uint_32" - COUNT_CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_0100', 0, async function (done) {
      await audioRen.getUnderflowCount((err, data) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getUnderflowCount ERROR! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: getUnderflowCount : Success! ${data}`);
          expect(data).assertEqual(env.OUTPUT_NUMBER_0);
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_0200
     * @tc.name      : AudioRenderer - getUnderflowCount "uint_32" - COUNT_RENDER_PLAY_CALLBACK
     * @tc.desc      : AudioRenderer - getUnderflowCount "uint_32" - COUNT_RENDER_PLAY_CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_0200', 0, async function (done) {
      try {
        await renderPlay();
        await audioRen.getUnderflowCount((error, data) => {
          if (error) {
            console.log(`${TagFrmwkRender}: getUnderflowCount execution fail,error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`getUnderflowCount :SUCCESS ${data}`);
            expect(data).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
          }
        });
        await audioRen.drain().then(() => {
          audioRen.stop().then(() => {
            expect(true).assertTrue();
            done();
          }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch((err) => {
          console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(`${TagFrmwkRender}: getUnderflowCount unknown error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_0300
     * @tc.name      : AudioRenderer - getUnderflowCount "uint_32" - ALL_STREAM_TYPE_CALLBACK
     * @tc.desc      : AudioRenderer - getUnderflowCount "uint_32" - ALL_STREAM_TYPE_CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_0300', 0, async function (done) {
      try {
        for (let index = 0; index < env.StreamUsage.length; index++) {
          let audioRender;
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
          try {
            await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
              audioRender = data;
              console.info(`${TagFrmwkRender}: AudioRender Created : Stream Type: ${env.StreamUsage[index]} SUCCESS data state: ` + Object.keys(data));
            }).catch((err) => {
              console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ` + err.message);
            });
          } catch (error) {
            console.info(`${TagFrmwkRender}: AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          await audioRen.getUnderflowCount((error, data) => {
            if (error) {
              expect(false).assertTrue();
              done();
            } else {
              console.log(`${TagFrmwkRender}:getUnderflowCount StreamType:${env.StreamUsage[index]} execution success, data: ${JSON.stringify(data)}`);
              expect(data).assertEqual(env.OUTPUT_NUMBER_0);
            }
          });
          sleep(1000);
          await audioRender.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer ${env.StreamUsage[index]} release : SUCCESS`);
          }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
          });
        }
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });
  })
}
