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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import { testConst } from './Const.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { ReadOptions } from '@ohos.file.fs';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import abilityContext from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Hypium } from '../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement'
let g_context: common.UIAbilityContext;

export default function audioRendererTest() {
  describe('getUnderflowCount', () => {
    let audioRen: audio.AudioRenderer | null;
    let TagFrmwkRender = "audioRendererEnhanceTest";

    beforeAll(async (): Promise<void> => {
      try {
        console.info(' beforeAll start');
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
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err: BusinessError) {
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
        } catch (error) {
          console.info(`${TagFrmwkRender}:  audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
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
          //构建欠载音频帧
          if (i == len - 1) {
            await Utils.msSleep(2000);
          }
          if (i == len - 5) {
            await Utils.msSleep(2000);
          }
          if (i == len - 6) {
            await Utils.msSleep(2000);
          }
          if (i == len - 10) {
            await Utils.msSleep(2000);
          }
          if (i == len - 15) {
            await Utils.msSleep(2000);
          }
          if (i == len - 16) {
            await Utils.msSleep(2000);
          }
        }
        console.info(`${TagFrmwkRender}: audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_STATIC_0100
     * @tc.desc   AudioRenderer - getUnderflowCountSync_COUNT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let value: number = audioRen!.getUnderflowCountSync();
        console.info(`${TagFrmwkRender}: getUnderflowCount :SUCCESS ${value}`);
        expect(value).assertEqual(testConst.OUTPUT_NUMBER_0);
        done();
      } catch (err: BusinessError) {
        console.log("${TagFrmwkRender}:getUnderflowCount : error = " + err);
        expect(false).assertTrue();
        done();
      }

    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_STATIC_0200
     * @tc.desc   AudioRenderer - getUnderflowCountSync_COUNT_RENDER_PLAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNTSYNC_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {

      try {
        await renderPlay();
        let value: number = audioRen!.getUnderflowCountSync();
        console.info(`${TagFrmwkRender}: getUnderflowCount :SUCCESS ${value}`);
        expect(value as number).assertLargerOrEqual(testConst.OUTPUT_NUMBER_0 as number);
        try {
          await audioRen!.drain();
          try {
            await audioRen!.stop();
            expect(true).assertTrue();
            done();
          } catch (err: BusinessError) {
            console.info(`${TagFrmwkRender}:  Renderer stop:ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        } catch (err: BusinessError) {
          console.error(`${TagFrmwkRender}:  Renderer drain: ERROR : ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err: BusinessError) {
        console.log("${TagFrmwkRender}:getUnderflowCount : error = " + err);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0100
     * @tc.desc   AudioRenderer - getUnderflowCount "unit_32" - COUNT_PROMISE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioRen!.getUnderflowCount();
          console.info(`${TagFrmwkRender}: getUnderflowCount :SUCCESS ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          done();
        } catch (error: BusinessError) {
          console.log("${TagFrmwkRender}:getUnderflowCount : error = " + error);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.log("GETUNDERFLOWCOUNT catch unknown error = " + error);
        expect(false).assertTrue();
        done();
      }

    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0200
     * @tc.desc   AudioRenderer - getUnderflowCount "unit_32" - COUNT_RENDER_PLAY_PROMISE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await renderPlay();
        try {
          let data = await audioRen!.getUnderflowCount();
          console.info(`${TagFrmwkRender}: getUnderflowCount :SUCCESS ${data}`);
          expect(data as number).assertLargerOrEqual(testConst.OUTPUT_NUMBER_0 as number);
          try {
            await audioRen!.drain();
            try {
              await audioRen!.stop();
              expect(true).assertTrue();
              done();
            } catch (err: BusinessError) {
              console.info(`${TagFrmwkRender}:  Renderer stop:ERROR : ${err.message}`);
              expect(false).assertTrue();
              done();
            }
          } catch (err: BusinessError) {
            console.error(`${TagFrmwkRender}:  Renderer drain: ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        } catch (error: BusinessError) {
          console.log("${TagFrmwkRender}: getUnderflowCount : error = " + error);
          expect(false).assertTrue();
          done();
        }
      } catch (error: BusinessError) {
        console.log("GETUNDERFLOWCOUNT catch unknown error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0300
     * @tc.desc   AudioRenderer - getUnderflowCount "unit_32" - ALL_STREAM_TYPE_PROMISE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
          let audioRender: audio.AudioRenderer | null;
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
              console.info(`${TagFrmwkRender}:  AudioRender Created : Stream Type: ${testConst.StreamUsage[index]} success`);
            } catch (err: BusinessError) {
              console.info(`${TagFrmwkRender}:  AudioRender Created : ERROR : ` + err.code + err.message);
            }
          } catch (error: BusinessError) {
            console.info(`${TagFrmwkRender}:  AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          try {
            let data = await audioRender!.getUnderflowCount();
            console.info(`${TagFrmwkRender}:  getUnderflowCount SUCCESS! ${testConst.StreamUsage[index]}  data ${data}:, now release audiorender`);
            expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          } catch (error: BusinessError) {
            console.info(`${TagFrmwkRender}:  getUnderflowCount: ERROR : code: ${error.code}, mesage: ${error.message}`);
            expect(false).assertTrue();
            done();
          }
          Utils.msSleep(1000);
          try {
            await audioRender!.release()
            console.info(`${TagFrmwkRender}:  Renderer ${testConst.StreamUsage[index]} release  SUCCESS! `);
          } catch (err: BusinessError) {
            console.info(`${TagFrmwkRender}:  Renderer release ERROR: ${err.message}`);
          }
        }
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0100
     * @tc.desc   AudioRenderer - getUnderflowCount "uint_32" - COUNT_CALLBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      audioRen!.getUnderflowCount((err: BusinessError<void> | null, data: long | undefined) => {
        if (err) {
          console.info(`${TagFrmwkRender}:  getUnderflowCount ERROR! code: ${err?.code}, mesage: ${err?.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}:  getUnderflowCount : Success! ${data}`);
          expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0200
     * @tc.desc   AudioRenderer - getUnderflowCount "uint_32" - COUNT_RENDER_PLAY_CALLBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await renderPlay();
        audioRen!.getUnderflowCount((error: BusinessError<void> | null, data: long | undefined) => {
          if (error?.code) {
            console.info(`${TagFrmwkRender}:  getUnderflowCount execution fail,error: [${error?.code}, ${error?.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TagFrmwkRender}: getUnderflowCount :SUCCESS ${data}`);
            expect(data as long).assertLargerOrEqual(testConst.OUTPUT_NUMBER_0 as long);
          }
        });
        try {
          await audioRen!.drain();
          try {
            await audioRen!.stop();
            done();
          } catch (err: BusinessError) {
            console.info(`${TagFrmwkRender}:  Renderer stop:ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        } catch (err: BusinessError) {
          console.error(`${TagFrmwkRender}:  Renderer drain: ERROR : ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error: BusinessError) {
        console.info(`${TagFrmwkRender}:  getUnderflowCount unknown error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0300
     * @tc.desc   AudioRenderer - getUnderflowCount "uint_32" - ALL_STREAM_TYPE_CALLBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETUNDERFLOWCOUNT_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
          let audioRender: audio.AudioRenderer | null;
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
            } catch (err: BusinessError) {
              console.info(`${TagFrmwkRender}:  AudioRender Created : ERROR : ` + err.message);
            }
          } catch (error: BusinessError) {
            console.info(`${TagFrmwkRender}:  AudioRender Created : catch ERROR : ` + error.code + error.message);
          }
          audioRen!.getUnderflowCount((error: BusinessError<void> | null, data: long | undefined) => {
            if (error?.code) {
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}: getUnderflowCount StreamType:${testConst.StreamUsage[index]} execution success, data: ${JSON.stringify(data)}`);
              expect(data).assertEqual(testConst.OUTPUT_NUMBER_0);
            }
          });
          Utils.msSleep(1000);
          try {
            await audioRender!.release();
            console.info(`${TagFrmwkRender}:  Renderer ${testConst.StreamUsage[index]} release : SUCCESS`);
          } catch (err: BusinessError) {
            console.info(`${TagFrmwkRender}:  Renderer release :ERROR : ${err.message}`);
          }
        }
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });

  })
}