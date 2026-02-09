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
  describe('setChannelBlendMode', () => {
    let audioRen: audio.AudioRenderer | null;
    let Tag = "audioRendererEnhanceTest";

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
    })
    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioRenderer(AudioRendererOptions).then((data: audio.AudioRenderer | null) => {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' +
          Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' +
          JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });
      } catch (error: BusinessError) {
        console.info('AudioFrameworkRenderLog: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      Utils.msSleep(2000);
      await audioRen!.release().then(() => {
        console.info(`${Tag}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${Tag}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async () => {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    })

    let filePath: string;
    let renderPlay = async () => {
      let bufferSize: long;
      try {
        bufferSize = await audioRen!.getBufferSize()
        console.info(`${Tag}: audioRenderer getBufferSize success,bufferSize:${bufferSize} \n`);
        await audioRen!.start();
        console.info(`${Tag}: audioRenderer start success\n`);
      } catch (err) {
        console.info(`${Tag}: audioRenderer start : Error: ${JSON.stringify(err)}\n`);
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      filePath = testContext.filesDir;
      console.info(`${Tag}:  case2 dirPath is  ${JSON.stringify(filePath)}`);

      let path = filePath + '/StarWars10s-1C-8000-2SW.wav';
      console.info(`${Tag}: path:${path}\n`);
      try {
        let len: number;
        try {
          let stat = await fs.stat(path);
          console.info(`${Tag}: stat:${JSON.stringify(stat)}\n`);
          console.info(`${Tag}: size:${stat.size}\n`);
          len =
            stat.size % bufferSize == 0 ? Math.floor(stat.size / bufferSize) : Math.floor(stat.size / bufferSize + 1);
          console.info(`${Tag}: len:${len}\n`);
        } catch (error) {
          console.info(`${Tag}: #######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`${Tag}: fd:${file.fd}\n`);

        let buf = new ArrayBuffer(bufferSize);
        console.info(`${Tag}: audioRenderer write start.......... \n`);

        let inputVolume = 0.5;
        try {
          await audioRen!.setVolume(inputVolume);
          console.info(`${Tag}: setVolume to 0.5 : Success`);
        } catch (err: BusinessError) {
          console.info(`${Tag}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
        }

        for (let i = 0; i < len; i++) {
          let options: ReadOptions = {
            offset: i * bufferSize,
            length: bufferSize
          }
          let readsize = await fs.read(file.fd, buf, options);
        }
        console.info(`${Tag}: audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`${Tag}: audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0100
     * @tc.desc   AudioRenderer - setChannelBlendMode-MDOE_INPUT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioRen!.setChannelBlendMode(audio.ChannelBlendMode.MODE_DEFAULT)
        console.info(`${Tag}: setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0200
     * @tc.desc   AudioRenderer - setChannelBlendMode-MODE_LEFT_RIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioRen!.setChannelBlendMode(audio.ChannelBlendMode.MODE_BLEND_LR)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}:  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0300
     * @tc.desc   AudioRenderer - setChannelBlendMode-MODE_ALL_LEFT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioRen!.setChannelBlendMode(audio.ChannelBlendMode.MODE_ALL_LEFT)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}:  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0400
     * @tc.desc   AudioRenderer - setChannelBlendMode-MODE_ALL_RIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioRen!.setChannelBlendMode(audio.ChannelBlendMode.MODE_ALL_RIGHT)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}:  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0800
     * @tc.desc   AudioRenderer - setChannelBlendMode - USE_ALL_STREAMTYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < testConst.StreamUsage.length; index++) {
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
          let audioRender: audio.AudioRenderer | null;
          try {
            let data = await audio.createAudioRenderer(AudioRendererOptions);
            audioRender = data;
          } catch (err: BusinessError) {
            console.info(`${Tag}: createAudioRenderer : ${testConst.StreamUsage[index]} ERROR : ${err.message}, ${err.code}`);
          }
          let keysArray: audio.ChannelBlendMode[] = [
            audio.ChannelBlendMode.MODE_DEFAULT,
            audio.ChannelBlendMode.MODE_BLEND_LR,
            audio.ChannelBlendMode.MODE_ALL_LEFT,
            audio.ChannelBlendMode.MODE_ALL_RIGHT,
          ];
          try {
            for (let index = 0; index < keysArray.length; index++) {
              audioRender!.setChannelBlendMode(keysArray[index])
              await Utils.msSleep(20);
            }
          } catch (error: BusinessError) {
            console.info(`${Tag}: setChannelBlendMode : ${testConst.StreamUsage[index]} error ${error.message}, ${error.code}`);
            expect(false).assertTrue();
            done();
          }
          if (audioRender != null) {
            await audioRender!.release().then(() => {
              // audioRender = null;
            }).catch((err: Error) => {
              console.info(`${Tag}: setChannelBlendMode Renderer release :fail :${err.message}`);
            });
          }
          await Utils.msSleep(20);
        }
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0900
     * @tc.desc   AudioRenderer - setChannelBlendMode-RUNNING-STATE-MODE_LR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        audioRen!.setChannelBlendMode(audio.ChannelBlendMode.MODE_BLEND_LR)
        console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
        await renderPlay();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}:  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
