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
  describe('getCurrentOutputDevices', function () {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0100
     * @tc.name      : AudioRenderer -getCurrentOutputDevices "struct" - promise
     * @tc.desc      : AudioRenderer - getCurrentOutputDevices "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0100', 0, async function (done) {
      try {
        await audioRen.getCurrentOutputDevices().then((data) => {
          console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id}, name:${data[0].name},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(env.OUTPUT_NUMBER_1);
          done();
        }).catch((error) => {
          console.log("${TagFrmwkRender}: getCurrentOutputDevices error = " + error);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`get current output deviceinfo unknown errro: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0200
     * @tc.name      : AudioRenderer -getCurrentOutputDevices "struct" - promise
     * @tc.desc      : AudioRenderer - getCurrentOutputDevices "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0200', 0, async function (done) {
      try {
        await renderPlay();
        await audioRen.getCurrentOutputDevices().then((data) => {
          console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(env.OUTPUT_NUMBER_1);
          console.info(`${TagFrmwkRender}: Renderer get current output device SUCCESS, now stop audiorender`);
          audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drain : SUCCESS, stop audiorender`);
            audioRen.stop().then(() => {
              console.info(`${TagFrmwkRender}: Renderer stopp : SUCCESS`);
              done();
            }).catch((err) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            });
          }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
          });
        }).catch((error) => {
          console.log("${TagFrmwkRender}: getCurrentOutputDevices : error = " + error);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_0100
     * @tc.name      : AudioRenderer -getCurrentOutputDevices "struct" - callback
     * @tc.desc      : AudioRenderer - getCurrentOutputDevices "struct" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_0100', 0, async function (done) {
      audioRen.getCurrentOutputDevices((err, data) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getCurrentOutputDevices ERROR ! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(env.OUTPUT_NUMBER_1);
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_0200
     * @tc.name      : AudioRenderer -getCurrentOutputDevices "struct" - callback
     * @tc.desc      : AudioRenderer - getCurrentOutputDevices "struct" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_0200', 0, async function (done) {
      await renderPlay();
      audioRen.getCurrentOutputDevices((err, data) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getCurrentOutputDevices ERROR! error: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: getCurrentOutputDevices :deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(env.OUTPUT_NUMBER_1);
          console.info(`${TagFrmwkRender}: Renderer getCurrentOutputDevices SUCCESS! now stop the audiorenderer`);
          audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drain, stop the audiorenderer`);
            audioRen.stop().then(() => {
              console.info(`${TagFrmwkRender}: Renderer stopp SUCCESS, testcase SUCCESS!`);
              done();
            }).catch((err) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            });
          }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
          });
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICESSYNC_0100
     * @tc.name      : AudioRenderer - getCurrentOutputDevicesSync 
     * @tc.desc      : AudioRenderer - getCurrentOutputDevicesSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICESSYNC_0100', 0, async function (done) {
      try {
        let data = audioRen.getCurrentOutputDevicesSync();
        console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id}, name:${data[0].name},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(env.OUTPUT_NUMBER_1);
          done();
      } catch (err) {
        console.log("${TagFrmwkRender}: getCurrentOutputDevices error = " + err);
          expect(false).assertTrue();
          done();
      }
    });

  })
}
