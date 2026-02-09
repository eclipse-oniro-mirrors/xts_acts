/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import { testConst } from './Const.test';
import common from '@ohos.app.ability.common';
import { ReadOptions } from '@ohos.file.fs';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import { AppStorage } from '@ohos.arkui.stateManagement'

let g_context: common.UIAbilityContext;

export default function audioRendererTest() {
  describe('getMax_MinStreamVolume', () => {
    let audioRen: audio.AudioRenderer | null = null;
    let TagFrmwkRender = "audioRendererEnhanceTest";

    beforeAll(async (): Promise<void> => {
      try {
        console.info('beforeAll start');
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
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000);
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error('beforeAll failed, err: ' + err);
      }
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
          console.info('${TagFrmwkRender} audioRendererEnhanceTest: AudioRender Created : Stream Type:STREAM_USAGE_MUSIC SUCCESS data state: ' +
          Object.keys(data!));
          console.info('${TagFrmwkRender} audioRendererEnhanceTest: AudioRender Created : Stream Type:STREAM_USAGE_MUSIC SUCCESS data value: ' +
          JSON.stringify(data));
        } catch(err) {
          console.info('${TagFrmwkRender} audioRendererEnhanceTest: AudioRender Created : ERROR : ' + err.message);
        }
      } catch (error) {
        console.info('${TagFrmwkRender} audioRendererEnhanceTest: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async () => {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
      Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
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
          console.info(`${TagFrmwkRender}: len:${len}\n`);
        } catch (error) {
          console.info(`${TagFrmwkRender}: #######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`${TagFrmwkRender}: fd:${file.fd}\n`);

        let buf = new ArrayBuffer(bufferSize);
        console.info(`${TagFrmwkRender}: audioRenderer write start.......... \n`);

        let inputVolume = 0.5;
        try {
          await audioRen!.setVolume(inputVolume)
          console.info(`${TagFrmwkRender}: setVolume to 0.5 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
        }

        for (let i = 0; i < len; i++) {
          let options: ReadOptions = {
            offset: i * bufferSize,
            length: bufferSize
          }
          let readsize = await fs.read(file.fd, buf, options);

          if (i == len - 100) {
            try {
              let data = await audioRen!.getMinStreamVolume();
              console.info(`${TagFrmwkRender}: #####getMinStreamVolume :SUCCESS ${data}`);
              inputVolume = data;
            } catch (error) {
              console.log("#####getMinStreamVolume : error = " + error);
            }
            try {
              await audioRen!.setVolume(inputVolume)
              console.info(`${TagFrmwkRender}: setVolume to ${inputVolume} : Success`);
            } catch (err) {
              console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            }
          }

          if (i == len - 50) {
            try {
              let data = await audioRen!.getMaxStreamVolume();
              console.info(`${TagFrmwkRender}: #####getMaxStreamVolume :SUCCESS ${data}`);
              inputVolume = data;
            } catch (error) {
              console.log("#####getMaxStreamVolume : error = " + error);
            }
            try {
              await audioRen!.setVolume(inputVolume)
              console.info(`${TagFrmwkRender}: setVolume to ${inputVolume} : Success`);
            } catch (err) {
              console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            }
          }

        }
        console.info(`${TagFrmwkRender}: audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUMESYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUMESYNC_STATIC_0100
     * @tc.desc   AudioRenderer - getMaxStreamVolumeSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUMESYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let value: number = audioRen!.getMaxStreamVolumeSync()
        console.info(`${TagFrmwkRender}: getMaxStreamVolume :SUCCESS ${value}`);
        expect(value).assertEqual(testConst.OUTPUT_NUMBER_1);
        done();
      } catch (err) {
        console.log("getMaxStreamVolume : error = " + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUMESYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUMESYNC_STATIC_0200
     * @tc.desc   AudioRenderer - getMinStreamVolumeSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUMESYNC_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let value: number = audioRen!.getMinStreamVolumeSync()
        console.info(`${TagFrmwkRender}: getMaxStreamVolume :SUCCESS ${value}`);
        expect(value).assertEqual(testConst.OUTPUT_NUMBER_0);
        done();
      } catch (err) {
        console.log("getMaxStreamVolume : error = " + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0100
     * @tc.desc   AudioRenderer - getMaxStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioRen!.getMaxStreamVolume();
          console.info(`${TagFrmwkRender}: getMaxStreamVolume :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_1);
          done();
        } catch (error) {
          console.log("getMaxStreamVolume : error = " + error);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.log("GETMAXSTREAMVOLUME catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0200
     * @tc.desc   AudioRenderer - getMaxStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await renderPlay();
        try {
          let data = await audioRen!.getMaxStreamVolume();
          console.info(`${TagFrmwkRender}: getMaxStreamVolume :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_1);
          done();
        } catch (error) {
          console.log("getMaxStreamVolume : error = " + error);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.log("GETMAXSTREAMVOLUME catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0300
     * @tc.desc   AudioRenderer - getMaxStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
          let audioRender: audio.AudioRenderer | null = null;
          let AudioStreamInfo: audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo: audio.AudioRendererInfo = {
            usage: testConst.StreamUsage[index],
            rendererFlags: 0
          }
          let AudioRendererOptions: audio.AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          try {
            try {
              let data = await audio.createAudioRenderer(AudioRendererOptions);
              audioRender = data;
              console.info(`${TagFrmwkRender}:  AudioRender Created : Stream Type: ${testConst.StreamUsage[index]} SUCCESS data state: ` +
              Object.keys(data!));
            } catch (err) {
              console.info(`${TagFrmwkRender}:  AudioRender Created : ERROR : ` + err.message);
            }
          } catch (error) {
            console.info(`${TagFrmwkRender}:  AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          try {
            let data = await audioRender!.getMaxStreamVolume();
            console.info(`${TagFrmwkRender}: getMaxStreamVolume:Stream Type: ${testConst.StreamUsage[index]} SUCCESS ${data}`);
            expect(data).assertEqual(testConst.OUTPUT_NUMBER_1);
          } catch (error) {
            console.info(`${TagFrmwkRender}: getMaxStreamVolume:Stream Type: ${testConst.StreamUsage[index]} ERROR : code: ${error.code}, mesage: ${error.message}`);
            expect(false).assertTrue();
            done();
          }

          Utils.msSleep(1000);
          try {
            await audioRender!.release();
            console.info(`${TagFrmwkRender}:  Renderer release : SUCCESS`);
          } catch (err) {
            console.info(`${TagFrmwkRender}:  Renderer release :ERROR : ${err.message}`);
          }
        }
        done();
      } catch (error) {
        console.info(`${TagFrmwkRender}: GETMAXSTREAMVOLUME Stream ERROR : code: ${error.code}, mesage: ${error.message}`);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0400
     * @tc.desc   AudioRenderer - getMaxStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioRen!.getMaxStreamVolume();
          console.info(`${TagFrmwkRender}: getMaxStreamVolume :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_1);
          try {
            await audioRen!.setVolume(data);
            console.info(`${TagFrmwkRender}:  setVolume to maxVolume Success! maxVolume: ${data}`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.info(`${TagFrmwkRender}:  setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          console.info(`${TagFrmwkRender}: getMaxStreamVolume : ERROR : code: ${error.code}, mesage: ${error.message}`);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.info(`${TagFrmwkRender}: GETMAXSTREAMVOLUME catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0100
     * @tc.desc   AudioRenderer - getMinStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioRen!.getMinStreamVolume();
          console.info(`${TagFrmwkRender}: getMinStreamVolume :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          done();
        } catch (error) {
          console.info(`${TagFrmwkRender}: getMinStreamVolume : ERROR : code: ${error.code}, mesage: ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(`${TagFrmwkRender}: GETMINSTREAMVOLUME catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0200
     * @tc.desc   AudioRenderer - getMinStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await renderPlay();
        try {
          let data = await audioRen!.getMinStreamVolume();
          console.info(`${TagFrmwkRender}: getMinStreamVolume :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          done();
        } catch (error) {
          console.info(`${TagFrmwkRender}: getMinStreamVolume : ERROR : code: ${error.code}, mesage: ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(`${TagFrmwkRender}: GETMINSTREAMVOLUME catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0300
     * @tc.desc   AudioRenderer - getMinStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
          let audioRender: audio.AudioRenderer | null = null;
          let AudioStreamInfo: audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo: audio.AudioRendererInfo = {
            usage: testConst.StreamUsage[index],
            rendererFlags: 0
          }
          let AudioRendererOptions: audio.AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          try {
            try {
              let data = await audio.createAudioRenderer(AudioRendererOptions);
              audioRender = data;
              console.info(`${TagFrmwkRender}:  AudioRender Created : Stream Type: ${testConst.StreamUsage[index]} SUCCESS data state: ` +
              Object.keys(data!));
            } catch (err) {
              console.info(`${TagFrmwkRender}:  AudioRender Created : ERROR : ` + err.message);
            }
          } catch (error) {
            console.info(`${TagFrmwkRender}:  AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          try {
            let data = await audioRender!.getMinStreamVolume();
            console.info(`${TagFrmwkRender}: getMinStreamVolume:Stream Type: ${testConst.StreamUsage[index]} SUCCESS ${data}`);
            expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          } catch (error) {
            console.info(`${TagFrmwkRender}: getMinStreamVolume:Stream Type: ${testConst.StreamUsage[index]} ERROR : code: ${error.code}, mesage: ${error.message}`);
            expect(false).assertTrue();
            done();
          }

          Utils.msSleep(1000);
          try {
            await audioRender!.release();
            console.info(`${TagFrmwkRender}:  Renderer release : SUCCESS`);
          } catch (err) {
            console.info(`${TagFrmwkRender}:  Renderer release :ERROR : ${err.message}`);
          }
        }
        done();
      } catch (error) {
        console.info(`${TagFrmwkRender}: GETMINSTREAMVOLUME Stream ERROR : code: ${error.code}, mesage: ${error.message}`);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0400
     * @tc.desc   AudioRenderer - getMinStreamVolume "unit_32" - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioRen!.getMinStreamVolume();
          console.info(`${TagFrmwkRender}:  getMinStreamVolume :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          try {
            await audioRen!.setVolume(data);
            console.info(`${TagFrmwkRender}:  setVolume to minVolume Success! minVolume: ${data}`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.info(`${TagFrmwkRender}:  setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          console.info(`${TagFrmwkRender}: getMinStreamVolume : ERROR : code: ${error.code}, mesage: ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(`${TagFrmwkRender}: GETMINSTREAMVOLUME catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0100
     * @tc.desc   AudioRenderer - getMaxStreamVolume "uint_32" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      audioRen!.getMaxStreamVolume((err: BusinessError<void> | null, maxVolume: number | undefined) => {
        if (err) {
          console.error('${TagFrmwkRender} Get max stream volume Fail: ${err}');
          expect(false).assertTrue();
          done();
        } else {
          console.info('${TagFrmwkRender} Get max stream volume Success! ${maxVolume}');
          expect(maxVolume).assertEqual(testConst.OUTPUT_NUMBER_1);
          done();
        }
      })
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0200
     * @tc.desc   AudioRenderer - getMaxStreamVolume "uint_32" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await renderPlay();
      audioRen!.getMaxStreamVolume((err: BusinessError<void> | null, maxVolume: number | undefined) => {
        if (err) {
          console.error('${TagFrmwkRender} Get max stream volume Fail: ${err}');
          expect(false).assertTrue();
          done();
        } else {
          console.info('${TagFrmwkRender} Get max stream volume Success! ${maxVolume}');
          expect(maxVolume).assertEqual(testConst.OUTPUT_NUMBER_1);
          done();
        }
      })
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0300
     * @tc.desc   AudioRenderer - getMaxStreamVolume "uint_32" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
          let audioRender: audio.AudioRenderer | null = null;
          let AudioStreamInfo: audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo: audio.AudioRendererInfo = {
            usage: testConst.StreamUsage[index],
            rendererFlags: 0
          }
          let AudioRendererOptions: audio.AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          try {
            try {
              let data = await audio.createAudioRenderer(AudioRendererOptions);
              audioRender = data;
              console.info(`${TagFrmwkRender}:  AudioRender Created : Stream Type: ${testConst.StreamUsage[index]} SUCCESS data state: ` +
              Object.keys(data!));
            } catch (err) {
              console.info(`${TagFrmwkRender}:  AudioRender Created : ERROR : ` + err.message);
            }
          } catch (error) {
            console.info(`${TagFrmwkRender}:  AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          audioRen!.getMaxStreamVolume((err: BusinessError<void> | null, maxVolume: number | undefined) => {
            if (err) {
              console.error('${TagFrmwkRender} Get max stream volume Fail: ${err}');
              expect(false).assertTrue();
              done();
            } else {
              console.info('${TagFrmwkRender} Get max stream volume Success! ${maxVolume}');
              expect(maxVolume).assertEqual(testConst.OUTPUT_NUMBER_1);
              done();
            }
          })

          Utils.msSleep(1000);
          try {
            await audioRender!.release();
            console.info(`${TagFrmwkRender}:  Renderer release : SUCCESS`);
          } catch (err) {
            console.info(`${TagFrmwkRender}:  Renderer release :ERROR : ${err.message}`);
          }
        }
        done();
      } catch (error) {
        console.info(`${TagFrmwkRender}: getMaxStreamVolume: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0400
     * @tc.desc   AudioRenderer - getMaxStreamVolume "uint_32" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      audioRen!.getMaxStreamVolume((err: BusinessError<void> | null, maxVolume: number | undefined) => {
        if (err) {
          console.error('${TagFrmwkRender} Get max stream volume Fail: ${err}');
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: Get max stream volume Success! maxVolume: ${maxVolume}`);
          expect(maxVolume).assertEqual(testConst.OUTPUT_NUMBER_1);
          try {
            await audioRen!.setVolume(maxVolume!);
            console.info(`${TagFrmwkRender}:  setVolume to maxVolume Success! maxVolume: ${maxVolume}`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.info(`${TagFrmwkRender}:  setVolume ERROR! : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        }
      })
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0100
     * @tc.desc   AudioRenderer - getMinStreamVolume "float" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      audioRen!.getMinStreamVolume((err: BusinessError<void> | null, minVolume: number | undefined) => {
        if (err) {
          console.error('${TagFrmwkRender} Get min stream volume Fail: ${err}');
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: Get min stream volume Success! minVolume: ${minVolume}`);
          expect(minVolume).assertEqual(testConst.OUTPUT_NUMBER_0);
          done();
        }
      })
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0200
     * @tc.desc   AudioRenderer - getMinStreamVolume "uint_32" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await renderPlay();
      audioRen!.getMinStreamVolume((err: BusinessError<void> | null, minVolume: number | undefined) => {
        if (err) {
          console.error('${TagFrmwkRender} Get min stream volume Fail: ${err}');
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: Get min stream volume Success! minVolume: ${minVolume}`);
          expect(minVolume).assertEqual(testConst.OUTPUT_NUMBER_0);
          done();
        }
      })
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0300
     * @tc.desc   AudioRenderer - getMinStreamVolume "uint_32" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
          let audioRender: audio.AudioRenderer | null = null;
          let AudioStreamInfo: audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo: audio.AudioRendererInfo = {
            usage: testConst.StreamUsage[index],
            rendererFlags: 0
          }
          let AudioRendererOptions: audio.AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          try {
            try {
              let data = await audio.createAudioRenderer(AudioRendererOptions);
              audioRender = data;
              console.info(`${TagFrmwkRender}:  AudioRender Created : Stream Type: ${testConst.StreamUsage[index]} SUCCESS data state: ` +
              Object.keys(data!));
            } catch (err) {
              console.info(`${TagFrmwkRender}:  AudioRender Created : ERROR : ` + err.message);
            }
          } catch (error) {
            console.info(`${TagFrmwkRender}:  AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          audioRen!.getMinStreamVolume((err: BusinessError<void> | null, minVolume: number | undefined) => {
            if (err) {
              console.error('${TagFrmwkRender} Get min stream volume Fail: ${err}');
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}: Get min stream volume Success! minVolume: ${minVolume}`);
              expect(minVolume).assertEqual(testConst.OUTPUT_NUMBER_0);
            }
          })

          Utils.msSleep(1000);
          try {
            await audioRender!.release()
            console.info(`${TagFrmwkRender}:  Renderer release : SUCCESS`);
          } catch (err) {
            console.info(`${TagFrmwkRender}:  Renderer release :ERROR : ${err.message}`);
          }
        }
        done();
      } catch (error) {
        console.info(`${TagFrmwkRender}: getMinStreamVolume: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0400
     * @tc.desc   AudioRenderer - getMinStreamVolume "float" - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let minVolume = 1.0;
      audioRen!.getMinStreamVolume((err: BusinessError<void> | null, minVolume: number | undefined) => {
        if (err) {
          console.error('${TagFrmwkRender} Get min stream volume Fail: ${err}');
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: Get min stream volume Success! minVolume: ${minVolume}`);
          expect(minVolume).assertEqual(testConst.OUTPUT_NUMBER_0);
          try {
            await audioRen!.setVolume(minVolume!);
            console.info(`${TagFrmwkRender}:  setVolume to minVolume Success! minVolume: ${minVolume}`);
            done();
          } catch (err) {
            console.info(`${TagFrmwkRender}:  setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        }
      })
    });
  })
}