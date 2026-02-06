/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import audio from '@ohos.multimedia.audio';
import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility'
import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';


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
  rendererFlags: number
}

interface AudioRendererOptions {
  streamInfo: AudioStreamInfo,
  rendererInfo: AudioRendererInfo
}

interface AudioCapturerInfo {
  source: number,
  capturerFlags: number
}

interface AudioCapturerOptions {
  streamInfo: AudioStreamInfo,
  capturerInfo: AudioCapturerInfo
}

interface AudioStreamInfoCap {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface AudioStreamInfoRen {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface AudioCapturerOptionsRecplay {
  streamInfo: AudioStreamInfoCap,
  capturerInfo: AudioCapturerInfo
}

interface AudioRendererOptionsRecplay {
  streamInfo: AudioStreamInfoRen,
  rendererInfo: AudioRendererInfo
}

let testContext: common.UIAbilityContext;

export default function audioVoip() {
  describe('audioVoip', () => {
    let mediaDir: ESObject;
    let fdRead: number;
    let readpath: string;
    let fdPath: string;
    let filePath: string;
    let TagRender = "AudioFrameworkRenderLog";
    let TagRec = "AudioFrameworkRecLog";
    const AUDIOMANAGER = audio.getAudioManager();
    console.info(`${TagRender}: Create AudioManger Object JS Framework`);
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();

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
      console.info(`AudioFrameworkTest: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(() => {
      console.info(`AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      console.info(`AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
    })

    let getAbilityInfo = async (fileName: string) => {
      try {
        mediaDir = testContext.filesDir + '/' + fileName;
        console.info(`case2 mediaDir is : ${mediaDir}`);
      } catch (err) {
        console.log(`${TagRender}:case getFileDir err: ${err}`);
      }
    }

    let closeFileDescriptor = async (fileName: string) => {
      try {
        testContext.resourceManager.closeRawFdSync(fileName);
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`closeRawFd failed, error code: ${code}, message: ${message}.`);
      }
    }

    let getFdRead = async (pathName: string) => {
      try {
        filePath = testContext.filesDir + '/' + pathName;
        console.info(`case4 filePath is : ${filePath}`);
      } catch (err) {
        console.log(`${TagRender}:case getFilesDir err:  ${err}`);
      }
      fdPath = 'fd://';
      await fileio.open(filePath).then((fdNumber) => {
        fdPath = fdPath + '' + fdNumber;
        fdRead = fdNumber;
        console.info(`[fileIO]case open fd success,fdPath is : ${fdPath}`);
        console.info(`[fileIO]case open fd success,fdRead is : ${fdRead}`);

      }, (err: BusinessError) => {
        console.info(`[fileIO]case open fd err : ${err}`);
      }).catch((error: BusinessError) => {
        console.info(`[fileIO]case catch open fd failed : ${error}`);
      });
    }

    let playbackPromise = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string) => {
      let resultFlag: string | boolean = 'new';
      console.info(`${TagRender}: Promise : Audio Playback Function`);

      let audioRen: audio.AudioRenderer | ESObject;
      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${TagRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRender}: AudioRender Created : ERROR : ${err.message}`);
        return resultFlag;
      });

      console.info(`${TagRender}: AudioRenderer : Path : ${pathName}`);

      console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

      await audioRen.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
        console.info(`${TagRender}: Renderer getStreamInfo:`);
        console.info(`${TagRender}: Renderer sampleFormat: ${audioParamsGet.sampleFormat}`);
        console.info(`${TagRender}: Renderer samplingRate: ${audioParamsGet.samplingRate}`);
        console.info(`${TagRender}: Renderer channels: ${audioParamsGet.channels}`);
        console.info(`${TagRender}: Renderer encodingType: ${audioParamsGet.encodingType}`);
      }).catch((err: BusinessError) => {
        console.log(`${TagRender}: getStreamInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as boolean | string == false) {
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await audioRen.getRendererInfo().then((audioParamsGet: ESObject) => {
        console.info(`${TagRender}: Renderer RendererInfo:`);
        console.info(`${TagRender}: Renderer content type: ${audioParamsGet.content}`);
        console.info(`${TagRender}: Renderer usage: ${audioParamsGet.usage}`);
        console.info(`${TagRender}: Renderer rendererFlags: ${audioParamsGet.rendererFlags}`);
      }).catch((err: BusinessError) => {
        console.log(`${TagRender}: RendererInfo :ERROR: ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as boolean | string == false) {
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await audioRen.start().then(() => {
        console.info(`${TagRender}: renderInstant started :SUCCESS `);
      }).catch((err: BusinessError) => {
        console.info(`${TagRender}: renderInstant start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as boolean | string == false) {
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

      let bufferSize: ESObject;
      await audioRen.getBufferSize().then((data: ESObject) => {
        console.info(`${TagRender}: getBufferSize :SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: BusinessError) => {
        console.info(`${TagRender}: getBufferSize :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as boolean | string == false) {
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      let ss = fileio.fdopenStreamSync(fdRead, 'r');
      console.info(`${TagRender}: case2: File Path: ${ss}`);
      let discardHeader = new ArrayBuffer(44);
      ss.readSync(discardHeader);
      let totalSize = fileio.fstatSync(fdRead).size;
      console.info(`${TagRender}: case3: File totalSize size: ${totalSize}`);
      totalSize = totalSize - 44;
      console.info(`${TagRender}: File size : Removing header: ${totalSize}`);
      let rlen = 0;
      while (rlen < totalSize / 4) {
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info(`${TagRender}: BufferAudioFramework: bytes read from file: ${rlen}`);
        await audioRen.write(buf);
        if (rlen > (totalSize / 2)) {
          await AUDIOMANAGER.getAudioScene().then((data) => {
            console.info(`${TagRender}:AudioFrameworkAudioScene: getAudioScene : Value : ${data}`);
          }).catch((err: BusinessError) => {
            console.info(`${TagRender}:AudioFrameworkAudioScene: getAudioScene : ERROR : ${err.message}`);
            resultFlag = false;
          });
        }
      }
      console.info(`${TagRender}: Renderer after read`);

      await audioRen.drain().then(() => {
        console.info(`${TagRender}: Renderer drained : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.error(`${TagRender}: Renderer drain: ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as boolean | string == false) {
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

      await audioRen.stop().then(() => {
        console.info(`${TagRender}: Renderer stopped : SUCCESS`);
        resultFlag = true;
        console.info(`${TagRender}: resultFlagRen : ${resultFlag}`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRender}: Renderer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

      await audioRen.release().then(() => {
        console.info(`${TagRender}: Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRender}: Renderer release :ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);
      console.info(`${TagRender}: resultFlag : ${resultFlag}`);

      return resultFlag;
    }

    let recPromise = async (AudioCapturerOptions: audio.AudioCapturerOptions, fpath: string) => {
      let resultFlag: string | boolean = 'new';
      console.info(`${TagRec}: Promise : Audio Recording Function`);

      let audioCap: ESObject;

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${TagRec}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRec}: AudioCapturer Created : ERROR : ${err.message}`);
        return resultFlag;
      });

      console.info(`${TagRec}: AudioCapturer : Path : ${fpath}`);

      console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

      await audioCap.getStreamInfo().then((audioParamsGet: ESObject) => {
        if (audioParamsGet != undefined) {
          console.info(`${TagRec}: Capturer getStreamInfo:`);
          console.info(`${TagRec}: Capturer sampleFormat: ${audioParamsGet.sampleFormat}`);
          console.info(`${TagRec}: Capturer samplingRate: ${audioParamsGet.samplingRate}`);
          console.info(`${TagRec}: Capturer channels: ${audioParamsGet.channels}`);
          console.info(`${TagRec}: Capturer encodingType: ${audioParamsGet.encodingType}`);
        } else {
          console.info(`${TagRec}: audioParamsGet is : ${audioParamsGet}`);
          console.info(`${TagRec}: audioParams getStreamInfo are incorrect: `);
          resultFlag = false;
        }
      }).catch((err: BusinessError) => {
        console.log(`${TagRec}: getStreamInfo  :ERROR: ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as string | boolean == false) {
        console.info(`${TagRec}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await audioCap.getCapturerInfo().then((audioParamsGet: ESObject) => {
        if (audioParamsGet != undefined) {
          console.info(`${TagRec}: Capturer CapturerInfo:`);
          console.info(`${TagRec}: Capturer SourceType: ${audioParamsGet.source}`);
          console.info(`${TagRec}: Capturer capturerFlags: ${audioParamsGet.capturerFlags}`);
        } else {
          console.info(`${TagRec}: audioParamsGet is : ${audioParamsGet}`);
          console.info(`${TagRec}: audioParams getCapturerInfo are incorrect: `);
          resultFlag = false;
        }
      }).catch((err: BusinessError) => {
        console.log(`${TagRec}: CapturerInfo :ERROR:  ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as string | boolean == false) {
        console.info(`${TagRec}: resultFlag : ${resultFlag}`);
        return resultFlag;
      }

      await audioCap.start().then(() => {
        console.info(`${TagRec}: Capturer started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRec}: Capturer start :ERROR : ${err.message}`);
        resultFlag = false;
      });
      if (resultFlag as string | boolean == false) {
        console.info(`${TagRec}: resultFlag :  ${resultFlag}`);
        return resultFlag;
      }

      console.info(`${TagRec}: AudioCapturer : STATE :  ${audioCap.state}`);

      let bufferSize: ESObject = await audioCap.getBufferSize();
      console.info(`${TagRec}: buffer size: ${bufferSize}`);

      let fd = fileio.openSync(fpath, 0o102, 0o777);
      if (fd !== null) {
        console.info(`${TagRec}: file fd created`);
      } else {
        console.info(`${TagRec}: Capturer start :ERROR : `);
        resultFlag = false;
        return resultFlag;
      }

      fd = fileio.openSync(fpath, 0o2002, 0o666);
      if (fd !== null) {
        console.info(`${TagRec}: file fd opened : Append Mode :PASS`);
      } else {
        console.info(`${TagRec}: file fd Open: Append Mode : FAILED`);
        resultFlag = false;
        return resultFlag;
      }
      await sleep(100);
      let numBuffersToCapture = 45;
      while (numBuffersToCapture) {
        console.info(`${TagRec}: ---------READ BUFFER---------`);
        let buffer: ESObject = await audioCap.read(bufferSize, true);
        await sleep(50);
        console.info(`${TagRec}: ---------WRITE BUFFER---------`);
        let number = fileio.writeSync(fd, buffer);
        console.info(`${TagRec}:BufferRecLog: data written: ${number}`);
        await sleep(50);
        numBuffersToCapture--;
      }
      await sleep(1000);
      console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

      await audioCap.stop().then(() => {
        console.info(`${TagRec}: Capturer stopped : SUCCESS`);
        resultFlag = true;
        console.info(`${TagRec}: resultFlag : ${resultFlag}`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRec}: Capturer stop:ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

      await audioCap.release().then(() => {
        console.info(`${TagRec}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${TagRec}: Capturer release :ERROR : ${err.message}`);
        resultFlag = false;
      });

      console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

      return resultFlag;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_0100
     * @tc.name      : AudioRenderer-Set1-Media
     * @tc.desc      : AudioRenderer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      await getFdRead("StarWars10s-1C-44100-2SW.wav");
      let resultFlag = await playbackPromise(AudioRendererOptions, filePath);
      await sleep(100);
      console.info(`${TagRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      await closeFileDescriptor(filePath);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      await getAbilityInfo("capture_js-44100-2C-16B.pcm");
      let resultFlag = await recPromise(AudioCapturerOptions, mediaDir);
      await sleep(100);
      console.info(`${TagRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfoCap: AudioStreamInfoCap = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptionsRecplay = {
        streamInfo: AudioStreamInfoCap,
        capturerInfo: AudioCapturerInfo
      }

      let AudioStreamInfoRen: AudioStreamInfoRen = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptionsRecplay = {
        streamInfo: AudioStreamInfoRen,
        rendererInfo: AudioRendererInfo
      }

      await getAbilityInfo("capture_js-44100-2C-16B-2.pcm");
      recPromise(AudioCapturerOptions, mediaDir);
      await sleep(500);

      readpath = 'StarWars10s-1C-44100-2SW.wav';
      await getFdRead(readpath);
      let resultFlag = await playbackPromise(AudioRendererOptions, readpath);
      await sleep(100);
      console.info(`${TagRender}: resultFlag : ${resultFlag}`);
      expect(resultFlag).assertTrue();
      await closeFileDescriptor(readpath);
      done();
    })
  });
}