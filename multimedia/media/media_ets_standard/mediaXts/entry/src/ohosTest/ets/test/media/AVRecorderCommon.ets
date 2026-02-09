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

import { expect } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import File from '@system.file';
import { Driver, ON, MatchPattern, } from '@ohos.UiTest';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import media from '@ohos.multimedia.media';
import { BusinessError } from '@ohos.base';
import { SLEEP_TIME_500 } from '../Constants';

export interface FdObject {
  fileAsset: File | null;
  fdNumber: number | null;
}

export default class AVRecorderCommon {
  async getPermission(permissionNames: Array<Permissions>) {
    let context: ESObject = AppStorage.get('testContext');
    let atManager = abilityAccessCtrl.createAtManager();
    //requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(context, permissionNames).then((data) => {
      let grantStatus = data.authResults;
      let length = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          return;
        }
      }
      //授权成功
    }).catch((err: BusinessError) => {
      console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })
  }

  async driveFn() {
    console.info(`case come in driveFn`);
    let driver = Driver.create();
    console.info(`driver is ${JSON.stringify(driver)}`);
    await this.msleepAsync(SLEEP_TIME_500);
    console.info(`UiDriver start`);
    let dr = Driver.create();
    await this.msleepAsync(SLEEP_TIME_500);
    let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
    await this.msleepAsync(SLEEP_TIME_500);
    await power?.click();
    let power2 = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
    await power2?.click();
    await this.msleepAsync(SLEEP_TIME_500);
  }

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  // callback function for promise call back error
  failureCallback(error: BusinessError) {
    console.info(`resumeTest case error called,errMessage is ${JSON.stringify(error)}`);
    expect(error).not().assertUndefined();
  }

  // callback function for promise catch error
  catchCallback(error: BusinessError) {
    console.info(`resumeTest case error called,errMessage is 44 ${JSON.stringify(error)}`);
    expect(error).not().assertUndefined();
  }

  async getFd(pathName: string) {
    console.info('case come in getFd');
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    };

    pathName = globalThis.abilityContext.filesDir + "/" + pathName;
    console.info('pathName =' + pathName);
    let file = await fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info('case getFd number is: ' + fdObject.fdNumber);
    return fdObject;
  }

  async closeFd(fdNumber: number | null) {
    console.info('case come in closeFd');
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }

  async unlinkFd(fdPath: string) {
    console.info('case come in unlinkFd');
    if (fdPath != null) {
      fs.unlink(fdPath);
    } else {
      console.info('[fs.unlink] case fdPath is null');
    }
  }

  async saveVideo(asset: photoAccessHelper.PhotoAsset) {
    console.info('case saveVideo start');
    try {
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
      assetChangeRequest.saveCameraPhoto();
      await phAccessHelper.applyChanges(assetChangeRequest);
      console.info('case saveVideo successfully');
    } catch (error) {
      console.info(`case error called,errMessage is ${error.message}`);
    }
    console.info('case saveVideo end');
  }

  resourceName() {
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.m4a`;
    return filename;
  }

  async idleCallback(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, done: Function) {
    console.info('case idleCallback called');
    media.createAVRecorder((error, recorder) => {
      if (recorder != null) {
        avRecorder = recorder;
        console.info('createAVRecorder idleCallback success');
        avRecorder.prepare(avConfig);
        this.releaseDone(avRecorder, done);
      } else {
        console.info(`createAVRecorder idleCallback fail, error:${error}`);
      }
    });
  }

  async idleCallbackWithError(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, done: Function) {
    console.info('case idleCallback called');
    media.createAVRecorder((error, recorder) => {
      if (recorder != null) {
        avRecorder = recorder;
        console.info('createAVRecorder idleCallback success');
      } else {
        console.info(`createAVRecorder idleCallback fail, error:${error}`);
      }
    });
    try {
      avRecorder.prepare(avConfig);
      console.info('success excute avRecorder.prepare');
    } catch (err) {
      console.info('case avRecorderReliabilitWithErrorTest001 avRecorder.on(error) called, errMessage is ' +
      err.message);
      console.info('case avRecorderReliabilitWithErrorTest001 avRecorder.on(error) called, errcode is ' + err.code);
      expect(err.code).assertEqual(401);
      done();
    }
    this.releaseDone(avRecorder, done);
  }

  idle(avRecorder: media.AVRecorder): Promise<media.AVRecorder> {
    console.info('case createAVRecorder called');
    return new Promise<media.AVRecorder>((resolve, reject) => {
      media.createAVRecorder().then((record) => {
        avRecorder = record;
        resolve(avRecorder);
      }).catch((err: BusinessError) => {
        console.info('idle err' + JSON.stringify(err));
        reject();
      })
    })
  }

  AV_RECORDER_STATE: ESObject = {
    IDLE: 'idle',
    PREPARED: 'prepared',
    STARTED: 'started',
    PAUSED: 'paused',
    STOPPED: 'stopped',
    RELEASED: 'released',
    ERROR: 'error',
  }

  prepareCallback(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig) {
    if (!avRecorder) {
      console.error('prepareCallback avRecorder is null!');
      return;
    }
    return new Promise<void>((resolve, reject) => {
      avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        resolve();
      }).catch((err: BusinessError) => {
        console.info('prepareCallback err' + JSON.stringify(err));
        reject();
      })
    })
  }

  prepareCallbackWithError(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig) {
    if (typeof (avRecorder) === 'undefined') {
      return;
    }
    avRecorder.prepare(undefined, (err: BusinessError) => {
      console.info('case prepare called' + err);
      if (err == null) {
        this.sleep(200)
        console.error(`case prepare success, state is ${avRecorder.state}`);
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('prepare success');
      } else {
        console.error(`case prepare error, errMessage is ${err.message}`);
        console.info('case prepare error called, errcode is ' + err.code);
        expect(err.code).assertEqual(401);
      }
    })
    console.info('success excute prepareCallbackWithError ');
  }

  preparePromise(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    avRecorder.prepare(avConfig).then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
      console.info('prepare success');
    }).catch((err: BusinessError) => {
      console.info('prepare failed and catch error is ' + err.message);
    });
  }

  async getInputSurfacePromise(avRecorder: media.AVRecorder) {
    let surfaceID: string | null = null;
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.getInputSurface().then((surfaceId) => {
      console.info('getInputSurface success');
      surfaceID = surfaceId;
    }).catch((err: BusinessError) => {
      console.info('getInputSurface failed and catch error is ' + err.message);
    });
  }

  getInputSurfaceCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    let surfaceID: string | null = null;
    avRecorder.getInputSurface((err: BusinessError, surfaceId) => {
      if (err == null) {
        console.info('getInputSurface success');
        surfaceID = surfaceId;
      } else {
        console.info('getInputSurface failed and error is ' + err.message);
      }
    });
  }

  async getAVRecorderConfigPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) === 'undefined') {
      return;
    }
    await avRecorder.getAVRecorderConfig().then((config) => {
      console.info('getAVRecorderConfig success');
      expect(config.audioSourceType).assertEqual(avConfig.audioSourceType);
      // expect(config.audioBitrate).assertEqual(avConfig.audioBitrate);
    }).catch((err: BusinessError) => {
      console.info('getAVRecorderConfig failed and catch error is ' + err.message);
    });
  }

  async startCallback(avRecorder: media.AVRecorder, recorderTime?: number) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    avRecorder.start(async (err: BusinessError) => {
      console.info('case start called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STARTED);
        console.info('start AVRecorder success');
        if (recorderTime != undefined) {
          await this.msleepAsync(recorderTime);
        }
      } else {
        console.info('start AVRecorder failed and error is ' + err.message);
      }
    })
  }

  async startPromise(avRecorder: media.AVRecorder, recorderTime?: number) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.start().then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STARTED);
      console.info('start success');
      if (recorderTime != undefined) {
        setTimeout(() => {
          console.info('startPromise setTimeout success');
        }, recorderTime);
      }
    }).catch((err: BusinessError) => {
      console.info('start failed and catch error is ' + err.message);
    });
  }

  async pauseCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.pause((err: BusinessError) => {
      console.info('case pause called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PAUSED);
        console.info('pause AVRecorder success');
      } else {
        console.info('pause AVRecorder failed and error is ' + err.message);
      }
    })
  }

  async pausePromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.pause().then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PAUSED);
      console.info('pause success');
    }).catch((err: BusinessError) => {
      console.info('pause failed and catch error is ' + err.message);
    });
  }

  async resumeCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.resume((err: BusinessError) => {
      console.info('case resume called');
      if (err == null) {
        console.info('resume AVRecorder success');
      } else {
        console.info('resume AVRecorder failed and error is ' + err.message);
      }
    })
  }

  async resumePromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.resume().then(() => {
      console.info('resume success');
    }, this.failureCallback).catch(this.catchCallback);
  }

  stopCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    avRecorder.stop((err) => {
      console.info('case stop called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STOPPED);
        console.info('stop AVRecorder success');
      } else {
        console.info('stop AVRecorder failed and error is ' + err.message);
      }
    })
  }

  async stopPromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.stop().then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STOPPED);
      console.info('stop success');
    }).catch((err: BusinessError) => {
      console.info('stop failed and catch error is ' + err.message);
    });
  }

  async resetCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.reset((err) => {
      console.info('case reset called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
        console.info('reset AVRecorder success');
      } else {
        console.info('reset AVRecorder failed and error is ' + err.message);
      }
    })
  }

  async resetPromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.reset().then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset AVRecorder failed and catch error is ' + err.message);
    });
  }

  async releaseCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.release((err) => {
      console.info('case release called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
        console.info('release AVRecorder success');
      } else {
        expect().assertFail();
        console.info('release AVRecorder failed and error is ' + err.message);
      }
    })
  }

  async releasePromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    await avRecorder.release().then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
    }).catch((err: BusinessError) => {
      console.info('release AVRecorder failed and catch error is ' + err.message);
    });
  }

  async releaseDone(avRecorder: media.AVRecorder, done: Function) {
    await avRecorder.release().then(() => {
      console.info('this.releaseDone avRecorder.state is ' + avRecorder.state);
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      done();
    }).catch((err: BusinessError) => {
      console.info('release this.releaseDone failed and catch error is ' + err.message);
    });
  }

  sleep(ms: number): Promise<string> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async setOnCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    console.info(`case setOnCallback in`);
    avRecorder.on('stateChange', async (state, reason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case this.AV_RECORDER_STATE.IDLE:
          console.info(`case avRecorderWithCallBack is idle`);
          expect(avRecorder.state).assertEqual("idle");
          // start->stop->release
          this.prepareCallback(avRecorder, avConfig);
          break;
        case this.AV_RECORDER_STATE.PREPARED:
          console.info(`case avRecorderWithCallBack is prepared`);
          expect(avRecorder.state).assertEqual('prepared');
          this.startCallback(avRecorder);
          break;
        case this.AV_RECORDER_STATE.STARTED:
          console.info(`case avRecorderWithCallBack is started`);
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          this.stopCallback(avRecorder);
          break;
        case this.AV_RECORDER_STATE.PAUSED:
          console.info(`case avRecorderWithCallBackis paused`);
          expect(avRecorder.state).assertEqual('paused');
          break;
        case this.AV_RECORDER_STATE.STOPPED:
          console.info(`case avRecorderWithCallBack is stopped`);
          expect(avRecorder.state).assertEqual('stopped');
          this.releasePromise(avRecorder);
          break;
        case this.AV_RECORDER_STATE.RELEASED:
          console.info(`case avRecorderWithCallBack is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case this.AV_RECORDER_STATE.ERROR:
          console.info(`case avRecorderWithCallBack is error`);
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });

    avRecorder.on('error', (err) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err.message);
    });
  }

  async setPrepareOnCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    console.info(`case setOnCallback in`);
    avRecorder.on('stateChange', async (state, reason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case this.AV_RECORDER_STATE.PREPARED:
          console.info(`case this.AV_RECORDER_STATE.PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.releaseCallback(avRecorder);
          break;
        case this.AV_RECORDER_STATE.RELEASED:
          console.info(`case setPrepareOnCallback is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case this.AV_RECORDER_STATE.ERROR:
          console.info(`case this.AV_RECORDER_STATE.ERROR`);
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
  }

  async avRecorderWithCallBack(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    // Create an instance
    avRecorder = await this.idle(avRecorder);
    this.setOnCallback(avConfig, avRecorder, recorderTime, done);
    await avRecorder.prepare(avConfig);
    await avRecorder.start();
  }

  async avRecorderWithCallBack2(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.prepareCallback(avRecorder, avConfig);
    await this.startCallback(avRecorder, recorderTime);
    await this.pauseCallback(avRecorder);
    await this.stopCallback(avRecorder);
    await avRecorder.reset();
    await this.releaseCallback(avRecorder);
    done();
  }

  async avRecorderWithCallBack3(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.resumePromise(avRecorder);
    await this.stopPromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack3 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack3 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack4(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.stopPromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack4 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack4 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack5(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.resumePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack5 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack5 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack6(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.startPromise(avRecorder, recorderTime);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack6 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack6 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack7(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.resumePromise(avRecorder);
    await this.pausePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack7 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack7 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack8(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.stopPromise(avRecorder);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack8 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack8 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack9(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.stopPromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack9 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset avRecorderWithCallBack9 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack10(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.stopPromise(avRecorder);
    await this.pausePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset AVRecorder success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('reset AVRecorder failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack11(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('avRecorderWithCallBack11 reset AVRecorder success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: BusinessError) => {
      console.info('avRecorderWithCallBack11 reset AVRecorder failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done);
  }

  async avRecorderWithCallBack13(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.resumePromise(avRecorder);
    await this.sleep(recorderTime);
    await this.stopPromise(avRecorder);
    await avRecorder.release().then(() => {
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      console.info('release success');
      done();
    }).catch((err: BusinessError) => {
      console.info('release failed and catch error is ' + err.message);
    });
  }

  async startTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('startTimeTestCallback avPlayer state is prepared');
      }, this.failureCallback).catch(this.catchCallback);
      let start = Date.now();
      console.info(`startTimeTestCallback start time is : ${start}`);
      let end: number;
      await avRecorder.start((err) => {
        if (err == null) {
          end = Date.now()
          console.info(`startTimeTestCallback end time is : ${end}`);
          console.info('startTimeTestCallback avRecorder success');
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("startTimeTestCallback execution time  is :" + execution);
          totalTime = totalTime + execution;
        } else {
          console.info('startTimeTestCallback failed and error is ' + err.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('startTimeTestCallback avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }, this.failureCallback).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("startTimeTestCallback avg time  is :" + avg);
    done();
  }

  async pauseTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('pauseTimeTestCallback avPlayer state is prepared');
      }, this.failureCallback).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start avRecorder success');
      }).catch((err: BusinessError) => {
        console.info('pauseTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let start = Date.now();
      console.info(`pauseTimeTestCallback start time is : ${start}`);
      let end: number;
      await avRecorder.pause((err) => {
        if (err == null) {
          end = Date.now()
          console.info(`pauseTimeTestCallback end time is : ${end}`);
          console.info('pause pauseTimeTestCallback success');
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("pauseTimeTestCallback execution time  is :" + execution);
          totalTime = totalTime + execution;
        } else {
          console.info('pause pauseTimeTestCallback failed and error is ' + err.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('pauseTimeTestCallback avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }, this.failureCallback).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("pauseTimeTestCallback avg time  is :" + avg);
    done();
  }

  async resumeTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resumeTimeTestCallback avPlayer state is prepared');
      }, this.failureCallback).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start resumeTimeTestCallback success');
      }).catch((err: BusinessError) => {
        console.info('resumeTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      await avRecorder.pause((err) => {
        if (err == null) {
          console.info('pause resumeTimeTestCallback success');
        } else {
          console.info('pause resumeTimeTestCallback failed and error is ' + err.message);
        }
      });
      let start = Date.now();
      console.info(`resumeTimeTestCallback start time is : ${start}`);
      await avRecorder.resume((err) => {
        if (err == null) {
          console.info('resume resumeTimeTestCallback success');
          end = Date.now()
          console.info(`resumeTimeTestCallback end time is : ${end}`);
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("resumeTimeTestCallback execution time  is :" + execution);
          totalTime = totalTime + execution;
        } else {
          console.info('resume resumeTimeTestCallback failed and error is ' + err.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('resumeTimeTestCallback avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }, this.failureCallback).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("resumeTimeTestCallback avg time  is :" + avg);
    done();
  }

  async stopTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('stopTimeTestCallback avPlayer state is prepared');
      }, this.failureCallback).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start stopTimeTestCallback success');
      }).catch((err: BusinessError) => {
        console.info('stopTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`stopTimeTestCallback start time is : ${start}`);
      await avRecorder.stop((err) => {
        if (err == null) {
          console.info('resume stopTimeTestCallback success');
          end = Date.now()
          console.info(`stopTimeTestCallback end time is : ${end}`);
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("stopTimeTestCallback execution time  is :" + execution);
          totalTime = totalTime + execution;
        } else {
          console.info('resume stopTimeTestCallback failed and error is ' + err.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('stopTimeTestCallback avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }, this.failureCallback).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("stopTimeTestCallback avg time  is :" + avg);
    done();
  }

  async resetTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resetTimeTestCallback avPlayer state is prepared');
      }, this.failureCallback).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start resetTimeTestCallback success');
      }).catch((err: BusinessError) => {
        console.info('resetTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`resetTimeTestCallback start time is : ${start}`);
      await avRecorder.reset((err) => {
        if (err == null) {
          console.info('resume resetTimeTestCallback success');
          end = Date.now()
          console.info(`resetTimeTestCallback end time is : ${end}`);
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("resetTimeTestCallback execution time  is :" + execution);
          totalTime = totalTime + execution;
        } else {
          console.info('resume resetTimeTestCallback failed and error is ' + err.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('resetTimeTestCallback avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }, this.failureCallback).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("resetTimeTestCallback avg time  is :" + avg);
    done();
  }

  async releaseTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('releaseTimeTestCallback avPlayer state is prepared');
      }, this.failureCallback).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start releaseTimeTestCallback success');
      }).catch((err: BusinessError) => {
        console.info('releaseTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`releaseTimeTestCallback start time is : ${start}`);
      await avRecorder.release((err) => {
        if (err == null) {
          console.info(`releaseTimeTestCallback current state is : ${avRecorder.state}`);
          console.info('release releaseTimeTestCallback success');
          end = Date.now();
          console.info(`releaseTimeTestCallback end time is : ${end}`);
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("releaseTimeTestCallback execution time  is :" + execution);
          totalTime = totalTime + execution;
          if (i == 9) {
            let avg = totalTime / 10;
            console.info("releaseTimeTestCallback avg time  is :" + avg);
            done();
          }
        } else {
          console.info('resume releaseTimeTestCallback failed and error is ' + err.message);
        }
      });
    }
  }

  async createTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      let start = Date.now();
      console.info(`createTimeTestPromise start time is : ${start}`);
      avRecorder = await this.idle(avRecorder);
      let end = Date.now();
      let difference: string = (end - start) + '';
      let execution = parseInt(difference);
      console.info("createTimeTestPromise execution time  is :" + execution);
      totalTime = totalTime + execution;
      await avRecorder.release().then(() => {
        console.info('createTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }, this.failureCallback).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("createTimeTestPromise avg time  is :" + avg);
    done();
  }

  async prepareTimePromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      let start = Date.now();
      console.info(`prepareTimeWithoutPromise start time is : ${start}`);
      let end: number;
      await avRecorder.prepare(avConfig).then(() => {
        console.info('prepare success');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('prepareTimeWithoutPromise avPlayer state is prepared');
        end = Date.now();
        console.info(`prepareTimeWithoutPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("prepareTimeWithoutPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
      }).catch((err: BusinessError) => {
        console.info('prepare failed and catch error is ' + err.message);
      });

      await avRecorder.release().then(() => {
        console.info('prepareTimeWithoutPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("prepareTimeWithoutPromise avg time  is :" + avg);
    done();
  }

  async getInputSurfaceTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder,
    recorderTime: number, done: Function) {
    let totalTime = 0;
    let surfaceID: string | null = null;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      let end: number;
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('getInputSurfaceTimeTestPromise avPlayer state is prepared');
      });
      let start = Date.now();
      console.info(`getInputSurfaceTimeTestPromise start time is : ${start}`);
      await avRecorder.getInputSurface().then((surfaceId) => {
        console.info('getInputSurfaceTimeTestPromise success');
        surfaceID = surfaceId;
        end = Date.now();
        console.info(`getInputSurfaceTimeTestPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("getInputSurfaceTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
      }).catch((err: BusinessError) => {
        console.info('getInputSurface failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('getInputSurfaceTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("getInputSurfaceTimeTestPromise avg time  is :" + avg);
    done();
  }

  async startTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      let end: number;
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('startTimeTestPromise avPlayer state is prepared');
      });
      let start = Date.now();
      console.info(`startTimeTestPromise start time is : ${start}`);
      await avRecorder.start().then(() => {
        console.info('start AVRecorder success');
        end = Date.now();
        console.info(`startTimeTestPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("startTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
        console.info('startTimeTestPromise avRecorder success');
      }).catch((err: BusinessError) => {
        console.info('start AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('startTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("startTimeTestPromise avg time  is :" + avg);
    done();
  }

  async pauseTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('pauseTimeTestPromise avPlayer state is prepared');
      });
      await avRecorder.start().then(() => {
        console.info('start avRecorder success');
      }).catch((err: BusinessError) => {
        console.info('pauseTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let start = Date.now();
      console.info(`pauseTimeTestPromise start time is : ${start}`);
      let end: number;
      await avRecorder.pause().then(() => {
        console.info('pause AVRecorder success');
        end = Date.now();
        console.info(`pauseTimeTestPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("pauseTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
        console.info('pause pauseTimeTestPromise success');
      }).catch((err: BusinessError) => {
        console.info('pause AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('pauseTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("pauseTimeTestPromise avg time  is :" + avg);
    done();
  }

  async resumeTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resumeTimeTestPromise avPlayer state is prepared');
      });

      await avRecorder.start().then(() => {
        console.info('start resumeTimeTestPromise success');
      }).catch((err: BusinessError) => {
        console.info('resumeTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      await avRecorder.pause((err) => {
        if (err == null) {
          console.info('pause resumeTimeTestPromise success');
        } else {
          console.info('pause resumeTimeTestPromise failed and error is ' + err.message);
        }
      });
      let start = Date.now();
      console.info(`resumeTimeTestPromise start time is : ${start}`);
      await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
        console.info('resume resumeTimeTestPromise success');
        end = Date.now();
        console.info(`resumeTimeTestPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("resumeTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
      }).catch((err: BusinessError) => {
        console.info('resume AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('resumeTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("resumeTimeTestPromise avg time  is :" + avg);
    done();
  }

  async stopTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('stopTimeTestPromise avPlayer state is prepared');
      });

      await avRecorder.start().then(() => {
        console.info('start stopTimeTestPromise success');
      }).catch((err: BusinessError) => {
        console.info('stopTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`stopTimeTestPromise start time is : ${start}`);
      await avRecorder.stop().then(() => {
        console.info('stop AVRecorder success');
        console.info('resume stopTimeTestPromise success');
        end = Date.now();
        console.info(`stopTimeTestPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("stopTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
      }).catch((err: BusinessError) => {
        console.info('stop AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('stopTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("stopTimeTestPromise avg time  is :" + avg);
    done();
  }

  async resetTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resetTimeTestPromise avPlayer state is prepared');
      });

      await avRecorder.start().then(() => {
        console.info('start resetTimeTestPromise success');
      }).catch((err: BusinessError) => {
        console.info('resetTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`resetTimeTestPromise start time is : ${start}`);
      await avRecorder.reset().then(() => {
        console.info('reset AVRecorder success');
        console.info('resume resetTimeTestPromise success');
        end = Date.now();
        console.info(`resetTimeTestPromise end time is : ${end}`);
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("resetTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
      }).catch((err: BusinessError) => {
        console.info('resume resetTimeTestPromise failed and error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('resetTimeTestPromise avPlayer is release');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("resetTimeTestPromise avg time  is :" + avg);
    done();
  }

  async releaseTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: Function) {
    let totalTime = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20);
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('releaseTimeTestPromise avPlayer state is prepared');
      });

      await avRecorder.start().then(() => {
        console.info('start releaseTimeTestPromise success');
      }).catch((err: BusinessError) => {
        console.info('releaseTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`releaseTimeTestPromise start time is : ${start}`);
      await avRecorder.release().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
        console.info('release AVRecorder success');
        console.info('resume releaseTimeTestPromise success');
        end = Date.now();
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("releaseTimeTestPromise execution time  is :" + execution);
        totalTime = totalTime + execution;
        console.info(`releaseTimeTestPromise end time is : ${end}`);
      }).catch((err: BusinessError) => {
        console.info('resume releaseTimeTestPromise failed and error is ' + err.message);
      });
    }
    let avg = totalTime / 10;
    console.info("releaseTimeTestPromise avg time  is :" + avg);
    done();
  }

  AV_RECORDER_AUDIO_STATE: ESObject = {
    PREPARED: 1,
    STARTED: 2,
    PAUSED: 3,
  }
}