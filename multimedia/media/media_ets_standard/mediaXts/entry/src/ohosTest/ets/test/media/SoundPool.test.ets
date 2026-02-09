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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { LOG_TAG, MediaErrorCode, SLEEP_TIME_500, SLEEP_TIME_2000, TEST_MP3_FILE } from '../Constants';
import { common, Permissions } from '@kit.AbilityKit';
import AVRecorderCommon from './AVRecorderCommon';
import { sleep } from '../common';

const TAG = LOG_TAG + 'SoundPoolTest';

let soundPool: media.SoundPool | null = null;
let commonFun: AVRecorderCommon = new AVRecorderCommon();

let audioRendererInfo: audio.AudioRendererInfo = {
  usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
  rendererFlags: 1
}

let playParameters: media.PlayParameters = {
  loop: 1, // 循环1次。
  rate: audio.AudioRendererRate.RENDER_RATE_NORMAL, // 正常倍速。
  leftVolume: 0.8, // range = 0.0-1.0
  rightVolume: 0.8, // range = 0.0-1.0
  priority: 0, // 最低优先级。
}

function createSoundPoolCallbackNormal(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  console.info(TAG, `Start to createSoundPoolCallbackNormal.`);
  media.createSoundPool(maxStreams, audioRendererInfo, (error, soundPool_: media.SoundPool) => {
    if (error) {
      console.error(TAG, `Failed to createSoundPool, error is: ${error} ,code is : ${error?.code}`);
      expect().assertFail();
    } else {
      console.info(TAG, `Succeeded in creating SoundPool callback.`);
      soundPool = soundPool_;
      expect(true).assertTrue();
    }
    done();
  });
}

function createSoundPoolCallbackAbnormal(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  console.info(TAG, `Start to createSoundPoolCallbackAbnormal.`);
  media.createSoundPool(maxStreams, audioRendererInfo, (error, soundPool_: media.SoundPool) => {
    if (error) {
      console.error(TAG, `Failed to createSoundPool, error is: ${error} ,code is : ${error?.code}`);
      expect(error?.code).assertEqual(MediaErrorCode.NO_MEMORY);
    } else {
      console.info(TAG, `Succeeded in creating SoundPool callback.`);
      soundPool = soundPool_;
      expect().assertFail();
    }
    done();
  });
}

async function createSoundPoolPromiseNormal(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  console.info(TAG, `Start to createSoundPoolPromiseNormal.`);
  await media.createSoundPool(maxStreams, audioRendererInfo).then((soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      console.info(TAG, 'Succeeded in creating SoundPool promise.');
      soundPool = soundPool_;
      expect(true).assertTrue();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise.');
      expect().assertFail();
    }
    done();
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message:${error?.message}, code：${error?.code}`);
    expect().assertFail();
    done();
  });
}

async function createSoundPoolPromiseAbnormal(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  console.info(TAG, `Start to createSoundPoolPromiseAbnormal.`);
  await media.createSoundPool(maxStreams, audioRendererInfo).then((soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      console.info(TAG, 'Succeeded in creating SoundPool promise.');
      soundPool = soundPool_;
      expect().assertFail();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise.');
      expect(true).assertTrue();
    }
    done();
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message:${error?.message}, code：${error?.code}`);
    expect(error?.code).assertEqual(MediaErrorCode.NO_MEMORY);
    done();
  });
}

function loadSoundPoolCallback(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  media.createSoundPool(maxStreams, audioRendererInfo, async (error: BusinessError, soundPool_: media.SoundPool) => {
    if (error) {
      console.error(TAG, `Failed to createSoundPool callback.`);
      return;
    } else {
      soundPool = soundPool_;
      console.info(TAG, `Succeeded in createSoundPool callback.`);
      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = await testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      let uri = 'fd://' + (rawFileDescriptor.fd).toString();
      soundPool?.load(uri, (error: BusinessError, soundId_: number) => {
        if (error) {
          console.error(TAG,
            `Failed to load soundPool: errCode is ${error?.code}, errMessage is ${error?.message}`);
          expect().assertFail();
        } else {
          console.info(TAG, `Succeeded in loading soundPool` + JSON.stringify(soundId_));
          expect(true).assertTrue();
        }
        done();
      });
    }
  });
}

async function loadSoundPoolPromise(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      let uri = 'fd://' + (rawFileDescriptor.fd).toString();
      console.info(TAG, 'uri: ' + uri);
      await soundPool.load(uri).then(async (soundId: number) => {
        console.info(TAG, 'Succeeded in loading uri, soundID is ' + soundId);
        expect(true).assertTrue();
      }, (err: BusinessError) => {
        console.error(TAG, `Failed to load soundPool errCode is ${err?.code}, errMessage is ${err?.message}`);
        expect().assertFail();
      });
      done();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, ` soundpool catchCallback, error message:${error.message}`);
    expect().assertFail();
    done();
  });
}

async function loadSoundPoolWithFdCallback(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      soundPool.load(rawFileDescriptor.fd, 0, rawFileDescriptor.length, (error: BusinessError, soundId_: number) => {
        if (error) {
          console.error(TAG, `Failed to load soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
          expect().assertFail();
        } else {
          console.info(TAG, 'Succeeded in loading soundId:' + soundId_);
          expect(true).assertTrue();
        }
        done();
      });
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message:${error.message}`);
    expect().assertFail();
    done();
  });
}

async function loadSoundPoolWithFdPromise(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      await soundPool.load(rawFileDescriptor.fd, 0, rawFileDescriptor.length).then(async (soundId: number) => {
        console.info(TAG, 'Succeeded in loading soundPool, soundId is ' + soundId);
        expect(true).assertTrue();
      }, (err: BusinessError) => {
        console.error(TAG, 'Failed to load soundpool and catch error is ' + err.message);
        expect().assertFail();
      });
      done();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message:${error.message}`);
    expect().assertFail();
    done();
  });
}

async function playSoundPoolWithParamsPromise(usage: audio.StreamUsage, maxStreams: number,
  done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          await soundPool?.play(soundId, playParameters).then((streamId: number) => {
            console.info(TAG, 'Succeeded in playing soundPool ,streamId =' + streamId);
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }, (err: BusinessError) => {
            console.error(TAG,
              `Failed to play soundPool and catch errorCode is: ${err?.code}, errMsg is ${err?.message}'`);
            expect().assertFail();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `playSoundPoolWithParamsPromise create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `playSoundPoolWithParamsPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function playSoundPoolWithParamsCallback(usage: audio.StreamUsage, maxStreams: number,
  done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          soundPool?.play(soundId, playParameters, (error: BusinessError, streamId: number) => {
            if (error) {
              console.error(TAG, `Failed to play soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in playing soundPool, streamId:' + streamId);
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `playSoundPoolWithParamsCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `playSoundPoolWithParamsCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function playSoundPoolWithoutParamsCallback(usage: audio.StreamUsage, maxStreams: number,
  done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          soundPool?.play(soundId, (error: BusinessError, streamId: number) => {
            if (error) {
              console.error(TAG, `Failed to play soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in playing soundPool, streamId:' + streamId);
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `playSoundPoolWithoutParamsCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `playSoundPoolWithoutParamsCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function stopSoundPoolCallback(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let streamId = await soundPool?.play(soundId);
          console.info(TAG, 'play, streamId：' + streamId);
          await sleep(SLEEP_TIME_2000);
          soundPool?.stop(streamId, (error: BusinessError) => {
            if (error) {
              console.error(TAG,
                `Failed to stop soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in stopping soundPool');
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          })
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'load finish soundId: ' + soundId);
      } else {
        console.error(TAG, `stopSoundPoolCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `stopSoundPoolCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function stopSoundPoolPromise(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let streamId = await soundPool?.play(soundId);
          console.info(TAG, 'play, streamId：' + streamId);
          await sleep(SLEEP_TIME_2000);
          await soundPool!.stop(streamId).then(() => {
            console.info(TAG, 'Succeeded in stopping soundPool');
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }, (err: BusinessError) => {
            console.error(TAG, 'Failed to stop soundPool and catch error is ' + err.message);
            expect().assertFail();
            reject();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'load finish soundId: ' + soundId);
      } else {
        console.error(TAG, `stopSoundPoolPromise create soundPool error.`);
        expect().assertFail();
      }
    } catch (error) {
      console.error(TAG, `stopSoundPoolPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setLoopNormalCallback(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let streamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          soundPool?.setLoop(streamId, 1, (error: BusinessError) => {
            if (error) {
              console.error(TAG,
                `Failed to setLoop soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in setLooping soundPool, streamID:' + streamId);
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setLoopNormalCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setLoopNormalCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setLoopNormalPromise(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let streamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          await soundPool!.setLoop(streamId, 1).then(() => {
            console.info(TAG, 'Succeeded in setLooping soundPool, streamID:' + streamId);
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG, 'Failed to setLoop soundPool and catch error is ' + err.message);
            expect().assertFail();
            reject();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setLoopNormalPromise create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setLoopNormalPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setPriorityNormalCallback(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let playStreamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          soundPool?.setPriority(playStreamId, 2, (error: BusinessError) => {
            if (error) {
              console.error(TAG,
                `Failed to setPriority soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in setPriority soundPool, streamID:' + playStreamId);
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setPriorityNormalCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setPriorityNormalCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setPriorityNormalPromise(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let playStreamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          await soundPool!.setPriority(playStreamId, 1).then(() => {
            console.info(TAG, 'Succeeded in setPriority  soundPool, streamID:' + playStreamId);
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG, 'Failed to setPriority  soundPool and catch error is ' + err.message);
            expect().assertFail();
            reject();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setPriorityNormalPromise create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setPriorityNormalPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setRateNormalCallback(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let playStreamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          let selectedAudioRendererRate: audio.AudioRendererRate = audio.AudioRendererRate.RENDER_RATE_NORMAL;
          soundPool?.setRate(playStreamId, selectedAudioRendererRate, (error: BusinessError) => {
            if (error) {
              console.error(TAG,
                `Failed to setRate soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in setRate soundPool, streamID:' + playStreamId);
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setRateNormalCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setRateNormalCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setRateNormalPromise(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let playStreamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          let selectedAudioRendererRate: audio.AudioRendererRate = audio.AudioRendererRate.RENDER_RATE_NORMAL;
          await soundPool!.setRate(playStreamId, selectedAudioRendererRate).then(() => {
            console.info(TAG, 'Succeeded in setRate soundPool, streamID:' + playStreamId);
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG, 'Failed to setPriority  soundPool and catch error is ' + err.message);
            expect().assertFail();
            reject();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setRateNormalPromise create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setRateNormalPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setVolumeNormalCallback(usage: audio.StreamUsage, maxStreams: number, leftVolume: number,
  rightVolume: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let streamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          soundPool?.setVolume(streamId, leftVolume, rightVolume, (error: BusinessError) => {
            if (error) {
              console.error(TAG,
                `Failed to setVolume soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in setVolume soundPool, streamID:' + streamId);
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setVolumeNormalCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setVolumeNormalCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function setVolumeNormalPromise(usage: audio.StreamUsage, maxStreams: number, leftVolume: number,
  rightVolume: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          let streamId = await soundPool?.play(soundId, playParameters);
          await sleep(SLEEP_TIME_2000);
          await soundPool!.setVolume(streamId, leftVolume, rightVolume).then(() => {
            console.info(TAG, 'Succeeded in setVolume soundPool, streamID:' + streamId);
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG, 'Failed to setVolume soundPool and catch error is ' + err.message);
            expect().assertFail();
            reject();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `setVolumeNormalPromise create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `setVolumeNormalPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

function unloadSoundPoolCallback(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          await sleep(SLEEP_TIME_2000);
          soundPool?.unload(soundId, (error: BusinessError) => {
            if (error) {
              console.error(TAG,
                `Failed to unload soundPool: errCode is ${error?.code}, errMessage is ${error?.message}`);
              expect().assertFail();
              reject();
            } else {
              console.info(TAG, 'Succeeded in unload soundPool');
              expect(true).assertTrue();
              resolve();
            }
            soundPool?.off('loadComplete');
            done();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `unloadSoundPoolCallback create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `unloadSoundPoolCallback error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function unloadSoundPoolPromise(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          await sleep(SLEEP_TIME_2000);
          await soundPool!.unload(soundId).then(() => {
            console.info(TAG, 'Succeeded in unload soundPool');
            expect(true).assertTrue();
            soundPool?.off('loadComplete');
            resolve();
            done();
          }, (err: BusinessError) => {
            console.error(TAG, `Failed to unload soundPool errCode is ${err?.code}, errMessage is ${err?.message}`);
            expect().assertFail();
            reject();
          });
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `unloadSoundPoolPromise create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `unloadSoundPoolPromise error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function unloadSoundPoolWithFdCallback(usage: audio.StreamUsage, maxStreams: number,
  done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
      if (soundPool_ != null) {
        soundPool = soundPool_;
        console.info(TAG, 'Succeeded in creating SoundPool promise');

        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.load(rawFileDescriptor.fd, 0, rawFileDescriptor.length, (error: BusinessError, soundId_: number) => {
          if (error) {
            console.error(TAG, `Failed to load soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
            expect().assertFail();
            reject();
          } else {
            console.info(TAG, 'Succeeded in loading soundId:' + soundId_);
            expect(true).assertTrue();
            resolve();
          }
          done();
        });
      } else {
        console.error(TAG, 'Failed to create SoundPool promise');
        expect().assertFail();
        reject();
      }
    }, (error: BusinessError) => {
      console.error(TAG, `soundpool catchCallback, error message:${error.message}`);
      expect().assertFail();
      reject();
    });
  });
}

async function unloadSoundPoolWithFdPromise(usage: audio.StreamUsage, maxStreams: number,
  done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
      if (soundPool_ != null) {
        soundPool = soundPool_;
        console.info(TAG, 'Succeeded in creating SoundPool promise');

        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        await soundPool.load(rawFileDescriptor.fd, 0, rawFileDescriptor.length).then(async (soundId: number) => {
          console.info(TAG, 'Succeeded in loading soundPool, soundId is ' + soundId);
          expect(true).assertTrue();
          resolve();
          done();
        }, (err: BusinessError) => {
          console.error(TAG, 'Failed to load soundPool and catch error is ' + err.message);
          expect().assertFail();
          reject();
        });
      } else {
        console.error(TAG, 'Failed to create SoundPool promise');
        expect().assertFail();
        reject();
      }
    }, (error: BusinessError) => {
      console.error(TAG, `unloadSoundPoolWithFdPromise catchCallback, error message:${error.message}`);
      expect().assertFail();
      reject();
    });
  });
}

async function releaseSoundPoolCallback(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
      if (soundPool_ != null) {
        soundPool = soundPool_;
        console.info(TAG, 'Succeeded in creating SoundPool promise');

        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.release((error: BusinessError) => {
          if (error) {
            console.error(TAG, `Failed to release soundPool: errCode is ${error.code}, errMessage is ${error.message}`);
            expect().assertFail();
            reject();
          } else {
            console.info(TAG, 'Succeeded in releasing soundPool');
            expect(true).assertTrue();
            resolve();
          }
          done();
        });
      } else {
        console.error(TAG, 'Failed to create SoundPool promise');
        expect().assertFail();
        reject();
      }
    }, (error: BusinessError) => {
      console.error(TAG, `soundpool catchCallback, error message:${error.message}`);
      expect().assertFail();
      reject();
    });
  });
}

async function releaseSoundPoolPromise(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      await soundPool.release().then(() => {
        console.info(TAG, 'Succeeded in releasing soundPool');
        expect(true).assertTrue();
      }, (err: BusinessError) => {
        console.error(TAG, 'Failed to release SoundPool and catch error is ' + err.message);
        expect().assertFail();
      });
      done();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchPromise, error message:${error.message}`);
    expect().assertFail();
    done();
  });
}

async function loadCompleteListen(usage: audio.StreamUsage, maxStreams: number, done: Function): Promise<void> {
  return new Promise(async (resolve, reject) => {
    audioRendererInfo.usage = usage;
    try {
      soundPool = await media.createSoundPool(maxStreams, audioRendererInfo);
      if (soundPool) {
        let testContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

        let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
        console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
        soundPool.on('loadComplete', async (soundId: number) => {
          console.info(TAG, 'Succeeded in loadComplete, soundId：' + soundId);
          await sleep(SLEEP_TIME_2000);
          soundPool?.off('loadComplete');
          resolve();
          done();
        })
        let soundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
        console.info(TAG, 'file soundId: ' + soundId);
      } else {
        console.error(TAG, `loadCompleteListen create soundPool error.`);
        expect().assertFail();
        reject();
      }
    } catch (error) {
      console.error(TAG, `loadCompleteListen error,  ${error}`);
      expect().assertFail();
      reject();
    }
  });
}

async function playFinishedWithStreamIdListen(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  let loadSoundId: number = -1;
  let playStreamId: number = -1;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      soundPool.on('playFinishedWithStreamId', (streamId: number) => {
        console.info(TAG, 'Succeeded in finish playing, streamId：' + streamId);
        expect(streamId).assertEqual(playStreamId);
      });
      loadSoundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
      await sleep(SLEEP_TIME_500);
      playStreamId = await soundPool.play(loadSoundId, playParameters);
      soundPool.off('playFinishedWithStreamId');
      done();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message:${error.message}`);
    expect().assertFail();
    done();
  });
}

async function playFinishedListen(usage: audio.StreamUsage, maxStreams: number, done: Function) {
  audioRendererInfo.usage = usage;
  let loadSoundId: number = -1;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      soundPool.on('playFinished', () => {
        console.info(TAG, 'Succeeded in playFinished');
        expect(true).assertTrue();
      });
      loadSoundId = await soundPool.load(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length);
      await sleep(SLEEP_TIME_500);
      await soundPool.play(loadSoundId, playParameters);
      soundPool.off('playFinished');
      done();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message:${error.message}`);
    expect().assertFail();
    done();
  });
}

async function errorListen(usage: audio.StreamUsage, maxStreams: number, uri: string, done: Function) {
  audioRendererInfo.usage = usage;
  await media.createSoundPool(maxStreams, audioRendererInfo).then(async (soundPool_: media.SoundPool) => {
    if (soundPool_ != null) {
      soundPool = soundPool_;
      console.info(TAG, 'Succeeded in creating SoundPool promise');

      let testContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;

      let rawFileDescriptor = testContext.resourceManager.getRawFdSync(TEST_MP3_FILE);
      console.info(TAG, 'file fd: ' + rawFileDescriptor.fd);
      soundPool.on('error', (error: BusinessError) => {
        console.error(TAG, 'error listen: err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == media.AVErrorCode.AVERR_UNSUPPORT_FORMAT).assertTrue();
      });
      soundPool.load(uri).then((soundId: number) => {
        console.info(TAG, 'Succeeded in loading uri, soundID is ' + soundId);
        expect(true).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(TAG, `Failed to load soundPool errCode is ${err?.code}, errMessage is ${err?.message}`);
        // expect(err.code == media.AVErrorCode.AVERR_UNSUPPORT_FORMAT).assertTrue();
      });
      await sleep(SLEEP_TIME_500);
      soundPool.off('error');
      done();
    } else {
      console.error(TAG, 'Failed to create SoundPool promise');
      expect().assertFail();
      done();
    }
  }, (error: BusinessError) => {
    console.error(TAG, `soundpool catchCallback, error message: ${error.message}`);
    expect().assertFail();
    done();
  });
}

export default function SoundPoolTest() {
  describe('SoundPoolTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case, check surfaceId is ' + globalThis.value);
      let permissionNames: Array<Permissions> =
        ['ohos.permission.READ_MEDIA'];
      await commonFun.getPermission(permissionNames);
      await commonFun.msleepAsync(SLEEP_TIME_500);
      await commonFun.driveFn();
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await sleep(SLEEP_TIME_500);
      if (soundPool) {
        console.info(TAG, 'afterEach case， soundPool is not null.');
        await soundPool.release().then(() => {
          console.info(TAG, 'Succeeded in releasing soundPool');
        }, (err: BusinessError) => {
          console.error(TAG, 'Failed to release soundPool and catch error is ' + err?.message);
        });
        soundPool = null;
      } else {
        console.info(TAG, 'afterEach case， soundPool is null.');
      }
    });

    afterAll(async () => {
      console.info(TAG, 'beforeEach case');
    });

    /**
     * @tc.name   createSoundPool_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_001
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_001', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_002
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_002', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_003
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_003', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_004
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_004', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_005
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_005', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_006
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_006', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_007
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_007', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_008
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_008', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_009
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_009', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_010
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_010', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_011
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_011', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_012
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_012', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_013
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_013', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_014
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_callback_014', Level.LEVEL0, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_015
     * @tc.number SOUND_POOL_FUNC_TEST_015
     * @tc.desc   Test normal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createSoundPool_callback_015', Level.LEVEL1, async (done: Function) => {
      createSoundPoolCallbackNormal(audio.StreamUsage.STREAM_USAGE_MUSIC, 32, done);
    })

    /**
     * @tc.name   createSoundPool_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_016
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_001', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_017
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_002', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_018
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_003', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_019
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_004', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_020
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_005', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_021
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_006', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_022
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_007', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_023
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_008', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
      done();
    })

    /**
     * @tc.name   createSoundPool_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_024
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_009', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_025
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_010', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_026
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_011', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_027
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_012', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_028
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_013', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_029
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_014', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_015
     * @tc.number SOUND_POOL_FUNC_TEST_030
     * @tc.desc   Test normal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createSoundPool_promise_015', Level.LEVEL0, async (done: Function) => {
      await createSoundPoolPromiseNormal(audio.StreamUsage.STREAM_USAGE_MUSIC, 32, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_001
     * @tc.number SOUND_POOL_FUNC_TEST_031
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_001', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_UNKNOWN, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_002
     * @tc.number SOUND_POOL_FUNC_TEST_032
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_002', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_MUSIC, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_003
     * @tc.number SOUND_POOL_FUNC_TEST_033
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_003', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_004
     * @tc.number SOUND_POOL_FUNC_TEST_034
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_004', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_005
     * @tc.number SOUND_POOL_FUNC_TEST_035
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_005', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_ALARM, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_006
     * @tc.number SOUND_POOL_FUNC_TEST_036
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_006', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_007
     * @tc.number SOUND_POOL_FUNC_TEST_037
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_007', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_RINGTONE, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_008
     * @tc.number SOUND_POOL_FUNC_TEST_038
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_008', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_009
     * @tc.number SOUND_POOL_FUNC_TEST_039
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_009', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_010
     * @tc.number SOUND_POOL_FUNC_TEST_040
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_010', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_MOVIE, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_011
     * @tc.number SOUND_POOL_FUNC_TEST_041
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_011', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_GAME, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_012
     * @tc.number SOUND_POOL_FUNC_TEST_042
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_012', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_013
     * @tc.number SOUND_POOL_FUNC_TEST_043
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_013', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_NAVIGATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_callback_abnormal_014
     * @tc.number SOUND_POOL_FUNC_TEST_044
     * @tc.desc   Test abnormal scene of create soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_callback_abnormal_014', Level.LEVEL2, async (done: Function) => {
      createSoundPoolCallbackAbnormal(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_001
     * @tc.number SOUND_POOL_FUNC_TEST_045
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_001', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_UNKNOWN, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_002
     * @tc.number SOUND_POOL_FUNC_TEST_046
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_002', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_MUSIC, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_003
     * @tc.number SOUND_POOL_FUNC_TEST_047
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_003', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_004
     * @tc.number SOUND_POOL_FUNC_TEST_048
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_004', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_005
     * @tc.number SOUND_POOL_FUNC_TEST_049
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_005', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_ALARM, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_006
     * @tc.number SOUND_POOL_FUNC_TEST_050
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_006', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_007
     * @tc.number SOUND_POOL_FUNC_TEST_051
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_007', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_RINGTONE, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_008
     * @tc.number SOUND_POOL_FUNC_TEST_052
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_008', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_009
     * @tc.number SOUND_POOL_FUNC_TEST_053
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_009', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_010
     * @tc.number SOUND_POOL_FUNC_TEST_054
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_010', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_MOVIE, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_011
     * @tc.number SOUND_POOL_FUNC_TEST_055
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_011', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_GAME, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_012
     * @tc.number SOUND_POOL_FUNC_TEST_056
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_012', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_013
     * @tc.number SOUND_POOL_FUNC_TEST_057
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_013', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_NAVIGATION, -1, done);
    })

    /**
     * @tc.name   createSoundPool_promise_abnormal_014
     * @tc.number SOUND_POOL_FUNC_TEST_058
     * @tc.desc   Test abnormal scene of create soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createSoundPool_promise_abnormal_014', Level.LEVEL2, async (done: Function) => {
      await createSoundPoolPromiseAbnormal(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, -1, done);
    })

    /**
     * @tc.name   load_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_059
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_060
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_061
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_062
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_063
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_064
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done)
    })

    /**
     * @tc.name   load_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_065
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_066
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_067
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_068
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_069
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_070
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_071
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   load_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_072
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      loadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_073
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_074
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_075
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_076
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_077
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_078
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_079
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_080
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_081
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_082
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_083
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_084
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_085
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   load_normal_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_086
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_normal_promise_014', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   load_with_fd_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_087
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_with_fd_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolWithFdCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   load_with_fd_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_088
     * @tc.desc   Test normal scene of load soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_with_fd_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolWithFdCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 15, done);
    })

    /**
     * @tc.name   load_with_fd_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_089
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_with_fd_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolWithFdPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   load_with_fd_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_090
     * @tc.desc   Test normal scene of load soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('load_with_fd_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await loadSoundPoolWithFdPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 15, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_091
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_092
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_093
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_094
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_095
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_096
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_097
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_098
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_099
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_100
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_101
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_102
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_103
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_104
     * @tc.desc   Test normal scene of play soundPool with PlayParameters promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_promise_014', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_105
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_106
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_107
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_108
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_109
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_110
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_111
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_112
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_113
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_114
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_115
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_116
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_117
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_118
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   play_with_params_normal_callback_015
     * @tc.number SOUND_POOL_FUNC_TEST_119
     * @tc.desc   Test normal scene of play soundPool with PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_with_params_normal_callback_015', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithParamsCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 32, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_120
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_121
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_122
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_123
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_124
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_125
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_126
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_127
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_128
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_129
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_130
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_131
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_132
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   play_without_params_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_133
     * @tc.desc   Test normal scene of play soundPool without PlayParameters callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('play_without_params_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await playSoundPoolWithoutParamsCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_134
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_135
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_136
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_137
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_138
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_139
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_140
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_141
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_142
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_143
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_144
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_145
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_146
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_147
     * @tc.desc   Test normal scene of stop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_148
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_149
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_150
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_151
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_152
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_153
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_154
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_155
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_156
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_157
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_158
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_159
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_160
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   stopSoundPool_normal_promise_018
     * @tc.number SOUND_POOL_FUNC_TEST_161
     * @tc.desc   Test normal scene of stop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stopSoundPool_normal_promise_018', Level.LEVEL0, async (done: Function) => {
      await stopSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_162
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_163
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_164
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_165
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_166
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_167
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_168
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_169
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_170
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_171
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_172
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_173
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_174
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_175
     * @tc.desc   Test normal scene of setLoop soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_176
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_177
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_178
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_179
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_180
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_181
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_182
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_183
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_184
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_185
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_186
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_187
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_188
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   setLoop_normal_promise_018
     * @tc.number SOUND_POOL_FUNC_TEST_189
     * @tc.desc   Test normal scene of setLoop soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setLoop_normal_promise_018', Level.LEVEL0, async (done: Function) => {
      await setLoopNormalPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_190
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_191
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_192
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_193
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_194
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_195
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_196
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_197
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_198
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_199
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_200
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_201
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_202
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_203
     * @tc.desc   Test normal scene of setPriority soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_204
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_205
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_206
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_207
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_208
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_209
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_210
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_211
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_212
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_213
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_214
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_215
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_216
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   setPriority_normal_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_217
     * @tc.desc   Test normal scene of setPriority soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPriority_normal_promise_014', Level.LEVEL0, async (done: Function) => {
      await setPriorityNormalPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_218
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_219
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_220
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_221
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_222
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_223
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_224
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_225
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_226
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_227
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_228
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_229
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_230
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   setRate_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_231
     * @tc.desc   Test normal scene of setRate soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await setRateNormalCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_232
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_233
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_234
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_235
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_236
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_237
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_238
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_239
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_240
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_241
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_242
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_243
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_244
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   setRate_normal_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_245
     * @tc.desc   Test normal scene of setRate soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setRate_normal_promise_014', Level.LEVEL0, async (done: Function) => {
      await setRateNormalPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_246
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_247
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_248
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_249
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_250
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_251
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_252
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_253
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_254
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_255
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_256
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_257
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_258
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_259
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_260
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_261
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_262
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_263
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_264
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_265
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_266
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_267
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_268
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_269
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_270
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_271
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_272
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   setVolume_normal_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_273
     * @tc.desc   Test normal scene of setVolume soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVolume_normal_promise_014', Level.LEVEL0, async (done: Function) => {
      await setVolumeNormalPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, 0.5, 0.5, done);
    })

    /**
     * @tc.name   unload_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_274
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_275
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_003
     * @tc.number SOUND_POOL_FUNC_TEST_276
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_003', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_004
     * @tc.number SOUND_POOL_FUNC_TEST_277
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_004', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_005
     * @tc.number SOUND_POOL_FUNC_TEST_278
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_005', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_006
     * @tc.number SOUND_POOL_FUNC_TEST_279
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_006', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done)
    })

    /**
     * @tc.name   unload_normal_callback_007
     * @tc.number SOUND_POOL_FUNC_TEST_280
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_007', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_008
     * @tc.number SOUND_POOL_FUNC_TEST_281
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_008', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_009
     * @tc.number SOUND_POOL_FUNC_TEST_282
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_009', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_010
     * @tc.number SOUND_POOL_FUNC_TEST_283
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_010', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_011
     * @tc.number SOUND_POOL_FUNC_TEST_284
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_011', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_012
     * @tc.number SOUND_POOL_FUNC_TEST_285
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_012', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_013
     * @tc.number SOUND_POOL_FUNC_TEST_286
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_013', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_callback_014
     * @tc.number SOUND_POOL_FUNC_TEST_287
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_callback_014', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_288
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_289
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_003
     * @tc.number SOUND_POOL_FUNC_TEST_290
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_003', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_004
     * @tc.number SOUND_POOL_FUNC_TEST_291
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_004', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_005
     * @tc.number SOUND_POOL_FUNC_TEST_292
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_005', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_006
     * @tc.number SOUND_POOL_FUNC_TEST_293
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_006', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_007
     * @tc.number SOUND_POOL_FUNC_TEST_294
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_007', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_008
     * @tc.number SOUND_POOL_FUNC_TEST_295
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_008', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_009
     * @tc.number SOUND_POOL_FUNC_TEST_296
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_009', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_010
     * @tc.number SOUND_POOL_FUNC_TEST_297
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_010', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_011
     * @tc.number SOUND_POOL_FUNC_TEST_298
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_011', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_012
     * @tc.number SOUND_POOL_FUNC_TEST_299
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_012', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_013
     * @tc.number SOUND_POOL_FUNC_TEST_300
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_013', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   unload_normal_promise_014
     * @tc.number SOUND_POOL_FUNC_TEST_301
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_normal_promise_014', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   unload_with_fd_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_302
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_with_fd_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolWithFdCallback(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   unload_with_fd_normal_callback_002
     * @tc.number SOUND_POOL_FUNC_TEST_303
     * @tc.desc   Test normal scene of unload soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_with_fd_normal_callback_002', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolWithFdCallback(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 15, done);
    })

    /**
     * @tc.name   unload_with_fd_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_304
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_with_fd_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolWithFdPromise(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   unload_with_fd_normal_promise_002
     * @tc.number SOUND_POOL_FUNC_TEST_305
     * @tc.desc   Test normal scene of unload soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unload_with_fd_normal_promise_002', Level.LEVEL0, async (done: Function) => {
      await unloadSoundPoolWithFdPromise(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 15, done);
    })

    /**
     * @tc.name   release_normal_callback_001
     * @tc.number SOUND_POOL_FUNC_TEST_306
     * @tc.desc   Test normal scene of release soundPool callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_normal_callback_001', Level.LEVEL0, async (done: Function) => {
      await releaseSoundPoolCallback(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   release_normal_promise_001
     * @tc.number SOUND_POOL_FUNC_TEST_307
     * @tc.desc   Test normal scene of release soundPool promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_normal_promise_001', Level.LEVEL0, async (done: Function) => {
      await releaseSoundPoolPromise(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_001
     * @tc.number SOUND_POOL_FUNC_TEST_308
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_001', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_002
     * @tc.number SOUND_POOL_FUNC_TEST_309
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_002', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_003
     * @tc.number SOUND_POOL_FUNC_TEST_310
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_003', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_004
     * @tc.number SOUND_POOL_FUNC_TEST_311
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_004', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_005
     * @tc.number SOUND_POOL_FUNC_TEST_312
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_005', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_006
     * @tc.number SOUND_POOL_FUNC_TEST_313
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_006', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_007
     * @tc.number SOUND_POOL_FUNC_TEST_314
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_007', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_008
     * @tc.number SOUND_POOL_FUNC_TEST_315
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_008', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_009
     * @tc.number SOUND_POOL_FUNC_TEST_316
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_009', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_010
     * @tc.number SOUND_POOL_FUNC_TEST_317
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_010', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_011
     * @tc.number SOUND_POOL_FUNC_TEST_318
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_011', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_012
     * @tc.number SOUND_POOL_FUNC_TEST_319
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_012', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_013
     * @tc.number SOUND_POOL_FUNC_TEST_320
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_013', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   on_off_loadComplete_listen_normal_014
     * @tc.number SOUND_POOL_FUNC_TEST_321
     * @tc.desc   Test normal scene of load soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_loadComplete_listen_normal_014', Level.LEVEL0, async (done: Function) => {
      await loadCompleteListen(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_001
     * @tc.number SOUND_POOL_FUNC_TEST_322
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_001', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_002
     * @tc.number SOUND_POOL_FUNC_TEST_323
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_002', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_003
     * @tc.number SOUND_POOL_FUNC_TEST_324
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_003', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_004
     * @tc.number SOUND_POOL_FUNC_TEST_325
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_004', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_005
     * @tc.number SOUND_POOL_FUNC_TEST_326
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_005', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_006
     * @tc.number SOUND_POOL_FUNC_TEST_327
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_006', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_007
     * @tc.number SOUND_POOL_FUNC_TEST_328
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_007', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_008
     * @tc.number SOUND_POOL_FUNC_TEST_329
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_008', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_009
     * @tc.number SOUND_POOL_FUNC_TEST_330
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_009', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_010
     * @tc.number SOUND_POOL_FUNC_TEST_331
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_010', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_011
     * @tc.number SOUND_POOL_FUNC_TEST_332
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_011', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_012
     * @tc.number SOUND_POOL_FUNC_TEST_333
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_012', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_013
     * @tc.number SOUND_POOL_FUNC_TEST_334
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_013', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinishedWithStreamId_listen_normal_014
     * @tc.number SOUND_POOL_FUNC_TEST_335
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinishedWithStreamId_listen_normal_014', Level.LEVEL0, async (done: Function) => {
      await playFinishedWithStreamIdListen(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_001
     * @tc.number SOUND_POOL_FUNC_TEST_336
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_001', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_002
     * @tc.number SOUND_POOL_FUNC_TEST_337
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_002', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_MUSIC, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_003
     * @tc.number SOUND_POOL_FUNC_TEST_338
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_003', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_004
     * @tc.number SOUND_POOL_FUNC_TEST_339
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_004', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_005
     * @tc.number SOUND_POOL_FUNC_TEST_340
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_005', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_ALARM, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_006
     * @tc.number SOUND_POOL_FUNC_TEST_341
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_006', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_007
     * @tc.number SOUND_POOL_FUNC_TEST_342
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_007', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_RINGTONE, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_008
     * @tc.number SOUND_POOL_FUNC_TEST_343
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_008', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_009
     * @tc.number SOUND_POOL_FUNC_TEST_344
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_009', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_010
     * @tc.number SOUND_POOL_FUNC_TEST_345
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_010', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_MOVIE, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_011
     * @tc.number SOUND_POOL_FUNC_TEST_346
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_011', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_GAME, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_012
     * @tc.number SOUND_POOL_FUNC_TEST_347
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_012', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_013
     * @tc.number SOUND_POOL_FUNC_TEST_348
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_013', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 1, done);
    })

    /**
     * @tc.name   on_off_playFinished_listen_normal_014
     * @tc.number SOUND_POOL_FUNC_TEST_349
     * @tc.desc   Test normal scene of play soundPool listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_playFinished_listen_normal_014', Level.LEVEL0, async (done: Function) => {
      await playFinishedListen(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 1, done);
    })

    /**
     * @tc.name   on_off_error_listen_normal_001
     * @tc.number SOUND_POOL_FUNC_TEST_350 //TODO 不确定如何触发回调
     * @tc.desc   Test normal scene of soundPool error listen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_error_listen_normal_001', Level.LEVEL0, async (done: Function) => {
      let uri: string = 'invalid path';
      await errorListen(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 1, uri, done);
    })
  })
}