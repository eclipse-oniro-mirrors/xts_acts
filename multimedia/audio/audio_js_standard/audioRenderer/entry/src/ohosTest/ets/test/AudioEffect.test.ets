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
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function AudioEffectTest() {
  describe('AudioEffectTest', function () {
    let TAG = "[EffectManagerInterfaceTest] ";
    let audioStreamManager = audio.getAudioManager().getStreamManager();
    let audioRenderer = null;
    let streamNum = 0;
    let audioRendererList = [];
    let audioRendererOptionsList = []
    let audioEffectModeList = [];
    let bufferSizeList = [];
    let pathDir = '';
    let testCaseName = '';
    let audioPaths = [
      'pcm_48ksr_32kbr_2ch.wav'
    ]
    let audioRendererOptions = {
      streamInfo: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
      rendererInfo: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
    }

    beforeAll(async function () {
      console.info(TAG + 'TestLog: Start Testing AudioEffectTest Interfaces');
    })

    beforeEach(async function () {
      console.info(TAG + 'AudioEffectTest: beforeEach: Prerequisites at the test case level');
      await sleep(1000);
    })

    afterEach(async function () {
      console.info(TAG + 'AudioEffectTest: afterEach: Test case-level clearance conditions');
    })

    afterAll(async function () {
      console.info(TAG + 'AudioEffectTest: afterAll: Test suite-level cleanup condition');
    })

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }



    async function getPath() {
      console.log(TAG + 'TestLog: Start Testing getPath ');
      let context = await featureAbility.getContext()
      await context.getFilesDir().then((data) => {
        pathDir = data + '/';
        console.log(TAG + testCaseName + `TestLog: Start Testing getPath ${pathDir} `);
      })
    }


    async function createAudioRenderer(assertFunction, done) {
      if (audioRendererList && audioRendererList.length) {
        audioRendererList.map(async (audioRenderer, index) => {
          console.log(`create audio renderer release index:  ${index} length : ${audioRendererList.length}`)
          if (audioRendererList[index]) {
            await audioRendererList[index].release();
            audioRendererList[index] = null;
          }
        })
      }
      for (let index = 0; index < streamNum; index++) {
        console.log(TAG + testCaseName + `create  ${JSON.stringify(audioRendererOptionsList[index])} `);
        audioRendererList[index] = await audio.createAudioRenderer(audioRendererOptionsList[index]).then((data) => {
          console.log(TAG + testCaseName + `create1  ${JSON.stringify(data)} `);
          return data
        }).catch((err) => {
          console.log(TAG + testCaseName + `create Error  ${JSON.stringify(err)} `);
        });
        console.log(TAG + testCaseName + `create  ${JSON.stringify(audioRendererList[index])} `);
        console.log(TAG + testCaseName + `TestLog: Start Testing createAudioRenderer create ${index} rendererObj`);
      }
    }

    function isCheckAudioRendererObj() {
      let status = true
      for (let index = 0; index < audioRendererList.length; index++) {
        console.log(`isCheckAudioRendererObj status : ${audioRendererList[index] === null}`)
        console.log('isCheckAudioRendererObj audioRendererList :' + index + audioRendererList[index] + `length : ${audioRendererList.length} `)
        if (audioRendererList[index] === null) {
          status = false
          return status
        }
      }
      return status
    }


    async function setAudioEffectMode(assertFunction, done) {
      if (isCheckAudioRendererObj()) {
        for (let index = 0; index < audioRendererList.length; index++) {
          await audioRendererList[index].setAudioEffectMode(audioEffectModeList[index]).then(() => {
            console.log(TAG + testCaseName + `setAudioEffectMode audioRendererList ${index} success `);
          }).catch((err) => {
            console.log(TAG + testCaseName + `setAudioEffectMode audioRendererList ${index} failed `);
            assertFunction();
            done()
          })
        }
      } else {
        assertFunction();
        done()
      }
    }

    function isCheckAllWriteSuccess(arr) {
      if (Array.isArray(arr) && arr.length > 0) {
        return arr.every(v => v === true)
      } else {
        return false
      }
    }

    async function start(assertFunction, done) {
      let stateGroup = [audio.AudioState.STATE_PREPARED, audio.AudioState.STATE_PAUSED, audio.AudioState.STATE_STOPPED]
      if (isCheckAudioRendererObj()) {
        for (let index = 0; index < audioRendererList.length; index++) {
          console.log('current audio renderer state : ' + audioRendererList[index].state)
          if (stateGroup.indexOf(audioRendererList[index].state) === -1) {
            console.log(TAG + testCaseName + `start state ${index} faile `);
            assertFunction();
            done()
          } else {
            await audioRendererList[index].start().then(() => {
              console.log(TAG + testCaseName + `start audioRendererList ${index} success `);
            }).catch((err) => {
              console.log(TAG + testCaseName + `start audioRendererList ${index} failed `);
              assertFunction();
              done()
            })
          }
        }
      } else {
        console.log('start is isCheckAudioRendererObj Fail')
        assertFunction();
        done()
      }
    }

    async function writeRender(assertFunction, done) {
      console.log(TAG + ' writeRender start');
      if (isCheckAudioRendererObj()) {
        await Promise.all(audioRendererList.map((item, index) => asyncWriteFunc(index))).then((resArray) => {
          console.log(TAG + testCaseName + `writeRender end  ${JSON.stringify(resArray)}`)
          if (isCheckAllWriteSuccess(resArray)) {
            console.log(TAG + testCaseName + `all write render  success ; status ${JSON.stringify(resArray)}`)
          } else {
            console.log(TAG + testCaseName + `all write render  fail ; status ${JSON.stringify(resArray)}`)
            assertFunction()
            done()
          }
        }).catch((errArray) => {
          console.log(TAG + testCaseName + `writeRender error ${JSON.stringify(errArray)}`)
          console.log(TAG + testCaseName + `all write render  fail ; status ${JSON.stringify(errArray)}`)
          assertFunction()
          done()
        })
      } else {
        assertFunction();
        done()
      }
    }

    function asyncWriteFunc(index) {
      return new Promise(async (resolve, reject) => {
        let bfsize = 0;
        let sr = audioRendererOptionsList[index].streamInfo.samplingRate;
        let chn = audioRendererOptionsList[index].streamInfo.channels;
        bufferSizeList[index] = await audioRendererList[index].getBufferSize()
        console.log(TAG + testCaseName + `getBufferSize audioRendererList ${index} ${bufferSizeList[index]} SUCCESS`);
        let path = pathDir + audioPaths[index]
        console.log(TAG + testCaseName + `audio  path ${path} `);
        try {
          console.log(TAG + testCaseName + 'fs start');
          let stat = await fs.stat(path);
          console.log(TAG + testCaseName + "fs stat SUCCESS");
          let len = stat.size % bufferSizeList[index] == 0 ? Math.floor(stat.size / bufferSizeList[index]) : Math.floor(stat.size / bufferSizeList[index] + 1);
          console.log(TAG + testCaseName + `len ${len}`);
          let file = await fs.open(path, 0o0);
          console.log(TAG + testCaseName + "open SUCCESS");
          let buf = new ArrayBuffer(bufferSizeList[index]);
          while (true) {
            for (let i = 0; i < len; i++) {
              let options = {
                offset: i * bufferSizeList[index],
                length: bufferSizeList[index]
              }
              let readsize = await fs.read(file.fd, buf, options);
              let time = Date.now();
              let writeSize = await new Promise((resolve, reject) => {
                audioRendererList[index].write(buf, (err, writeSize) => {
                  time = Date.now();
                  if (err) {
                    reject(err)
                  } else {
                    resolve(writeSize)
                  }
                })
              })
            }
            break
          }
          console.log(TAG + testCaseName + "writeRender success" + `audioRendererList ${index} write end, state:${audioRendererList[index].state}\n`);
          console.log(TAG + testCaseName + "writeRender " + ` file descriptor:  ${file.fd} `);
          await fs.close(file.fd).then(() => {
            console.log(TAG + testCaseName + "writeRender success" + `audioRendererList close success`);
            resolve(true)
          }).catch((err) => {
            console.log(TAG + testCaseName + "writeRender failed" + `audioRendererList close : Error: ${JSON.stringify(err)}\n`);
            resolve(false)
          })
        } catch (err) {
          console.log(TAG + testCaseName + "writeRender failed" + `audioRendererList write : Error: ${JSON.stringify(err)}\n`);
          reject(false)
        }
      })
    }

    async function writeStandRender(index, path, assertFunction, done) {
      let bfsize = 0;
      let sr = audioRendererOptionsList[index].streamInfo.samplingRate;
      let chn = audioRendererOptionsList[index].streamInfo.channels;
      bufferSizeList[index] = await audioRendererList[index].getBufferSize()
      console.log(TAG + testCaseName + `getBufferSize audioRendererList ${index} ${bufferSizeList[index]} SUCCESS`);
      console.log(TAG + testCaseName + `audio  path ${path} `);
      try {
        console.log(TAG + testCaseName + 'fs start');
        let stat = await fs.stat(path);
        console.log(TAG + testCaseName + "fs stat SUCCESS");
        let len = stat.size % bufferSizeList[index] == 0 ? Math.floor(stat.size / bufferSizeList[index]) : Math.floor(stat.size / bufferSizeList[index] + 1);
        console.log(TAG + testCaseName + `len ${len}`);
        let file = await fs.open(path, 0o0);
        console.log(TAG + testCaseName + "open SUCCESS");
        let buf = new ArrayBuffer(bufferSizeList[index]);
        while (true) {
          for (let i = 0; i < len; i++) {
            let options = {
              offset: i * bufferSizeList[index],
              length: bufferSizeList[index]
            }
            let readsize = await fs.read(file.fd, buf, options);
            let time = Date.now();
            let writeSize = await new Promise((resolve, reject) => {
              audioRendererList[index].write(buf, (err, writeSize) => {
                time = Date.now();
                if (err) {
                  reject(err)
                } else {
                  resolve(writeSize)
                }
              })
            })
          }
          break
        }
        console.log(TAG + testCaseName + "writeRender success" + `audioRendererList ${index} write end, state:${audioRendererList[index].state}\n`);
        console.log(TAG + testCaseName + "writeRender " + ` file descriptor:  ${file.fd} `);
        await fs.close(file.fd).then(() => {
          console.log(TAG + testCaseName + "writeRender success" + `audioRendererList close success`);
        }).catch((err) => {
          console.log(TAG + testCaseName + "writeRender failed" + `audioRendererList close : Error: ${JSON.stringify(err)}\n`);
        })
      } catch (err) {
        console.log(TAG + testCaseName + "writeRender failed" + `audioRendererList write : Error: ${JSON.stringify(err)}\n`);
        assertFunction()
        done()
      }
    }

    async function writeRenderChange(assertFunction, done) {
      console.log(TAG + ' writeRender start');
      if (isCheckAudioRendererObj()) {
        await Promise.all(audioRendererList.map((item, index) => asyncWriteChangeFunc(index))).then((resArray) => {
          console.log(TAG + testCaseName + `writeRender end  ${JSON.stringify(resArray)}`)
          if (isCheckAllWriteSuccess(resArray)) {
            console.log(TAG + testCaseName + `all write render  success ; status ${JSON.stringify(resArray)}`)
          } else {
            console.log(TAG + testCaseName + `all write render  fail ; status ${JSON.stringify(resArray)}`)
            assertFunction()
            done()
          }
        }).catch((errArray) => {
          console.log(TAG + testCaseName + `writeRender error ${JSON.stringify(errArray)}`)
          console.log(TAG + testCaseName + `all write render  fail ; status ${JSON.stringify(errArray)}`)
          assertFunction()
          done()
        })
      } else {
        assertFunction();
        done()
      }
    }

    function asyncWriteChangeFunc(index) {
      return new Promise(async (resolve, reject) => {
        let bfsize = 0;
        let sr = audioRendererOptionsList[index].streamInfo.samplingRate;
        let chn = audioRendererOptionsList[index].streamInfo.channels;
        bufferSizeList[index] = await audioRendererList[index].getBufferSize()
        console.log(TAG + testCaseName + `getBufferSize audioRendererList ${index} ${bufferSizeList[index]} SUCCESS`);
        let path = pathDir + audioPaths[index]
        console.log(TAG + testCaseName + `audio  path ${path} `);
        try {
          console.log(TAG + testCaseName + 'fs start');
          let stat = await fs.stat(path);
          console.log(TAG + testCaseName + "fs stat SUCCESS");
          let len = stat.size % bufferSizeList[index] == 0 ? Math.floor(stat.size / bufferSizeList[index]) : Math.floor(stat.size / bufferSizeList[index] + 1);
          console.log(TAG + testCaseName + `len ${len}`);
          let file = await fs.open(path, 0o0);
          console.log(TAG + testCaseName + "open SUCCESS");
          let buf = new ArrayBuffer(bufferSizeList[index]);
          while (true) {
            for (let i = 0; i < len; i++) {
              if (i === Math.floor(len / 2)) {
                if (index === 1) {
                  await audioRendererList[index].setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE)
                }
              }
              let options = {
                offset: i * bufferSizeList[index],
                length: bufferSizeList[index]
              }
              let readsize = await fs.read(file.fd, buf, options);
              let time = Date.now();
              let writeSize = await new Promise((resolve, reject) => {
                audioRendererList[index].write(buf, (err, writeSize) => {
                  time = Date.now();
                  if (err) {
                    reject(err)
                  } else {
                    resolve(writeSize)
                  }
                })
              })
            }
            break
          }
          console.log(TAG + testCaseName + "writeRender success" + `audioRendererList ${index} write end, state:${audioRendererList[index].state}\n`);
          console.log(TAG + testCaseName + "writeRender " + ` file descriptor:  ${file.fd} `);
          await fs.close(file.fd).then(() => {
            console.log(TAG + testCaseName + "writeRender success" + `audioRendererList close success`);
            resolve(true)
          }).catch((err) => {
            console.log(TAG + testCaseName + "writeRender failed" + `audioRendererList close : Error: ${JSON.stringify(err)}\n`);
            resolve(false)
          })
        } catch (err) {
          console.log(TAG + testCaseName + "writeRender failed" + `audioRendererList write : Error: ${JSON.stringify(err)}\n`);
          reject(false)
        }
      })

    }


    async function release(assertFunction, done) {
      if (isCheckAudioRendererObj()) {
        for (let index = 0; index < audioRendererList.length; index++) {
          await audioRendererList[index].release()
          audioRendererList[index] = null
        }
      } else {
        assertFunction();
        done()
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0100
     * @tc.desc   GET_AUDIOEFFECTINFOARRYSYNC - MEDIA - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let audioEffectInfoArray = audioStreamManager.getAudioEffectInfoArraySync(audio.StreamUsage.STREAM_USAGE_MEDIA)
        expect(audioEffectInfoArray[0]).assertEqual(0);
        expect(audioEffectInfoArray[1]).assertEqual(1);
        console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
        done();
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0200
     * @tc.desc   GET_AUDIOEFFECTINFOARRYSYNC - Null_Parameter - 401 - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        // @ts-ignore
        let audioEffectInfoArray = audioStreamManager.getAudioEffectInfoArraySync()
        console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0300
     * @tc.desc   GET_AUDIOEFFECTINFOARRYSYNC - Invalid_Number_Parameter - 6800101 - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0300', 2, async function (done) {
      try {
        // @ts-ignore
        let audioEffectInfoArray = audioStreamManager.getAudioEffectInfoArraySync(123);
        console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},code:${err.code}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0400
     * @tc.desc   GET_AUDIOEFFECTINFOARRYSYNC - String_Parameter - 401 - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRYSYNC_0400', 2, async function (done) {
      try {
        // @ts-ignore
        let audioEffectInfoArray = audioStreamManager.getAudioEffectInfoArraySync('123');
        console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0100
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_UNKNOWN).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0200
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_MEDIA).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0300
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0300', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0400
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - RING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0400', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0500
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0500', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_MOVIE).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0600
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0600', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_MUSIC, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0700
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0700', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_ALARM, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0800
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0800', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0900
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_0900', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1000
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1000', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1100
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1100', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_RINGTONE, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1200
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1200', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1300
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1300', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_GAME, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            expect(audioEffectInfoArray[0]).assertEqual(0);
            expect(audioEffectInfoArray[1]).assertEqual(1);
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1400
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - AUDIOBOOK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1400', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1500
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1500', 2, async function (done) {
      try {
        audioStreamManager.getAudioEffectInfoArray(audio.StreamUsage.STREAM_USAGE_NAVIGATION).then((audioEffectInfoArray) => {
          expect(audioEffectInfoArray[0]).assertEqual(0);
          expect(audioEffectInfoArray[1]).assertEqual(1);
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          done();
        }).catch((err) => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1700
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - Null_Parameter - 401 - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1700', 2, async function (done) {
      try {
        // @ts-ignore
        audioStreamManager.getAudioEffectInfoArray().then((audioEffectInfoArray) => {
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},Code:${err.code}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1800
     * @tc.desc   GET_AUDIOEFFECTINFOARRY -Invaild_Number_Parameter - 6800101 - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1800', 2, async function (done) {
      try {
        // @ts-ignore
        audioStreamManager.getAudioEffectInfoArray(123).then((audioEffectInfoArray) => {
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},Code:${err.code}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :error: ${err},Code:${err.code}`);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1900
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - String_Parameter - 401 - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_1900', 2, async function (done) {
      try {
        // @ts-ignore
        audioStreamManager.getAudioEffectInfoArray('123').then((audioEffectInfoArray) => {
          console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},Code:${err.code}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2000
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - Null_Parameter - 401 - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2000', 2, async function (done) {
      try {
        // @ts-ignore
        audioStreamManager.getAudioEffectInfoArray(async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }


    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2100
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - Invaild_Number_Parameter - 6800101 - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2100', 2, async function (done) {
      try {
        // @ts-ignore
        audioStreamManager.getAudioEffectInfoArray(123, async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err},Code: ${err.code}`);
            expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
            done();
          } else {
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :error: ${err},Code:${err.code}`);
        expect(false).assertTrue();
        done();
      }


    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2200
     * @tc.desc   GET_AUDIOEFFECTINFOARRY - String_Parameter - 401 - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIOEFFECTINFOARRY_2200', 2, async function (done) {
      try {
        // @ts-ignore
        audioStreamManager.getAudioEffectInfoArray('123', async (err, audioEffectInfoArray) => {
          if (err) {
            console.error(`${TAG} getAudioEffectInfoArray :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TAG} getAudioEffectInfoArray success:${JSON.stringify(audioEffectInfoArray)}`);
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} getAudioEffectInfoArray :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }


    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0100
     * @tc.desc   setAudioEffectMode - Null_Parameter - 401 - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        // @ts-ignore
        await audioRenderer.setAudioEffectMode().then(() => {
          console.log(`${TAG} setAudioEffectMode success`);
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} setAudioEffectMode :ERROR: ${err},Code:${err.code}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} setAudioEffectMode :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        await audioRenderer.release();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0200
     * @tc.desc   setAudioEffectMode -Invaild_Number_Parameter - 6800101 - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0200', 2, async function (done) {
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        // @ts-ignore
        await audioRenderer.setAudioEffectMode(123).then(() => {
          console.log(`${TAG} setAudioEffectMode success`);
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} setAudioEffectMode :ERROR: ${err},Code:${err.code}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
          audioRenderer.release();
          done();
        });
      } catch (err) {
        console.error(`${TAG} setAudioEffectMode :error: ${err},Code:${err.code}`);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0300
     * @tc.desc   setAudioEffectMode - String_Parameter - 401 - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0300', 2, async function (done) {
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        // @ts-ignore
        await audioRenderer.setAudioEffectMode('123').then(() => {
          console.log(`${TAG} setAudioEffectMode success`);
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(`${TAG} setAudioEffectMode :ERROR: ${err},Code:${err.code}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${TAG} setAudioEffectMode :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        await audioRenderer.release();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0400
     * @tc.desc   setAudioEffectMode - Null_Parameter - 401 - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0400', 2, async function (done) {
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        // @ts-ignore
        await audioRenderer.setAudioEffectMode(async (err) => {
          if (err) {
            console.error(`${TAG} setAudioEffectMode :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TAG} setAudioEffectMode success`);
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} setAudioEffectMode :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        await audioRenderer.release();
        done();
      }


    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0500
     * @tc.desc   setAudioEffectMode - Invaild_Number_Parameter - 6800101 - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0500', 2, async function (done) {
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        // @ts-ignore
        await audioRenderer.setAudioEffectMode(123, async (err) => {
          if (err) {
            console.error(`${TAG} setAudioEffectMode :ERROR: ${err},Code: ${err.code}`);
            expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
            await audioRenderer.release();
            done();
          } else {
            console.log(`${TAG} setAudioEffectMode success`);
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} setAudioEffectMode :error: ${err},Code:${err.code}`);
        expect(false).assertTrue();
        done();
      }


    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0600
     * @tc.desc   setAudioEffectMode - String_Parameter - 401 - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_AUDIOEFFECTIMODE_0600', 2, async function (done) {
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        // @ts-ignore
        await audioRenderer.setAudioEffectMode('123', async (err) => {
          if (err) {
            console.error(`${TAG} setAudioEffectMode :ERROR: ${err}`);
            expect(false).assertTrue();
            done();
          } else {
            console.log(`${TAG} setAudioEffectMode success`);
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(`${TAG} setAudioEffectMode :error: ${err},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        await audioRenderer.release();
        done();
      }


    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0100
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0100 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0200
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0200', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0200 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0300
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0300', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0300 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0400
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0400', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0400 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })


    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0500
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0500', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0500 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0600
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0600', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0600 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0700
     * @tc.desc   GET_SET_AudioEffectMode-UNKNOWN & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0700', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0700 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0800
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0800', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0800 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0900
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0900', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_0900 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1000
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1000', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1000 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1100
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1100', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1100 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1200
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1200', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1200 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1300
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1300', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1300 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1400
     * @tc.desc   GET_SET_AudioEffectMode-SPEECH & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1400', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1400 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1500
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1500', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1500 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1600
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1600', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1600 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1700
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1700', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1700 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1800
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1800', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1800 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1900
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1900', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_1900 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2000
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2000', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2000 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2100
     * @tc.desc   GET_SET_AudioEffectMode-MUSIC & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2100', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2100 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2200
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2200', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2200 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2300
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2300', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2300 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2400
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2400', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2400 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2500
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2500', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2500 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2600
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2600', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2600 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2700
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2700', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2700 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2800
     * @tc.desc   GET_SET_AudioEffectMode-MOVIE & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2800', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2800 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2900
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2900', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_2900 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3000
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3000', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3000 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3100
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3100', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3100 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3200
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3200', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3200 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3300
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3300', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3300 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });


    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3400
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3400', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3400 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });


    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3500
     * @tc.desc   GET_SET_AudioEffectMode-SONIFICATION & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3500', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3500 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });


    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3600
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3600', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3600 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3700
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3700', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3700 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3800
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3800
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3800', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3800 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3900
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3900
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3900', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_3900 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
        if (audioEffectMode == 1) {
          expect(true).assertTrue();
          console.log(TAG + "getAudioEffectMode EFFECT_DEFAULT SUCCESS");
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE).then(async () => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
            await audioRenderer.getAudioEffectMode().then((audioEffectMode) => {
              if (audioEffectMode == 0) {
                expect(true).assertTrue();
                console.log(TAG + "getAudioEffectMode EFFECT_NONE SUCCESS");
                audioRenderer.release();
                done();
              }

            }).catch((err) => {
              console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();
            })
          }).catch((err) => {
            console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
            expect(false).assertTrue();
            done();
          })
        }


      }).catch((err) => {
        console.log(TAG + "getAudioEffectMode failed" + err.message);
        expect(false).assertTrue();
        done();
      })

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4000
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4000
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4000', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4000 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4100
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4100', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4100 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4200
     * @tc.desc   GET_SET_AudioEffectMode-RINGTONE & ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4200', 2, async function (done) {
      console.info(TAG + 'SUB_MULTIMEDIA_AUDIO_GET_SET_AUDIOEFFECTMODE_4200 come in')
      let audioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let audioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let audioRenderer;
      await audio.createAudioRenderer(audioRendererOptions).then((data) => {
        audioRenderer = data;
        console.info(TAG + ' AudioRenderer Created : Success : Stream Type: SUCCESS');
      }).catch((err) => {
        console.error(TAG + ` AudioRenderer Created : ERROR : ${err}`);
      });
      await audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_DEFAULT);
      console.log(TAG + "setAudioEffectMode EFFECT_DEFAULT SUCCESS");
      await audioRenderer.getAudioEffectMode((err, effectmode) => {
        if (effectmode == 1) {
          console.info(`${TAG} getAudioEffectMode EFFECT_DEFAULT SUCCESS: ${effectmode}`);
          audioRenderer.setAudioEffectMode(audio.AudioEffectMode.EFFECT_NONE, (err) => {
            if (err) {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE fail" + err.message);
              expect(false).assertTrue();
              done();

            } else {
              console.log(TAG + "setAudioEffectMode EFFECT_NONE SUCCESS");
              audioRenderer.getAudioEffectMode((err, effectmode) => {
                if (effectmode == 0) {
                  expect(true).assertTrue();
                  console.info(`${TAG} getAudioEffectMode EFFECT_NONE SUCCESS: ${effectmode}`);
                  audioRenderer.release();
                  done();
                } else {
                  console.log(TAG + "getAudioEffectMode EFFECT_NONE fail" + err.message);
                  expect(false).assertTrue();
                  done();
                }
              });
            }


          });
        } else {
          console.log(TAG + "getAudioEffectMode failed" + err.message);
          done();
        }
      });

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0100
     * @tc.desc   AudioEffect_Play_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      testCaseName = '[SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0100]'
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
          content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0200
     * @tc.desc   AudioEffect_Play_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0200', 2, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0300
     * @tc.desc   AudioEffect_Play_VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0300', Level.LEVEL0, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_SPEECH,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Sleep 1s,wait to switch to normal stream');
      await sleep(1000)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0400
     * @tc.desc   AudioEffect_Play_RING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0400', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0500
     * @tc.desc   AudioEffect_Play_MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0500', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MOVIE,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0600
     * @tc.desc   AudioEffect_Play_SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0600', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_SPEECH,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          rendererFlags: 0
        }
      }]
      audioEffectModeList = [
        audio.AudioEffectMode.EFFECT_DEFAULT
      ];
      audioPaths = [
        'StarWars10s-2C-48000-4SW.wav',
      ]
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0700
     * @tc.desc   AudioEffect_Play_ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0700', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0800
     * @tc.desc   AudioEffect_Play_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0800', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_SPEECH,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0900
     * @tc.desc   AudioEffect_Play_ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_0900', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_SPEECH,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1000
     * @tc.desc   AudioEffect_Play_SameStreams_DiffAudioEffectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1000', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1100
     * @tc.desc   AudioEffect_Play_SameStreams_SameAudioEffectMode_EFFECT_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1100', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1200
     * @tc.desc   AudioEffect_Play_SameStreams_SameAudioEffectMode_EFFECT_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1200', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1300
     * @tc.desc   AudioEffect_Play_DiffStreams_DiffAudioEffectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOEFFECT_PLAY_1300', 1, async function (done) {
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
          content: audio.ContentType.CONTENT_TYPE_MUSIC,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
          content: audio.ContentType.CONTENT_TYPE_MOVIE,
          usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
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
      console.log(TAG + testCaseName + 'TestLog: Start Testing createAudioRenderer function');
      await createAudioRenderer(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing setAudioEffectMode function');
      await setAudioEffectMode(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing start function');
      await start(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing writeRender function');
      await writeRender(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing release function');
      await release(expect().assertFail, done)
      console.log(TAG + testCaseName + 'TestLog: Start Testing end');
      done()
    })
  })
}