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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility';
import * as env from './Const';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let testContext: common.UIAbilityContext;
let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface AudioStreamInfo {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface AudioRendererInfo {
  content: number,
  usage: number,
  rendererFlags: 0
}

interface AudioRendererOptions {
  streamInfo: AudioStreamInfo,
  rendererInfo: AudioRendererInfo
}

interface options {
  offset: ESObject,
  length: ESObject
}

export default function audioRendererTest() {
  describe('getCurrentOutputDevices', () => {
    let TagFrmwkRender = "audioRendererEnhanceTest";
    let audioRen: audio.AudioRenderer | ESObject;

    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      await power?.click();
    }

    let getPermission = async () => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      atManager.requestPermissionsFromUser(testContext, permissions,
        (err: BusinessError, data: PermissionRequestResult) => {
          console.info("request success permissions" + JSON.stringify(data));
          console.info("getPermissionRequestResult err", JSON.stringify(err));
        })
    }
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      await getPermission();
      await driveFn();
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async () => {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try {
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
          audioRen = data;
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data state: ' +
          Object.keys(data));
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data value: ' +
          JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.info('audioRendererEnhanceTest: AudioRender Created : ERROR : ' + err.message);
        });
      } catch (error) {
        console.info('audioRendererEnhanceTest: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async () => {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
      await audioRen.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async () => {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })

    let filePath: string;

    let renderPlay = async () => {
      let bufferSize: ESObject
      try {
        bufferSize = await audioRen.getBufferSize()
        console.info(`audioRenderer getBufferSize success,bufferSize:${bufferSize} \n`);
        await audioRen.start();
        console.info(`audioRenderer start success\n`);
      } catch (err) {
        console.info(`audioRenderer start : Error: ${JSON.stringify(err)}\n`);
        return;
      }

      let appContext = testContext.getApplicationContext();
      filePath = appContext.filesDir;
      console.info(` case2 dirPath is  ${JSON.stringify(filePath)}`);


      let path = filePath + '/StarWars10s-1C-8000-2SW.wav';
      console.info(`path:${path}\n`);
      try {
        let len: ESObject;
        try {
          let stat = await fs.stat(path);
          console.info(`stat:${JSON.stringify(stat)}\n`);
          console.info(`size:${stat.size}\n`);
          len =
            stat.size % bufferSize == 0 ? Math.floor(stat.size / bufferSize) : Math.floor(stat.size / bufferSize + 1);
        } catch (error) {
          console.info(`#######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`fd:${file.fd}\n`);

        let buf = new ArrayBuffer(bufferSize);
        console.info(`audioRenderer write start.......... \n`);
        for (let i = 0; i < len; i++) {
          let options: options = {
            offset: i * bufferSize,
            length: bufferSize
          }
          let readsize = await fs.read(file.fd, buf, options);
          let writeSize: ESObject = await audioRen.write(buf);
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await audioRen.getCurrentOutputDevices().then((data: ESObject) => {
          console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id}, name:${data[0].name},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(env.OUTPUT_NUMBER_1);
          done();
        }).catch((error: ESObject) => {
          console.log("${TagFrmwkRender}: getCurrentOutputDevices error = " + error);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`get current output deviceinfo unknown errro: [${error.code}, ${error.message}]`);
        if (error.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0200
     * @tc.name      : AudioRenderer -getCurrentOutputDevices "struct" - promise
     * @tc.desc      : AudioRenderer - getCurrentOutputDevices "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_0200', 2, async (done: Function) => {
      try {
        await renderPlay();
        await audioRen.getCurrentOutputDevices().then((data: ESObject) => {
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
            }).catch((err: BusinessError) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            });
          }).catch((err: BusinessError) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
          });
        }).catch((error: BusinessError) => {
          console.log("${TagFrmwkRender}: getCurrentOutputDevices : error = " + error);
          if (error.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      audioRen.getCurrentOutputDevices((err: BusinessError, data: ESObject) => {
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
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_0200', 2, async (done: Function) => {
      await renderPlay();
      audioRen.getCurrentOutputDevices((err: BusinessError, data: ESObject) => {
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
            }).catch((err: BusinessError) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            });
          }).catch((err: BusinessError) => {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICESSYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let data: ESObject = audioRen.getCurrentOutputDevicesSync();
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
  }
  )
}
