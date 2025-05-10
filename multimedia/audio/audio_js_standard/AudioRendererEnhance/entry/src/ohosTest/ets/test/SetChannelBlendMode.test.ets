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
import * as env from './Const';
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

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
  describe('setChannelBlendMode', () => {
    let Tag = "audioRendererEnhanceTest";
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
      console.info(`${Tag}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
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
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' +
          Object.keys(data));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' +
          JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });
      } catch (error) {
        console.info('AudioFrameworkRenderLog: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
      await audioRen.release().then(() => {
        console.info(`${Tag}: Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async () => {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
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
          console.info(`len:${len}\n`);
        } catch (error) {
          console.info(`#######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`fd:${file.fd}\n`);

        let buf = new ArrayBuffer(bufferSize);
        console.info(`audioRenderer write start.......... \n`);

        let inputVolume = 0.5;
        await audioRen.setVolume(inputVolume).then(() => {
          console.info(`${Tag}: setVolume to 0.5 : Success`);
        }).catch((err: BusinessError) => {
          console.info(`${Tag}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
        });

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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0100
     * @tc.name      : AudioRenderer - setChannelBlendMode-MDOE_INPUT_DEFAULT
     * @tc.desc      : AudioRenderer - setChannelBlendMode-MDOE_INPUT_DEFAULT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0200', 2, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0300', 2, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0400', 2, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0500', 2, async (done: Function) => {
      try {
        //unsupported option, 6800104
        await audioRen.setChannelBlendMode(env.INPUT_PARAMETER_TYPE_NUMBER);
        console.log(`${Tag}  setChannelBlendMode success test fail!`);
        expect(false).assertTrue();
        done();
      } catch (error) {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0600', 2, async (done: Function) => {
      try {
        //unsupported option, 6800104
        await audioRen.setChannelBlendMode(env.INPUT_PARAMETER_TYPE_NUMBER_4);
        console.log(`${Tag}  setChannelBlendMode success test fail!`);
        expect(false).assertTrue();
        done();
      } catch (error) {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0700', 2, async (done: Function) => {
      try {
        //invalid parameter, 6800101
        await audioRen.setChannelBlendMode(env.INVALID_PARAMETER_STRING);
        console.log(`${Tag}  setChannelBlendMode success test fail!`);
        expect(false).assertTrue();
        done();
      } catch (error) {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0800', 2, async (done: Function) => {
      try {
        for (let index = 0; index < env.StreamUsage.length; index++) {
          let AudioStreamInfo: AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo: AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: env.StreamUsage[index],
            rendererFlags: 0
          }
          let AudioRendererOptions: AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          let audioRender: audio.AudioRenderer | ESObject;
          await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRender = data;
          }).catch((err: BusinessError) => {
            console.info(`${Tag}: createAudioRenderer : ${env.StreamUsage[index]} ERROR : ${err.message}, ${err.code}`);
          });
          let key: ESObject;
          let ChannelBlendMode: ESObject = audio.ChannelBlendMode;
          const keysArray = [...Object.keys(ChannelBlendMode)];
          try {
            for (key of keysArray) {
              await audioRender.setChannelBlendMode(Number(keysArray[key]))
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
            }).catch((err: BusinessError) => {
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
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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