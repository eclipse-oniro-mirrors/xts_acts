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
import * as env from './Const';
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
  describe('on_off_outputDeviceChange', () => {
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

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_ON_CALLBACK_0100
     * @tc.name      : AudioRenderer -on "struct" - promise
     * @tc.desc      : AudioRenderer - on "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_ON_CALLBACK_0100', 0, async (done: Function) => {
      try {
        audioRen.on(-1, (error: BusinessError, data: ESObject) => {
          if (error) {
            console.log(`${TagFrmwkRender}: On error, error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error) {
          console.log(`${TagFrmwkRender}: On catch error, error: [${error.code}, ${error.message}]`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_ON_CALLBACK_0200
     * @tc.name      : AudioRenderer -on "struct" - promise
     * @tc.desc      : AudioRenderer - on "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_ON_CALLBACK_0200', 0, async (done: Function) => {
      try {
        audioRen.on('123', (error: BusinessError, data: ESObject) => {
          if (error) {
            console.log(`${TagFrmwkRender}: On error, error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error) {
          console.log(`${TagFrmwkRender}: On catch error, error: [${error.code}, ${error.message}]`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_ON_CALLBACK_0300
     * @tc.name      : AudioRenderer -on "struct" - promise
     * @tc.desc      : AudioRenderer - on "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_ON_CALLBACK_0300', 0, async (done: Function) => {
      try {
        audioRen.on((error: BusinessError, data: ESObject) => {
          if (error) {
            console.log(`${TagFrmwkRender}: On execution fail,error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwkRender}: On execution success, testcase FAIL!`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error) {
          console.log(`${TagFrmwkRender}: On: catch error, error: [${error.code}, ${error.message}]`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_OFF_CALLBACK_0100
     * @tc.name      : AudioRenderer -on "struct" - promise
     * @tc.desc      : AudioRenderer - on "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_OFF_CALLBACK_0100', 0, async (done: Function) => {
      try {
        audioRen.off(-1, (error: BusinessError, data: ESObject) => {
          if (error) {
            console.log(`${TagFrmwkRender}:Off execution fail,error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwkRender}:Off execution success, testcase FAIL! `);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error) {
          console.log(`${TagFrmwkRender}:On catch error, error: [${error.code}, ${error.message}]`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_OFF_CALLBACK_0200
     * @tc.name      : AudioRenderer -on "struct" - promise
     * @tc.desc      : AudioRenderer - on "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_OFF_CALLBACK_0200', 0, async (done: Function) => {
      try {
        audioRen.off('123', (error: BusinessError, data: ESObject) => {
          if (error) {
            console.log(`${TagFrmwkRender}: Off execution fail,error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwkRender}: Off execution success, testcase FAIL! `);
            expect(true).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error) {
          console.log(`${TagFrmwkRender}: Off catch error, error: [${error.code}, ${error.message}]`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_OFF_CALLBACK_0300
     * @tc.name      : AudioRenderer -off "struct" - promise
     * @tc.desc      : AudioRenderer - off "struct" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_OFF_CALLBACK_0300', 0, async (done: Function) => {
      try {
        audioRen.off((error: BusinessError, data: ESObject) => {
          if (error) {
            console.log(`${TagFrmwkRender}: Off execution fail,error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwkRender}: Off execution success, testcase FAIL! `);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error) {
          console.log(`${TagFrmwkRender}: Off catch error, error: [${error.code}, ${error.message}]`);
          expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });
  })
}
