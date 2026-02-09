/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import MediaTestBase from './MediaTestBase.test';
import { FdObject } from './MediaTestBase.test';
import { testAVPlayerFun, setSource, PlayTest, sleep } from './AVPlayerTestBase.test';
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { globalThis } from './Util.test';
import resourceManager from '@ohos.resourceManager';

let avTranscoder: media.AVTranscoder | null = null;
let fileDescriptor: media.AVFileDescriptor | undefined = undefined;
let outputFdObject: FdObject | null = null;
let inputName = '';
let outputName = '';
let pauseProgress = 101;
let times = 0;
let mediaTestBase = new MediaTestBase()
const PAUSE_TIME = 1000;

const CREATEAVTRANSCODER_PROMISE_EVENT = 'createPromise';
const PREPAREAVTRANSCODER_PROMISE_EVENT = 'preparePromise';
const STARTAVTRANSCODER_PROMISE_EVENT = 'startPromise';
const PAUSEAVTRANSCODER_PROMISE_EVENT = 'pausePromise';
const RESUMEAVTRANSCODER_PROMISE_EVENT = 'resumePromise';
const CANCELAVTRANSCODER_PROMISE_EVENT = 'cancelPromise';
const RELEASEAVTRANSCODER_PROMISE_EVENT = 'releasePromise';
const ERROR_EVENT = 'error';
const END_EVENT = 'end';

const SETONCALLBACK_EVENT = 'setAVTransCoderCallback';
const SET_SRC_AND_DST = 'setSrcAndDst';

let avTranscoderConfig: media.AVTranscoderConfig = {
  audioBitrate: 200000,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 3000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 720,
  videoFrameHeight: 480,
}

async function closeRawFd(fileName: string) {
  globalThis.abilityContext!!.resourceManager.closeRawFd(fileName)
    .then(() => {
      console.log('case closeRawFd ' + fileName);
    })
    .catch((error: Error) => {
      console.log('case closeRawFd err: ' + error);
    })
}

function toNextStep(avTranscoder: media.AVTranscoder | null, config: media.AVTranscoderConfig, pauseTime: int,
  steps: Array<string>, done: () => void) {

  if (steps[0] == END_EVENT) {
    console.info('case success!!');
    done();
  }
  switch (steps[0]) {
    case CREATEAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
        media.createAVTranscoder().then((transcoder: media.AVTranscoder | undefined) => {
          if (transcoder != null) {
            avTranscoder = transcoder;
            console.info('Succeeded in creating AVTranscoder');
            toNextStep(avTranscoder, config, pauseTime, steps, done);
          } else {
            console.error('Failed to create AVTranscoder');
          }
        }).catch((error: Error) => {
          console.error(`Failed to create AVTranscoder, error message:${error}`);
          expect(steps[0]).assertEqual(ERROR_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case PREPAREAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
        avTranscoder!.prepare(config).then(() => {
          console.info('prepare success');
          setTimeout(() => {
            toNextStep(avTranscoder, config, pauseTime, steps, done);
          }, 1000)
        }).catch((err: Error) => {
          console.info('prepare failed and catch error is ' + err.message);
          expect(steps[0]).assertEqual(ERROR_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case STARTAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
        console.info('case STARTAVTRANSCODER_PROMISE_EVENT in');
        avTranscoder?.start().then(() => {
          console.info('start success');
        }).catch((err: Error) => {
          console.info('start failed and catch error is ' + err.message);
          expect(steps[0]).assertEqual(ERROR_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case PAUSEAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
        avTranscoder?.pause().then(() => {
          console.info('pause AVTranscoder success');
          setTimeout(() => {
            console.info('PAUSEAVTRANSCODER_PROMISE_EVENT setTimeout success');
            toNextStep(avTranscoder, config, pauseTime, steps, done);
          }, pauseTime);
        }).catch((err: Error) => {
          console.info('pause AVTranscoder failed and catch error is ' + err.message);
          expect(steps[0]).assertEqual(ERROR_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case RESUMEAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
        avTranscoder?.resume().then(() => {
          console.info('resume AVTranscoder success');
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        }).catch((err: Error) => {
          console.info('resume AVTranscoder failed and catch error is ' + err.message);
          expect(steps[0]).assertEqual(ERROR_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case CANCELAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
        avTranscoder?.cancel().then(() => {
          console.info('cancel AVTranscoder success');
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        }).catch((err: Error) => {
          console.info('cancel AVTranscoder failed and catch error is ' + err.message);
          expect(steps[0]).assertEqual(ERROR_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case RELEASEAVTRANSCODER_PROMISE_EVENT:
      steps.shift();
      avTranscoder?.offComplete();
      avTranscoder?.offProgressUpdate();
        avTranscoder?.release().then(() => {
          console.info('release AVTranscoder success');
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        }).catch((err: Error) => {
          console.info('release AVTranscoder failed and catch error is ' + err.message);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        });
      break;
    case ERROR_EVENT:
      steps.shift();
      console.info('Error event occurred');
      toNextStep(avTranscoder, config, pauseTime, steps, done);
      break;
    case SETONCALLBACK_EVENT:
      steps.shift();
      try {
        if (avTranscoder) {
          setCallback(avTranscoder!!, config, pauseTime, steps, done);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
        }
      } catch (error) {
        console.info('setAVTranscoderCallback failed and catch error is ' + JSON.stringify(error));
      }
      break;
    case SET_SRC_AND_DST:
      steps.shift();
      try {
        console.info('case SET_SRC_AND_DST in');
          if (fileDescriptor && avTranscoder) {
            avTranscoder!!.fdSrc = fileDescriptor!!;
          }
          if (outputFdObject && outputFdObject!!.fdNumber && avTranscoder) {
            avTranscoder!!.fdDst = outputFdObject!!.fdNumber!.toInt();
          }
          expect(steps[0]).assertEqual(PREPAREAVTRANSCODER_PROMISE_EVENT);
          toNextStep(avTranscoder, config, pauseTime, steps, done);
      } catch (error) {
        console.info('SET_SRC_AND_DST failed and catch error is ' + JSON.stringify(error));
      }
      break;
    default:
      break;
  }
}

function setCallback(avTranscoder: media.AVTranscoder, config: media.AVTranscoderConfig, pauseTime: int,
  steps: Array<string>, done: () => void) {
    // 转码进度
    avTranscoder.onProgressUpdate((progress: int) => {
      console.info('avTranscoder progressUpdate = ' + progress);
      // to pause
      if (progress > 100) {
        console.info('avTranscoder progressUpdate');
        expect(steps[0]).assertEqual(ERROR_EVENT);
        toNextStep(avTranscoder, config, pauseTime, steps, done);
      }
      if (progress >= pauseProgress && times == 0) {
        console.info('avTranscoder progressUpdate');
        times++;
        expect(steps[0]).assertEqual(PAUSEAVTRANSCODER_PROMISE_EVENT);
        toNextStep(avTranscoder, config, pauseTime, steps, done);
      }
    })
    // 错误上报回调函数
    avTranscoder.onError((err: BusinessError) => {
      try {
        console.error('error ocConstantSourceNode, error message is ' + err);
        toNextStep(avTranscoder, config, pauseTime, steps, done);
      } catch (error) {
        // 处理错误
        console.error('when error on execute releaseRecorderPromise error message is ' + error);
      }
    });
    // 转码完成事件
    avTranscoder.onComplete(() => {
      console.info('avTranscoder complete');
      toNextStep(avTranscoder, config, pauseTime, steps, done);
    });
}

function resourceName() {
  let timestamp = Date.now();
  let filename = `TransCoder_${timestamp}.mp4`;
  return filename;
}

function getDSt(outputName: string) {
  outputName = globalThis.abilityContext!!.filesDir + "/" + outputName;
  console.info("case outputName is" + outputName);
  let fdObject: FdObject = {
    fileAsset: null,
    fdNumber: null
  }
  let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
  try {

  } catch (err) {
    console.info('case getDSt err: ' + err);
  }
  fdObject.fileAsset = file;
  if (file) {
    fdObject.fdNumber = file.fd;
  }
  console.info('case getDSt number is: ' + fdObject.fdNumber);
  return fdObject;
}

async function getfdScrAndfdDst() {
  console.info('case getfdScrAndfdDst start');
  await mediaTestBase.getFileDescriptorFromFileDir(inputName, () => {}).then((res: media.AVFileDescriptor) => {
    fileDescriptor = { fd: res!.fd } as media.AVFileDescriptor;
  });
  outputFdObject = getDSt(outputName);
  console.info('case getfdScrAndfdDst end');
}

export default function AVTransCoderTest() {
  describe('AVTransCoderTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      await mediaTestBase.msleepAsync(500);
      avTranscoder = null;
      outputFdObject = null;
      outputName = '';
      inputName = '';
      pauseProgress = 101;
      times = 0;
    });
    afterEach(async () => {
      console.info('afterEach case');
      if (avTranscoder != null) {
          await avTranscoder!!.release().then(() => {
            console.info('this testCase execution completed');
          }).catch(mediaTestBase.catchCallback);
        }
      if (outputFdObject) {
        await mediaTestBase.closeFd(outputFdObject!!.fdNumber);
      }
      try {
        fs.closeSync(fileDescriptor!.fd);
      } catch (error) {
        console.info('closeRawFd' + error);
      }
      await mediaTestBase.msleepAsync(500);
    });
    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AVTANSCODER_static_0100
     * @tc.number SUB_MULTIMEDIA_AVTANSCODER_static_0100
     * @tc.desc   Transcoder start-pause-resume-stop-release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVTANSCODER_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_AVTANSCODER_0100 start');
      outputName = resourceName();
      pauseProgress = 30;
      inputName = "H264_AAC.mp4";
      await getfdScrAndfdDst();
      let mySteps = new Array<string>(
        // create
        CREATEAVTRANSCODER_PROMISE_EVENT, SETONCALLBACK_EVENT, SET_SRC_AND_DST,
        // prepare
        PREPAREAVTRANSCODER_PROMISE_EVENT,
        // start Transcoder
        STARTAVTRANSCODER_PROMISE_EVENT,
        // pause Transcoder
        PAUSEAVTRANSCODER_PROMISE_EVENT,
        // resume Transcoder
        RESUMEAVTRANSCODER_PROMISE_EVENT,
        // release Transcoder
        RELEASEAVTRANSCODER_PROMISE_EVENT,
        // end
        END_EVENT);
      expect(outputFdObject).not().assertNull();
      toNextStep(avTranscoder, avTranscoderConfig, PAUSE_TIME, mySteps, done)
      console.info('SUB_MULTIMEDIA_AVTANSCODER_0100 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AVTANSCODER_static_0200
     * @tc.number SUB_MULTIMEDIA_AVTANSCODER_static_0200
     * @tc.desc   Transcoder start-pause-resume-cancel-release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVTANSCODER_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_AVTANSCODER_0200 start');
      outputName = resourceName();
      pauseProgress = 30;
      inputName = "H264_AAC.mp4";
      await getfdScrAndfdDst();
      expect(outputFdObject).not().assertNull();
      let mySteps = new Array<string>(
        // create
        CREATEAVTRANSCODER_PROMISE_EVENT, SETONCALLBACK_EVENT, SET_SRC_AND_DST,
        // prepare
        PREPAREAVTRANSCODER_PROMISE_EVENT,
        // start Transcoder
        STARTAVTRANSCODER_PROMISE_EVENT,
        // pause Transcoder
        PAUSEAVTRANSCODER_PROMISE_EVENT,
        // resume Transcoder
        RESUMEAVTRANSCODER_PROMISE_EVENT,
        // cancel Transcoder
        CANCELAVTRANSCODER_PROMISE_EVENT,
        // release Transcoder
        RELEASEAVTRANSCODER_PROMISE_EVENT,
        // end
        END_EVENT);
      toNextStep(avTranscoder, avTranscoderConfig, PAUSE_TIME, mySteps, done)
      console.info('SUB_MULTIMEDIA_AVTANSCODER_0200 end');
    });
  })
}
