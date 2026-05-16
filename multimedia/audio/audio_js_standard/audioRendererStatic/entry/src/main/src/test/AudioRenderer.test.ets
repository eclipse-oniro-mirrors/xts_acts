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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import fileIo from '@ohos.file.fs';
import { Hypium } from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000;
let tag: string = 'TestAudioRendererTest';

export default function audioRendererTest() {
  describe('audioRendererTest', () => {
    let fdRead: int;
    let readPath: string;
    const AUDIOMANAGER = audio.getAudioManager();
    let TagFrmwkRender = "AudioFrameworkRenderLog";
    let TagFrmwk = "AudioFrameworkTest";
    let TagFrmwkAudioScene = "AudioFrameworkAudioScene";
    let fdPath: string;
    let filePath: string;
    let stringParameter = "invalid_parameter";
    let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
    let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
    console.info(`${TagFrmwkRender}: Create AudioManger Object JS Framework`);

    beforeAll(() => {
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })

    beforeEach(() => {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
    })

    afterEach(() => {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(1000);
    })

    afterAll(() => {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })

    let getFdRead = async (pathName: string, done: ()=>void) => {
      let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      console.info(`context: ${JSON.stringify(context)}`);

      let data = context.filesDir;
      console.info(`case1 getFilesDir is path : ${data}`);
      filePath = data + '/' + pathName;
      console.info(`case4 filePath is : ${filePath}`);

      fdPath = 'fd://';
      await fileIo.open(filePath).then((fdNumber: fileIo.File) => {
        fdPath = fdPath + '' + fdNumber.fd;
        fdRead = fdNumber.fd;
        console.info(`[fileIO] case open fd success,fdPath is : ${fdPath}`);
        console.info(`[fileIO] case open fd success,fdRead is : ${fdRead}`);
      }, (err: Error) => {
        console.info(`[fileIO] case open fd failed : ${err}`);
      }).catch((error: Error) => {
        console.info(`[fileIO] case catch open fd error : ${error}`);
      });
    }

    let play = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, done: ()=>void)=> {
      console.info(`${TagFrmwkRender}: Promise : Audio Play Function`);
      let audioRen: audio.AudioRenderer | null;
      let speed: number = 0;
      await audio.createAudioRenderer(AudioRendererOptions).then((data: audio.AudioRenderer | null)=> {
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      await audioRen!.start().then(async () => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        speed = audioRen!.getSpeed();
        console.info(`${TagFrmwkRender}: Renderer getSpeed:${speed}`);
        expect(speed).assertEqual(1);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:ss: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:totalSize: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      // let rlen = 0;

      audioRen!.setSpeed(0.25);
      speed = audioRen!.getSpeed();
      console.info(`${TagFrmwkRender}: Renderer getSpeed:${speed}`);
      expect(speed).assertEqual(0.25);

      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err:Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      await Utils.msSleep(100);
      audioRen!.setSpeed(4);
      speed = audioRen!.getSpeed();
      console.info(`${TagFrmwkRender}: Renderer getSpeed:${speed}`);
      expect(speed).assertEqual(4);
      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      done();
    }

    let playWithVideoStream = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, done: ()=>void)=> {
      console.info(`${TagFrmwkRender}: Play with Video Stream Function`);
      let audioRen: audio.AudioRenderer | null;
      await audio.createAudioRenderer(AudioRendererOptions).then((data: audio.AudioRenderer | null) => {
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      await audioRen!.getRendererInfo().then((data: audio.AudioRendererInfo)=> {
        if (data.usage == audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION) {
          console.info(`${TagFrmwkRender}: AudioRender's streamUsage is equal to STREAM_USAGE_VIDEO_COMMUNICATION: ${audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwkRender}: AudioRender's streamUsage: ${data.usage} is not equal to STREAM_USAGE_VIDEO_COMMUNICATION: ${audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION}`);
          expect(false).assertTrue();
          done();
        }
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:ss: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}: totalSize: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}: BufferAudioFramework: bytes read from file: ${rlen}`);
          await audioRen!.getCurrentOutputDevices().then((outputDeviceDescription: audio.AudioDeviceDescriptors) => {
            console.info(`${TagFrmwkRender}: outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
            if (outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
              console.info(`${TagFrmwkRender}: outputDeviceDescription[0].deviceType is SPEAKER`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwkRender}: outputDeviceDescription[0].deviceType is not SPEAKER`);
              expect(false).assertTrue();
              done();
            }
          }).catch((err: Error) => {
            console.info(`${TagFrmwkRender}: getDevices : ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);

      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(async () => {
        console.info(`${TagFrmwkRender}: renderInstant started : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start : ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      audioRen!.offWriteData(writeDataCallback);
      await Utils.msSleep(2000);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      done();
    }

    let playbackPromise_92 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, done: ()=>void)=> {
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          expect(true).assertTrue();
          done();
        }
        expect(false).assertTrue();
        done();
      }
      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.getStreamInfo().then( (audioParamsGet: audio.AudioStreamInfo)=> {
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION) {
          console.info(`${TagFrmwkRender}: AudioRender's streamUsage is equal to STREAM_USAGE_VIDEO_COMMUNICATION: ${audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION}`);
        } else {
          console.info(`${TagFrmwkRender}: AudioRender's streamUsage: ${audioParamsGet.usage} is not equal to STREAM_USAGE_VIDEO_COMMUNICATION: ${audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION}`);
          expect(false).assertTrue();
          done();
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case2: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case3: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        if (rlen > (totalSize / 2)) {
          await AUDIOMANAGER.getAudioScene().then((data: audio.AudioScene) => {
            console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : Value : ${data}`);
          }).catch((err: Error) => {
            console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : ERROR : ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }
      }
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      done();
    }

    let playbackPromise_AudioSceneSync = async(AudioRendererOptions: audio.AudioRendererOptions, pathName: string, AudioScene: audio.AudioScene):Promise<boolean>=> {
      let resultFlag = false;
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        return resultFlag;
      }
      console.log(`isPass:${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      try {
        let audioParamsGet = audioRen!.getStreamInfoSync();
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      }

      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      try {
        let audioParamsGet = audioRen!.getRendererInfoSync();
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      }

      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      try {
        let renderRate = audioRen!.getSpeed();
        if (renderRate == audio.AudioRendererRate.RENDER_RATE_NORMAL) {
          console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : PASS : ${renderRate}`);
        }
        else {
          console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : FAIL : ${renderRate}`);
          resultFlag = false;
        }
      } catch (err) {
        console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
        resultFlag = false;
      }

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case2: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case3: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        if (rlen > (totalSize / 2)) {
          try {
            let value = AUDIOMANAGER.getAudioSceneSync();
            console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : Value : ${value}`);
          } catch (error) {
            console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : ERROR : ${error.message}`);
            resultFlag = false;
          }
        }
      }
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        resultFlag = true;
        console.info(`${TagFrmwkRender}: resultFlagRen : ${resultFlag}`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

      return resultFlag;
    }

    let playbackPromise_GetAudioTimeSync = async(AudioRendererOptions: audio.AudioRendererOptions, pathName: string, AudioScene: audio.AudioScene):Promise<boolean>=> {
      let resultFlag = true;
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let audioTimeStart: long;
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize = audioRen!.getBufferSizeSync();
      console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let gettime = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);

        try {
          let data = audioRen!.getAudioTimeSync();
          audioTimeStart = data / 1000000000;
          console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
          resultFlag = false;
        }

      }
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      if (audioTimeStart != 0) {
        console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
      }
      else {
        console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
        resultFlag = false;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      return resultFlag;
    }

    let playbackPromise = async(AudioRendererOptions: audio.AudioRendererOptions, pathName: string, AudioScene: audio.AudioScene):Promise<boolean>=> {
      let resultFlag = false;
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        return resultFlag;
      }
      console.log(`isPass:${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.getStreamInfo().then( (audioParamsGet: audio.AudioStreamInfo)=> {
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case2: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case3: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        if (rlen > (totalSize / 2)) {
          await AUDIOMANAGER.getAudioScene().then((data: audio.AudioScene) => {
            console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : Value : ${data}`);
          }).catch((err: Error) => {
            console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : ERROR : ${err.message}`);
            resultFlag = false;
          });
        }
      }
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        resultFlag = true;
        console.info(`${TagFrmwkRender}: resultFlagRen : ${resultFlag}`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

      return resultFlag;
    }

    let playbackPromise_93 =async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, AudioScene: audio.AudioScene):Promise<boolean> => {
      let resultFlag = true;
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions)
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let audioTimeStart: long;

      await audioRen!.getAudioTime().then((data: long) => {
        audioTimeStart = data / 1000000000;
        console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize = await audioRen!.getBufferSize();
      console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
      }
      console.info(`${TagFrmwkRender}: Renderer after read`);

      if (audioTimeStart != 0) {
        console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
      }
      else {
        console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
        resultFlag = false;
      }

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err:Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      return resultFlag;
    }

    let playbackPromise_94 = async(AudioRendererOptions: audio.AudioRendererOptions, pathName: string, AudioScene: audio.AudioScene):Promise<boolean>=> {
      let resultFlag = true;
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let audioTimeStart: long;
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize = await audioRen!.getBufferSize();
      console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let gettime = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        await audioRen!.getAudioTime().then((data: long) => {
          audioTimeStart = data / 1000000000;
          console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
        }).catch((err: Error) => {
          console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
          resultFlag = false;
        });
      }
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      if (audioTimeStart != 0) {
        console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
      }
      else {
        console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
        resultFlag = false;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      return resultFlag;
    }

    let playbackPromise_95 = async(AudioRendererOptions: audio.AudioRendererOptions, pathName: string, AudioScene: audio.AudioScene):Promise<boolean> => {
      let resultFlag = true;
      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
        console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let audioTimeStart: long = -1;

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize = await audioRen!.getBufferSize();
      console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;

      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);

      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      await audioRen!.getAudioTime().then((data: long) => {
        audioTimeStart = data / 1000000000;
        console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
      }).catch((err: Error) => {
        resultFlag = true;
        console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
      });

      if (audioTimeStart == -1) {
        console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
      }
      else {
        console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
        resultFlag = false;
      }

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

    let playbackPromise_102 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {
      let resultFlag = false;
      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      audioRen!.onMarkReach(55, (position: long) => {
        console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
        resultFlag = true;
      })

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      console.info(`${TagFrmwkRender}:case 2-1:AudioFrameworkRenderLog: File Path: `);
      ss.readSync(discardHeader);
      console.info(`${TagFrmwkRender}:case 2-2:AudioFrameworkRenderLog: File Path: `);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;

      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);

      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

    let playbackPromise_103 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {
      let resultFlag = false;
      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      let rlen = 0;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      audioRen!.onMarkReach(55, (position: long) => {
        console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
        audioRen!.offMarkReach();
        expect(true).assertTrue();
      });
      let markReachCallback = (position: long) => {
        if (position == 100) {
          console.info('markReachCallback successfully');
        }
      };
      audioRen!.onMarkReach(100, (position: long) => {
        console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
        resultFlag = true;
        audioRen!.offMarkReach(markReachCallback);
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

    let playbackPromise_104 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {
      let resultFlag = false;
      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      audioRen!.onMarkReach(55, (position: long) => {
        console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
        resultFlag = true;
        audioRen!.onMarkReach(73, (position: long) => {
          console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
          resultFlag = true;
        });
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }


    let playbackPromise_105 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {
      let resultFlag = false;
      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      audioRen!.onPeriodReach(55, (position: long) => {
        console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
        resultFlag = true;
        audioRen!.offPeriodReach();
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);

      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

    let playbackPromise_106 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {
      let resultFlag = false;
      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      audioRen!.onPeriodReach(55, (position: long) => {
        console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
        resultFlag = true;
        expect(true).assertTrue();
        audioRen!.offPeriodReach();

      });
      let periodReachCallback = (position: long) => {
        if (position == 100) {
          console.info('periodReachCallback successfully');
        }
      };
      audioRen!.onPeriodReach(100, (position: long) => {
        console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
        resultFlag = true;
        expect(true).assertTrue();
        audioRen!.offPeriodReach(periodReachCallback);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

    let playbackPromise_107 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {
      let resultFlag = false;
      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        let LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
          return true;
        }
        resultFlag = false;
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        return resultFlag;
      }
      audioRen!.onPeriodReach(55, (position: long) => {
        console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
        resultFlag = true;
        try {
          audioRen!.onPeriodReach(73, (position: long) => {
            console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
            resultFlag = false;
          });
        } catch (err) {
          console.log(`${TagFrmwk}: periodReach Event is : ERROR : ${err.message}`);
          resultFlag = true;
        }
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 4) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      audioRen!.onWriteData(writeDataCallback);
      console.info(`${TagFrmwkRender}: Renderer after read`);

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.drain().then(() => {
        console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
      }).catch((err: Error) => {
        console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

    let playbackCB = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string):Promise<boolean> => {

      let resultFlag = true;

      console.info(`${TagFrmwkRender}: CALLBACK : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;

      audio.createAudioRenderer(AudioRendererOptions, (err, data) => {
        if (err) {
          console.error(`${TagFrmwkRender}: AudioRender Created : Error: ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: AudioRender Created : Success : SUCCESS`);
          audioRen = data!;
        }
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await Utils.msSleep(100);

      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: CALLBACK : Audio Playback Function`);

      audioRen!.start((err) => {
        if (err) {
          console.error(`${TagFrmwkRender}: Renderer start failed: Error: ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer started`);
        }
      });
      await Utils.msSleep(100);
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let samplingRate: audio.AudioSamplingRate;
      audioRen!.getStreamInfo((err, audioParamsGet) => {
        await Utils.msSleep(100);
        if (err) {
          console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
          samplingRate = audioParamsGet!.samplingRate;
        }
      });
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      audioRen!.getRendererInfo((err, audioParamsGet) => {
        await Utils.msSleep(100);
        if (err) {
          console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }
      });
      await Utils.msSleep(100);
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      let bufferSize: long;
      audioRen!.getBufferSize((err, data) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
          bufferSize = data!;
        }
      });
      await Utils.msSleep(100);
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagFrmwkRender}:case 4: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      let aa = fileIo.statSync(fdRead);
      console.log(`case 6 : ${aa}`);
      console.info(`${TagFrmwkRender}: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      let rlen = 0;
      console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
      await Utils.msSleep(100);
      let waitTime: int;
      switch (samplingRate as int) {
        case 44100:
          waitTime = 45;
          break;
        case 8000:
          waitTime = 60;
          break;
        case 32000:
          waitTime = 45;
          break;
        case 64000:
          waitTime = 45;
          break;
        case 96000:
          waitTime = 45;
          break;
        case 11025:
          waitTime = 45;
          break;
        case 12000:
          waitTime = 45;
          break;
        case 16000:
          waitTime = 45;
          break;
        case 22050:
          waitTime = 45;
          break;
        case 24000:
          waitTime = 45;
          break;
        case 48000:
          waitTime = 45;
          break;
        default:
          waitTime = 45;
          break
      }

      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: waitTime : ${waitTime}`);
      let buf = new ArrayBuffer(bufferSize);
      let writeDataCallback: audio.AudioRendererWriteDataCallback = (buf: ArrayBuffer) => {
        while (rlen < totalSize / 10) {
          rlen += ss.readSync(buf);
          console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
          await Utils.msSleep(waitTime);
        }
        return audio.AudioDataCallbackResult.VALID;
      };
      try {
        audioRen!.onWriteData(writeDataCallback);
        console.info(`${TagFrmwkRender}:BufferAudioFramework: Buff write successful`);
        resultFlag = true;
      } catch (err) {
        console.error(`${TagFrmwkRender}: Buff write: Error: ${err.message}`);
        resultFlag = false;
      }
      await Utils.msSleep(100);
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }
      ss.closeSync();
      audioRen!.drain((err, state) => {
        if (err) {
          console.error(`${TagFrmwkRender}: Renderer drain failed: Error: ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer drained`);
        }
      });
      await Utils.msSleep(100);
      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }
      audioRen!.stop((err, state) => {
        if (err) {
          console.error(`${TagFrmwkRender}: Renderer stop failed: Error: ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer stopped`);
          resultFlag = true;
          console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        }
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      if (resultFlag) {
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }
      audioRen!.release((err, state) => {
        if (err) {
          console.error(`${TagFrmwkRender}: Renderer release failed: Error: ${err.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer released`);
        }
      });
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      return resultFlag;
    }

     let playbackWriteDataCallback_001 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, done: ()=>void) => {
      console.info(`${TagFrmwkRender}: Callback : Audio Play Function`);
      let audioRen: audio.AudioRenderer | null;
      let speed: number = 0;
      await audio.createAudioRenderer(AudioRendererOptions).then((data: audio.AudioRenderer | null)=> {
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      audioRen!.onWriteData((buffer: ArrayBuffer): audio.AudioDataCallbackResult => {
        console.info(`${TagFrmwkRender}: writeDataCallback : ${buffer.byteLength}`);
        return audio.AudioDataCallbackResult.VALID;
      });

      await audioRen!.start().then(async () => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        speed = audioRen!.getSpeed();
        console.info(`${TagFrmwkRender}: Renderer getSpeed:${speed}`);
        expect(speed).assertEqual(1);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      await Utils.msSleep(1000);

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      done();
    }

    let playbackWriteDataCallback_002 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, done: ()=>void) => {
      console.info(`${TagFrmwkRender}: Callback : Audio Play Function`);
      let audioRen: audio.AudioRenderer | null;
      let speed: number = 0;
      await audio.createAudioRenderer(AudioRendererOptions).then((data: audio.AudioRenderer | null)=> {
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      audioRen!.onWriteData((buffer: ArrayBuffer): audio.AudioDataCallbackResult => {
        console.info(`${TagFrmwkRender}: writeDataCallback : ${buffer.byteLength}`);
        return audio.AudioDataCallbackResult.VALID;
      });

      await audioRen!.start().then(async () => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        speed = audioRen!.getSpeed();
        console.info(`${TagFrmwkRender}: Renderer getSpeed:${speed}`);
        expect(speed).assertEqual(1);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      await Utils.msSleep(1000);

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      done();
    }

    let playbackWriteDataCallback_003 = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string, done: ()=>void) => {
      console.info(`${TagFrmwkRender}: Callback : Audio Play Function`);
      let audioRen: audio.AudioRenderer | null;
      let speed: number = 0;
      await audio.createAudioRenderer(AudioRendererOptions).then( (data: audio.AudioRenderer | null)=> {
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data!)}`);
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      let bufferSize: long;
      await audioRen!.getBufferSize().then((data: long) => {
        console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      audioRen!.onWriteData((buffer: ArrayBuffer): audio.AudioDataCallbackResult => {
        console.info(`${TagFrmwkRender}: writeDataCallback : ${buffer.byteLength}`);
        return audio.AudioDataCallbackResult.INVALID;
      });

      await audioRen!.start().then(async () => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        speed = audioRen!.getSpeed();
        console.info(`${TagFrmwkRender}: Renderer getSpeed:${speed}`);
        expect(speed).assertEqual(1);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      await Utils.msSleep(1000);

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      audioRen!.offWriteData();

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
        done();
      });
      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);
      done();
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OUTPUTDEVICECHANGEWITHINFO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OUTPUTDEVICECHANGEWITHINFO_STATIC_0100
     * @tc.desc   on_outputDeviceChangeWithInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_OUTPUTDEVICECHANGEWITHINFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
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
      let audioRender = await audio.createAudioRenderer(audioRendererOptions);
      audioRender!.onOutputDeviceChangeWithInfo((deviceChangeInfo: audio.AudioStreamDeviceChangeInfo) => {
        console.info(`${TagFrmwkRender}: devices: ${JSON.stringify(deviceChangeInfo.devices)}`);
        console.info(`${TagFrmwkRender}: changeReason: ${JSON.stringify(deviceChangeInfo.changeReason)}`);
      });
      await audioRender!.release();
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSTREAMDEVICECHANGEREASON_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSTREAMDEVICECHANGEREASON_STATIC_0100
     * @tc.desc   AudioStreamDeviceChangeReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOSTREAMDEVICECHANGEREASON_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`${TagFrmwkRender}: AudioStreamDeviceChangeReason: ${JSON.stringify(audio.AudioStreamDeviceChangeReason.REASON_UNKNOWN)}`);
      expect(audio.AudioStreamDeviceChangeReason.REASON_UNKNOWN == 0).assertTrue();
      console.info(`${TagFrmwkRender}: AudioStreamDeviceChangeReason: ${JSON.stringify(audio.AudioStreamDeviceChangeReason.REASON_NEW_DEVICE_AVAILABLE)}`);
      expect(audio.AudioStreamDeviceChangeReason.REASON_NEW_DEVICE_AVAILABLE == 1).assertTrue();
      console.info(`${TagFrmwkRender}: AudioStreamDeviceChangeReason: ${JSON.stringify(audio.AudioStreamDeviceChangeReason.REASON_OLD_DEVICE_UNAVAILABLE)}`);
      expect(audio.AudioStreamDeviceChangeReason.REASON_OLD_DEVICE_UNAVAILABLE == 2).assertTrue();
      console.info(`${TagFrmwkRender}: AudioStreamDeviceChangeReason: ${JSON.stringify(audio.AudioStreamDeviceChangeReason.REASON_OVERRODE)}`);
      expect(audio.AudioStreamDeviceChangeReason.REASON_OVERRODE == 3).assertTrue();
      console.info(`AudioStreamDeviceChangeReason: ${JSON.stringify(audio.AudioStreamDeviceChangeReason.REASON_SESSION_ACTIVATED)}`);
      expect(audio.AudioStreamDeviceChangeReason.REASON_SESSION_ACTIVATED).assertEqual(4);
      console.info(`AudioStreamDeviceChangeReason: ${JSON.stringify(audio.AudioStreamDeviceChangeReason.REASON_STREAM_PRIORITY_CHANGED)}`);
      expect(audio.AudioStreamDeviceChangeReason.REASON_STREAM_PRIORITY_CHANGED).assertEqual(5);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0100
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_48000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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
      let readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0200
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_8000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
      let readPath = 'StarWars10s-1C-8000-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0300
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_16000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
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
      let readPath = 'StarWars10s-1C-16000-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0400
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_24000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
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
      let readPath = 'StarWars10s-2C-24000-3SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0500
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_44100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let readPath = 'StarWars10s-1C-44100-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0600
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_48000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0700
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_8000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
      let readPath = 'StarWars10s-1C-8000-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0800
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_16000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let readPath = 'StarWars10s-1C-16000-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0900
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_24000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let readPath = 'StarWars10s-2C-24000-3SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1000
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_44100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let readPath = 'StarWars10s-1C-44100-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1100
     * @tc.desc   setSpeed_getSpeed_AudioSamplingRate_44100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let readPath = 'StarWars10s-1C-44100-2SW.wav'
      await getFdRead(readPath, done);
      await play(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1200
     * @tc.desc   setSpeed_no_start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      audioRenderer!.setSpeed(3);
      let speed = audioRenderer!.getSpeed();
      console.info(`${TagFrmwkRender}: get Speed success: ` + JSON.stringify(speed));
      expect(speed).assertEqual(3);
      await Utils.msSleep(100);
      await audioRenderer!.release();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1300
     * @tc.desc   setSpeed_invalid_number_parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET/GET_SPEED_STATIC_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        audioRenderer!.setSpeed(0.1);
      } catch (error) {
        console.info(`${TagFrmwkRender}: get Speed error: ` + JSON.stringify(error.code));
        expect(Number(error.code)).assertEqual(6800101)
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOCHANNEL_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOCHANNEL_STATIC_0100
     * @tc.desc   Get All AudioChannel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOCHANNEL_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`${TagFrmwkRender}: get CHANNEL_1 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_1));
      expect(audio.AudioChannel.CHANNEL_2 == 0x1 << 1).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_2 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_2));
      expect(audio.AudioChannel.CHANNEL_3 == 3).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_3 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_3));
      expect(audio.AudioChannel.CHANNEL_4 == 4).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_4 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_4));
      expect(audio.AudioChannel.CHANNEL_5 == 5).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_5 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_5));
      expect(audio.AudioChannel.CHANNEL_6 == 6).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_6 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_6));
      expect(audio.AudioChannel.CHANNEL_7 == 7).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_7 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_7));
      expect(audio.AudioChannel.CHANNEL_8 == 8).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_8 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_8));
      expect(audio.AudioChannel.CHANNEL_9 == 9).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_9 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_9));
      expect(audio.AudioChannel.CHANNEL_10 == 10).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_10 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_10));
      expect(audio.AudioChannel.CHANNEL_12 == 12).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_12 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_12));
      expect(audio.AudioChannel.CHANNEL_14 == 14).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_14 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_14));
      expect(audio.AudioChannel.CHANNEL_16 == 16).assertTrue();
      console.info(`${TagFrmwkRender}: get CHANNEL_16 success: ` + JSON.stringify(audio.AudioChannel.CHANNEL_16));
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CHANNEL_LAYOUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CHANNEL_LAYOUT_STATIC_0100
     * @tc.desc   All AudioChannelLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_CHANNEL_LAYOUT_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_UNKNOWN success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN));
      expect(audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN == 0x0).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_MONO success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_MONO));
      expect(audio.AudioChannelLayout.CH_LAYOUT_MONO == 0x4).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_STEREO success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_STEREO));
      expect(audio.AudioChannelLayout.CH_LAYOUT_STEREO == 0x3).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_STEREO_DOWNMIX success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX));
      expect(audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX == 0x60000000).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_2POINT1 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_2POINT1));
      expect(audio.AudioChannelLayout.CH_LAYOUT_2POINT1 == 0xB).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_3POINT0 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_3POINT0));
      expect(audio.AudioChannelLayout.CH_LAYOUT_3POINT0 == 0x103).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_SURROUND success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_SURROUND));
      expect(audio.AudioChannelLayout.CH_LAYOUT_SURROUND == 0x7).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_3POINT1 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_3POINT1));
      expect(audio.AudioChannelLayout.CH_LAYOUT_3POINT1 == 0xF).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_4POINT0 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_4POINT0));
      expect(audio.AudioChannelLayout.CH_LAYOUT_4POINT0 == 0x107).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_QUAD success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_QUAD));
      expect(audio.AudioChannelLayout.CH_LAYOUT_QUAD == 0x33).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_QUAD_SIDE success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE));
      expect(audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE == 0x603).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_2POINT0POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2 == 0x3000000003).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER1_ACN_N3D success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D == 0x100000000001).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER1_ACN_SN3D success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D == 0x100000001001).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER1_FUMA success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA == 0x100000000101).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_4POINT1 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_4POINT1));
      expect(audio.AudioChannelLayout.CH_LAYOUT_4POINT1 == 0x10F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_5POINT0 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_5POINT0));
      expect(audio.AudioChannelLayout.CH_LAYOUT_5POINT0 == 0x607).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_5POINT0_BACK success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK));
      expect(audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK == 0x37).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_2POINT1POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2 == 0x300000000B).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_3POINT0POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2 == 0x3000000007).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_5POINT1 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_5POINT1));
      expect(audio.AudioChannelLayout.CH_LAYOUT_5POINT1 == 0x60F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_5POINT1_BACK success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK));
      expect(audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK == 0x3F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_6POINT0 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_6POINT0));
      expect(audio.AudioChannelLayout.CH_LAYOUT_6POINT0 == 0x707).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_HEXAGONAL success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL));
      expect(audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL == 0x137).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_3POINT1POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2 == 0x500F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_6POINT0_FRONT success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT));
      expect(audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT == 0x6C3).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_6POINT1 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_6POINT1));
      expect(audio.AudioChannelLayout.CH_LAYOUT_6POINT1 == 0x70F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_6POINT1_BACK success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK));
      expect(audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK == 0x13F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_6POINT1_FRONT success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT));
      expect(audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT == 0x6CB).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT0 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT0));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT0 == 0x637).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT0_FRONT success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT == 0x6C7).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT1 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT1));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT1 == 0x63F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_OCTAGONAL success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL));
      expect(audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL == 0x737).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_5POINT1POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2 == 0x300000060F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT1_WIDE success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE == 0x6CF).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT1_WIDE_BACK success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK == 0xFF).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER2_ACN_N3D success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D == 0x100000000002).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER2_ACN_SN3D success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D == 0x100000001002).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER2_FUMA success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA == 0x100000000102).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_5POINT1POINT4 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4));
      expect(audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4 == 0x2D60F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT1POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2 == 0x300000063F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_7POINT1POINT4 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4));
      expect(audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4 == 0x2D63F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_10POINT2 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_10POINT2));
      expect(audio.AudioChannelLayout.CH_LAYOUT_10POINT2 == 0x180005737).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_9POINT1POINT4 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4));
      expect(audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4 == 0x18002D63F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_9POINT1POINT6 success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6));
      expect(audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6 == 0x318002D63F).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_HEXADECAGONAL success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL));
      expect(audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL == 0x18003F737).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER3_ACN_N3D success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D == 0x100000000003).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER3_ACN_SN3D success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D == 0x100000001003).assertTrue();
      console.info(`${TagFrmwkRender}: get CH_LAYOUT_AMB_ORDER3_FUMA success: ` + JSON.stringify(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA));
      expect(audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA == 0x100000000103).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_GETSTREAMINFO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_GETSTREAMINFO_STATIC_0100
     * @tc.desc   AudioRenderer-GetStreamInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETSTREAMINFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRen = await audio.createAudioRenderer(AudioRendererOptions);
      try {
        let streamInfo = await audioRen!.getStreamInfo();
        console.info('Renderer GetStreamInfo:');
        console.info(`${TagFrmwkRender}: Renderer sampling rate: ${streamInfo.samplingRate}`);
        expect(streamInfo.samplingRate).assertEqual(audio.AudioSamplingRate.SAMPLE_RATE_44100);
        console.info(`${TagFrmwkRender}: Renderer channel: ${streamInfo.channels}`);
        expect(streamInfo.channels).assertEqual(audio.AudioChannel.CHANNEL_1);
        console.info(`${TagFrmwkRender}: Renderer format: ${streamInfo.sampleFormat}`);
        expect(streamInfo.sampleFormat).assertEqual(audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE);
        console.info(`${TagFrmwkRender}: Renderer encoding type: ${streamInfo.encodingType}`);
        expect(streamInfo.encodingType).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        console.info(`${TagFrmwkRender}: Renderer channelLayout type: ${streamInfo.channelLayout}`);
        expect(streamInfo.channelLayout).assertEqual(audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN);
        audioRen!.release();
        done();
      } catch (err) {
        console.error(`ERROR: ${err}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_SYNC_STATIC_0100
     * @tc.desc   AudioRenderer-GetAudioSceneSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-1C-44100-2SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_AudioSceneSync(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_GETAUDIOTIMESYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_GETAUDIOTIMESYNC_STATIC_0200
     * @tc.desc   AudioRenderer - getAudioTimeSync - During Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_GETAUDIOTIMESYNC_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-24000-3SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_GetAudioTimeSync(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_SYNC_STATIC_0300
     * @tc.desc   AudioRenderer - getAudioStreamIdSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_SYNC_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      try {
        let data = audioRenderer!.getAudioStreamIdSync();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_SYNC_0200 OUT OF BORDER PROMISE: SUCCESS ${data}`);
        expect(true).assertTrue();
        try {
          await audioRenderer!.release();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        }
        done();
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_SYNC_0200 OUT OF BORDER PROMISE: ERROR: ${err.message}`);
        expect(false).assertTrue();
        try {
          await audioRenderer!.release();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_SETINTERRUPTMODESYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_SETINTERRUPTMODESYNC_STATIC_0400
     * @tc.desc   STREAM_VOICE_CALL AUDIO_INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETINTERRUPTMODESYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_VOICE_ASSISTANT
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
            interrput_flag = true;
          }
          expect(interrput_flag).assertTrue();
        });

        // @ts-ignore
        audioRen!.setInterruptModeSync(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_VOICE_CALL
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        // @ts-ignore
        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0100 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0100
     * @tc.desc   STREAM_VOICE_CALL AUDIO_INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_VOICE_ASSISTANT
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
            interrput_flag = true;
          }
          expect(interrput_flag).assertTrue();
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_VOICE_CALL
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0100 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0200
     * @tc.desc   STREAM_RING INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_VOICE_ASSISTANT
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
            interrput_flag = true;
          }
          expect(interrput_flag).assertTrue();
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_RING
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0200 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0300
     * @tc.desc   STREAM_MUSIC INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_VOICE_ASSISTANT
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
            interrput_flag = true;
          }
          expect(interrput_flag).assertTrue();
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_MUSIC
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0300 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0400
     * @tc.desc   STREAM_VOICE_ASSISTANT INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_VOICE_ASSISTANT
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
            interrput_flag = true;
          }
          expect(interrput_flag).assertTrue();
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null) => {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_0400 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0500
     * @tc.desc   STREAM_VOICE_ASSISTANT INTERRUPT STREAM_VOICE_CALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_VOICE_CALL
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
          }
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
        expect(interrput_flag).assertFalse();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0500 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0600
     * @tc.desc   STREAM_VOICE_ASSISTANT INTERRUPT STREAM_RING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_RING
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
          }
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
        expect(interrput_flag).assertFalse();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0600 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0700
     * @tc.desc   STREAM_VOICE_ASSISTANT INTERRUPT STREAM_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_TEST_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let interrput_flag = false;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      // STREAM_MUSIC
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        let audioRen: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions).then(async (data: audio.AudioRenderer | null)=> {
          audioRen = data;
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        audioRen!.onAudioInterrupt((interruptEvent: audio.InterruptEvent) => {
          console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
          console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
          console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
          if (interruptEvent.hintType >= 0) {
            console.info("AudioFrameworkRenderLog: on'audioInterrupt' SUCCESS ");
            interrput_flag = true;
          }
          expect(interrput_flag).assertTrue();
        });

        let a = await audioRen!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });
        await Utils.msSleep(1000);
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo_interrupt: audio.AudioRendererInfo = {
          usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          rendererFlags: 0
        }

        let AudioRendererOptions_interrupt: audio.AudioRendererOptions = {
          streamInfo: AudioStreamInfo,
          rendererInfo: AudioRendererInfo_interrupt
        }

        let audioRen_interrupt: audio.AudioRenderer | null;
        await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async (data: audio.AudioRenderer | null)=> {
          audioRen_interrupt = data;
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data!));
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
        });

        let b = await audioRen_interrupt!.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
        console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

        await audioRen_interrupt!.start().then(async ()=> {
          console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
        }).catch((err: Error) => {
          console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
        });
        await Utils.msSleep(2000);
        await audioRen!.release();
        await audioRen_interrupt!.release();
      }
      catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0700 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0100
     * @tc.desc   SetInterruptMode mode 0 callback,is public share mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      let mode = audio.InterruptMode.SHARE_MODE;
      audioRenderer!.setInterruptMode(mode, (err: BusinessError<void> | null) => {
        if (err) {
          console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: error: ${err?.message}`);
          expect(false).assertTrue();
          await audioRenderer!.release();
          done();
        }
        console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: SUCCESS`);
        expect(true).assertTrue();
        await audioRenderer!.release();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0200
     * @tc.desc   SetInterruptMode mode 1 callback,is independent mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      let mode = audio.InterruptMode.INDEPENDENT_MODE;
      audioRenderer!.setInterruptMode(mode, (err: BusinessError<void> | null) => {
        if (err) {
          console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: error: ${err?.message}`);
          expect(false).assertTrue();
          await audioRenderer!.release();
          done();
        }
        console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: SUCCESS`);
        expect(true).assertTrue();
        await audioRenderer!.release();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0300
     * @tc.desc   SetInterruptMode mode 0 promise,is public share mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      let mode = audio.InterruptMode.SHARE_MODE;
      await audioRenderer!.setInterruptMode(mode).then(() => {
        console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE PROMISE: SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error)=> {
        console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE PROMISE: error: ${err.message}`);
        expect(false).assertTrue();
      });
      await audioRenderer!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0400
     * @tc.desc   SetInterruptMode mode 1 promise,is independent mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      let mode = audio.InterruptMode.INDEPENDENT_MODE;
      await audioRenderer!.setInterruptMode(mode).then(() => {
        console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE PROMISE: SUCCESS`);
        expect(true).assertTrue();
      }).catch((err: Error)=> {
        console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE PROMISE: error: ${err.message}`);
        expect(false).assertTrue();
      })
      await audioRenderer!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0100
     * @tc.desc   AudioRenderer - getAudioStreamId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      try {
        let data = await audioRenderer!.getAudioStreamId();
        console.info(`${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_getAudioStreamId_0100 OUT OF BORDER PROMISE: SUCCESS ${data}`);
        expect(true).assertTrue();
        await audioRenderer!.release().then(() => {
          console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err: Error) => {
          console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_getAudioStreamId_0100 OUT OF BORDER PROMISE: ERROR: ${err.message}`);
        expect(false).assertTrue();
        await audioRenderer!.release().then(() => {
          console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err: Error) => {
          console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0200
     * @tc.desc   AudioRenderer - getAudioStreamId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      audioRenderer!.getAudioStreamId((err: BusinessError<void> | null, data: long | undefined) => {
        if (err) {
          console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: error: ${err?.message}`);
          expect(false).assertTrue();
          await audioRenderer!.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
          }).catch((err: Error) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
          });
          done();
        }
        console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: SUCCESS ${data}`);
        expect(true).assertTrue();
        await audioRenderer!.release().then(() => {
          console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err: Error) => {
          console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0300
     * @tc.desc   AudioRenderer - getAudioStreamId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      await audioRenderer!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      audioRenderer!.getAudioStreamId((err: BusinessError<void> | null, data: long | undefined) => {
        if (err) {
          console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK : ${err?.message}`);
          if (err?.code == 6800103) {
            console.log(`${TagFrmwkRender}:SetInterruptMode : SUCCESS`);
            expect(true).assertTrue();
          } else {
            console.log(`${TagFrmwkRender}: SetInterruptMode : error : ${err?.code}`);
            expect(false).assertTrue();
          }
        } else {
          console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: SUCCESS ${data}`);
          expect(false).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0100
     * @tc.desc   AudioRenderer - setVolume 0 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0100 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0200
     * @tc.desc   AudioRenderer - setVolume 0.5 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0.5;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0.5 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0200 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0300
     * @tc.desc   AudioRenderer - setVolume 1.1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1.1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(false).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 5 TEST: ERROR`);
        } catch (err) {
          if (err.code == 6800104) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1.1 : OK`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0300 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0500
     * @tc.desc   AudioRenderer - setVolume 0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0500 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0600
     * @tc.desc   AudioRenderer - setVolume 0.5 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0.5;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0.5 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0600 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0700
     * @tc.desc   AudioRenderer - setVolume 1.1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1.1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            if (err?.code == 6800104) {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1.1 : OK`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1.1 TEST: ERROR`);
            expect(false).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0700 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0100
     * @tc.desc   AudioRenderer with parameter set 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-1C-44100-2SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0200
     * @tc.desc   AudioRenderer - getAudioTime -Before Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-24000-3SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_93(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0300
     * @tc.desc   AudioRenderer - getAudioTime - During Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-24000-3SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_94(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0400
     * @tc.desc   AudioRenderer - getAudioTime - after Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-24000-3SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_95(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0500
     * @tc.desc   AudioRenderer - markReached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_102(AudioRendererOptions, filePath);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0600
     * @tc.desc   AudioRenderer - markReached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_103(AudioRendererOptions, filePath);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0700
     * @tc.desc   AudioRenderer - markReached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav';
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_104(AudioRendererOptions, filePath);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0800
     * @tc.desc   AudioRenderer - periodReach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      readPath = 'StarWars10s-2C-48000-4SW.wav';
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_105(AudioRendererOptions, filePath);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0900
     * @tc.desc   AudioRenderer - periodReach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav';
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_106(AudioRendererOptions, filePath);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1000
     * @tc.desc   AudioRenderer - periodReach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav';
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise_107(AudioRendererOptions, filePath);
      await Utils.msSleep(100)
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1100
     * @tc.desc   AudioRenderer with parameter set 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-1C-8000-2SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1200
     * @tc.desc   AudioRenderer with parameter set 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-1C-32000-1SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1300
     * @tc.desc   AudioRenderer with parameter set 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-1C-64000-3SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1400
     * @tc.desc   AudioRenderer with parameter set 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-1C-96000-4SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1500
     * @tc.desc   AudioRenderer with parameter set 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-11025-1SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1600
     * @tc.desc   AudioRenderer with parameter set 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-12000-2SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1700
     * @tc.desc   AudioRenderer with parameter set 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(100);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1800
     * @tc.desc   AudioRenderer-isStreamActive - UNKNOWN - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then( (data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1900
     * @tc.desc   AudioRenderer-isStreamActive - SPEECH - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then( (data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2000
     * @tc.desc   AudioRenderer-isStreamActive - MUSIC - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2200
     * @tc.desc   AudioRenderer-isStreamActive - SONIFICATION - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.RINGTONE).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2300
     * @tc.desc   AudioRenderer-isStreamActive - RINGTONE - UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.RINGTONE).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2400
     * @tc.desc   AudioRenderer-isStreamActive - UNKNOWN - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2500
     * @tc.desc   AudioRenderer-isStreamActive - SPEECH - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.VOICE_ASSISTANT).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive VOICE_ASSISTANT: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive VOICE_ASSISTANT: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2600
     * @tc.desc   AudioRenderer-isStreamActive - MUSIC - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2700
     * @tc.desc   AudioRenderer-isStreamActive - MOVIE - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2800
     * @tc.desc   AudioRenderer-isStreamActive - SONOTIFICATION - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.RINGTONE).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2900
     * @tc.desc   AudioRenderer-isStreamActive - RINGTONE - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.RINGTONE).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3000
     * @tc.desc   AudioRenderer-isStreamActive - UNKNOWN - VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3100
     * @tc.desc   AudioRenderer-isStreamActive - SPEECH - VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.VOICE_CALL).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive VOICE_CALL: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive VOICE_CALL: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3200
     * @tc.desc   AudioRenderer-isStreamActive - MUSIC - VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3300
     * @tc.desc   AudioRenderer-isStreamActive - MOVIE - VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3400
     * @tc.desc   AudioRenderer-isStreamActive - SONOTIFICATION - VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3500
     * @tc.desc   AudioRenderer-isStreamActive - RINGTONE - VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3600
     * @tc.desc   AudioRenderer-isStreamActive - UNKNOWN - NOTIFICATION_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3700
     * @tc.desc   AudioRenderer-isStreamActive - SPEECH - NOTIFICATION_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3800
     * @tc.desc   AudioRenderer-isStreamActive - MUSIC - NOTIFICATION_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.RINGTONE).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive RENGITONE: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3900
     * @tc.desc   AudioRenderer-isStreamActive - MOVIE - NOTIFICATION_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4000
     * @tc.desc   AudioRenderer-isStreamActive - SONOTIFICATION - NOTIFICATION_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.MEDIA).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4100
     * @tc.desc   AudioRenderer-isStreamActive - RINGTONE - NOTIFICATION_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.RINGTONE).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4200
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4300
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4400
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4500
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      expect(resultFlag).assertTrue();
      await audioRen!.release();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4600
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      expect(resultFlag).assertTrue();
      await audioRen!.release();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4700
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      expect(resultFlag).assertTrue();
      await audioRen!.release();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4800
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });

      expect(resultFlag).assertTrue();
      await audioRen!.release();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4900
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5000
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5100
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5200
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5300
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5400
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5500
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5600
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5700
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5800
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5900
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6000
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6100
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6200
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6300
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6400
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6500
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - Set24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      }  catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6600
     * @tc.desc   AudioRenderer - STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      if (audioRen!.state == audio.AudioState.STATE_PREPARED) {
        console.info(`${TagFrmwkRender}: Audio State : STATE_PREPARED : PASS : ${audioRen!.state}`);
      }
      else {
        console.info(`${TagFrmwkRender}: Audio State : STATE_PREPARED : FAIL : ${audioRen!.state}`);
        resultFlag = false;
      }

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6700
     * @tc.desc   AudioRenderer - STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      if (audioRen!.state == audio.AudioState.STATE_RUNNING) {
        console.info(`${TagFrmwkRender}: Audio State : STATE_RUNNING : PASS : ${audioRen!.state}`);
      }
      else {
        console.info(`${TagFrmwkRender}: Audio State : STATE_RUNNING : FAIL : ${audioRen!.state}`);
        resultFlag = false;
      }

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6800
     * @tc.desc   AudioRenderer - STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(500);

      if (audioRen!.state == audio.AudioState.STATE_STOPPED) {
        console.info(`${TagFrmwkRender}: Audio State : STATE_STOPPED : PASS : ${audioRen!.state}`);
      }
      else {
        console.info(`${TagFrmwkRender}: Audio State : STATE_STOPPED : FAIL : ${audioRen!.state}`);
        resultFlag = false;
      }

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6900
     * @tc.desc   AudioRenderer - STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(500);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(500);

      if (audioRen!.state == audio.AudioState.STATE_RELEASED) {
        console.info(`${TagFrmwkRender}: Audio State : STATE_RELEASED : PASS : ${audioRen!.state}`);
      }
      else {
        console.info(`${TagFrmwkRender}: Audio State : STATE_RELEASED : FAIL : ${audioRen!.state}`);
        resultFlag = false;
      }

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7000
     * @tc.desc   AudioRenderer - STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.pause().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant Pause :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant Pause :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      if (audioRen!.state == audio.AudioState.STATE_PAUSED) {
        console.info(`${TagFrmwkRender}: Audio State : STATE_PAUSED : PASS : ${audioRen!.state}`);
      }
      else {
        console.info(`${TagFrmwkRender}: Audio State : STATE_PAUSED : FAIL : ${audioRen!.state}`);
        resultFlag = false;
      }

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });
      await Utils.msSleep(500);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(500)

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7600
     * @tc.desc   AudioRenderer - getAudioTime - Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      readPath = 'StarWars10s-2C-48000-4SW.wav';
      await getFdRead(readPath, done);
      let resultFlag = true;
      console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

      console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getAudioTime().then((data: long) => {
        console.info(`${TagFrmwkRender}: getAudioTime : Value : ${data}`);
        resultFlag = true;
        if (data > 0) {
          console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${data}`);
        }
        else {
          console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${data}`);
        }
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
      });

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });

      console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen!.state}`);

      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

      await Utils.msSleep(500);

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7700
     * @tc.desc   AudioRenderer - STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
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
      let resultFlag = false;
      let isPass = false;
      let audioRenderer: audio.AudioRenderer | null;
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = audioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.info(`${TagFrmwkRender}: isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      audioRenderer!.onStateChange((state: audio.AudioState) => {
        console.info(`${TagFrmwkRender}: ${TagFrmwk}: Volume Change Event is called`);
        switch (state) {
          case audio.AudioState.STATE_RELEASED:
            console.info(`${TagFrmwkRender}: ${TagFrmwk}: state : STATE_NEW`);
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwkRender}: ${TagFrmwk}: state : ${state}`);
            break;
        }
      });
      await Utils.msSleep(1000);
      try {
        await audioRenderer!.release()
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      await Utils.msSleep(1000);
      expect(resultFlag).assertTrue();

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7800
     * @tc.desc   AudioRenderer - STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      audioRen!.onStateChange((AudioState: audio.AudioState) => {

        console.log(`${TagFrmwk}: Volume Change Event is called`);

        switch (AudioState) {
          case audio.AudioState.STATE_RUNNING:
            console.info(`${TagFrmwk}: state : STATE_RUNNING`);
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwk}: state : ${AudioState}`);
            break;
        }
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(1000);

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7900
     * @tc.desc   AudioRenderer - STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      audioRen!.onStateChange((AudioState: audio.AudioState) => {

        console.log(`${TagFrmwk}: Volume Change Event is called`);

        switch (AudioState) {
          case audio.AudioState.STATE_STOPPED:
            console.info(`${TagFrmwk}: state : STATE_STOPPED`);
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwk}: state : ${AudioState}`);
            break;
        }
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(500);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(500);

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8000
     * @tc.desc   AudioRenderer - STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      audioRen!.onStateChange((AudioState: audio.AudioState) => {

        console.log(`${TagFrmwk}: Volume Change Event is called`);

        switch (AudioState) {
          case audio.AudioState.STATE_RELEASED:
            console.info(`${TagFrmwk}: state : STATE_RELEASED`);
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwk}: state : ${AudioState}`);
            break;
        }
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });
      await Utils.msSleep(500);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(500);

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8100
     * @tc.desc   AudioRenderer - STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
      audioRen!.onStateChange((AudioState: audio.AudioState) => {

        console.log(`${TagFrmwk}: Volume Change Event is called`);

        switch (AudioState) {
          case audio.AudioState.STATE_PAUSED:
            console.info(`${TagFrmwk}: state : STATE_PAUSED`);
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwk}: state : ${AudioState}`);
            break;
        }
      });
      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.pause().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant Pause :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant Pause :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);
      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });
      await Utils.msSleep(500);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(500)

      expect(resultFlag).assertTrue();

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8200
     * @tc.desc   AudioState - STATE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.AudioState.STATE_INVALID == -1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8300
     * @tc.desc   AudioState - STATE_NEW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.AudioState.STATE_NEW == 0).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8400
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8400
     * @tc.desc   AudioSampleFormat - STATE_FORMAT_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID == -1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8500
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8500
     * @tc.desc   SourceType - SOURCE_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.SourceType.SOURCE_TYPE_INVALID == -1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8600
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8600
     * @tc.desc   AudioRenderer - Pause - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }
      audioRen!.onStateChange((AudioState: audio.AudioState) => {

        console.log(`${TagFrmwk}: Volume Change Event is called`);

        switch (AudioState) {
          case audio.AudioState.STATE_PAUSED:
            console.info(`${TagFrmwk}: state : STATE_PAUSED`);
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwk}: state : ${AudioState}`);
            break;
        }
      });
      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(2000);

      audioRen!.pause((err: BusinessError<void> | null) => {
        if (err) {
          console.info(`${TagFrmwkRender}: renderInstant Pause :ERROR : ${err?.message}`);
          resultFlag = false;
        }
        else {
          console.info(`${TagFrmwkRender}: renderInstant Pause :SUCCESS`);
        }
      });
      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });
      await Utils.msSleep(500);

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(500)

      expect(resultFlag).assertTrue();

      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8700
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8700
     * @tc.desc   AudioEncodingType - ENCODING_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.AudioEncodingType.ENCODING_TYPE_INVALID == -1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8800
     * @tc.desc   StreamUsage - STREAM_USAGE_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      try {
        readPath = 'StarWars10s-1C-44100-2SW.wav';
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await Utils.msSleep(100);
        console.info('AudioFrameworkRenderLog: resultFlag : ' + resultFlag);
        expect(resultFlag).assertTrue();
      } catch (error) {
        console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8800 : error = " + error);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8900
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - SetALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer flags type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer flags type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9000
     * @tc.desc   AudioRenderer-SET & GET AudioRendererInfo - SetACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS ${JSON.stringify(data)}`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
        console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        if (audioParamsGet.usage == AudioRendererInfo.usage) {
          console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
          resultFlag = false;
        }
        if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
          console.info(`${TagFrmwkRender}: Renderer flags type: PASS: ${audioParamsGet.rendererFlags}`);
        }
        else {
          console.info(`${TagFrmwkRender}: Renderer flags type: FAIL: ${audioParamsGet.rendererFlags}`);
          resultFlag = false;
        }
      }).catch((err: Error) => {
        console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      await audioRen!.release();
      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9100
     * @tc.desc   AudioRenderer-isActive - MUSIC - ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.ALARM).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive ALARM: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive ALARM: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9200
     * @tc.desc   AudioRenderer-isActive - SPEECH - ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;
      readPath = 'StarWars10s-2C-48000-4SW.wav'
      await getFdRead(readPath, done);
      playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
      await Utils.msSleep(2000);
      AUDIOMANAGER.getStreamManager().isActive(audio.AudioVolumeType.ACCESSIBILITY).then((data: boolean)=> {
        if (data == true) {
          console.log(`${TagFrmwk}: Promise : isActive ACCESSIBILITY: PASS : ${data}`);
        }
        else {
          console.log(`${TagFrmwk}: Promise : isActive ACCESSIBILITY: FAIL : ${data}`);
        }
      });
      await Utils.msSleep(9000);
      console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0900
     * @tc.desc   AudioRenderer - setVolume 0 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0900 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1100
     * @tc.desc   AudioRenderer - setVolume 1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_1100 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1200
     * @tc.desc   AudioRenderer - setVolume 1.1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1.1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(false).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1.1 TEST: ERROR`);
        } catch (err) {
          if (err.code == 6800104) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : SUCCESS : code: ${err.code}, mesage: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_1200 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1400
     * @tc.desc   AudioRenderer - setVolume 0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_1400 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1600
     * @tc.desc   AudioRenderer - setVolume 1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_1600 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1700
     * @tc.desc   AudioRenderer - setVolume 1.1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1.1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            if (err?.code == 6800104) {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 16 : OK`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 16 TEST: ERROR`);
            expect(false).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_1700 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1900
     * @tc.desc   AudioRenderer - setVolume 0 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_1900 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2000
     * @tc.desc   AudioRenderer - setVolume -1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = -1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(false).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to -1 TEST: ERROR`);
        } catch (err) {
          if (err.code == 6800104) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : SUCCESS : code: ${err.code}, mesage: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2000 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2100
     * @tc.desc   AudioRenderer - setVolume 1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1 : Success`);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2100 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2200
     * @tc.desc   AudioRenderer - setVolume 1.1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1.1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(false).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 16 TEST: ERROR`);
        } catch (err) {
          if (err.code == 6800104) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : SUCCESS : code: ${err.code}, mesage: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2200 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2400
     * @tc.desc   AudioRenderer - setVolume 0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2400 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2500
     * @tc.desc   AudioRenderer - setVolume -1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = -1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            if (err?.code == 6800104) {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to -1 : OK`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to -1 TEST: ERROR`);
            expect(false).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2500 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2600
     * @tc.desc   AudioRenderer - setVolume 1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2600 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2700
     * @tc.desc   AudioRenderer - setVolume 1.1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1.1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          if (err) {
            if (err?.code == 6800104) {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 16 : OK`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to -1 TEST: ERROR`);
            expect(false).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_2700 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9300
     * @tc.desc   AudioRenderer with parameter STREAM_USAGE_VIDEO_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      readPath = 'StarWars10s-1C-8000-2SW.wav'
      await getFdRead(readPath, done);
      await playbackPromise_92(AudioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_VIDEO_STREAM_STATIC_USAGE
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_VIDEO_STREAM_STATIC_USAGE
     * @tc.desc   AudioRenderer with parameter STREAM_USAGE_VIDEO_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_VIDEO_STREAM_STATIC_USAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      readPath = 'StarWars10s-1C-16000-2SW.wav'
      await getFdRead(readPath, done);
      await playWithVideoStream(AudioRendererOptions, filePath, done);
      await Utils.msSleep(2000);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0100
     * @tc.desc   AudioRenderer - getVolume 0 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
          let data = audioRen!.getVolume();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0100 SUCCESS: ${data}`);
          expect(data).assertEqual(0);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0100 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0200
     * @tc.desc   AudioRenderer - getVolume 0.5 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0.5;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0.5 : Success`);
          let data = audioRen!.getVolume();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0200 SUCCESS: ${data}`);
          expect(data).assertEqual(0.5);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0200 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0300
     * @tc.desc   AudioRenderer - getVolume 1 - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1;
        try {
          await audioRen!.setVolume(inputVolume);
          expect(true).assertTrue();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 1 : Success`);
          let data = audioRen!.getVolume();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0300 SUCCESS: ${data}`);
          expect(data).assertEqual(1);
        } catch (err) {
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0300 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0400
     * @tc.desc   AudioRenderer - getVolume 1 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let data = audioRen!.getVolume();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0400 SUCCESS: ${data}`);
        expect(data).assertEqual(1);
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0300 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0500
     * @tc.desc   AudioRenderer - setVolume 0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          let data = audioRen!.getVolume();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0500 SUCCESS: ${data}`);
          expect(data).assertEqual(0);
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0500 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0600
     * @tc.desc   AudioRenderer - setVolume 0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 0.5;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          let data = audioRen!.getVolume();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0600 SUCCESS: ${data}`);
          expect(data).assertEqual(0.5);
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0600 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0700
     * @tc.desc   AudioRenderer - setVolume 0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_VOLUME_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      let audioRen: audio.AudioRenderer | null;
      try {
        try {
          audioRen = await audio.createAudioRenderer(audioRendererOptions);
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(audioRen!));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(audioRen));
        } catch (err) {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        }

        let inputVolume = 1;
        audioRen!.setVolume(inputVolume, (err: BusinessError<void> | null) => {
          let data = audioRen!.getVolume();
          console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0700 SUCCESS: ${data}`);
          expect(data).assertEqual(1);
          if (err) {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume : ERROR : code: ${err?.code}, mesage: ${err?.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: setVolume to 0 : Success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info("SUB_MULTIMEDIA_AUDIO_GET_VOLUME_0700 : error = " + error);
        expect(false).assertTrue();
      }

      await Utils.msSleep(2000);
      try {
        await audioRen!.release();
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: ${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_FLUSH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_FLUSH_STATIC_0100
     * @tc.desc   AudioRenderer - STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_FLUSH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      let audioRen: audio.AudioRenderer | null;
      let isPass = false;
      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen = data;
        console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
        LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
        if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
          isPass = true;
        } else {
          resultFlag = false;
        }
      }
      console.log(`isPass: ${isPass}`);
      if (isPass) {
        resultFlag = true;
        expect(resultFlag).assertTrue();
        done();
        return new Promise<void>((resolve, reject) => {
          resolve(undefined);
        });
      }

      audioRen!.onStateChange((AudioState: audio.AudioState) => {

        console.log(`${TagFrmwk}: Volume Change Event is called`);

        switch (AudioState) {
          case audio.AudioState.STATE_RUNNING:
            console.info(`${TagFrmwk}: state : STATE_RUNNING`);
            audioRen!.flush().then(() => {
              console.info('Renderer flushed successfully');
            }).catch((err: Error) => {
              console.error(`ERROR: ${err}`);
            });
            resultFlag = true;
            break;
          default:
            console.info(`${TagFrmwk}: state : ${AudioState}`);
            break;
        }
      });

      await audioRen!.start().then(() => {
        console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });

      await Utils.msSleep(500);

      await audioRen!.stop().then(() => {
        console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
      });

      await audioRen!.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
      await Utils.msSleep(1000);

      expect(resultFlag).assertTrue();

      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0100
     * @tc.desc   Test AudioRenderer writeData callback with on interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
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
      let readPath = 'StarWars10s-1C-16000-2SW.wav'
      await getFdRead(readPath, done);
      await playbackWriteDataCallback_001(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0200
     * @tc.desc   Test AudioRenderer writeData callback with VALID result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
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
      let readPath = 'StarWars10s-1C-16000-2SW.wav'
      await getFdRead(readPath, done);
      await playbackWriteDataCallback_002(audioRendererOptions, filePath, done);
      await Utils.msSleep(100);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0300
     * @tc.desc   Test AudioRenderer writeData callback with INVALID result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
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
      let readPath = 'StarWars10s-1C-16000-2SW.wav'
      try {
        await getFdRead(readPath, done);
        await playbackWriteDataCallback_003(audioRendererOptions, filePath, done);
        await Utils.msSleep(100);
      } catch (err) {
        console.info(`SUB_MULTIMEDIA_AUDIO_RENDERER_WRITE_DATA_TEST_STATIC_0300 : FAILED`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MEDIA_MUTE_PLAY_STATIC_0008
     * @tc.number SUB_MULTIMEDIA_AUDIO_MEDIA_MUTE_PLAY_STATIC_0008
     * @tc.desc   setSilentModeAndMixWithOthers and getSilentModeAndMixWithOthers success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_MEDIA_MUTE_PLAY_STATIC_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      } catch (err) {
        console.info(`AudioRenderer create : ERROR`);
        expect(false).assertTrue();
      }
      try {
        audioRenderer!.setSilentModeAndMixWithOthers(true);
        let data = audioRenderer!.getSilentModeAndMixWithOthers();
        expect(data).assertEqual(true);
      } catch (err) {
        console.info(`AudioRenderer setSilentModeAndMixWithOthers or getSilentModeAndMixWithOthers : ERROR: ${err.code}`);
        expect(false).assertTrue();
      }
      audioRenderer!.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
      });
      console.info('afterAll called')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MEDIA_MUTE_PLAY_STATIC_0009
     * @tc.number SUB_MULTIMEDIA_AUDIO_MEDIA_MUTE_PLAY_STATIC_0009
     * @tc.desc   setSilentModeAndMixWithOthers and getSilentModeAndMixWithOthers success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_MEDIA_MUTE_PLAY_STATIC_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      } catch (err) {
        console.info(`AudioRenderer create : ERROR`);
        expect(false).assertTrue();
      }
      try {
        audioRenderer!.setSilentModeAndMixWithOthers(false);
        let data = audioRenderer!.getSilentModeAndMixWithOthers();
        expect(data).assertEqual(false);
      } catch (err) {
        console.info(`AudioRenderer setSilentModeAndMixWithOthers or getSilentModeAndMixWithOthers : ERROR: ${err.code}`);
        expect(false).assertTrue();
      }
      audioRenderer!.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
      });
      console.info('afterAll called')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SET_DEFAULT_OUTPUT_DEVICE_STATIC_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SET_DEFAULT_OUTPUT_DEVICE_STATIC_0001
     * @tc.desc   setDefaultOutputDevice input usage invalid return 6800103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SET_DEFAULT_OUTPUT_DEVICE_STATIC_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
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
      try {
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`AudioRenderer create : SUCCESS`);
      } catch (err) {
        console.info(`AudioRenderer create : ERROR`);
        expect(false).assertTrue();
      }
      try {
        await audioRenderer!.start();
        console.info(`AudioRenderer start : SUCCESS`);
      } catch (err) {
        console.info(`AudioRenderer start : ERROR`);
        expect(false).assertTrue();
      }
      try {
        await audioRenderer!.setDefaultOutputDevice(audio.DeviceType.EARPIECE);
      } catch (err) {
        if (err.code == 6800103) {
          console.info(`AudioRenderer setDefaultOutputDevice : SUCCESS`);
        } else {
          console.info(`AudioRenderer setDefaultOutputDevice : ERROR: ${err.code}`);
          expect(false).assertTrue();
        }
      };
      await audioRenderer!.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('afterAll called')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_ON_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_ON_STATIC_0100
     * @tc.desc   on_streamVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_ON_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_ON_STATIC_0100';
      //define manager
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioVolumeManager:audio.AudioVolumeManager = audioManager.getVolumeManager();

      //define audiorenderer Parameter
      let StreamUsage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo:audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let audioRendererOptions:audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRenderer:audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);
      console.info(`${TAG},createAudioRenderer SUCCESS`);
      let minStreamVolumeValue:number = audioRenderer!.getMinStreamVolumeSync();
      console.info(`${TAG},getMinStreamVolumeSync SUCCESS,minStreamVolumeValue : ${minStreamVolumeValue}`);
      try{
        let streamVolumeChangeCB = (data:audio.StreamVolumeEvent) =>{
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.streamUsage : ${data.streamUsage}`);
          expect(data.streamUsage).assertEqual(StreamUsage);
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.volume : ${data.volume}`);
          expect(data.volume).assertEqual(minStreamVolumeValue);
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.updateUi : ${data.updateUi}`);
          done();
        };
        console.info(`${TAG},streamVolumeChangeCB SUCCESS`);

        audioVolumeManager.onStreamVolumeChange(StreamUsage,streamVolumeChangeCB)
        console.info(`${TAG},audioVolumeManager_on SUCCESS`);
        await audioRenderer!.setVolume(minStreamVolumeValue).then(() =>{
          console.info(`${TAG},setVolume SUCCESS`);
        }).catch((err: Error) =>{
          console.info(`${TAG},setVolume FAILED : ${err}`);
        });
        audioVolumeManager.offStreamVolumeChange(streamVolumeChangeCB);
        console.info(`${TAG},audioVolumeManager_off SUCCESS`);
        done();
      } catch (error){
        console.info(`${TAG},audioVolumeManager_off FAILED,error.code : ${error.code}, error.message : ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      await audioRenderer!.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('afterAll called')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0100
     * @tc.desc   off_streamVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0100';
      //define manager
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioVolumeManager:audio.AudioVolumeManager = audioManager.getVolumeManager();

      try{
        let StreamUsage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
        let streamVolumeChangeCB = (data:audio.StreamVolumeEvent) =>{
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.streamUsage : ${data.streamUsage}`);
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.volume : ${data.volume}`);
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.updateUi : ${data.updateUi}`);
          done();
        };
        console.info(`${TAG},streamVolumeChangeCB SUCCESS`);

        audioVolumeManager.onStreamVolumeChange(StreamUsage,streamVolumeChangeCB)
        console.info(`${TAG},audioVolumeManager_on SUCCESS`);
        audioVolumeManager.offStreamVolumeChange(streamVolumeChangeCB)
        console.info(`${TAG},audioVolumeManager_off SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error){
        console.error(`${TAG},audioVolumeManager_on FAILED,error.code : ${error.code}, error.message : ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0200
     * @tc.desc   off_streamVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_MULTIMEDIA_AUDIO_STREAMVOLUMECHANGE_OFF_STATIC_0200';
      //define manager
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioVolumeManager:audio.AudioVolumeManager = audioManager.getVolumeManager();

      try{
        let StreamUsage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
        let streamVolumeChangeCB = (data:audio.StreamVolumeEvent) =>{
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.streamUsage : ${data.streamUsage}`);
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.volume : ${data.volume}`);
          console.info(`${TAG},streamVolumeChangeCB StreamVolumeEvent.updateUi : ${data.updateUi}`);
          done();
        };
        console.info(`${TAG},streamVolumeChangeCB SUCCESS`);

        audioVolumeManager.onStreamVolumeChange(StreamUsage,streamVolumeChangeCB)
        console.info(`${TAG},audioVolumeManager_on SUCCESS`);
        audioVolumeManager.offStreamVolumeChange()
        console.info(`${TAG},audioVolumeManager_off SUCCESS`);
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError){
        console.error(`${TAG},audioVolumeManager_on FAILED,error.code : ${error.code}, error.message : ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETVOLUMEINUNITOFDBBYSTREAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETVOLUMEINUNITOFDBBYSTREAM_STATIC_0100
     * @tc.desc   getVolumeInUnitOfDbByStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETVOLUMEINUNITOFDBBYSTREAM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_MULTIMEDIA_AUDIO_GETVOLUMEINUNITOFDBBYSTREAM_0100';
      //define manager
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioVolumeManager:audio.AudioVolumeManager = audioManager.getVolumeManager();

      try{
        let StreamUsage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
        let volumeDb : double = audioVolumeManager.getVolumeInUnitOfDbByStream(StreamUsage,5,audio.DeviceType.SPEAKER)
        console.error(`Gets the volume db value that system calculate by volume stream,volume level and device type success`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(`${TagFrmwk},getDevucesSync FAILED,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETVOLUMEBYSTREAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETVOLUMEBYSTREAM_STATIC_0100
     * @tc.desc   getVolumeByStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_GETVOLUMEBYSTREAM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_MULTIMEDIA_AUDIO_GETVOLUMEBYSTREAM_STATIC_0100';
      //define manager
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioVolumeManager:audio.AudioVolumeManager = audioManager.getVolumeManager();

      //define audiorenderer Parameter
      let StreamUsage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo:audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let audioRendererOptions:audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRenderer:audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);
      console.info(`${TAG},createAudioRenderer SUCCESS`);
      let StreamVolumeValue:int = audioVolumeManager.getVolumeByStream(StreamUsage);
      console.info(`${TAG},getStreamVolume SUCCESS,StreamVolumeValue : ${StreamVolumeValue}`);

      await audioRenderer!.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err:Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('afterAll called')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9800
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9800
     * @tc.desc   AudioRenderer - CallBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.SYSTEM_GLOBAL
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null | undefined;

      let bufferSize: long | undefined;

      audio.createAudioRenderer(audioRendererOptions,(err: BusinessError | null, data: audio.AudioRenderer | null | undefined) => {
        if (err) {
          console.error(`AudioRenderer Created: Error: ${err}`);
          expect(true).assertFalse();
        } else {
          console.info('AudioRenderer Created: SUCCESS');
          audioRenderer = data;
          data?.start((err: BusinessError | null) => {
            if (err) {
              console.error('Renderer start failed.');
              expect(true).assertFalse();
            } else {
              console.info('Renderer start success.');
            }
          });
          data?.getRendererInfo((err: BusinessError | null, audioRendererInfo: audio.AudioRendererInfo | undefined) => {
            if (err) {
              console.error(`Failed to get renderer info. Code: ${err.code}, message: ${err.message}`);
              expect(true).assertFalse();
            } else {
              expect(audio.SourceType.SOURCE_TYPE_CAMCORDER).assertEqual(13);
              console.info(`Succeeded in getting renderer info, AudioRendererInfo: ${JSON.stringify(audioRendererInfo)}.`);
            }
          });
          data?.getStreamInfo((err: BusinessError | null, streamInfo: audio.AudioStreamInfo | undefined) => {
            if (err) {
              console.error(`Failed to get StreamInfo info. Code: ${err.code}, message: ${err.message}`);
              expect(true).assertFalse();
            } else {
              console.info('Renderer GetStreamInfo:');
              console.info(`Renderer sampling rate: ${streamInfo?.samplingRate}`);
              console.info(`Renderer channel: ${streamInfo?.channels}`);
              console.info(`Renderer format: ${streamInfo?.sampleFormat}`);
              console.info(`Renderer encoding type: ${streamInfo?.encodingType}`);
            }
          });
          data?.getBufferSize((err: BusinessError | null, value: long | undefined) => {
            if (err) {
              console.error('getBufferSize error');
              expect(true).assertFalse();
            } else {
              bufferSize = value;
              console.info(`AudioFrameworkRenderLog: getBufferSize: SUCCESS ${value}`);
            }
          });
          data?.drain((err: BusinessError | null) => {
            if (err) {
              console.error('Renderer drain failed');
              expect(true).assertFalse();
            } else {
              console.info('Renderer drained.');
            }
          });
          data?.stop((err: BusinessError | null) => {
            if (err) {
              console.error('Renderer stop failed');
              expect(true).assertFalse();
            } else {
              console.info('Renderer stopped.');
            }
          });
          await Utils.msSleep(1000);
          data?.release((err: BusinessError | null) => {
            if (err) {
              console.error('Renderer release failed');
              expect(true).assertFalse();
            } else {
              console.info('Renderer released.');
            }
          });
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9900
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9900
     * @tc.desc   AudioRenderer - appVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_9900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.APP_INDIVIDUAL
      };

      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      let audioRenderer: audio.AudioRenderer | null | undefined;
      let audioManager = audio.getAudioManager();
      let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();

      audio.createAudioRenderer(audioRendererOptions,(err: BusinessError | null, data: audio.AudioRenderer | null | undefined) => {
        if (err) {
          console.error(`AudioRenderer Created: Error: ${err}`);
          expect(true).assertFail();
        } else {
          console.info('AudioRenderer Created: SUCCESS');
          audioRenderer = data;
          audioRenderer?.getRendererInfo((err: BusinessError | null, audioRendererInfo: audio.AudioRendererInfo | undefined) => {
            if (err) {
              console.error(`Failed to get renderer info. Code: ${err.code}, message: ${err.message}`);
              expect(true).assertFalse();
            } else {
              console.info(`Succeeded in getting renderer info, AudioRendererInfo: ${JSON.stringify(audioRendererInfo)}.`);
              expect(audioRendererInfo?.volumeMode).assertEqual(1);
              expect(audio.AudioVolumeMode.APP_INDIVIDUAL).assertEqual(1);

              let appVolumeChangeCallback = (volumeEvent: audio.VolumeEvent) => {
                console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
                console.info(`Volume level: ${volumeEvent.volume} `);
                console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
              };
              audioVolumeManager.onAppVolumeChange(appVolumeChangeCallback);
              audioVolumeManager.setAppVolumePercentage(20).then(() => {
                console.info(`set app volume success.`);
              });
              audioVolumeManager.offAppVolumeChange(appVolumeChangeCallback);
            }
          });
          audioRenderer?.getAudioTime((err: BusinessError | null, timestamp: long | undefined) => {
            if (err) {
              console.error(`Failed to get AudioTime. Code: ${err.code}, message: ${err.message}`);
              expect(true).assertFalse();
            } else {
              console.info(`Current timestamp: ${timestamp}`);
              expect(timestamp).assertLargerOrEqual(0);
            }
          });
          await Utils.msSleep(1000);
          audioRenderer?.release((err: BusinessError | null) => {
            if (err) {
              console.error('Renderer release failed');
              expect(true).assertFalse();
            } else {
              console.info('Renderer released.');
            }
          });
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_10000
     * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_10000
     * @tc.desc   AudioRenderer - appVolumeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_10000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager = audio.getAudioManager();
      let audioVolumeManager: audio.AudioVolumeManager = audioManager.getVolumeManager();

      let appVolumeChangeCallback = (volumeEvent: audio.VolumeEvent) => {
        console.info(`STATIC_10000 VolumeType of stream: ${volumeEvent.volumeType} `);
        console.info(`STATIC_10000 Volume level: ${volumeEvent.volume} `);
        console.info(`STATIC_10000 Whether to updateUI: ${volumeEvent.updateUi} `);
        audioVolumeManager.offAppVolumeChange();
        done();
      };
      try {
        audioVolumeManager.onAppVolumeChange(appVolumeChangeCallback);
        await audioVolumeManager.setAppVolumePercentage(20);
      } catch (error: BusinessError) {
        console.info("SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_STATIC_10000 error:" + error);
        expect(false).assertTrue();
        done();
      }
      done();
    })

  })
}
