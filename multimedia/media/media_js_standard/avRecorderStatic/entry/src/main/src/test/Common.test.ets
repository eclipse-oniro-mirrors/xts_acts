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

import { expect } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import PermissionRequestResult from 'security.PermissionRequestResult';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import media from '@ohos.multimedia.media'
import { BusinessError, AsyncCallback } from '@ohos.base';
import { globalThis } from './Util.test';
import common from '@ohos.app.ability.common';
import { Hypium } from '../../../hypium/index';
import audio from "@ohos.multimedia.audio";
import image from '@ohos.multimedia.image';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export interface FdObject {
  fileAsset: fs.File | null;
  fdNumber: number | null;
}

interface StateObject {
  IDLE: 'idle',
  PREPARED: 'prepared',
  STARTED: 'started',
  PAUSED: 'paused',
  STOPPED: 'stopped',
  RELEASED: 'released',
  ERROR: 'error',
}

interface AudioRecorderState {
  PREPARED: number;
  STARTED: number;
  PAUSED: number;
}

export default class Commmon {
  async getPermission(permissionNames: Array<Permissions>) {
    let atManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    let g_context: common.UIAbilityContext;
    g_context = globalThis.getContext();
    atManager.requestPermissionsFromUser(g_context, permissionNames).then((data: PermissionRequestResult) => {
      let grantStatus: Array<int> = data.authResults;
      let length: int = grantStatus.length as int;
      for (let i: int = 0; i < length; i++) {
        let authResultGrant: int = 0;
        let ret: int = grantStatus.$_get(i) as int
        if (ret == authResultGrant) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          // return;
        }
      }
      // 授权成功
    }).catch((err: Error) => {
      console.error(`Failed to request permissions from user. Code is ${JSON.stringify(err)}`);
    })
  }

  async driveFn(num: number) {
    await this.msleepAsync(2000);
    console.info("dxs: permissionButton : Driver.create() in")
    let driver = Driver.create();
    console.info("dxs: permissionButton : Driver.create() out")
    for (let i = 0; i < num; i++) {
      console.info("dxs: permissionButton : " + i)
      let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 5000);
      console.info("dxs: permissionButton : " + (permissionButton != null))
      if (permissionButton != null) {
        await permissionButton.click();
        await this.msleepAsync(1000); // 等待下一个权限请求弹窗出现
      }
    }
  }
  async msleepAsync(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count.toInt())
    })
  }
  // callback function for promise call back error
  failureCallback(error: BusinessError|null) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error!!.message}`);
  }
  // callback function for promise catch error
  catchCallback(error: Error) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
  }
  async getFd(pathName: string) {
    console.info('case come in getFd')
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    }
    let g_context: common.UIAbilityContext;
    g_context = globalThis.getContext();
    pathName = g_context?.filesDir + '/' + pathName;

    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info('case getFd number is: ' + fdObject.fdNumber);

    return new Promise<FdObject>((resolve, reject) => {
      resolve(fdObject)
    });
  }
  async closeFd(fdNumber: number | null | undefined) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber.toInt());
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }

  async saveVideo(asset: photoAccessHelper.PhotoAsset) {
    console.info('case saveVideo start');
    try {
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalThis.getContext()!!);
      let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
      assetChangeRequest.saveCameraPhoto();
      await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest);
      console.info('case saveVideo successfully');
    } catch (error) {
      console.info(`case error called,errMessage is ${error}`);
    }
    console.info('case saveVideo end');
  }

  msleep(time: number) {
    for (let t = Date.now(); Date.now() - t <= time; ) {
      ;
    }
  }

  /**avRecorderTestBase*/

  resourceName() {
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.m4a`;
    return filename;
  }

  async idleCallback(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, done: () => void) {
    console.info('case idleCallback called');
    media.createAVRecorder((error, recorder) => {
      if (recorder != null) {
        avRecorder = recorder;
        console.info('createAVRecorder idleCallback success');
        avRecorder.prepare(avConfig)
        this.releaseDone(avRecorder, done)
      } else {
        console.info(`createAVRecorder idleCallback fail, error:${error}`);
      }
    });
  }

  // create avRecorder(promise)
  async idle(avRecorder: media.AVRecorder) {
    console.info('case createAVRecorder called');
    await media.createAVRecorder().then((recorder: media.AVRecorder|undefined) => {
      if (recorder) {
        avRecorder = recorder;
        console.info('createAVRecorder success');
      } else {
        console.info('createAVRecorder fail');
      }
    }).catch((error: Error) => {
      console.info(`createAVRecorder catchCallback, error:${error}`);
    });
    return avRecorder;
  }

  AV_RECORDER_STATE: StateObject = {
    IDLE: 'idle',
    PREPARED: 'prepared',
    STARTED: 'started',
    PAUSED: 'paused',
    STOPPED: 'stopped',
    RELEASED: 'released',
    ERROR: 'error',
  }

  prepareCallback(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig) {
    if (typeof (avRecorder) === 'undefined') {
    } else {
      avRecorder.prepare(avConfig, (err: BusinessError|null) => {
        console.info('case prepare called' + err);
        if (err == null) {
          this.sleep(200)
          console.error(`case prepare success, state is ${avRecorder.state}`);
          expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
          console.info('prepare success');
        } else {
          console.error(`case prepare error, errMessage is ${err!!.message}`);
        }
      })
    }
  }

  async preparePromise(avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      console.info('prepare in current state' + avRecorder.state)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('prepare success');
      }).catch((err: Error) => {
        console.info('prepare failed and catch error is ' + err.message);
      });
    }
  }

  async getInputSurfacePromise(avRecorder: media.AVRecorder) {
    let surfaceID: string | undefined = undefined;
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.getInputSurface().then((surfaceId: string|undefined) => {
        console.info('getInputSurface success');
        surfaceID = surfaceId;
      }).catch((err: Error) => {
        console.info('getInputSurface failed and catch error is ' + err.message);
      });
    }
  }

  getInputSurfaceCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    let surfaceID: string | undefined = undefined;
    avRecorder.getInputSurface((err: BusinessError|null, surfaceId: string|undefined) => {
      if (err == null) {
        console.info('getInputSurface success');
        surfaceID = surfaceId;
      } else {
        console.info('getInputSurface failed and error is ' + err!!.message);
      }
    });
  }

  async getAVRecorderConfigPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) === 'undefined') {
    } else {
      await avRecorder.getAVRecorderConfig().then((config) => {
        console.info('getAVRecorderConfig success');
        expect(config!!.audioSourceType).assertEqual(avConfig.audioSourceType);
        // expect(config.audioBitrate).assertEqual(avConfig.audioBitrate);
      }).catch((err: Error) => {
        console.info('getAVRecorderConfig failed and catch error is ' + err.message);
      });
    }
  }

  startCallback(avRecorder: media.AVRecorder, recorderTime?: number) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    avRecorder.start((err: BusinessError|null) => {
      console.info('case start called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STARTED);
        console.info('start AVRecorder success');
        if (recorderTime != undefined) {
          setTimeout(() => {
            console.info('this.startCallback setTimeout success');
          }, recorderTime.toInt());
        }
      } else {
        console.info('start AVRecorder failed and error is ' + err!!.message);
      }
    })
  }

  async startPromise(avRecorder: media.AVRecorder, recorderTime?: number) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.start().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STARTED);
        console.info('start success');
        if (recorderTime != undefined) {
          setTimeout(() => {
            console.info('startPromise setTimeout success');
          }, recorderTime.toInt());
        }
      }).catch((err: Error) => {
        console.info('start failed and catch error is ' + err.message);
      });
    }
  }

  async pauseCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      avRecorder.pause((err: BusinessError|null) => {
        console.info('case pause called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PAUSED);
          console.info('pause AVRecorder success');
        } else {
          console.info('pause AVRecorder failed and error is ' + err!!.message);
        }
      })
    }
  }

  async pausePromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.pause().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PAUSED);
        console.info('pause success');
      }).catch((err: Error) => {
        console.info('pause failed and catch error is ' + err.message);
      });
    }
  }

  resumeCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    avRecorder.resume((err: BusinessError|null) => {
      console.info('case resume called');
      if (err == null) {
        console.info('resume AVRecorder success');
      } else {
        console.info('resume AVRecorder failed and error is ' + err!!.message);
      }
    })
  }

  async resumePromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.resume().then(() => {
        console.info('resume success');
      }).catch(this.catchCallback);
    }
  }

  stopCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
      return;
    }
    avRecorder.stop((err: BusinessError|null) => {
      console.info('case stop called');
      if (err == null) {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STOPPED);
        console.info('stop AVRecorder success');
      } else {
        console.info('stop AVRecorder failed and error is ' + err!!.message);
      }
    })
  }

  async stopPromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.stop().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.STOPPED);
        console.info('stop success');
      }).catch((err: Error) => {
        console.info('stop failed and catch error is ' + err.message);
      });
    }
  }

  async resetCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      avRecorder.reset((err: BusinessError|null) => {
        console.info('case reset called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
          console.info('reset AVRecorder success');
        } else {
          console.info('reset AVRecorder failed and error is ' + err!!.message);
        }
      })
    }
  }

  async resetPromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.reset().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
      }).catch((err: Error) => {
        console.info('reset AVRecorder failed and catch error is ' + err.message);
      });
    }
  }

  async releaseCallback(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      avRecorder.release((err: BusinessError|null) => {
        console.info('case release called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
          console.info('release AVRecorder success');
        } else {
          console.info('release AVRecorder failed and error is ' + err!!.message);
        }
      })
    }
  }

  async releasePromise(avRecorder: media.AVRecorder) {
    if (typeof (avRecorder) == 'undefined') {
    } else {
      await avRecorder.release().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch((err: Error) => {
        console.info('release AVRecorder failed and catch error is ' + err.message);
      });
    }
  }

  async releaseDone(avRecorder: media.AVRecorder, done: () => void) {
    console.info('DXS__releaseDone___1')
    await avRecorder.release().then(() => {
      console.info('DXS__releaseDone___2')
      console.info('this.releaseDone avRecorder.state is ' + avRecorder.state);
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      console.info('DXS__releaseDone___3')
      done();
    }).catch((err: Error) => {
      console.info('DXS__releaseDone___4')
      console.info('release this.releaseDone failed and catch error is ' + err.message);
    });
  }

  sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      setTimeout(() => {
        resolve(undefined)
      }, ms.toInt())
    });
  }

  async setOnCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case setOnCallback in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      let stateValue: string = state as string
      switch (state) {
        case 'idle':
          console.info(`case avRecorderWithCallBack is idle`);
          expect(avRecorder.state).assertEqual("idle");
          // start->stop->release
          this.prepareCallback(avRecorder, avConfig);
          break;
        case 'prepared':
          console.info(`case avRecorderWithCallBack is prepared`);
          expect(avRecorder.state).assertEqual('prepared');
          this.startCallback(avRecorder);
          break;
        case 'started':
          console.info(`case avRecorderWithCallBack is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          this.stopCallback(avRecorder);
          break;
        case 'paused':
          console.info(`case avRecorderWithCallBackis paused`)
          expect(avRecorder.state).assertEqual('paused');
          break;
        case 'stopped':
          console.info(`case avRecorderWithCallBack is stopped`)
          expect(avRecorder.state).assertEqual('stopped');
          this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case avRecorderWithCallBack is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case avRecorderWithCallBack is error`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });

    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
    });
  }

  async setPrepareOnCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case setOnCallback in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case this.AV_RECORDER_STATE.PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.releaseCallback(avRecorder);
          break;
        case 'released':
          console.info(`case setPrepareOnCallback is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case this.AV_RECORDER_STATE.ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
  }

  async avRecorderWithCallBack(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    // Create an instance
    avRecorder = await this.idle(avRecorder)
    this.setOnCallback(avConfig, avRecorder, recorderTime, done);
    await avRecorder.prepare(avConfig)
  }

  async avRecorderWithCallBack2(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.stopPromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack2 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack2 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack3(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
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
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack3 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack4(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.stopPromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack4 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack4 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack5(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.resumePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack5 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack5 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack6(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await this.startPromise(avRecorder, recorderTime);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack6 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack6 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack7(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
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
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack7 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack8(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
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
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack8 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack9(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.stopPromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset avRecorderWithCallBack9 success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('reset avRecorderWithCallBack9 failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack10(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.stopPromise(avRecorder);
    await this.pausePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('reset AVRecorder success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('reset AVRecorder failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack11(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await this.preparePromise(avRecorder, avConfig);
    await this.startPromise(avRecorder, recorderTime);
    await this.pausePromise(avRecorder);
    await avRecorder.reset().then(() => {
      console.info('avRecorderWithCallBack11 reset AVRecorder success');
      expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.IDLE);
    }).catch((err: Error) => {
      console.info('avRecorderWithCallBack11 reset AVRecorder failed and catch error is ' + err.message);
    });
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderWithCallBack13(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
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
    }).catch((err: Error) => {
      console.info('release failed and catch error is ' + err.message);
    });
  }

  async avRecorderReliabilitTest01(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    this.sleep(2000)
    avRecorder.pause((err: BusinessError|null) => {
      if (err == null) {
        console.info('pause avRecorderReliabilitTest01 success');
      } else {
        result = false
        expect(result).assertEqual(false);
        console.info('pause avRecorderReliabilitTest01 failed and error is ' + err!!.message);
        this.sleep(1000)
      }
    });
    this.sleep(2000)
    console.info('pause avRecorderReliabilitTest01 001');
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest02(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest03(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.setPrepareOnCallback(avConfig, avRecorder, recorderTime, done)
    await avRecorder.prepare(avConfig)
  }

  async avRecorderReliabilitTest001(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder,
    recorderTime: number, done: () => void) {
    this.idleCallback(avRecorder, avConfig, done)
  }

  async avRecorderReliabilitTest04(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await avRecorder.resume().then(() => {
      console.info('resume avRecorderReliabilitTest04 success');
    }).catch((err: Error) => {
      console.info('resume avRecorderReliabilitTest04 failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.preparePromise(avRecorder, avConfig)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest05(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.prepareCallback(avRecorder, avConfig)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest06(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await this.startPromise(avRecorder)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest07(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.resumePromise(avRecorder)
    await this.startPromise(avRecorder)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest08(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest08 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest08 failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest09(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest09 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest09 failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest10(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest11(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.resumePromise(avRecorder)
    await this.pausePromise(avRecorder)
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest12(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.stopPromise(avRecorder)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest12 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest12 failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest13(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.stopPromise(avRecorder)
    await this.resetPromise(avRecorder)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest13 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest13 failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest14(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result1 = true;
    let result2 = true;
    let result3 = true;
    let result4 = true;
    let result5 = true;

    avRecorder = await this.idle(avRecorder);
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest14 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest14 failed and catch error is ' + err.message);
      result1 = false
    });
    expect(result1).assertEqual(false);

    await this.preparePromise(avRecorder, avConfig)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest14 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest14 failed and catch error is ' + err.message);
      result2 = false
    });
    expect(result2).assertEqual(false);

    await this.startPromise(avRecorder)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest14 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest14 failed and catch error is ' + err.message);
      result3 = false
    });
    expect(result3).assertEqual(false);

    await this.stopPromise(avRecorder)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest14 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest14 failed and catch error is ' + err.message);
      result4 = false
    });
    expect(result4).assertEqual(false);

    await this.resetPromise(avRecorder)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest14 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest14 failed and catch error is ' + err.message);
      result5 = false
    });
    expect(result5).assertEqual(false);

    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest15(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result1 = true;
    let result2 = true;
    let result3 = true;

    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest15 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest15 failed and catch error is ' + err.message);
      result1 = false
    });
    expect(result1).assertEqual(false);

    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest15 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest15 failed and catch error is ' + err.message);
      result2 = false
    });
    expect(result2).assertEqual(false);

    await avRecorder.pause().then(() => {
      console.info('pause avRecorderReliabilitTest15 success');
    }).catch((err: Error) => {
      console.info('pause avRecorderReliabilitTest15 failed and catch error is ' + err.message);
      result3 = false
    });
    expect(result3).assertEqual(false);

    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest16(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await avRecorder.resume().then(() => {
      console.info('resume AVRecorder success');
    }).catch((err: Error) => {
      console.info('resume AVRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest17(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await avRecorder.resume().then(() => {
      console.info('resume AVRecorder success');
    }).catch((err: Error) => {
      console.info('resume AVRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest18(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest18 resume AVRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest18 resume AVRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest19(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest19 resume AVRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest19 resume AVRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest20(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.stopPromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest20 resume AVRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest20 resume AVRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest21(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await this.resetPromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest20 resume AVRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest20 resume AVRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest22(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result1 = true;
    let result2 = true;
    let result3 = true;
    let result4 = true;
    let result5 = true;

    avRecorder = await this.idle(avRecorder);
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest22 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest22 resume avRecorder failed and catch error is ' + err.message);
      result1 = false
    });
    expect(result1).assertEqual(false);

    await this.preparePromise(avRecorder, avConfig)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest22 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest22 resume avRecorder failed and catch error is ' + err.message);
      result2 = false
    });
    expect(result2).assertEqual(false);

    await this.startPromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest22 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest22 resume avRecorder failed and catch error is ' + err.message);
      result3 = false
    });
    expect(result3).assertEqual(false);

    await this.pausePromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest22 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest22 resume avRecorder failed and catch error is ' + err.message);
      result4 = false
    });
    expect(result4).assertEqual(false);

    await this.resetPromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest22 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest22 resume avRecorder failed and catch error is ' + err.message);
      result5 = false
    });
    expect(result5).assertEqual(false);

    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest23(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result1 = true;
    let result2 = true;
    let result3 = true;

    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest23 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest23 resume avRecorder failed and catch error is ' + err.message);
      result1 = false
    });
    expect(result1).assertEqual(false);

    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest23 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest23 resume avRecorder failed and catch error is ' + err.message);
      result2 = false
    });
    expect(result2).assertEqual(false);

    await avRecorder.resume().then(() => {
      console.info('avRecorderReliabilitTest23 resume avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest23 resume avRecorder failed and catch error is ' + err.message);
      result3 = false
    });
    expect(result3).assertEqual(false);

    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest24(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder, recorderTime)
    await this.pausePromise(avRecorder)
    await avRecorder.stop().then(() => {
      console.info('avRecorderReliabilitTest24 stop avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest24 stop avRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest25(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder, recorderTime)
    await this.pausePromise(avRecorder)
    await this.resumePromise(avRecorder)
    await avRecorder.stop().then(() => {
      console.info('avRecorderReliabilitTest25 stop avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest25 stop avRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest26(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await avRecorder.reset().then(() => {
      console.info('avRecorderReliabilitTest26 reset avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest26 reset avRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(true);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest27(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await this.resumePromise(avRecorder)
    await avRecorder.reset().then(() => {
      console.info('avRecorderReliabilitTest27 reset avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest27 reset avRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(true);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest28(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await avRecorder.release().then(() => {
      console.info('avRecorderReliabilitTest28 release avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest28 release avRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(true);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest29(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await this.resumePromise(avRecorder)
    await avRecorder.release().then(() => {
      console.info('avRecorderReliabilitTest29 release avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest29 release avRecorder failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(true);
    await this.releaseDone(avRecorder, done)
  }

  async avRecorderReliabilitTest30(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result1 = true;
    let result2 = true;
    let result3 = true;

    avRecorder = await this.idle(avRecorder);
    await this.preparePromise(avRecorder, avConfig)
    await this.startPromise(avRecorder)
    await this.pausePromise(avRecorder)
    await avRecorder.release().then(() => {
      console.info('avRecorderReliabilitTest30 release avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest30 release avRecorder failed and catch error is ' + err.message);
      result1 = false
    });
    expect(result1).assertEqual(true);

    await avRecorder.release().then(() => {
      console.info('avRecorderReliabilitTest30 release avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest30 release avRecorder failed and catch error is ' + err.message);
      result2 = false
    });
    expect(result2).assertEqual(true);

    await avRecorder.release().then(() => {
      console.info('avRecorderReliabilitTest30 release avRecorder success');
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest30 release avRecorder failed and catch error is ' + err.message);
      result3 = false
    });
    expect(result3).assertEqual(true);
    done();
  }

  async avRecorderReliabilitTest31(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let surfaceID: string | undefined = undefined;
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await avRecorder.getInputSurface().then((surfaceId: string|undefined) => {
      console.info('avRecorderReliabilitTest31 getInputSurface success');
      surfaceID = surfaceId;
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest31 getInputSurface failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }

  async getInputSurfaceTest32(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getInputSurfaceTest in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getInputSurfaceTest32 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          setTimeout(async () => {
            await this.getInputSurfacePromise(avRecorder)
            await this.releasePromise(avRecorder)
          }, 2000);

          break;
        case 'released':
          console.info(`case getInputSurfaceTest32 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest32 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case getInputSurfaceTest32 avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest32(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest32(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getInputSurfaceTest33(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getInputSurfaceTest33 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getInputSurfaceTest33 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.getInputSurfacePromise(avRecorder)
          this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getInputSurfaceTest33 state is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          console.info(`case getInputSurfaceTest33 111`)
          this.getInputSurfacePromise(avRecorder)
          console.info(`case getInputSurfaceTest33 222`)
          this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getInputSurfaceTest33 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest33 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest33(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest33(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getInputSurfaceTest34(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getInputSurfaceTest34 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getInputSurfaceTest34 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.getInputSurfacePromise(avRecorder)
          this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getInputSurfaceTest34 state is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          this.pausePromise(avRecorder)
          break;
        case 'paused':
          console.info(`case getInputSurfaceTest34 state is paused`)
          expect(avRecorder.state).assertEqual('paused');
          this.getInputSurfacePromise(avRecorder)
          this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getInputSurfaceTest34 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest34 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest34(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest34(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getInputSurfaceTest35(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getInputSurfaceTest35 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getInputSurfaceTest35 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          await this.getInputSurfacePromise(avRecorder)
          await this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getInputSurfaceTest35 state is started`)
          expect(avRecorder.state).assertEqual('started');
          setTimeout(async () => {
            console.info('getInputSurfaceTest35 setTimeout success');
            await this.pausePromise(avRecorder)
          }, recorderTime.toInt());
          break;
        case 'paused':
          console.info(`case getInputSurfaceTest35 state is paused`)
          expect(avRecorder.state).assertEqual('paused');
          await this.resumePromise(avRecorder)
          await this.getInputSurfacePromise(avRecorder)
          await this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getInputSurfaceTest35 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest35 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest35(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest35(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getInputSurfaceTest36(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getInputSurfaceTest36 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getInputSurfaceTest36 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          await this.getInputSurfacePromise(avRecorder)
          await this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getInputSurfaceTest36 state is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          setTimeout(async () => {
            console.info('getInputSurfaceTest36 setTimeout success');
            await this.stopPromise(avRecorder)
          }, recorderTime.toInt());
          break;
        case 'stopped':
          console.info(`case getInputSurfaceTest36 state is stopped`)
          expect(avRecorder.state).assertEqual('stopped');
          await this.getInputSurfacePromise(avRecorder)
          await this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getInputSurfaceTest36 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest36 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest36(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest36(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getInputSurfaceTest37(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getInputSurfaceTest37 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case "idle":
          console.info(`case getInputSurfaceTest37 state is idle`);
          expect(avRecorder.state).assertEqual("idle");
          await this.getInputSurfacePromise(avRecorder)
          await this.releasePromise(avRecorder)
          break;
        case 'prepared':
          console.info(`case getInputSurfaceTest37 state isPREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          await this.getInputSurfacePromise(avRecorder)
          await this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getInputSurfaceTest37 state isstarted`)
          expect(avRecorder.state).assertEqual('started');
          setTimeout(async () => {
            console.info('getInputSurfaceTest37 setTimeout success');
            await this.resetPromise(avRecorder)
          }, recorderTime.toInt());
          break;
        case 'released':
          console.info(`case getInputSurfaceTest37 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest37 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest37(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest37(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getInputSurfaceCatachError(avRecorder: media.AVRecorder, result: boolean, surfaceID: string | undefined) {
    await avRecorder.getInputSurface().then((surfaceId: string|undefined) => {
      console.info('getInputSurfaceTest38 getInputSurface success');
      surfaceID = surfaceId;
    }).catch((err: Error) => {
      console.info('getInputSurfaceTest38 getInputSurface failed and catch error is ' + err!!.message);
      result = false
      console.info('getInputSurfaceTest38 getInputSurface result is ' + result);
      expect(result).assertEqual(false);
    });
  }

  async getInputSurfaceTest38(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let result1 = true;
    let result2 = true;
    let result3 = true;
    let surfaceID: string | undefined = undefined;
    console.info(`case getInputSurfaceTest38 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getInputSurfaceTest38 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.getInputSurfaceCatachError(avRecorder, result1, surfaceID)
          this.getInputSurfaceCatachError(avRecorder, result2, surfaceID)
          this.getInputSurfaceCatachError(avRecorder, result3, surfaceID)
          this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getInputSurfaceTest38 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getInputSurfaceTest38 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest38(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getInputSurfaceTest38(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async avRecorderReliabilitTest39(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let avRecorderConfig: media.AVRecorderConfig;
    let result = true;
    avRecorder = await this.idle(avRecorder);
    await avRecorder.getAVRecorderConfig().then((config) => {
      console.info('avRecorderReliabilitTest39 getAVRecorderConfig success');
      avRecorderConfig = config!!;
    }).catch((err: Error) => {
      console.info('avRecorderReliabilitTest31 getAVRecorderConfig failed and catch error is ' + err.message);
      result = false
    });
    expect(result).assertEqual(false);
    await this.releaseDone(avRecorder, done)
  }
  async avRecorderReliabilitTestCallback39(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let avRecorderConfig: media.AVRecorderConfig;
    let result = true;
    avRecorder = await this.idle(avRecorder);
    avRecorder.getAVRecorderConfig((err: BusinessError<void> | null, config: media.AVRecorderConfig | undefined) => {
      console.info('avRecorderReliabilitTest39 getAVRecorderConfig callback called');
      if (err != null) {
        console.info('avRecorderReliabilitTest39 getAVRecorderConfig callback err is ' + err.message);
        result = false;
      } else {
        console.info('avRecorderReliabilitTest39 getAVRecorderConfig callback config is ' + JSON.stringify(config));
        avRecorderConfig = config!!;
      }
      expect(result).assertEqual(false);
      await this.releaseDone(avRecorder, done)
    });
  }

  async getAVRecorderConfigTest40(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getAVRecorderConfigTest40 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getAVRecorderConfigTest40 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          setTimeout(async () => {
            await this.getAVRecorderConfigPromise(avConfig, avRecorder)
            await this.releasePromise(avRecorder)
          }, 2000);
          break;
        case 'released':
          console.info(`case getAVRecorderConfigTest40 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getAVRecorderConfigTest40 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case getAVRecorderConfigTest40 avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest40(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getAVRecorderConfigTest40(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getAVRecorderConfigTest41(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getAVRecorderConfigTest41 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getAVRecorderConfigTest41 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.getAVRecorderConfigPromise(avConfig, avRecorder)
          this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getAVRecorderConfigTest41 state is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          console.info(`case getAVRecorderConfigTest41 111`)
          this.getAVRecorderConfigPromise(avConfig, avRecorder)
          console.info(`case getAVRecorderConfigTest41 222`)
          this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getAVRecorderConfigTest41 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getAVRecorderConfigTest41 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest41(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getAVRecorderConfigTest41(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getAVRecorderConfigTest42(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getAVRecorderConfigTest42 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getAVRecorderConfigTest42 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          this.getAVRecorderConfigPromise(avConfig, avRecorder)
          this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getAVRecorderConfigTest42 state is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          this.pausePromise(avRecorder)
          break;
        case 'paused':
          console.info(`case getAVRecorderConfigTest42 state is paused`)
          expect(avRecorder.state).assertEqual('paused');
          this.getAVRecorderConfigPromise(avConfig, avRecorder)
          this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getAVRecorderConfigTest42 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getAVRecorderConfigTest42 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest42(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getAVRecorderConfigTest42(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getAVRecorderConfigTest43(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getAVRecorderConfigTest43 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getAVRecorderConfigTest43 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          await this.getAVRecorderConfigPromise(avConfig, avRecorder)
          await this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getAVRecorderConfigTest43 state is started`)
          expect(avRecorder.state).assertEqual('started');
          setTimeout(async () => {
            console.info('getAVRecorderConfigTest43 setTimeout success');
            await this.pausePromise(avRecorder)
          }, recorderTime.toInt());
          break;
        case 'paused':
          console.info(`case getAVRecorderConfigTest43 state is paused`)
          expect(avRecorder.state).assertEqual('paused');
          await this.resumePromise(avRecorder)
          await this.getAVRecorderConfigPromise(avConfig, avRecorder)
          await this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getAVRecorderConfigTest43 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getAVRecorderConfigTest43 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest43(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getAVRecorderConfigTest43(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async getAVRecorderConfigTest44(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getAVRecorderConfigTest44 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case 'prepared':
          console.info(`case getAVRecorderConfigTest44 state is PREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          await this.getAVRecorderConfigPromise(avConfig, avRecorder)
          await this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getAVRecorderConfigTest44 state is started`)
          expect(avRecorder.state).assertEqual('started');
          await this.sleep(recorderTime);
          setTimeout(async () => {
            console.info('getAVRecorderConfigTest44 setTimeout success');
            await this.stopPromise(avRecorder)
          }, recorderTime.toInt());
          break;
        case 'stopped':
          console.info(`case getAVRecorderConfigTest44 state is stopped`)
          expect(avRecorder.state).assertEqual('stopped');
          await this.getAVRecorderConfigPromise(avConfig, avRecorder)
          await this.releasePromise(avRecorder)
          break;
        case 'released':
          console.info(`case getAVRecorderConfigTest44 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getAVRecorderConfigTest44 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async getAVRecorderConfigTest45(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    console.info(`case getAVRecorderConfigTest45 in`);
    avRecorder.onStateChange((state: media.AVRecorderState, reason: media.StateChangeReason) => {
      console.info('case state has changed, new state is :' + state);
      switch (state) {
        case "idle":
          console.info(`case getAVRecorderConfigTest45 state is idle`);
          expect(avRecorder.state).assertEqual("idle");
          await this.getAVRecorderConfigPromise(avConfig, avRecorder)
          await this.releasePromise(avRecorder)
          break;
        case 'prepared':
          console.info(`case getAVRecorderConfigTest45 state isPREPARED`);
          expect(avRecorder.state).assertEqual('prepared');
          await this.getAVRecorderConfigPromise(avConfig, avRecorder)
          await this.startPromise(avRecorder)
          break;
        case 'started':
          console.info(`case getAVRecorderConfigTest45 state isstarted`)
          expect(avRecorder.state).assertEqual('started');
          setTimeout(async () => {
            console.info('getAVRecorderConfigTest45 setTimeout success');
            await this.resetPromise(avRecorder)
          }, recorderTime.toInt());
          break;
        case 'released':
          console.info(`case getAVRecorderConfigTest45 state is released`);
          expect(avRecorder.state).assertEqual('released');
          done();
          break;
        case 'error':
          console.info(`case getAVRecorderConfigTest45 state is ERROR`)
          expect(avRecorder.state).assertEqual('error');
          break;
        default:
          console.info('case state is unknown');
      }
    });
    avRecorder.onError((err: BusinessError|null) => {
      console.info('case avRecorder.on(error) called, errMessage is ' + err!!.message);
      done();
    });
  }

  async avRecorderReliabilitTest45(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    avRecorder = await this.idle(avRecorder);
    this.getAVRecorderConfigTest45(avConfig, avRecorder, recorderTime, done)
    await this.preparePromise(avRecorder, avConfig)
  }

  async createTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      let start = Date.now();
      console.info(`createTimeTestCallback start time is : ${start}`)
      avRecorder = await this.idle(avRecorder);
      let end = Date.now();
      let difference: string = (end - start) + '';
      let execution = parseInt(difference);
      console.info("createTimeTestCallback execution time  is :" + execution)
      totalTime = totalTime + execution;
      await avRecorder.release().then(() => {
        console.info('createTimeTestCallback avPlayer is release')
        console.info(`createTimeTestCallback avRecorder.state is : ${avRecorder.state}`)
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
        if (i == 9) {
          let avg = totalTime / 10;
          console.info("createTimeTest avg time  is :" + avg)
          done();
        }
      }).catch(this.catchCallback);
    }
  }

  async prepareTimeCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      let start = Date.now();
      console.info(`prepareTimeWithoutCallback start time is : ${start}`)
      let end = Date.now();
      avRecorder.prepare(avConfig, (err: BusinessError|null) => {
        if (err == null) {
          expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
          console.info('prepareTimeWithoutCallback avPlayer state is prepared')
          end = Date.now()
          console.info(`prepareTimeWithoutCallback end time is : ${end}`)
        } else {
          console.info('prepare failed and error is ' + err!!.message);
        }
      })
      let difference: string = (end - start) + '';
      let execution = parseInt(difference);
      console.info("prepareTimeWithoutCallback execution time  is :" + execution)
      totalTime = totalTime + execution;
      await avRecorder.release().then(() => {
        console.info('prepareTimeWithoutCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("prepareTimeWithoutCallback avg time  is :" + avg)
    done();
  }

  async getInputSurfaceTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder,
    recorderTime: number, done: () => void) {
    let totalTime: number = 0;
    let surfaceID: string | undefined = undefined;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('getInputSurfaceTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);

      let start = Date.now();
      console.info(`getInputSurfaceTimeTestCallback start time is : ${start}`)
      let end: number;
      avRecorder.getInputSurface((err: BusinessError|null, surfaceId: string|undefined) => {
        if (err == null) {
          console.info('getInputSurfaceTimeTestCallback success');
          surfaceID = surfaceId;
          end = Date.now()
          console.info(`getInputSurfaceTimeTestCallback end time is : ${end}`)
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("getInputSurfaceTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
        } else {
          console.info('getInputSurfaceTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('getInputSurfaceTimeTestCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("getInputSurfaceTimeTestCallback avg time  is :" + avg)
    done();
  }

  async startTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('startTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);
      let start = Date.now();
      console.info(`startTimeTestCallback start time is : ${start}`)
      let end: number;
      avRecorder.start((err: BusinessError|null) => {
        if (err == null) {
          end = Date.now()
          console.info(`startTimeTestCallback end time is : ${end}`)
          console.info('startTimeTestCallback avRecorder success');
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("startTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
        } else {
          console.info('startTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('startTimeTestCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("startTimeTestCallback avg time  is :" + avg)
    done();
  }

  async pauseTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('pauseTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start avRecorder success');
      }).catch((err: Error) => {
        console.info('pauseTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let start = Date.now();
      console.info(`pauseTimeTestCallback start time is : ${start}`)
      let end: number;
      avRecorder.pause((err: BusinessError|null) => {
        if (err == null) {
          end = Date.now()
          console.info(`pauseTimeTestCallback end time is : ${end}`)
          console.info('pause pauseTimeTestCallback success');
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("pauseTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
        } else {
          console.info('pause pauseTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('pauseTimeTestCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("pauseTimeTestCallback avg time  is :" + avg)
    done();
  }

  async resumeTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resumeTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start resumeTimeTestCallback success');
      }).catch((err: Error) => {
        console.info('resumeTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      avRecorder.pause((err: BusinessError|null) => {
        if (err == null) {
          console.info('pause resumeTimeTestCallback success');
        } else {
          console.info('pause resumeTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      let start = Date.now();
      console.info(`resumeTimeTestCallback start time is : ${start}`)
      avRecorder.resume((err: BusinessError|null) => {
        if (err == null) {
          console.info('resume resumeTimeTestCallback success');
          end = Date.now()
          console.info(`resumeTimeTestCallback end time is : ${end}`)
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("resumeTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
        } else {
          console.info('resume resumeTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('resumeTimeTestCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("resumeTimeTestCallback avg time  is :" + avg)
    done();
  }

  async stopTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('stopTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start stopTimeTestCallback success');
      }).catch((err: Error) => {
        console.info('stopTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`stopTimeTestCallback start time is : ${start}`)
      avRecorder.stop((err: BusinessError|null) => {
        if (err == null) {
          console.info('resume stopTimeTestCallback success');
          end = Date.now()
          console.info(`stopTimeTestCallback end time is : ${end}`)
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("stopTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
        } else {
          console.info('resume stopTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('stopTimeTestCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("stopTimeTestCallback avg time  is :" + avg)
    done();
  }

  async resetTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resetTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start resetTimeTestCallback success');
      }).catch((err: Error) => {
        console.info('resetTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`resetTimeTestCallback start time is : ${start}`)
      avRecorder.reset((err: BusinessError|null) => {
        if (err == null) {
          console.info('resume resetTimeTestCallback success');
          end = Date.now()
          console.info(`resetTimeTestCallback end time is : ${end}`)
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("resetTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
        } else {
          console.info('resume resetTimeTestCallback failed and error is ' + err!!.message);
        }
      });
      await avRecorder.release().then(() => {
        console.info('resetTimeTestCallback avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("resetTimeTestCallback avg time  is :" + avg)
    done();
  }

  async releaseTimeTestCallback(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('releaseTimeTestCallback avPlayer state is prepared')
      }).catch(this.catchCallback);

      await avRecorder.start().then(() => {
        console.info('start releaseTimeTestCallback success');
      }).catch((err: Error) => {
        console.info('releaseTimeTestCallback start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`releaseTimeTestCallback start time is : ${start}`)
      avRecorder.release((err: BusinessError|null) => {
        if (err == null) {
          console.info(`releaseTimeTestCallback current state is : ${avRecorder.state}`)
          console.info('release releaseTimeTestCallback success');
          end = Date.now()
          console.info(`releaseTimeTestCallback end time is : ${end}`)
          let difference: string = (end - start) + '';
          let execution = parseInt(difference);
          console.info("releaseTimeTestCallback execution time  is :" + execution)
          totalTime = totalTime + execution;
          if (i == 9) {
            let avg = totalTime / 10;
            console.info("releaseTimeTestCallback avg time  is :" + avg)
            done();
          }
        } else {
          console.info('resume releaseTimeTestCallback failed and error is ' + err!!.message);
        }
      });
    }
  }


  async createTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      let start = Date.now();
      console.info(`createTimeTestPromise start time is : ${start}`)
      avRecorder = await this.idle(avRecorder);
      let end = Date.now()
      let difference: string = (end - start) + '';
      let execution = parseInt(difference);
      console.info("createTimeTestPromise execution time  is :" + execution)
      totalTime = totalTime + execution;
      await avRecorder.release().then(() => {
        console.info('createTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      }).catch(this.catchCallback);
    }
    let avg = totalTime / 10;
    console.info("createTimeTestPromise avg time  is :" + avg)
    done();
  }

  async prepareTimePromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      let start = Date.now();
      console.info(`prepareTimeWithoutPromise start time is : ${start}`)
      let end: number;
      await avRecorder.prepare(avConfig).then(() => {
        console.info('prepare success');
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('prepareTimeWithoutPromise avPlayer state is prepared')
        end = Date.now()
        console.info(`prepareTimeWithoutPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("prepareTimeWithoutPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
      }).catch((err: Error) => {
        console.info('prepare failed and catch error is ' + err!!.message);
      });

      await avRecorder.release().then(() => {
        console.info('prepareTimeWithoutPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("prepareTimeWithoutPromise avg time  is :" + avg)
    done();
  }

  async getInputSurfaceTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder,
    recorderTime: number, done: () => void) {
    let totalTime: number = 0;
    let surfaceID: string | undefined = undefined;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      let end: number;
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('getInputSurfaceTimeTestPromise avPlayer state is prepared')
      });
      let start = Date.now();
      console.info(`getInputSurfaceTimeTestPromise start time is : ${start}`)
      await avRecorder.getInputSurface().then((surfaceId: string|undefined) => {
        console.info('getInputSurfaceTimeTestPromise success');
        surfaceID = surfaceId;
        end = Date.now()
        console.info(`getInputSurfaceTimeTestPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("getInputSurfaceTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
      }).catch((err: Error) => {
        console.info('getInputSurface failed and catch error is ' + err!!.message);
      });
      await avRecorder.release().then(() => {
        console.info('getInputSurfaceTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("getInputSurfaceTimeTestPromise avg time  is :" + avg)
    done();
  }

  async startTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      let end: number;
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('startTimeTestPromise avPlayer state is prepared')
      });
      let start = Date.now();
      console.info(`startTimeTestPromise start time is : ${start}`)
      await avRecorder.start().then(() => {
        console.info('start AVRecorder success');
        end = Date.now()
        console.info(`startTimeTestPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("startTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
        console.info('startTimeTestPromise avRecorder success');
      }).catch((err: Error) => {
        console.info('start AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('startTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("startTimeTestPromise avg time  is :" + avg)
    done();
  }

  async pauseTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('pauseTimeTestPromise avPlayer state is prepared')
      });
      await avRecorder.start().then(() => {
        console.info('start avRecorder success');
      }).catch((err: Error) => {
        console.info('pauseTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let start = Date.now();
      console.info(`pauseTimeTestPromise start time is : ${start}`)
      let end: number;
      await avRecorder.pause().then(() => {
        console.info('pause AVRecorder success');
        end = Date.now()
        console.info(`pauseTimeTestPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("pauseTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
        console.info('pause pauseTimeTestPromise success');
      }).catch((err: Error) => {
        console.info('pause AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('pauseTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("pauseTimeTestPromise avg time  is :" + avg)
    done();
  }

  async resumeTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resumeTimeTestPromise avPlayer state is prepared')
      });

      await avRecorder.start().then(() => {
        console.info('start resumeTimeTestPromise success');
      }).catch((err: Error) => {
        console.info('resumeTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      avRecorder.pause((err: BusinessError|null) => {
        if (err == null) {
          console.info('pause resumeTimeTestPromise success');
        } else {
          console.info('pause resumeTimeTestPromise failed and error is ' + err!!.message);
        }
      });
      let start = Date.now();
      console.info(`resumeTimeTestPromise start time is : ${start}`)
      await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
        console.info('resume resumeTimeTestPromise success');
        end = Date.now()
        console.info(`resumeTimeTestPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("resumeTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
      }).catch((err: Error) => {
        console.info('resume AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('resumeTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("resumeTimeTestPromise avg time  is :" + avg)
    done();
  }

  async stopTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('stopTimeTestPromise avPlayer state is prepared')
      });

      await avRecorder.start().then(() => {
        console.info('start stopTimeTestPromise success');
      }).catch((err: Error) => {
        console.info('stopTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`stopTimeTestPromise start time is : ${start}`)
      await avRecorder.stop().then(() => {
        console.info('stop AVRecorder success');
        console.info('resume stopTimeTestPromise success');
        end = Date.now()
        console.info(`stopTimeTestPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("stopTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
      }).catch((err: Error) => {
        console.info('stop AVRecorder failed and catch error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('stopTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("stopTimeTestPromise avg time  is :" + avg)
    done();
  }

  async resetTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('resetTimeTestPromise avPlayer state is prepared')
      });

      await avRecorder.start().then(() => {
        console.info('start resetTimeTestPromise success');
      }).catch((err: Error) => {
        console.info('resetTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`resetTimeTestPromise start time is : ${start}`)
      await avRecorder.reset().then(() => {
        console.info('reset AVRecorder success');
        console.info('resume resetTimeTestPromise success');
        end = Date.now()
        console.info(`resetTimeTestPromise end time is : ${end}`)
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("resetTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
      }).catch((err: Error) => {
        console.info('resume resetTimeTestPromise failed and error is ' + err.message);
      });
      await avRecorder.release().then(() => {
        console.info('resetTimeTestPromise avPlayer is release')
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
      });
    }
    let avg = totalTime / 10;
    console.info("resetTimeTestPromise avg time  is :" + avg)
    done();
  }

  async releaseTimeTestPromise(avConfig: media.AVRecorderConfig, avRecorder: media.AVRecorder, recorderTime: number,
    done: () => void) {
    let totalTime: number = 0;
    for (let i = 0; i < 10; i++) {
      avRecorder = await this.idle(avRecorder);
      await this.sleep(20)
      await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.PREPARED);
        console.info('releaseTimeTestPromise avPlayer state is prepared')
      });

      await avRecorder.start().then(() => {
        console.info('start releaseTimeTestPromise success');
      }).catch((err: Error) => {
        console.info('releaseTimeTestPromise start avRecorder failed and catch error is ' + err.message);
      });
      let end: number;
      let start = Date.now();
      console.info(`releaseTimeTestPromise start time is : ${start}`)
      await avRecorder.release().then(() => {
        expect(avRecorder.state).assertEqual(this.AV_RECORDER_STATE.RELEASED);
        console.info('release AVRecorder success');
        console.info('resume releaseTimeTestPromise success');
        end = Date.now()
        let difference: string = (end - start) + '';
        let execution = parseInt(difference);
        console.info("releaseTimeTestPromise execution time  is :" + execution)
        totalTime = totalTime + execution;
        console.info(`releaseTimeTestPromise end time is : ${end}`)
      }).catch((err: Error) => {
        console.info('resume releaseTimeTestPromise failed and error is ' + err.message);
      });
    }
    let avg = totalTime / 10;
    console.info("releaseTimeTestPromise avg time  is :" + avg)
    done();
  }

  AV_RECORDER_AUDIO_STATE: AudioRecorderState = {
    PREPARED: 1,
    STARTED: 2,
    PAUSED: 3,
  };
}

