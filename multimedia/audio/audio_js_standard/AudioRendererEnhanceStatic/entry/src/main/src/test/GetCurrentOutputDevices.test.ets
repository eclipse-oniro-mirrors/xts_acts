/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../hypium/index';
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import { ReadOptions } from '@ohos.file.fs';
import { testConst } from './Const.test';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import { AppStorage } from '@ohos.arkui.stateManagement'

let g_context: common.UIAbilityContext;

export default function audioRendererTest() {
  describe('getCurrentOutputDevices', () => {
    let audioRen: audio.AudioRenderer | null;
    let TagFrmwkRender = "audioRendererEnhanceTest";

    beforeAll(async (): Promise<void> => {
      try {
        console.info('%{public}s', ' beforeAll start');
        g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info(' requestPermissionsFromUser end');
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
      }
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async () => {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try {
        try {
          let data = await audio.createAudioRenderer(AudioRendererOptions);
          audioRen = data;
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data state: ' +
          Object.keys(data!));
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data value: ' +
          JSON.stringify(data));
        } catch (err: BusinessError) {
          console.info('audioRendererEnhanceTest: AudioRender Created : ERROR : ' + err.message);
        }
      } catch (error: BusinessError) {
        console.info('audioRendererEnhanceTest: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async () => {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
      Utils.msSleep(2000);
      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async () => {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })

    let filePath: string;

    let renderPlay = async () => {
      let bufferSize: long;
      try {
        bufferSize = await audioRen!.getBufferSize()
        console.info(`${TagFrmwkRender}: audioRenderer getBufferSize success,bufferSize:${bufferSize} \n`);
        await audioRen!.start();
        console.info(`${TagFrmwkRender}: audioRenderer start success\n`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: audioRenderer start : Error: ${JSON.stringify(err)}\n`);
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      filePath = testContext.filesDir;
      console.info(`${TagFrmwkRender}:  case2 dirPath is  ${JSON.stringify(filePath)}`);


      let path = filePath + '/StarWars10s-1C-8000-2SW.wav';
      console.info(`${TagFrmwkRender}: path:${path}\n`);
      try {
        let len: number;
        try {
          let stat = await fs.stat(path);
          console.info(`${TagFrmwkRender}: stat:${JSON.stringify(stat)}\n`);
          console.info(`${TagFrmwkRender}: size:${stat.size}\n`);
          len =
            stat.size % bufferSize == 0 ? Math.floor(stat.size / bufferSize) : Math.floor(stat.size / bufferSize + 1);
        } catch (error) {
          console.info(`${TagFrmwkRender}: #######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`${TagFrmwkRender}: fd:${file.fd}\n`);

        let buf = new ArrayBuffer(bufferSize);
        console.info(`${TagFrmwkRender}: audioRenderer write start.......... \n`);
        for (let i = 0; i < len; i++) {
          let options: ReadOptions = {
            offset: i * bufferSize,
            length: bufferSize
          }
          let readsize = await fs.read(file.fd, buf, options);
        }
        console.info(`${TagFrmwkRender}: audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_STATIC_0100
     * @tc.desc   AudioRenderer - getCurrentOutputDevices "struct" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await audioRen!.getCurrentOutputDevices().then((data: audio.AudioDeviceDescriptors) => {
          console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id}, name:${data[0].name},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
          expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0].id).assertEqual(testConst.OUTPUT_NUMBER_1);
          done();
        }).catch((error: Error) => {
          console.log("${TagFrmwkRender}: getCurrentOutputDevices error = " + error);
          expect(false).assertTrue();
          done();
        });
      } catch (error: BusinessError) {
        console.info(`${TagFrmwkRender}: get current output deviceinfo unknown errro: [${error.code}, ${error.message}]`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_STATIC_0200
     * @tc.desc   AudioRenderer - getCurrentOutputDevices "struct" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await renderPlay();
        try {
          let data = await audioRen!.getCurrentOutputDevices();
          console.info(`${TagFrmwkRender}: deviceRole:${data[0]!.deviceRole}, deviceType:${data[0]!.deviceType}, id:${data[0]!.id},
            address:${data[0]!.address}, sampleRates:${data[0]!.sampleRates}, channelCounts:${data[0]!.channelCounts}, channelMasks:${data[0]!.channelMasks}`);
          expect(data[0]!.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data[0]!.deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data[0]!.id).assertEqual(testConst.OUTPUT_NUMBER_1);
          console.info(`${TagFrmwkRender}: Renderer get current output device SUCCESS, now stop audiorender`);
          audioRen!.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drain : SUCCESS, stop audiorender`);
            audioRen!.stop().then(() => {
              console.info(`${TagFrmwkRender}: Renderer stopp : SUCCESS`);
              done();
            }).catch((err: Error) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            });
          }).catch((err: Error) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
          });
        } catch (error: BusinessError) {
          console.log("${TagFrmwkRender}: getCurrentOutputDevices : error = " + error);
          if (error.code === 6800301) {
            console.log("${TagFrmwkRender}: getCurrentOutputDevices : error.code = " + error.code);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_STATIC_0100
     * @tc.desc   AudioRenderer - getCurrentOutputDevices "struct" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      audioRen!.getCurrentOutputDevices((err: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getCurrentOutputDevices ERROR ! code: ${err?.code}, mesage: ${err?.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwkRender}: deviceRole:${data![0].deviceRole}, deviceType:${data![0].deviceType}, id:${data![0].id},
            address:${data![0].address}, sampleRates:${data![0].sampleRates}, channelCounts:${data![0].channelCounts}, channelMasks:${data![0].channelMasks}`);
          expect(data![0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data![0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data![0].id).assertEqual(testConst.OUTPUT_NUMBER_1);
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_STATIC_0200
     * @tc.desc   AudioRenderer - getCurrentOutputDevices "struct" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICES_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await renderPlay();
      audioRen!.getCurrentOutputDevices((err: BusinessError<void> | null, data: audio.AudioDeviceDescriptors | undefined) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getCurrentOutputDevices ERROR! error: ${err?.code}, mesage: ${err?.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: getCurrentOutputDevices :deviceRole:${data![0].deviceRole}, deviceType:${data![0].deviceType}, id:${data![0].id},
            address:${data![0].address}, sampleRates:${data![0].sampleRates}, channelCounts:${data![0].channelCounts}, channelMasks:${data![0].channelMasks}`);
          expect(data![0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
          expect(data![0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
          expect(data![0].id).assertEqual(testConst.OUTPUT_NUMBER_1);
          console.info(`${TagFrmwkRender}: Renderer getCurrentOutputDevices SUCCESS! now stop the audiorenderer`);
          audioRen!.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drain, stop the audiorenderer`);
            audioRen!.stop().then(() => {
              console.info(`${TagFrmwkRender}: Renderer stopp SUCCESS, testcase SUCCESS!`);
              done();
            }).catch((err: Error) => {
              console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            });
          }).catch((err: Error) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
          });
        }
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICESSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICESSYNC_STATIC_0100
     * @tc.desc   AudioRenderer - getCurrentOutputDevicesSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETCURRENTOUTPUTDEVICESSYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let data = audioRen!.getCurrentOutputDevicesSync();
        console.info(`${TagFrmwkRender}: deviceRole:${data[0].deviceRole}, deviceType:${data[0].deviceType}, id:${data[0].id}, name:${data[0].name},
            address:${data[0].address}, sampleRates:${data[0].sampleRates}, channelCounts:${data[0].channelCounts}, channelMasks:${data[0].channelMasks}`);
        expect(data[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(data[0].deviceType).assertEqual(audio.DeviceType.SPEAKER);
        expect(data[0].id).assertEqual(testConst.OUTPUT_NUMBER_1);
        done();
      } catch (err) {
        console.log("${TagFrmwkRender}: getCurrentOutputDevices error = " + err);
        expect(false).assertTrue();
        done();
      }
    });

  })
}
