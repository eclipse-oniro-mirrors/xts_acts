/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import { Hypium } from "../../../hypium/index";
import { ReadOptions } from '@ohos.file.fs';
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000;
let tag: string = 'TestAudioRendererTest';

export default function AudioEffectTest() {
  describe('AudioEffectTest', () => {
    let TAG = "[EffectManagerInterfaceTest] ";
    let audioStreamManager = audio.getAudioManager().getStreamManager();
    let audioRenderer: audio.AudioRenderer | null;
    let streamNum: int = 0;
    let audioRendererList: Array<audio.AudioRenderer | null> = [];
    let audioRendererOptionsList: audio.AudioRendererOptions[] = []
    let audioEffectModeList: audio.AudioEffectMode[] = [];
    let bufferSizeList: long[] = [];
    let pathDir = '';
    let testCaseName = '';
    let audioPaths = [
      'pcm_48ksr_32kbr_2ch.wav'
    ]
    let audioRendererOptions: audio.AudioRendererOptions = {
      streamInfo: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
      rendererInfo: {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
    }

    beforeAll(async () => {
      console.info(TAG + 'TestLog: Start Testing AudioEffectTest Interfaces');
    })

    beforeEach(async () => {
      console.info(TAG + 'AudioEffectTest: beforeEach: Prerequisites at the test case level');
      await Utils.msSleep(1000);
    })

    afterEach(async () => {
      console.info(TAG + 'AudioEffectTest: afterEach: Test case-level clearance conditions');
    })

    afterAll(async () => {
      console.info(TAG + 'AudioEffectTest: afterAll: Test suite-level cleanup condition');
    })

    let getPath = async () => {
      console.info(TAG + 'TestLog: Start Testing getPath ');
      let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      let data = context.filesDir;
      pathDir = data + '/';
      console.info(TAG + `TestLog: Start Testing getPath ${pathDir} `);
    }

    let createAudioRenderer = async (assertFunction: ()=>void, done: ()=>void) => {
      if (audioRendererList && audioRendererList?.length) {
        audioRendererList.map( (audioRenderer: audio.AudioRenderer | null, index: int, array: Array<audio.AudioRenderer | null>) => {
          console.info(TAG + `create audio renderer release index:  ${index} length : ${audioRendererList.length}`)
          if (audioRendererList[index]) {
            await audioRendererList[index]!.release();
            audioRendererList[index] = null;
          }
        })
      }
      for (let index = 0; index < streamNum; index++) {
        console.info(TAG + `create  ${JSON.stringify(audioRendererOptionsList[index])} `);
        try {
          let data: audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptionsList[index]);
          console.info(TAG + `create1  ${JSON.stringify(data!)} `);
          audioRendererList.push(data!);
        } catch (err: BusinessError) {
          console.info(TAG + `create Error  ${JSON.stringify(err)} `);
        }
        console.info(TAG + `create  ${JSON.stringify(audioRendererList[index])} `);
        console.info(TAG + `TestLog: Start Testing createAudioRenderer create ${index} rendererObj`);
      }
    }

    let isCheckAudioRendererObj = () => {
      let status = true
      for (let index = 0; index < audioRendererList.length; index++) {
        console.info(TAG + `isCheckAudioRendererObj status : ${audioRendererList[index] === null}`)
        console.info(TAG + 'isCheckAudioRendererObj audioRendererList :' + index + audioRendererList[index] + `length : ${audioRendererList.length} `)
        if (audioRendererList[index] === null) {
          status = false
          return status
        }
      }
      return status
    }

    let setAudioEffectMode = async (assertFunction: ()=>void, done: ()=>void) => {
      if (isCheckAudioRendererObj()) {
        for (let index = 0; index < audioRendererList.length; index++) {
          try {
            await audioRendererList[index]!.setAudioEffectMode(audioEffectModeList[index]);
            console.info(TAG + `setAudioEffectMode audioRendererList ${index} success `);
          } catch (err: BusinessError) {
            console.info(TAG + `setAudioEffectMode audioRendererList ${index} failed `);
            assertFunction();
            done()
          }
        }
      } else {
        assertFunction();
        done()
      }
    }

    let isCheckAllWriteSuccess = (arr: Boolean[]) => {
      if (Array.isArray(arr) && arr.length > 0) {
        return arr.every(v => v === true)
      } else {
        return false
      }
    }

    let start = async (assertFunction: ()=>void, done: ()=>void) => {
      let stateGroup = [audio.AudioState.STATE_PREPARED, audio.AudioState.STATE_PAUSED, audio.AudioState.STATE_STOPPED]
      if (isCheckAudioRendererObj()) {
        for (let index = 0; index < audioRendererList.length; index++) {
          console.info(TAG + 'current audio renderer state : ' + audioRendererList[index]?.state)
          if (stateGroup.indexOf(audioRendererList[index]!.state) === -1) {
            console.info(TAG + `start state ${index} faile `);
            assertFunction();
            done()
          } else {
            try {
              await audioRendererList[index]!.start();
              console.info(TAG + `start audioRendererList ${index} success `);
            } catch (err: BusinessError) {
              console.info(TAG + `start audioRendererList ${index} failed `);
              assertFunction();
              done()
            }
          }
        }
      } else {
        console.info(TAG + 'start is isCheckAudioRendererObj Fail')
        assertFunction();
        done()
      }
    }

    let release = async (assertFunction: ()=>void, done: ()=>void) => {
      if (isCheckAudioRendererObj()) {
        for (let index = 0; index < audioRendererList.length; index++) {
          await audioRendererList[index]!.release()
          audioRendererList[index] = null
        }
      } else {
        assertFunction();
        done()
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_STATIC_0100
     * @tc.desc   GET_AUDIOEFFECTINFOARRYSYNC - MEDIA - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let audioEffectInfoArray = audioStreamManager.getAudioEffectInfoArraySync(audio.StreamUsage.STREAM_USAGE_MUSIC)
        expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
        expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
        console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
        done();
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0100
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_UNKNOWN).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0200
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_MUSIC).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0300
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0400
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - RING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_RINGTONE).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0500
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_MOVIE).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0600
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_MUSIC, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0700
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_ALARM, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0800
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0900
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1000
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1100
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_RINGTONE, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1200
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1300
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_GAME, (err: BusinessError<void> | null, audioEffectInfoArray: audio.AudioEffectInfoArray | undefined) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
            console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1400
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - AUDIOBOOK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1500
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_NAVIGATION).then((audioEffectInfoArray: audio.AudioEffectInfoArray) => {
          expect(audioEffectInfoArray![0]).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
          expect(audioEffectInfoArray![1]).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
          console.info(TAG + `getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err: Error) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0100
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0100 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0200
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0200 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0300
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0300 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      try {
        let data = await audio.createAudioRenderer(audioRendererOptions);
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      } catch (err: BusinessError) {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      }
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0400
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0400 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0500
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0500 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0600
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0600 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0700
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0700 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0800
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0800 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0900
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0900 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1000
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1000 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1100
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1100 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1200
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1200 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1300
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1300 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1400
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1400 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1500
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1500 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1600
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1600 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1700
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1700 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1800
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1800 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1900
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1900 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();

            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2000
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2000 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2100
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2100 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2200
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2200 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2300
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2300 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2400
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2400 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }

            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2500
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2500 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }

            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2600
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2600 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2700
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2700 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2800
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2800 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2900
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2900 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3000
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3000 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3100
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3100 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3200
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3200 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3300
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3300 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3400
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3400 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3500
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3500 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3600
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3600 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3700
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3700 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3800
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3800 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3900
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3900 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.info(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.info(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer!.release();
                done();
              }
            }).catch((err: Error) => {
              console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4000
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4000 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4100
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4100 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  expect(true).assertTrue();
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4200
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_STATIC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4200 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        if (effectmode! == 1) {
          console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
                if (effectmode! == 0) {
                  console.info(`getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer!.release();
                  done();
                } else {
                  console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err?.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }
          });
        } else {
          console.info(TAG + "getAudioEffectMode failed" + err?.message);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0100
     * @tc.desc   AudioEffect_Play_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0100]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0200
     * @tc.desc   AudioEffect_Play_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0200]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0300
     * @tc.desc   AudioEffect_Play_VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0300]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0400
     * @tc.desc   AudioEffect_Play_RING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0400]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0500
     * @tc.desc   AudioEffect_Play_MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0500]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0600
     * @tc.desc   AudioEffect_Play_SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0600]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0700
     * @tc.desc   AudioEffect_Play_ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0700]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_ALARM,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0800
     * @tc.desc   AudioEffect_Play_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0800]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0900
     * @tc.desc   AudioEffect_Play_ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0900]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 1
      audioRendererList = []
      await getPath()
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1000
     * @tc.desc   AudioEffect_Play_SameStreams_DiffAudioEffectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1000]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 2
      audioRendererList = []
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }, {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
        'pcm_48ksr_32kbr_2ch.wav'
      ]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT,
        audio.AudioEffectMode.EFFECT_NONE,
      ];
      await getPath()
      audioRendererList = []
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1100
     * @tc.desc   AudioEffect_Play_SameStreams_SameAudioEffectMode_EFFECT_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1100]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 2
      audioRendererList = []
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }, {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
        'pcm_48ksr_32kbr_2ch.wav'
      ]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_NONE,
        audio.AudioEffectMode.EFFECT_NONE,
      ];
      await getPath()
      audioRendererList = []
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1200
     * @tc.desc   AudioEffect_Play_SameStreams_SameAudioEffectMode_EFFECT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1200]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 2
      audioRendererList = []
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }, {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
        'pcm_48ksr_32kbr_2ch.wav'

      ]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT,
        audio.AudioEffectMode.EFFECT_DEFAULT,
      ];
      await getPath()
      audioRendererList = []
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1300
     * @tc.desc   AudioEffect_Play_DiffStreams_DiffAudioEffectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1300]'
      console.info(TAG + testCaseName + 'start')
      streamNum = 2
      audioRendererList = []
      audioRendererOptionsList = [{
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }, {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        },
        rendererInfo: {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }
      }]
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
        'pcm_48ksr_32kbr_2ch.wav'
      ]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT,
        audio.AudioEffectMode.EFFECT_NONE,
      ];
      await getPath()
      audioRendererList = []
      console.info(TAG + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.info(TAG + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0100
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0100 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
        console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS is: ${audioEffectMode}`);
        expect(audioEffectMode).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
        audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
          console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
          await audioRenderer!.getAudioEffectMode().then((audioEffectMode: audio.AudioEffectMode) => {
            console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS is: ${audioEffectMode}`);
            expect(audioEffectMode).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
            audioRenderer!.release();
          }).catch((err: Error) => {
            console.info(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }).catch((err: Error) => {
          console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
          expect(false).assertTrue();
          done();
        })
      }).catch((err: Error) => {
        console.info(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0200
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTMODE_STATIC_0200 come in')
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer | null;
      await audio.createAudioRenderer(audioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err: Error) => {
        console.error(`${TAG}  AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.info(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {
        console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS is: ${effectmode}`);
        expect(effectmode).assertEqual(audio.AudioEffectMode.EFFECT_DEFAULT);
        audioRenderer!.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err: BusinessError<void> | null) => {
          if (err) {
            audioRenderer!.release();
            console.info(TAG + "setAudioEffectMode EFFECT_NONE fail" + err?.message);
            expect(false).assertTrue();
            done();
          } else {
            console.info(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            audioRenderer!.getAudioEffectMode((err: BusinessError<void> | null, effectmode: audio.AudioEffectMode | undefined) => {              
              console.info(`getAudioEffectMode EFFECT_DEFAULT SUCCESS is: ${effectmode}`);
              expect(effectmode).assertEqual(audio.AudioEffectMode.EFFECT_NONE);
              audioRenderer!.release();
              done();
            });
          }
        });
        done();
      });
    })
  })
}
