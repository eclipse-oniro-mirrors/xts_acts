/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import MediaTestBase from './MediaTestBase';
import { Permissions } from '@kit.AbilityKit';
import Common from './AVRecorderCommon';
import { LOG_TAG, MediaErrorCode, SLEEP_TIME_20, SLEEP_TIME_200, SLEEP_TIME_500, SLEEP_TIME_2000 } from '../Constants';
import { audio } from '@kit.AudioKit';
import { sleep } from '../common';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'AVRecorderTest';

const IDLE = 'idle';
const PREPARED = 'prepared';
const STARTED = 'started';
const PAUSED = 'paused';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';

let mediaTestBase = new MediaTestBase();
let commonFun: Common = new Common();
let mAvRecord: media.AVRecorder | null = null;
let fdObject: ESObject;
let fdPath: string;

let avProfile: media.AVRecorderProfile = {
  audioBitrate: 100000, // 音频比特率。
  audioChannels: 2, // 音频声道数。
  audioCodec: media.CodecMimeType.AUDIO_AAC, // 音频编码格式，当前支持ACC，MP3，G711MU。
  audioSampleRate: 48000, // 音频采样率。
  fileFormat: media.ContainerFormatType.CFT_MPEG_4A, // 封装格式，当前支持MP4，M4A，MP3，WAV。
};

let videoProfile: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
}

let avConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT, // 音频输入源，这里设置为麦克风。
  profile: avProfile,
  url: 'fd://', // 使用前需要替换url
};

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
  url: 'fd://', // 使用前需要替换url
};

export function resourceName() {
  let timestamp = Date.now();
  let filename = `avRecorder_${timestamp}.m4a`;
  return filename;
}

export async function createAvRecorderPromise(): Promise<media.AVRecorder | null> {
  await media.createAVRecorder().then((recorder: media.AVRecorder) => {
    if (recorder) {
      mAvRecord = recorder;
      let state = mAvRecord.state;
      console.info(TAG, 'Succeeded in creating AVRecorder state =' + state);
      expect(mAvRecord.state).assertEqual(IDLE);
    } else {
      console.error(TAG, 'Failed to create AVRecorder');
      expect().assertFail();
    }
  }).catch((error: BusinessError) => {
    console.error(TAG, `Failed to create AVRecorder, error message:${error?.message}`);
    expect().assertFail();
  });
  return mAvRecord;
}

async function createAvRecorderCallback() {
  media.createAVRecorder((error: BusinessError, recorder: media.AVRecorder) => {
    if (recorder) {
      console.info(TAG, 'Succeeded in creating AVRecorder');
      mAvRecord = recorder;
      let state = mAvRecord.state;
      console.info(TAG, 'Succeeded in creating AVRecorder state =' + state);
      expect(mAvRecord.state).assertEqual(IDLE);
    } else {
      console.error(TAG, `Failed to create AVRecorder, error message:${error?.message}`);
      expect().assertFail();
    }
  });
}

async function initConfigAndPreparedCallback(sourceType: media.AudioSourceType, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'initConfigAndPreparedCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'initConfigAndPreparedCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    await initAvConfig(sourceType);
    console.info(TAG, 'initConfigAndPreparedCallback url=' + avConfig.url + ',state =' + mAvRecord?.state);
    mAvRecord?.prepare(avConfig, (err: BusinessError) => {
      if (err) {
        console.error(TAG, 'initConfigAndPreparedCallback Failed to prepare and error is ' + err?.message);
        expect().assertFail();
        reject();
      } else {
        console.info(TAG, 'initConfigAndPreparedCallback  Succeeded in preparing');
        expect(true).assertTrue();
        resolve();
      }
      done();
    });
  });
}

async function initConfigAndPreparedPromise(sourceType: media.AudioSourceType) {
  if (mAvRecord != null) {
    await initAvConfig(sourceType);
    console.info(TAG, 'initConfigAndPreparedPromise url=' + avConfig.url + ',state =' + mAvRecord.state);
    await mAvRecord.prepare(avConfig).then(() => {
      console.info(TAG, 'initConfigAndPreparedPromise Succeeded in preparing');
      expect(mAvRecord?.state).assertEqual(PREPARED);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'initConfigAndPreparedPromise Failed to prepare and catch error is ' + err?.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'initConfigAndPreparedPromise error.');
    expect().assertFail();
  }
}

async function initVideoConfigAndPreparedPromise(sourceType: media.VideoSourceType) {
  if (mAvRecord != null) {
    await initVideoConfig(sourceType);
    console.info(TAG, 'initVideoConfigAndPreparedPromise url=' + avConfig.url + ',state =' + mAvRecord.state);
    await mAvRecord.prepare(videoConfig).then(() => {
      console.info(TAG, 'Succeeded in preparing');
      expect(mAvRecord?.state).assertEqual(PREPARED);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'initVideoConfigAndPreparedPromise Failed to prepare and catch error is ' + err?.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'initVideoConfigAndPreparedPromise error.');
    expect().assertFail();
  }
}

async function avRecorderStartCallbackNormal(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecorderStartCallbackNormal start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecorderStartCallbackNormal  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecorderStartCallbackNormal stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          mAvRecord?.start((err: BusinessError) => {
            if (err) {
              console.error(TAG, 'avRecorderStartCallbackNormal Failed to start AVRecorder and error is ' + JSON);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'avRecorderStartCallbackNormal Succeeded in starting AVRecorder');
              expect(mAvRecord?.state).assertEqual(STARTED);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

function avRecorderStartCallbackAbnormal(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, ' avRecorderStartCallbackAbnormal startState =' + mAvRecord.state);
    mAvRecord.start((err: BusinessError) => {
      if (err) {
        console.error(TAG, 'Failed to start AVRecorder and error is ' + JSON.stringify(err));
        expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);

      } else {
        console.info(TAG, 'Succeeded in starting AVRecorder');
        expect().assertFail();
      }
      done();
    });
  } else {
    console.error(TAG, 'avRecorderStartCallbackAbnormal error.');
    expect().assertFail();
  }
  done();
}

async function avRecorderStartPromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderStartPromiseNormal url=' + avConfig?.url + ',state =' + mAvRecord.state);
    await mAvRecord.start().then(() => {
      console.info(TAG, 'avRecorderStartPromiseNormal Succeeded in starting AVRecorder');
      expect(mAvRecord?.state).assertEqual(STARTED);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'avRecorderStartPromiseNormal Failed to start AVRecorder and catch error is ' + err?.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'avRecorderStartPromiseNormal createAvRecorderPromise error.');
    expect().assertFail();
  }
}

async function avRecorderStartPromiseAbnormal(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderStartPromiseAbnormal url=' + avConfig.url + ',state =' + mAvRecord.state);
    await mAvRecord.start().then(() => {
      console.info(TAG, 'avRecorderStartPromiseAbnormal Succeeded in starting AVRecorder');
      expect().assertFail();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'avRecorderStartPromiseAbnormal Failed to start AVRecorder and catch error is ' + err?.code);
      expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      done();
    });
  } else {
    console.error(TAG, 'avRecorderStartPromiseAbnormal error.');
    expect().assertFail();
  }
  done();
}

async function avRecorderPauseCallbackNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderPauseCallbackNormal startState 1 =' + mAvRecord.state);
    mAvRecord.pause((err: BusinessError) => {
      if (err) {
        console.error(TAG,
          'Failed to pause AVRecorder and error is ' + err + JSON.stringify(err) + ',sate =' + mAvRecord?.state);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in pausing');
        expect(mAvRecord?.state).assertEqual(PAUSED);
      }
    });
  } else {
    console.error(TAG, 'avRecorderPauseCallbackNormal error.');
    expect().assertFail();
  }
}

async function avRecordStartAndStopCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordStartAndStopCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordStartAndStopCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordStartAndStopCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await mAvRecord?.start();
          break;
        case STARTED:
          await commonFun.msleepAsync(SLEEP_TIME_2000);
          mAvRecord?.stop((err: BusinessError) => {
            if (err) {
              console.error(TAG,
                'avRecordStartAndStopCallback Failed to stop AVRecorder and error is ' + err + JSON.stringify(err) + ',sate =' +
                  mAvRecord?.state);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'avRecordStartAndStopCallback Succeeded in stopping AVRecorder.');
              expect(mAvRecord?.state).assertEqual(STOPPED);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecordStopCallbackAbnormal(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordStopCallbackAbnormal start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordStopCallbackAbnormal  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordStopCallbackAbnormal stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          mAvRecord?.stop((err: BusinessError) => {
            if (err) {
              console.error(TAG,
                'avRecordStopCallbackAbnormal Failed to stop AVRecorder and error is ' + err + JSON.stringify(err) +
                  ',sate =' + mAvRecord?.state);
              expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
              resolve();
            } else {
              console.info(TAG,
                'avRecordStopCallbackAbnormal Succeeded in stopping AVRecorder, state =' + mAvRecord?.state);
              expect().assertFail();
              reject();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecordPauseAndStopCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordPauseAndStopCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordPauseAndStopCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordPauseAndStopCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await mAvRecord?.start();
          break;
        case STARTED:
          await commonFun.msleepAsync(SLEEP_TIME_2000);
          await mAvRecord?.pause();
          break;
        case PAUSED:
          mAvRecord?.stop((err: BusinessError) => {
            if (err) {
              console.error(TAG,
                'avRecordPauseAndStopCallback Failed to stop AVRecorder and error is ' + err + JSON.stringify(err) +
                  ',sate =' + mAvRecord?.state);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'avRecordPauseAndStopCallback Succeeded in stopping AVRecorder.');
              expect(mAvRecord?.state).assertEqual(STOPPED);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecordResumeAndStopCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordResumeAndStopCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordResumeAndStopCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    let isFirstTime = true;
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordResumeAndStopCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await mAvRecord?.start();
          break;
        case STARTED:
          if (isFirstTime) {
            await commonFun.msleepAsync(SLEEP_TIME_2000);
            await mAvRecord?.pause();
            isFirstTime = false;
          } else {
            mAvRecord?.stop((err: BusinessError) => {
              if (err) {
                console.error(TAG,
                  'avRecordResumeAndStopCallback Failed to stop AVRecorder and error is ' + err + JSON.stringify(err) +
                    ',sate =' +
                    mAvRecord?.state);
                expect().assertFail();
                reject();
              } else {
                console.info(TAG, 'avRecordPauseAndStopCallback Succeeded in stopping AVRecorder.');
                expect(mAvRecord?.state).assertEqual(STOPPED);
                resolve();
              }
            });
          }
          break;
        case PAUSED:
          await mAvRecord?.resume();
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecordPauseAndResumeCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordPauseAndResumeCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordPauseAndResumeCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordPauseAndResumeCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await mAvRecord?.start();
          break;
        case STARTED:
          await commonFun.msleepAsync(SLEEP_TIME_2000);
          await mAvRecord?.pause();
          break;
        case PAUSED:
          mAvRecord?.resume((err: BusinessError) => {
            if (err) {
              console.error(TAG,
                'avRecordPauseAndResumeCallback Failed to resume AVRecorder and error is ' + err + JSON.stringify(err) +
                  ',sate =' + mAvRecord?.state);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG,
                'avRecordPauseAndResumeCallback Succeeded in resuming AVRecorder, state =' + mAvRecord?.state);
              expect(mAvRecord?.state).assertEqual(STARTED);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecorderPausePromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderPausePromiseNormal startState  2=' + mAvRecord.state);
    await mAvRecord.pause().then(() => {
      console.info(TAG, 'Succeeded in pausing');
      expect(mAvRecord?.state).assertEqual(PAUSED);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to pause AVRecorder and catch error is ' + err.message);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'avRecorderPausePromiseNormal error.');
    expect().assertFail();
  }
}

async function avRecordStartAndResetCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordStartAndResetCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordStartAndResetCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordStartAndResetCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await mAvRecord?.start();
          break;
        case STARTED:
          await commonFun.msleepAsync(SLEEP_TIME_2000);
          mAvRecord?.reset((err: BusinessError) => {
            if (err) {
              console.error(TAG, 'Failed to reset AVRecorder and error is ' + err + JSON.stringify(err) + ',sate =' +
                mAvRecord?.state);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in resetting AVRecorder, state =' + mAvRecord?.state);
              expect(mAvRecord?.state).assertEqual(IDLE);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecordStopAndResetCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordStopAndResetCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordStopAndResetCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordStopAndResetCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await mAvRecord?.start();
          break;
        case STARTED:
          await commonFun.msleepAsync(SLEEP_TIME_2000);
          await mAvRecord?.stop();
          break;
        case STOPPED:
          mAvRecord?.reset((err: BusinessError) => {
            if (err) {
              console.error(TAG,
                'avRecordStopAndResetCallback Failed to reset AVRecorder and error is ' + err + JSON.stringify(err) +
                  ',sate =' + mAvRecord?.state);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG,
                'avRecordStopAndResetCallback Succeeded in resetting AVRecorder, state =' + mAvRecord?.state);
              expect(mAvRecord?.state).assertEqual(IDLE);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

async function avRecordPrepareAndResetCallback(sourceType: media.AudioSourceType): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecordPrepareAndResetCallback start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecordPrepareAndResetCallback  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.on('stateChange', async (state, reason) => {
      console.info(TAG, 'avRecordPrepareAndResetCallback stateChange state = ' + state);
      switch (state) {
        case PREPARED:
          await commonFun.msleepAsync(SLEEP_TIME_2000);
          mAvRecord?.reset((err: BusinessError) => {
            if (err) {
              console.error(TAG,
                'avRecordPrepareAndResetCallback Failed to reset AVRecorder and error is ' + err + JSON.stringify(err) +
                  ',sate =' + mAvRecord?.state);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG,
                'avRecordPrepareAndResetCallback Succeeded in resetting AVRecorder, state =' + mAvRecord?.state);
              expect(mAvRecord?.state).assertEqual(IDLE);
              resolve();
            }
          });
          break;
        case ERROR:
          expect().assertFail();
          await mAvRecord?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    await initConfigAndPreparedPromise(sourceType);
  });
}

function avRecorderReleaseCallbackNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderReleaseCallbackNormal startState =' + mAvRecord.state);
    mAvRecord.release((err: BusinessError) => {
      if (err) {
        console.error(TAG,
          'Failed to release AVRecorder and error is ' + err + JSON.stringify(err) + ',sate =' + mAvRecord?.state);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in releasing AVRecorder, state =' + mAvRecord?.state);
        expect(mAvRecord?.state).assertEqual(RELEASED);
      }
    });
  } else {
    console.error(TAG, 'avRecorderReleaseCallbackNormal error.');
    expect().assertFail();
  }
}

async function avRecorderResumePromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderResumePromiseNormal startState =' + mAvRecord.state);
    await mAvRecord.resume().then(() => {
      console.info(TAG, 'Succeeded in resuming AVRecorder');
      expect(mAvRecord?.state).assertEqual(STARTED);
    }).catch((err: BusinessError) => {
      console.error(TAG,
        'Failed to resume  AVRecorder failed and catch error is ' + err + JSON.stringify(err) + ',sate =' +
          mAvRecord?.state);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'avRecorderResumePromiseNormal error.');
    expect().assertFail();
  }
}

async function avRecorderStopPromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderStopPromiseNormal startState =' + mAvRecord.state);
    await mAvRecord.stop().then(() => {
      console.info(TAG, 'Succeeded in stopping AVRecorder, state = ' + mAvRecord?.state);
      expect(mAvRecord?.state).assertEqual(STOPPED);
    }).catch((err: BusinessError) => {
      console.error(TAG,
        'Failed to stop AVRecorder and catch error is ' + err + JSON.stringify(err) + ',sate =' +
          mAvRecord?.state + ',Code = ' + err?.code);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'avRecorderStopPromiseNormal error.');
    expect().assertFail();
  }
}

async function avRecorderResetPromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderResetPromiseNormal startState =' + mAvRecord.state);
    await mAvRecord.reset().then(() => {
      console.info(TAG, 'Succeeded in resting AVRecorde, state = ' + mAvRecord?.state);
      expect(mAvRecord?.state).assertEqual(IDLE);
    }).catch((err: BusinessError) => {
      console.error(TAG,
        'Failed to reset AVRecorder and catch error is ' + err + JSON.stringify(err) + ',sate =' +
          mAvRecord?.state + ',Code = ' + err?.code);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'avRecorderResetPromiseNormal error.');
    expect().assertFail();
  }
}

async function avRecorderReleasePromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderReleasePromiseNormal startState =' + mAvRecord.state);
    await mAvRecord.release().then(() => {
      console.info(TAG, 'Succeeded in releasing AVRecorde, state = ' + mAvRecord?.state);
      expect(mAvRecord?.state).assertEqual(RELEASED);
    }).catch((err: BusinessError) => {
      console.error(TAG,
        'Failed to release AVRecorder and catch error is ' + err + JSON.stringify(err) + ',sate =' +
          mAvRecord?.state + ',Code = ' + err?.code);
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'avRecorderReleasePromiseNormal error.');
    expect().assertFail();
  }
}

async function avRecorderResumeCallbackAbnormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderResumeCallbackAbnormal startState =' + mAvRecord.state);
    mAvRecord.resume((err: BusinessError) => {
      if (err) {
        console.error(TAG,
          'Failed to resume AVRecorder and error is ' + err + JSON.stringify(err) + ',sate =' +
            mAvRecord?.state);
        expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      } else {
        console.info(TAG, 'Succeeded in resuming AVRecorder, state =' + mAvRecord?.state);
        expect().assertFail();
      }
    });
  } else {
    console.error(TAG, 'avRecorderResumeCallbackAbnormal error.');
    expect().assertFail();
  }
}

async function avRecorderStopCallbackAbnormal(): Promise<void> {
  return new Promise(async (resolve, reject) => {
    console.info(TAG, 'avRecorderStopCallbackAbnormal without prepare start.');
    if (!mAvRecord) {
      console.error(TAG, 'avRecorderStopCallbackAbnormal  mAvRecord is null.');
      expect().assertFail();
      reject();
    }
    mAvRecord?.stop((err: BusinessError) => {
      if (err) {
        console.error(TAG,
          'avRecorderStopCallbackAbnormal Failed to stop AVRecorder and error is ' + err + JSON.stringify(err) +
            ',sate =' + mAvRecord?.state);
        expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
        resolve();
      } else {
        console.info(TAG,
          'avRecorderStopCallbackAbnormal Succeeded in stopping AVRecorder, state =' + mAvRecord?.state);
        expect().assertFail();
        reject();
      }
    });
  });
}

async function avRecorderResumePromiseAbnormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderResumePromiseAbnormal startState =' + mAvRecord.state);
    await mAvRecord.resume().then(() => {
      console.info(TAG, 'Succeeded in resuming AVRecorder');
      expect().assertFail();
    }).catch((err: BusinessError) => {
      console.error(TAG,
        'Failed to resume  AVRecorder failed and catch error is ' + err + JSON.stringify(err) + ',sate =' +
          mAvRecord?.state);
      expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
    });
  } else {
    console.error(TAG, 'avRecorderResumePromiseAbnormal error.');
    expect().assertFail();
  }
}

async function avRecorderStopPromiseAbnormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderStopPromiseAbnormal startState =' + mAvRecord.state);
    await mAvRecord.stop().then(() => {
      console.info(TAG, 'Succeeded in stopping AVRecorder');
      expect().assertFail();
    }).catch((err: BusinessError) => {
      console.error(TAG,
        'Failed to stop AVRecorder and catch error is ' + err + JSON.stringify(err) + ',sate =' +
          mAvRecord?.state);
      expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
    });
  } else {
    console.error(TAG, 'avRecorderStopPromiseAbnormal error.');
    expect().assertFail();
  }
}

function avRecorderPauseCallbackAbnormal(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderPauseCallbackAbnormal startState ' + mAvRecord.state);
    mAvRecord.pause((err: BusinessError) => {
      if (err) {
        console.error(TAG,
          'Failed to pause AVRecorder and error is ' + err + JSON.stringify(err) + ',sate =' + mAvRecord?.state);
        expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      } else {
        console.info(TAG, 'Succeeded in pausing');
        expect(mAvRecord?.state).assertEqual(PAUSED);
      }
      done();
    });
  } else {
    console.error(TAG, 'avRecorderPauseCallbackAbnormal error.');
    expect().assertFail();
  }
  done();
}

async function avRecorderPausePromiseAbnormal(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'avRecorderPausePromiseAbnormal startState ' + mAvRecord.state);
    mAvRecord.pause().then(() => {
      console.info(TAG, 'Succeeded in pausing');
      expect().assertFail();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to pause AVRecorder and catch error is ' + err.message);
      expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      done();
    });
  } else {
    console.error(TAG, 'avRecorderPausePromiseAbnormal error.');
    expect().assertFail();
  }
  done();
}

function getAVRecorderConfigCallback(sourceType: media.AudioSourceType, done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getAVRecorderConfigCallback mAvRecord state =' + mAvRecord.state);
    mAvRecord.getAVRecorderConfig((err: BusinessError, config: media.AVRecorderConfig) => {
      if (err) {
        console.error(TAG, 'Failed to get avConfig and error is ' + err?.message);
        expect().assertFail();
      } else {
        console.info(TAG,
          'Succeeded in getting AVRecorderConfig avConfig.audioSourceType =' + avConfig.audioSourceType);
        expect(avConfig.audioSourceType).assertEqual(sourceType);
      }
      done();
    });
  } else {
    console.error(TAG, 'getAVRecorderConfigCallback error.');
    expect().assertFail();
  }
  done();
}

async function getAVRecorderConfigPromise(sourceType: media.AudioSourceType, done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getAVRecorderConfigPromise mAvRecord state =' + mAvRecord.state);
    await mAvRecord.getAVRecorderConfig().then((config: media.AVRecorderConfig) => {
      console.info(TAG, 'Succeeded in getting AVRecorderConfig, audioSourceType =' + config.audioSourceType);
      expect(config.audioSourceType).assertEqual(sourceType);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to get AVRecorderConfig and catch error is ' + err.message);
    })
  } else {
    console.error(TAG, 'PROMISE getAVRecorderConfigPromise error.');
    expect().assertFail();
  }
  done();
}

async function getInputSurfaceCallbackNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'getInputSurfaceCallbackNormal mAvRecord state =' + mAvRecord.state);
    mAvRecord.getInputSurface((err: BusinessError, surfaceId: string) => {
      if (err) {
        console.error(TAG, 'Failed to do getInputSurface and error is, error is' + err + JSON.stringify(err));
        expect().assertFalse();
      } else {
        console.info(TAG, 'Succeeded in doing getInputSurface, surfaceId =' + surfaceId);
        expect(true).assertTrue();
      }
    });
  } else {
    console.error(TAG, 'getInputSurfaceCallbackNormal mAvRecord error.');
    expect().assertFail();
  }
}

async function getInputSurfacePromiseNormal() {
  if (mAvRecord != null) {
    console.info(TAG, 'getInputSurfacePromiseNormal mAvRecord state =' + mAvRecord.state);
    mAvRecord.getInputSurface().then((surfaceId: string) => {
      console.info(TAG, 'Succeeded in getting InputSurface,surfaceID =' + surfaceId);
      expect(true).assertTrue();
    }).catch((err: BusinessError) => {
      console.error(TAG, ' Failed to get InputSurface and catch error is ' + JSON.stringify(err));
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'getInputSurfacePromiseNormal mAvRecord error.');
    expect().assertFail();
  }
}

function getInputSurfaceCallbackAbnormal(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getInputSurfaceCallbackAbnormal mAvRecord state =' + mAvRecord.state);
    mAvRecord.getInputSurface((err: BusinessError, surfaceId: string) => {
      if (err) {
        console.error(TAG, 'Failed to do getInputSurface and error is ' + JSON.stringify(err));
        expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      } else {
        console.info(TAG, 'Succeeded in doing getInputSurface, surfaceId =' + surfaceId);
        expect(true).assertTrue();
      }
      done();
    });
  } else {
    console.error(TAG, 'getInputSurfaceCallbackAbnormal mAvRecord error.');
    expect().assertFail();
  }
  done();
}

async function getInputSurfacePromiseAbnormal(done: Function) {
  if (mAvRecord != null) {
    mAvRecord.getInputSurface().then((surfaceId: string) => {
      console.info(TAG, 'Succeeded in getting getInputSurfacePromiseAbnormal surfaceId =' + surfaceId);
      expect(true).assertTrue();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to getInputSurfacePromiseAbnormal and catch error is ' + JSON.stringify(err));
      expect(err?.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
    });
  } else {
    console.error(TAG, 'getInputSurfacePromiseAbnormal error.');
    expect().assertFail();
  }
  done();
}

async function updateRotationPromiseAbnormal(rotation: number, done: Function) {
  if (mAvRecord) {
    await mAvRecord.updateRotation(rotation).then(() => {
      console.info(TAG, 'Succeeded in updateRotation');
      expect().assertFail();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to updateRotation and catch error is error' + err + JSON.stringify(err));
      expect(err?.code);
    });
  } else {
    console.error(' Failed to create avRecord.');
    expect().assertFail();
  }
  done();
}

async function updateRotationPromiseAbnormal2(rotation: number, done: Function) {
  if (mAvRecord) {
    await mAvRecord.updateRotation(rotation).then(() => {
      console.info(TAG, 'Succeeded in updateRotation');
      expect().assertFail();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to updateRotation and catch error is error' + err + JSON.stringify(err));
      expect(err?.code).assertEqual(MediaErrorCode.PARAMETER_ERROR);
      done();
    });
  } else {
    console.error(TAG, 'Failed to create avRecord.');
    expect().assertFail();
  }
  done();
}

async function updateRotationPromiseNormal(rotation: number, done: Function) {
  if (mAvRecord) {
    await mAvRecord.updateRotation(rotation).then(() => {
      console.info(TAG, 'Succeeded in updateRotation');
      expect(true).assertTrue();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to updateRotation and catch error is error' + err + JSON.stringify(err));
      expect().assertFail();
    });
  } else {
    console.error(TAG, 'Failed to create avRecord.');
    expect().assertFail();
  }
  done();
}

export function setVideoRecordedCallback(done: Function) {
  mAvRecord?.on('stateChange', async (state, reason) => {
    console.info(TAG, 'mAvRecord stateChange state = ' + state + ', reason: ' + reason);
    switch (state) {
      case IDLE:
        if (!mAvRecord) {
          console.info(TAG, `avPlayer is null`);
          break;
        }
        expect(mAvRecord.state).assertEqual(IDLE);
        break;
      case PREPARED:
        break;
      case STARTED:
        break;
      case PAUSED:
        break;
      case STOPPED:
        break;
      case RELEASED:
        console.info(TAG, 'release avRecorder.');
        done();
        break;
      case ERROR:
        expect().assertFail();
        mAvRecord?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        mAvRecord = null;
        break;
      default:
        break;
    }
  });
  mAvRecord?.on('error', (err: BusinessError) => {
    console.error(TAG, `avRecorder failed, code is ${err.code}, message is ${err.message}`);
    expect().assertFail();
    done;
  });
}

export function offCallback(typeArr: Array<string>) {
  if (mAvRecord == null) {
    console.info(TAG, 'avRecord is null');
    return;
  }
  for (let i = 0; i < typeArr.length; i++) {
    switch (typeArr[i]) {
      case 'stateChange':
        mAvRecord.off('stateChange');
        break;
      case 'photoAssetAvailable':
        mAvRecord.off('photoAssetAvailable');
        break;
      case 'audioCapturerChange':
        mAvRecord.off('audioCapturerChange');
        break;
      case 'error':
        mAvRecord.off('error');
        break;
      default:
        break;
    }
  }
}

function getCurrentAudioCapturerInfoCallback(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getCurrentAudioCapturerInfoCallback mAvRecord state = ' + mAvRecord.state);
    mAvRecord.getCurrentAudioCapturerInfo((err: BusinessError, capturerInfo: audio.AudioCapturerChangeInfo) => {
      if (err) {
        console.error(TAG, 'Failed to get CurrentAudioCapturerInfo and error is ' + JSON.stringify(err));
        expect(err.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      } else {
        console.info(TAG,
          'Succeeded in getting CurrentAudioCapturerInfo, streamId: ' + capturerInfo.streamId + ', source: ' +
          capturerInfo.capturerInfo.source);
        expect(capturerInfo.streamId > 0).assertTrue();
      }
      done();
    });
  } else {
    console.error(TAG, 'getCurrentAudioCapturerInfoCallback mAvRecord error.');
    expect().assertFail();
  }
  done();
}

async function getCurrentAudioCapturerInfoPromise(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getCurrentAudioCapturerInfoPromise mAvRecord state = ' + mAvRecord.state);
    await mAvRecord.getCurrentAudioCapturerInfo().then((capturerInfo: audio.AudioCapturerChangeInfo) => {
      console.info(TAG,
        'Succeeded in getting CurrentAudioCapturerInfo, streamId: ' + capturerInfo.streamId + ', source: ' +
        capturerInfo.capturerInfo.source);
      expect(capturerInfo.streamId > 0).assertTrue();
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to get CurrentAudioCapturerInfo and error is ' + JSON.stringify(err));
      expect(err.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      done();
    });
  } else {
    console.error(TAG, 'getCurrentAudioCapturerInfoPromise mAvRecord error.');
    expect().assertFail();
  }
  done();
}

function getAudioCapturerMaxAmplitudeCallback(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getAudioCapturerMaxAmplitudeCallback mAvRecord state = ' + mAvRecord.state);
    mAvRecord.getAudioCapturerMaxAmplitude((err: BusinessError, amplitude: number) => {
      if (err) {
        console.error(TAG, 'Failed to get AudioCapturerMaxAmplitude and error is ' + JSON.stringify(err));
        expect(err.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      } else {
        console.info(TAG, 'Succeeded in getting AudioCapturerMaxAmplitude, amplitude: ' + amplitude);
        expect(amplitude).assertLargerOrEqual(0);
      }
      done();
    });
  } else {
    console.error(TAG, 'getAudioCapturerMaxAmplitudeCallback mAvRecord error.');
    expect().assertFail();
  }
  done();
}

async function getAudioCapturerMaxAmplitudePromise(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getAudioCapturerMaxAmplitudePromise mAvRecord state = ' + mAvRecord.state);
    await mAvRecord.getAudioCapturerMaxAmplitude().then((amplitude: number) => {
      console.info(TAG, 'Succeeded in getting AudioCapturerMaxAmplitude, amplitude: ' + amplitude);
      expect(amplitude).assertLargerOrEqual(0);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to get AudioCapturerMaxAmplitude and error is ' + JSON.stringify(err));
      expect(err.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      done();
    });
  } else {
    console.error(TAG, 'getAudioCapturerMaxAmplitudePromise mAvRecord error.');
    expect().assertFail();
  }
  done();
}

function getAvailableEncoderCallback(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getAvailableEncoderCallback mAvRecord state = ' + mAvRecord.state);
    mAvRecord.getAvailableEncoder((err: BusinessError, info: media.EncoderInfo[]) => {
      if (err) {
        console.error(TAG, 'Failed to get AvailableEncoder and error is ' + JSON.stringify(err));
        expect(err.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      } else {
        console.info(TAG, 'Succeeded in getting AvailableEncoder, info: ' + JSON.stringify(info));
        expect(info.length).assertLarger(0);
      }
      done();
    });
  } else {
    console.error(TAG, 'getAvailableEncoderCallback mAvRecord error.');
    expect().assertFail();
  }
  done();
}

async function getAvailableEncoderPromise(done: Function) {
  if (mAvRecord != null) {
    console.info(TAG, 'getAvailableEncoderPromise mAvRecord state = ' + mAvRecord.state);
    await mAvRecord.getAvailableEncoder().then((info: media.EncoderInfo[]) => {
      console.info(TAG, 'Succeeded in getting AvailableEncoder, info: ' + JSON.stringify(info));
      expect(info.length).assertLarger(0);
    }).catch((err: BusinessError) => {
      console.error(TAG, 'Failed to get AvailableEncoder and error is ' + JSON.stringify(err));
      expect(err.code).assertEqual(MediaErrorCode.OPERATE_NOT_PERMIT);
      done();
    });
  } else {
    console.error(TAG, 'getAvailableEncoderPromise mAvRecord error.');
    expect().assertFail();
  }
  done();
}

function audioCapturerChangeListen() {
  if (mAvRecord != null) {
    mAvRecord.on('audioCapturerChange', (audioCapturerChangeInfo: audio.AudioCapturerChangeInfo) => {
      console.info(TAG, 'audioCapturerChange called');
      let info = audioCapturerChangeInfo;
      expect(info).not().assertUndefined();
    });
  } else {
    console.error(TAG, 'getCurrentAudioCapturerInfoPromise mAvRecord error.');
    expect().assertFail();
  }
}

function photoAssetAvailableListen() {
  if (mAvRecord != null) {
    mAvRecord.on('photoAssetAvailable', async (asset: photoAccessHelper.PhotoAsset) => {
      console.info(TAG, 'photoAssetAvailable called');
      if (asset != undefined) {
        await commonFun.saveVideo(asset);
        console.info(TAG, 'case saveVideo end');
      } else {
        console.error(TAG, 'photoAsset is undefined');
      }
    });
  }
}

async function initAvConfig(sourceType: media.AudioSourceType) {
  let fileName: string = resourceName();
  fdObject = await commonFun.getFd(fileName);
  fdPath = "fd://" + fdObject.fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  avConfig.audioSourceType = sourceType;
  avConfig.url = fdPath;
  return avConfig;
}

async function initVideoConfig(sourceType: media.VideoSourceType) {
  let fileName: string = resourceName();
  fdObject = await commonFun.getFd(fileName);
  fdPath = "fd://" + fdObject.fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath;
  videoConfig.videoSourceType = sourceType;
  return videoConfig;
}

export default function AVRecorderTest() {
  describe('AVRecorderTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll in');
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA'];
      await commonFun.getPermission(permissionNames);
      await commonFun.msleepAsync(SLEEP_TIME_500);
      await commonFun.driveFn();
      console.info(TAG, 'beforeAll out');
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
      await commonFun.sleep(SLEEP_TIME_500);
      mAvRecord = null;
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach start.');
      await sleep(SLEEP_TIME_200);
      if (mAvRecord) {
        console.info(TAG, 'afterEach mAvRecord not null.');
        mAvRecord?.off('stateChange');
        await mAvRecord.release().then(() => {
          console.info(TAG, 'afterEach case release avRecord success.');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      if (fdObject && fdObject.fdNumber !== null) {
        console.info(TAG, 'afterEach case close file.');
        await commonFun.closeFd(fdObject.fdNumber);
        fdObject.fdNumber = null;
        await commonFun.unlinkFd(fdPath);
      }
      console.info(TAG, 'afterEach case');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
    });

    /**
     * @tc.name   createAVRecorder_callback_001
     * @tc.number AV_RECORDER_FUNC_TEST_001
     * @tc.desc   Test creat AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVRecorder_callback_001', Level.LEVEL0, async (done: Function) => {
      await createAvRecorderCallback();
      done();
    })

    /**
     * @tc.name   createAVRecorder_promise_001
     * @tc.number AV_RECORDER_FUNC_TEST_002
     * @tc.desc   Test creat AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVRecorder_promise_001', Level.LEVEL0, async (done: Function) => {
      await createAvRecorderPromise();
      done();
    })

    /**
     * @tc.name   prepareAVRecorder_callback_001
     * @tc.number AV_RECORDER_FUNC_TEST_003
     * @tc.desc   Test prepare AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_callback_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT, done);
    })

    /**
     * @tc.name   prepareAVRecorder_callback_002
     * @tc.number AV_RECORDER_FUNC_TEST_004
     * @tc.desc   Test prepare AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_callback_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, done);
    })

    /**
     * @tc.name   prepareAVRecorder_callback_003
     * @tc.number AV_RECORDER_FUNC_TEST_005
     * @tc.desc   Test prepare AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_callback_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION, done);
    })

    /**
     * @tc.name   prepareAVRecorder_callback_004
     * @tc.number AV_RECORDER_FUNC_TEST_006
     * @tc.desc   Test prepare AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_callback_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION, done);
    })

    /**
     * @tc.name   prepareAVRecorder_callback_005
     * @tc.number AV_RECORDER_FUNC_TEST_007
     * @tc.desc   Test prepare AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_callback_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE, done);
    })

    /**
     * @tc.name   prepareAVRecorder_callback_006
     * @tc.number AV_RECORDER_FUNC_TEST_008
     * @tc.desc   Test prepare AvRecorder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_callback_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER, done);
    })

    /**
     * @tc.name   prepareAVRecorder_promise_001
     * @tc.number AV_RECORDER_FUNC_TEST_009
     * @tc.desc   Test prepare AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_promise_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   prepareAVRecorder_promise_002
     * @tc.number AV_RECORDER_FUNC_TEST_010
     * @tc.desc   Test prepare AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_promise_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   prepareAVRecorder_promise_003
     * @tc.number AV_RECORDER_FUNC_TEST_011
     * @tc.desc   Test prepare AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_promise_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   prepareAVRecorder_promise_004
     * @tc.number AV_RECORDER_FUNC_TEST_012
     * @tc.desc   Test prepare AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_promise_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   prepareAVRecorder_promise_005
     * @tc.number AV_RECORDER_FUNC_TEST_013
     * @tc.desc   Test prepare AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_promise_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   prepareAVRecorder_promise_006
     * @tc.number AV_RECORDER_FUNC_TEST_014
     * @tc.desc   Test prepare AvRecorder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('prepareAVRecorder_promise_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   getAVRecorderConfig_callback_001
     * @tc.number AV_RECORDER_FUNC_TEST_015
     * @tc.desc   Test getAVRecorderConfig callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_callback_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      getAVRecorderConfigCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_callback_002
     * @tc.number AV_RECORDER_FUNC_TEST_016
     * @tc.desc   Test getAVRecorderConfig callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_callback_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      getAVRecorderConfigCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_callback_003
     * @tc.number AV_RECORDER_FUNC_TEST_017
     * @tc.desc   Test getAVRecorderConfig callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_callback_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      getAVRecorderConfigCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_callback_004
     * @tc.number AV_RECORDER_FUNC_TEST_018
     * @tc.desc   Test getAVRecorderConfig callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_callback_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      getAVRecorderConfigCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_callback_005
     * @tc.number AV_RECORDER_FUNC_TEST_019
     * @tc.desc   Test getAVRecorderConfig callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_callback_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      getAVRecorderConfigCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_callback_006
     * @tc.number AV_RECORDER_FUNC_TEST_020
     * @tc.desc   Test getAVRecorderConfig callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_callback_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      getAVRecorderConfigCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_promise_001
     * @tc.number AV_RECORDER_FUNC_TEST_021
     * @tc.desc   Test getAVRecorderConfig promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_promise_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await getAVRecorderConfigPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_promise_002
     * @tc.number AV_RECORDER_FUNC_TEST_022
     * @tc.desc   Test getAVRecorderConfig promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_promise_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      getAVRecorderConfigPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_promise_003
     * @tc.number AV_RECORDER_FUNC_TEST_023
     * @tc.desc   Test getAVRecorderConfig promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_promise_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      getAVRecorderConfigPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_promise_004
     * @tc.number AV_RECORDER_FUNC_TEST_024
     * @tc.desc   Test getAVRecorderConfig promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_promise_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      getAVRecorderConfigPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_promise_005
     * @tc.number AV_RECORDER_FUNC_TEST_025
     * @tc.desc   Test getAVRecorderConfig promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_promise_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      getAVRecorderConfigPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE, done);
    })

    /**
     * @tc.name   getAVRecorderConfig_promise_006
     * @tc.number AV_RECORDER_FUNC_TEST_026
     * @tc.desc   Test getAVRecorderConfig promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAVRecorderConfig_promise_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      getAVRecorderConfigPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER, done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_027
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_callback_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_028
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_callback_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_029
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_callback_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_030
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_callback_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_031
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_callback_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_032
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_callback_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_callback_abnormal_007
     * @tc.number AV_RECORDER_FUNC_TEST_033
     * @tc.desc   Test abnormal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getInputSurface_callback_abnormal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      getInputSurfaceCallbackAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_034
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await getInputSurfacePromiseAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_035
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await getInputSurfacePromiseAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_036
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await getInputSurfacePromiseAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_037
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await getInputSurfacePromiseAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_038
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await getInputSurfacePromiseAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_039
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await getInputSurfacePromiseAbnormal(done);
    })

    /**
     * @tc.name   getInputSurface_promise_abnormal_007
     * @tc.number AV_RECORDER_FUNC_TEST_040
     * @tc.desc   Test abnormal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getInputSurface_promise_abnormal_007', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await getInputSurfacePromiseAbnormal(done);
    })

    // Todo 用例无法通过会失败，可能条件未满足，报错信息是 Failed to do getInputSurface and error is, error isBusinessError:
    //  The operate GetInputSurface failed due to not permit in current state.{"code":5400102,"name":"BusinessError"}
    // 测试用video类型的config才能拿到surfaceId，但是接口描述未进行介绍
    /**
     * @tc.name   getInputSurface_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_041
     * @tc.desc   Test normal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getInputSurface_callback_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initVideoConfigAndPreparedPromise(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV);
      getInputSurfaceCallbackNormal();
      done();
    })

    /**
     * @tc.name   getInputSurface_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_042
     * @tc.desc   Test normal scene of getInputSurface callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getInputSurface_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initVideoConfigAndPreparedPromise(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES);
      getInputSurfaceCallbackNormal();
      done();
    })

    /**
     * @tc.name   getInputSurface_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_043
     * @tc.desc   Test normal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getInputSurface_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initVideoConfigAndPreparedPromise(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV);
      await getInputSurfacePromiseNormal();
      done();
    })

    /**
     * @tc.name   getInputSurface_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_044
     * @tc.desc   Test normal scene of getInputSurface promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getInputSurface_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initVideoConfigAndPreparedPromise(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV);
      await getInputSurfacePromiseNormal();
      done();
    })

    /**
     * @tc.name   updateRotation_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_045
     * @tc.desc   Test abnormal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await updateRotationPromiseAbnormal(90, done);
    })

    /**
     * @tc.name   updateRotation_promise_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_046
     * @tc.desc   Test abnormal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_abnormal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await updateRotationPromiseAbnormal(30, done);
    })

    /**
     * @tc.name   updateRotation_promise_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_047
     * @tc.desc   Test abnormal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_abnormal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await updateRotationPromiseAbnormal(-10, done);
    })

    /**
     * @tc.name   updateRotation_promise_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_048
     * @tc.desc   Test abnormal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_abnormal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await updateRotationPromiseAbnormal2(170, done);
    })

    /**
     * @tc.name   updateRotation_promise_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_049
     * @tc.desc   Test abnormal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_abnormal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await updateRotationPromiseAbnormal2(-100, done);
    })

    /**
     * @tc.name   updateRotation_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_050
     * @tc.desc   Test normal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await updateRotationPromiseNormal(0, done);
    })

    /**
     * @tc.name   updateRotation_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_051
     * @tc.desc   Test normal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await updateRotationPromiseNormal(90, done);
    })

    /**
     * @tc.name   updateRotation_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_052
     * @tc.desc   Test normal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await updateRotationPromiseNormal(90, done);
    })

    /**
     * @tc.name   updateRotation_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_053
     * @tc.desc   Test normal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await updateRotationPromiseNormal(180, done);
    })

    /**
     * @tc.name   updateRotation_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_054
     * @tc.desc   Test normal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await updateRotationPromiseNormal(180, done);
    })

    /**
     * @tc.name   updateRotation_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_055
     * @tc.desc   Test normal scene of updateRotation promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateRotation_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await updateRotationPromiseNormal(270, done);
    })

    /**
     * @tc.name   start_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_056
     * @tc.desc   Test normal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      done();
    })

    /**
     * @tc.name   start_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_057
     * @tc.desc   Test normal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      done();
    })

    /**
     * @tc.name   start_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_058
     * @tc.desc   Test normal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      done();
    })

    /**
     * @tc.name   start_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_059
     * @tc.desc   Test normal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      done();
    })

    /**
     * @tc.name   start_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_060
     * @tc.desc   Test normal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      done();
    })

    /**
     * @tc.name   start_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_061
     * @tc.desc   Test normal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      done();
    })

    /**
     * @tc.name   start_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_062
     * @tc.desc   Test normal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackNormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   start_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_063
     * @tc.desc   Test normal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackNormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   start_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_064
     * @tc.desc   Test normal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackNormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   start_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_065
     * @tc.desc   Test normal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackNormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   start_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_066
     * @tc.desc   Test normal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackNormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   start_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_067
     * @tc.desc   Test normal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackNormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   start_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_068
     * @tc.desc   Test abnormal scene of start avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_promise_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartPromiseAbnormal(done);
    })

    /**
     * @tc.name   start_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_069
     * @tc.desc   Test abnormal scene of start avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('start_callback_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStartCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_070
     * @tc.desc   Test normal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPauseCallbackNormal();
      done();
    })

    /**
     * @tc.name   pause_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_071
     * @tc.desc   Test normal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPauseCallbackNormal();
      done();
    })

    /**
     * @tc.name   pause_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_072
     * @tc.desc   Test normal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPauseCallbackNormal();
      done();
    })

    /**
     * @tc.name   pause_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_073
     * @tc.desc   Test normal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPauseCallbackNormal();
      done();
    })

    /**
     * @tc.name   pause_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_074
     * @tc.desc   Test normal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPauseCallbackNormal();
      done();
    })

    /**
     * @tc.name   pause_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_075
     * @tc.desc   Test normal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPauseCallbackNormal();
      done();
    })

    /**
     * @tc.name   pause_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_076
     * @tc.desc   Test normal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      done();
    })

    /**
     * @tc.name   pause_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_077
     * @tc.desc   Test normal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      done();
    })

    /**
     * @tc.name   pause_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_078
     * @tc.desc   Test normal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      done();
    })

    /**
     * @tc.name   pause_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_079
     * @tc.desc   Test normal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      done();
    })

    /**
     * @tc.name   pause_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_080
     * @tc.desc   Test normal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      done();
    })

    /**
     * @tc.name   pause_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_081
     * @tc.desc   Test normal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      done();
    })

    /**
     * @tc.name   pause_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_082
     * @tc.desc   Test abnormal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_callback_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      avRecorderPauseCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_callback_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_083
     * @tc.desc   Test abnormal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('pause_callback_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      avRecorderPauseCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_callback_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_084
     * @tc.desc   Test abnormal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('pause_callback_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      avRecorderPauseCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_callback_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_085
     * @tc.desc   Test abnormal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('pause_callback_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      avRecorderPauseCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_callback_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_086
     * @tc.desc   Test abnormal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('pause_callback_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      avRecorderPauseCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_callback_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_087
     * @tc.desc   Test abnormal scene of pause avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('pause_callback_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      avRecorderPauseCallbackAbnormal(done);
    })

    /**
     * @tc.name   pause_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_088
     * @tc.desc   Test abnormal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderPausePromiseAbnormal(done);
    })

    /**
     * @tc.name   pause_promise_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_089
     * @tc.desc   Test abnormal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_abnormal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderPausePromiseAbnormal(done);
    })

    /**
     * @tc.name   pause_promise_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_090
     * @tc.desc   Test abnormal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_abnormal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderPausePromiseAbnormal(done);
    })

    /**
     * @tc.name   pause_promise_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_091
     * @tc.desc   Test abnormal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_abnormal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderPausePromiseAbnormal(done);
    })

    /**
     * @tc.name   pause_promise_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_092
     * @tc.desc   Test abnormal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_abnormal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderPausePromiseAbnormal(done);
    })

    /**
     * @tc.name   pause_promise_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_093
     * @tc.desc   Test abnormal scene of pause avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pause_promise_abnormal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderPausePromiseAbnormal(done);
    })

    /**
     * @tc.name   resume_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_094
     * @tc.desc   Test normal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_callback_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndResumeCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   resume_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_095
     * @tc.desc   Test normal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndResumeCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   resume_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_096
     * @tc.desc   Test normal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_callback_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndResumeCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   resume_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_097
     * @tc.desc   Test normal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_callback_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndResumeCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   resume_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_098
     * @tc.desc   Test normal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_callback_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndResumeCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   resume_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_099
     * @tc.desc   Test normal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_callback_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndResumeCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   resume_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_100
     * @tc.desc   Test normal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderResumePromiseNormal();
      done();
    })

    /**
     * @tc.name   resume_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_101
     * @tc.desc   Test normal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderResumePromiseNormal();
      done();
    })

    /**
     * @tc.name   resume_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_102
     * @tc.desc   Test normal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderResumePromiseNormal();
      done();
    })

    /**
     * @tc.name   resume_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_103
     * @tc.desc   Test normal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderResumePromiseNormal();
      done();
    })

    /**
     * @tc.name   resume_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_104
     * @tc.desc   Test normal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderResumePromiseNormal();
      done();
    })

    /**
     * @tc.name   resume_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_105
     * @tc.desc   Test normal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resume_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderResumePromiseNormal();
      done();
    })

    // Todo start（）之后也能resume成功，但是接口文档描述：需要在pause()事件成功触发后，才能调用resume方法。
    /**
     * @tc.name   resume_callback_abnormal_001
     * @tc.number resume_callback_abnormal_001
     * @tc.desc   resume_callback_abnormal_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    /*    it('resume_callback_abnormal_001', Level.LEVEL2, async (done: Function) => {
          await createAvRecorderPromise();
          await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
          await avRecorderStartPromiseNormal();
          avRecorderResumeCallbackAbnormal();
          done();
        });*/

    /**
     * @tc.name   resume_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_106
     * @tc.desc   Test abnormal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_callback_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      avRecorderResumeCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   resume_callback_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_107
     * @tc.desc   Test abnormal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_callback_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      avRecorderResumeCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   resume_callback_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_108
     * @tc.desc   Test abnormal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_callback_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      avRecorderResumeCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   resume_callback_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_109
     * @tc.desc   Test abnormal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_callback_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      avRecorderResumeCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   resume_callback_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_110
     * @tc.desc   Test abnormal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_callback_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      avRecorderResumeCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   resume_callback_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_111
     * @tc.desc   Test abnormal scene of resume avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_callback_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      avRecorderResumeCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   resume_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_112
     * @tc.desc   Test abnormal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_promise_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderResumePromiseAbnormal();
      done();
    })

    /**
     * @tc.name   resume_promise_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_113
     * @tc.desc   Test abnormal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_promise_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderResumePromiseAbnormal();
      done();
    })

    /**
     * @tc.name   resume_promise_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_114
     * @tc.desc   Test abnormal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_promise_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderResumePromiseAbnormal();
      done();
    })

    /**
     * @tc.name   resume_promise_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_115
     * @tc.desc   Test abnormal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_promise_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderResumePromiseAbnormal();
      done();
    })

    /**
     * @tc.name   resume_promise_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_116
     * @tc.desc   Test abnormal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_promise_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderResumePromiseAbnormal();
      done();
    })

    /**
     * @tc.name   resume_promise_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_117
     * @tc.desc   Test abnormal scene of resume avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resume_promise_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderResumePromiseAbnormal();
      done();
    })

    // 测试Stop接口正常场景,预期是需要在start()或pause()事件成功触发后，才能调用stop方法
    /**
     * @tc.name   stop_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_118
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_119
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_120
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_121
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_122
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_123
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_007
     * @tc.number AV_RECORDER_FUNC_TEST_124
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT)
      done();
    })

    /**
     * @tc.name   stop_callback_normal_008
     * @tc.number AV_RECORDER_FUNC_TEST_125
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_008', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_009
     * @tc.number AV_RECORDER_FUNC_TEST_126
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_009', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_010
     * @tc.number AV_RECORDER_FUNC_TEST_127
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_010', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_011
     * @tc.number AV_RECORDER_FUNC_TEST_128
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_011', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_012
     * @tc.number AV_RECORDER_FUNC_TEST_129
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_012', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPauseAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_013
     * @tc.number AV_RECORDER_FUNC_TEST_130
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_013', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordResumeAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_014
     * @tc.number AV_RECORDER_FUNC_TEST_131
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_014', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordResumeAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_015
     * @tc.number AV_RECORDER_FUNC_TEST_132
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_015', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordResumeAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_016
     * @tc.number AV_RECORDER_FUNC_TEST_133
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_016', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordResumeAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_017
     * @tc.number AV_RECORDER_FUNC_TEST_134
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_017', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordResumeAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   stop_callback_normal_018
     * @tc.number AV_RECORDER_FUNC_TEST_135
     * @tc.desc   Test normal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_normal_018', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordResumeAndStopCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   stop_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_136
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_137
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_138
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_139
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_140
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_141
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_007
     * @tc.number AV_RECORDER_FUNC_TEST_142
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_008
     * @tc.number AV_RECORDER_FUNC_TEST_143
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_008', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_009
     * @tc.number AV_RECORDER_FUNC_TEST_144
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_009', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_010
     * @tc.number AV_RECORDER_FUNC_TEST_145
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_010', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_011
     * @tc.number AV_RECORDER_FUNC_TEST_146
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_011', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    /**
     * @tc.name   stop_promise_normal_012
     * @tc.number AV_RECORDER_FUNC_TEST_147
     * @tc.desc   Test normal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_normal_012', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      done();
    })

    // 测试Stop接口异常场景,预期是需要在start()或pause()事件成功触发后，才能调用stop方法
    /**
     * @tc.name   stop_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_148
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopCallbackAbnormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   stop_callback_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_149
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopCallbackAbnormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   stop_callback_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_150
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopCallbackAbnormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   stop_callback_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_151
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopCallbackAbnormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   stop_callback_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_152
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopCallbackAbnormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   stop_callback_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_153
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopCallbackAbnormal(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   stop_callback_abnormal_007
     * @tc.number AV_RECORDER_FUNC_TEST_154
     * @tc.desc   Test abnormal scene of stop avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_callback_abnormal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStopCallbackAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_155
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_156
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_157
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_158
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_159
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_160
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   stop_promise_abnormal_007
     * @tc.number AV_RECORDER_FUNC_TEST_161
     * @tc.desc   Test abnormal scene of stop avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stop_promise_abnormal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderStopPromiseAbnormal();
      done();
    })

    /**
     * @tc.name   reset_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_162
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_163
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_164
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_165
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_166
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_167
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStartAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_007
     * @tc.number AV_RECORDER_FUNC_TEST_168
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_008
     * @tc.number AV_RECORDER_FUNC_TEST_169
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_008', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_009
     * @tc.number AV_RECORDER_FUNC_TEST_170
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_009', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_010
     * @tc.number AV_RECORDER_FUNC_TEST_171
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_010', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_011
     * @tc.number AV_RECORDER_FUNC_TEST_172
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_011', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_012
     * @tc.number AV_RECORDER_FUNC_TEST_173
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_callback_normal_012', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordStopAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   reset_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_174
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_175
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_176
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_177
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_178
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_179
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_007
     * @tc.number AV_RECORDER_FUNC_TEST_180
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_008
     * @tc.number AV_RECORDER_FUNC_TEST_181
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_008', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_009
     * @tc.number AV_RECORDER_FUNC_TEST_182
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_009', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_010
     * @tc.number AV_RECORDER_FUNC_TEST_183
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_010', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_011
     * @tc.number AV_RECORDER_FUNC_TEST_184
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_011', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_012
     * @tc.number AV_RECORDER_FUNC_TEST_185
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('reset_promise_normal_012', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_186
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_187
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_188
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_189
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_190
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_191
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_007
     * @tc.number AV_RECORDER_FUNC_TEST_192
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('release_callback_normal_007', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_008
     * @tc.number AV_RECORDER_FUNC_TEST_193
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_008', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_009
     * @tc.number AV_RECORDER_FUNC_TEST_194
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_009', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_010
     * @tc.number AV_RECORDER_FUNC_TEST_195
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_010', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_011
     * @tc.number AV_RECORDER_FUNC_TEST_196
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_011', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_012
     * @tc.number AV_RECORDER_FUNC_TEST_197
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_callback_normal_012', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_198
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_199
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_002', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_200
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_003', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_201
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_004', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_202
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_005', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_203
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_006', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_007
     * @tc.number AV_RECORDER_FUNC_TEST_204
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_007', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_008
     * @tc.number AV_RECORDER_FUNC_TEST_205
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_008', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_009
     * @tc.number AV_RECORDER_FUNC_TEST_206
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_009', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_010
     * @tc.number AV_RECORDER_FUNC_TEST_207
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_010', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_011
     * @tc.number AV_RECORDER_FUNC_TEST_208
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_011', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_012
     * @tc.number AV_RECORDER_FUNC_TEST_209
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('release_promise_normal_012', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_callback_normal_013
     * @tc.number AV_RECORDER_FUNC_TEST_210
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_013', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPrepareAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_014
     * @tc.number AV_RECORDER_FUNC_TEST_211
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_014', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPrepareAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_015
     * @tc.number AV_RECORDER_FUNC_TEST_212
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_015', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPrepareAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_016
     * @tc.number AV_RECORDER_FUNC_TEST_213
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_016', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPrepareAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_017
     * @tc.number AV_RECORDER_FUNC_TEST_214
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_017', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPrepareAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      done();
    })

    /**
     * @tc.name   reset_callback_normal_018
     * @tc.number AV_RECORDER_FUNC_TEST_215
     * @tc.desc   Test normal scene of reset avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_callback_normal_018', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecordPrepareAndResetCallback(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      done();
    })

    /**
     * @tc.name   reset_promise_normal_013
     * @tc.number AV_RECORDER_FUNC_TEST_216
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_013', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_014
     * @tc.number AV_RECORDER_FUNC_TEST_217
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_014', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_015
     * @tc.number AV_RECORDER_FUNC_TEST_218
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_015', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_016
     * @tc.number AV_RECORDER_FUNC_TEST_219
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_016', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_017
     * @tc.number AV_RECORDER_FUNC_TEST_220
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_017', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   reset_promise_normal_018
     * @tc.number AV_RECORDER_FUNC_TEST_221
     * @tc.desc   Test normal scene of reset avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('reset_promise_normal_018', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderResetPromiseNormal();
      done();
    })

    /**
     * @tc.name   release_callback_normal_013
     * @tc.number AV_RECORDER_FUNC_TEST_222
     * @tc.desc   Test normal scene of release avRecord callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('release_callback_normal_013', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      avRecorderReleaseCallbackNormal();
      done();
    })

    /**
     * @tc.name   release_promise_normal_013
     * @tc.number AV_RECORDER_FUNC_TEST_223
     * @tc.desc   Test normal scene of release avRecord promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('release_promise_normal_013', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await avRecorderReleasePromiseNormal();
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_224
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_225
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_normal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_226
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_normal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_227
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_normal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_228
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_normal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_229
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_normal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_230
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_231
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_normal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_232
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_normal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_233
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_normal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_234
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_normal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_235
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_normal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_236
     * @tc.desc   after stop, getCurrentAudioCapturerInfo callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_237
     * @tc.desc   after stop, getCurrentAudioCapturerInfo callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_238
     * @tc.desc   after stop, getCurrentAudioCapturerInfo callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_239
     * @tc.desc   after stop, getCurrentAudioCapturerInfo callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_240
     * @tc.desc   after stop, getCurrentAudioCapturerInfo callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_callback_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_241
     * @tc.desc   after stop, getCurrentAudioCapturerInfo callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_callback_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getCurrentAudioCapturerInfoCallback(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_242
     * @tc.desc   after stop, getCurrentAudioCapturerInfo promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_abnormal_002
     * @tc.number AV_RECORDER_FUNC_TEST_243
     * @tc.desc   after stop, getCurrentAudioCapturerInfo promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_abnormal_003
     * @tc.number AV_RECORDER_FUNC_TEST_244
     * @tc.desc   after stop, getCurrentAudioCapturerInfo promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_abnormal_004
     * @tc.number AV_RECORDER_FUNC_TEST_245
     * @tc.desc   after stop, getCurrentAudioCapturerInfo promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_abnormal_005
     * @tc.number AV_RECORDER_FUNC_TEST_246
     * @tc.desc   after stop, getCurrentAudioCapturerInfo promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getCurrentAudioCapturerInfo_promise_abnormal_006
     * @tc.number AV_RECORDER_FUNC_TEST_247
     * @tc.desc   after stop, getCurrentAudioCapturerInfo promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getCurrentAudioCapturerInfo_promise_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getCurrentAudioCapturerInfoPromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_248
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_249
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_normal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_250
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_normal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_251
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_normal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_252
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_normal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_253
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_normal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_254
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_255
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_normal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_256
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_normal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_257
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_normal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_258
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_normal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_259
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_normal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_callback_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_260
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_callback_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      getAudioCapturerMaxAmplitudeCallback(done);
      done();
    })

    /**
     * @tc.name   getAudioCapturerMaxAmplitude_promise_abnormal_001
     * @tc.number AV_RECORDER_FUNC_TEST_261
     * @tc.desc   Test normal scene of getAudioCapturerMaxAmplitude promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAudioCapturerMaxAmplitude_promise_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderStopPromiseNormal();
      await getAudioCapturerMaxAmplitudePromise(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_callback_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_262
     * @tc.desc   Test normal scene of getAvailableEncoder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_callback_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      getAvailableEncoderCallback(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_callback_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_263
     * @tc.desc   Test normal scene of getAvailableEncoder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_callback_normal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      getAvailableEncoderCallback(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_callback_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_264
     * @tc.desc   Test normal scene of getAvailableEncoder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_callback_normal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      getAvailableEncoderCallback(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_callback_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_265
     * @tc.desc   Test normal scene of getAvailableEncoder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_callback_normal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      getAvailableEncoderCallback(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_callback_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_266
     * @tc.desc   Test normal scene of getAvailableEncoder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_callback_normal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      getAvailableEncoderCallback(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_callback_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_267
     * @tc.desc   Test normal scene of getAvailableEncoder callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_callback_normal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      getAvailableEncoderCallback(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_promise_normal_001
     * @tc.number AV_RECORDER_FUNC_TEST_268
     * @tc.desc   Test normal scene of getAvailableEncoder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_promise_normal_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await getAvailableEncoderPromise(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_promise_normal_002
     * @tc.number AV_RECORDER_FUNC_TEST_269
     * @tc.desc   Test normal scene of getAvailableEncoder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_promise_normal_002', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC);
      await getAvailableEncoderPromise(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_promise_normal_003
     * @tc.number AV_RECORDER_FUNC_TEST_270
     * @tc.desc   Test normal scene of getAvailableEncoder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_promise_normal_003', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION);
      await getAvailableEncoderPromise(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_promise_normal_004
     * @tc.number AV_RECORDER_FUNC_TEST_271
     * @tc.desc   Test normal scene of getAvailableEncoder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_promise_normal_004', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION);
      await getAvailableEncoderPromise(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_promise_normal_005
     * @tc.number AV_RECORDER_FUNC_TEST_272
     * @tc.desc   Test normal scene of getAvailableEncoder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_promise_normal_005', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE);
      await getAvailableEncoderPromise(done);
      done();
    })

    /**
     * @tc.name   getAvailableEncoder_promise_normal_006
     * @tc.number AV_RECORDER_FUNC_TEST_273
     * @tc.desc   Test normal scene of getAvailableEncoder promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAvailableEncoder_promise_normal_006', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER);
      await getAvailableEncoderPromise(done);
      done();
    })

    /**
     * @tc.name   stateChange_listen_001
     * @tc.number AV_RECORDER_FUNC_TEST_274
     * @tc.desc   Test normal scene of listen stateChange promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('stateChange_listen_001', Level.LEVEL1, async (done: Function) => {
      await createAvRecorderPromise();
      setVideoRecordedCallback(done);
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await avRecorderStartPromiseNormal();
      await avRecorderPausePromiseNormal();
      await avRecorderStopPromiseNormal();
      await avRecorderResetPromiseNormal();
      offCallback(['stataChange', 'error']);
      await avRecorderReleasePromiseNormal();
    })

    /**
     * @tc.name   audioCapturerChange_listen_001
     * @tc.number AV_RECORDER_FUNC_TEST_275
     * @tc.desc   Test normal scene of getCurrentAudioCapturerInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('audioCapturerChange_listen_001', Level.LEVEL2, async (done: Function) => {
      await createAvRecorderPromise();
      audioCapturerChangeListen();
      await initConfigAndPreparedPromise(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT);
      await getCurrentAudioCapturerInfoPromise(done);
      offCallback(['audioCapturerChange']);
      done();
    })
  })
}