/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is difstributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect } from '@ohos/hypium'
import fs from '@ohos.file.fs';
import { UiDriver, BY, } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import File from '@system.file';
import testNapi from 'libavrecorderndk.so'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import media from '@ohos.multimedia.media'
import { BusinessError } from '@ohos.base';
import camera from '@ohos.multimedia.camera';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export interface FdObject {
  fileAsset: File | null;
  fdNumber: number | null;
}

export default class AVRecorderNdkTestBase {
  TAG = "[AVRecorderNdkTestBase] ";
  CREATE_RECORDER_EVENT = 'create';
  CREATE_PREPARE_RECORDER_EVENT = 'create_prepare';
  PREPARE_RECORDER_EVENT = 'prepare';
  PREPARE_RECORDER_ERR_EVENT = 'prepare_err';
  GETINPUTSURFACE_EVENT = 'getInputSurface';
  PREPARE_CAMERA_EVENT = 'prepareCamera';
  START_RECORDER_EVENT = 'start_recorder';
  START_RECORDER_ERR_EVENT = 'start_err';
  WAIT_RECORDER_EVENT = 'wait_recorder';
  UPDATE_ROTATION_EVENT = 'update_rotation';
  UPDATE_ROTATION_ERR_EVENT = 'update_rotation_err';
  PAUSE_RECORDER_EVENT = 'pause';
  PAUSE_RECORDER_ERR_EVENT = 'pause_err';
  RESUME_RECORDER_EVENT = 'resume';
  RESUME_RECORDER_ERR_EVENT = 'resume_err';
  STOP_RECORDER_EVENT = 'stop';
  STOP_RECORDER_ERR_EVENT = 'stop_err';
  RESET_RECORDER_EVENT = 'reset';
  RESET_RECORDER_ERR_EVENT = 'reset_err';
  RELEASE_RECORDER_EVENT = 'release';
  CHECK_VIDEO_EVENT = 'check_video';
  GET_RECORDER_CONFIG = 'get_recorder_config';
  GET_AVAILABLE_ENCODER = 'get_available_encoder';
  END_EVENT = 'end';
  AV_CREATEAVPLAYER = 'createAVPlayer';
  AV_IDLE = 'idle';
  AV_INITIALIZED = 'initialized';
  AV_PREPARED = 'prepared';
  AV_PLAYING = 'playing';
  AV_PAUSED = 'paused';
  AV_COMPLETED = 'completed';
  AV_STOPPED = 'stopped';
  AV_RELEASED = 'released';
  AV_ERROR = 'error';
  result: number = 0;
  isRelease: boolean = false;
  focusMode: number = 2;
  cameraDeviceIndex: number = 0;
  sceneMode: number = 2;
  previewId: ESObject;
  photoId: string = "";
  videoId: string = "";
  outputName = "";
  outputFdObject: media.AVFileDescriptor = {
    fd: -1
  };
  avPlayer: media.AVPlayer | null = null;

  async toNextStep(config: ESObject, fdNumber: string,
    steps: Array<string>, done: Function) {
    try {
      if (steps[0] == this.END_EVENT) {
        console.info('case done() success!!');
        done();
      }

      let currentSteps = steps[0]
      console.info('case into currentSteps Event:!!' + currentSteps);
      steps.shift();
      // await mediaTestBase.msleepAsync(500)
      switch (currentSteps) {
        case this.CREATE_PREPARE_RECORDER_EVENT:
          this.result = await testNapi.createPrepareAVRecorder();
          expect(this.result).assertEqual(0);
          this.isRelease = true;
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.CREATE_RECORDER_EVENT:
          this.result = await testNapi.createAVRecorder();
          expect(this.result).assertEqual(0);
          this.isRelease = true;
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.PREPARE_CAMERA_EVENT:
          this.previewId = await AppStorage.get('testsurfaceId');
          let videoFrameWidth: number = config['videoFrameWidth']
          let videoFrameHeight: number = config['videoFrameHeight']
          this.result = await testNapi.prepareCamera(this.previewId, videoFrameWidth, videoFrameHeight);
          // expect(this.result).assertEqual(6);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.PREPARE_RECORDER_EVENT:
          this.result = await testNapi.prepareAVRecorder(config, fdNumber);
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.PREPARE_RECORDER_ERR_EVENT:
          this.result = await testNapi.prepareAVRecorder(config, fdNumber);
          expect(this.result != 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.START_RECORDER_EVENT:
          this.result = await testNapi.startAVRecorder();
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.START_RECORDER_ERR_EVENT:
          this.result = await testNapi.startAVRecorder();
          console.info('startAVRecorder into START_RECORDER_ERR_EVENT result:!!' + this.result);
          expect(this.result != 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.WAIT_RECORDER_EVENT:
          const time: number = config['recorderTimer'] || 5000;
          await this.msleepAsync(time);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.UPDATE_ROTATION_EVENT:
          const rotation: number = config['videoRotation'] || 0;
          this.result = await testNapi.updateRotationAVRecorder(rotation);
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.UPDATE_ROTATION_ERR_EVENT:
          const rotation_err: number = config['videoRotation'] || 0;
          this.result = await testNapi.updateRotationAVRecorder(rotation_err);
          expect(this.result !== 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.PAUSE_RECORDER_EVENT:
          this.result = await testNapi.pauseAVRecorder();
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.PAUSE_RECORDER_ERR_EVENT:
          this.result = await testNapi.pauseAVRecorder();
          expect(this.result != 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.STOP_RECORDER_EVENT:
          this.result = await testNapi.stopAVRecorder();
          console.info('stopAVRecorder into STOP_RECORDER_EVENT result:!!' + this.result);
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;
        case this.STOP_RECORDER_ERR_EVENT:
          this.result = await testNapi.stopAVRecorder();
          expect(this.result != 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.RESUME_RECORDER_EVENT:
          this.result = await testNapi.resumeAVRecorder();
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;
        case this.RESUME_RECORDER_ERR_EVENT:
          this.result = await testNapi.resumeAVRecorder();
          expect(this.result != 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.RESET_RECORDER_EVENT:
          this.result = await testNapi.resetAVRecorder();
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.RESET_RECORDER_ERR_EVENT:
          this.result = await testNapi.resetAVRecorder();
          expect(this.result != 0).assertEqual(true);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.RELEASE_RECORDER_EVENT:
          this.result = await testNapi.releaseAVRecorder();
          expect(this.result).assertEqual(0);
          await this.closeFd(config['fdNumber']);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.CHECK_VIDEO_EVENT:
          this.AvPlayerMp4(config, fdNumber);
          await this.msleepAsync(2000);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.GET_RECORDER_CONFIG:
          this.result = await testNapi.getAVRecorderConfig();
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        case this.GET_AVAILABLE_ENCODER:
          this.result = await testNapi.getAvailableEncoder();
          expect(this.result).assertEqual(0);
          this.toNextStep(config, fdNumber, steps, done);
          break;

        default:
          break;
      }
    } catch (error) {
      console.log('toNextStep error', error);
      done();
    }
  }

  async getFd(pathName: string) {
    console.info('case come in getFd');
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    };

    pathName = getContext().filesDir + "/" + pathName;
    console.info('case getFd pathName getContext is: ' + pathName);
    let pathName1 = globalThis.abilityContext.filesDir + "/";
    console.info('case getFd pathName globalThis is: ' + pathName1);
    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info('case getFd number is: ' + fdObject.fdNumber);

    return fdObject;
  }

  getAVFd(outputName: string) {
    outputName = globalThis.abilityContext.filesDir + "/" + outputName;
    console.info("case outputName is" + outputName);
    try {
      let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      if (file) {
        this.outputFdObject.fd = file.fd;
      }
    } catch (err) {
      console.info('case getDSt err: ' + err);
    }
    console.info('case getDSt number is: ' + this.outputFdObject.fd);
    return this.outputFdObject;
  }

  async closeFd(fdNumber: number | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }

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

  async driveFn(num: number) {
    console.info(`case come in driveFn 111`)
    let driver = await UiDriver.create()
    console.info(`case come in driveFn 222`)
    console.info(`driver is ${JSON.stringify(driver)}`)
    await this.msleepAsync(2000)
    console.info(`UiDriver start`)
    for (let i = 0; i < num; i++) {
      let button = await driver.findComponent(BY.text('允许'))
      if (button == null) {
        let cmd = "hidumper -s WindowManagerService -a'-a'"
        await delegator.executeShellCommand(cmd);
        continue;
      }
      console.info(`button is ${JSON.stringify(button)}`)
      await this.msleepAsync(1000)
      if (await driver.findComponent(BY.text('允许')) != null) {
        await button.click()
      }
      await this.msleepAsync(1000)
    }
    await this.msleepAsync(2000)
  }

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  resourceMP4Name() {
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.mp4`;
    return filename;
  }

  resourceM4AName() {
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.m4a`;
    return filename;
  }

  resourceMP3Name() {
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.mp3`;
    return filename;
  }

  async AvPlayerMp4(config: string, fdNumber: string) {
    await media.createAVPlayer((err, video) => {
      console.info(`case media err: ${err}`)
      if (typeof (video) != 'undefined') {
        console.info('case createAVPlayer success');
        this.avPlayer = video;

        let surfaceID: ESObject = AppStorage.get('testsurfaceId');
        console.info(`case INITIALIZED , surfaceID is ${surfaceID}`);
        this.avPlayer?.on('stateChange', async (state, reason) => {
          switch (state) {
            case this.AV_INITIALIZED:
              if (!this.avPlayer) {
                console.info(`avPlayer is null`);
                break;
              }
              console.info(`case INITIALIZED`);
              console.info(`case INITIALIZED , surfaceID is ${surfaceID}`);
              this.avPlayer.surfaceId = surfaceID;
              expect(this.avPlayer.state).assertEqual(this.AV_INITIALIZED);
              setTimeout(() => {
                this.avPlayer?.prepare((err) => {
                  console.info('case prepare called' + err);
                  if (err != null) {
                    console.error(`case prepare error, errMessage is ${err.message}`);
                    expect().assertFail();
                  } else if (this.avPlayer) {
                    console.info('case avPlayer.duration: ' + this.avPlayer.duration);
                  }
                });
              }, 500);

              break;
            case this.AV_PREPARED:
              if (this.avPlayer != null) {
                this.getTrackDescriptionTest(this.avPlayer, config)
              }
              this.avPlayer?.play().then(() => {
                console.info('Succeeded in playing');
              }, (err: BusinessError) => {
                console.error('Failed to play,error message is :' + err.message)
              })
              break;
            case this.AV_PLAYING:
              if (this.avPlayer != null) {
                this.getTrackDescriptionTest(this.avPlayer, config)
              }
              this.avPlayer?.stop().then(() => {
                console.info('avPlayer stop success');
                this.avPlayer?.release().then(() => {
                  console.info('avPlayer release success');
                }).catch((err: BusinessError) => {
                  console.info('avPlayer release failed, error: ' + err.message);
                  expect().assertFail()
                })
              }).catch((err: BusinessError) => {
                console.info('avPlayer stop failed, error: ' + err.message);
                expect().assertFail()
              })
              break;
            case this.AV_RELEASED:
              this.avPlayer = null;
              this.closeFd(this.outputFdObject.fd)
              break;
            case this.AV_ERROR:
              expect().assertFail();
              this.avPlayer?.release().then(() => {
                console.info('avPlayer release success');
              }).catch((err: BusinessError) => {
                console.info('avPlayer release failed, error: ' + err.message);
                expect().assertFail()
              })
              this.avPlayer = null;
              break;
            default:
              break;
          }
        })
        this.outputFdObject = this.getAVFd(config['avOutName'])
        if (typeof (this.outputFdObject) == 'string') {
          console.info('case src test');
          this.avPlayer.url = this.outputFdObject;
        } else {
          console.info('case fdsrc test');
          this.avPlayer.fdSrc = this.outputFdObject;
        }

      }
      if (err != null) {
        console.error(`case createAVPlayer error, errMessage is ${err.message}`);
        expect().assertFail();
      }
    });

  }

  // 测试是否有音轨数据，如果有则结束
  getTrackDescriptionTest(avPlayer: media.AVPlayer, config: ESObject) {
    avPlayer?.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
      if (arrList != null) {
        for (let i = 0; i < arrList.length; i++) {
          console.info(`case getTrackDescription is ${JSON.stringify(arrList[i])}`);
          console.info(`case config is ${JSON.stringify(config)}`);
          let audioBitrate: number = 48000;
          if (!this.isEmpty(config['audioBitrate'])) {
            audioBitrate = config['audioBitrate']
          }
          if (arrList[i]['codec_mime'].toString() == 'audio/mp4a-latm' ||
            arrList[i]['codec_mime'].toString() == 'audio/mpeg') {
            expect(arrList[i]['bitrate']).assertLess(3 * audioBitrate)

            let audioSampleRate: number = 48000;
            if (!this.isEmpty(config['audioSampleRate'])) {
              audioSampleRate = config['audioSampleRate']
              expect(arrList[i]['sample_rate']).assertEqual(audioSampleRate)
            }
          }
        }
        // done();
      } else {
        console.error(`Failed to get TrackDescription, error:${error}`);
        expect().assertFail();
      }
    });
  }

  isEmpty(data: ESObject) {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  executeAVVideoRecorder(): boolean {
    const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
    let context: ESObject = AppStorage.get('testContext');

    let isSupportedCameras = true;
    let isExecute = false;
    let mCameraManager: camera.CameraManager;
    let mCameraDevicesArray: Array<camera.CameraDevice>;

    let isEmpty = (data: ESObject) => {
      if (data == null || data == undefined) {
        return true;
      }
      return false;
    }

    console.info(this.TAG + 'Enter getCameraManagerInstance');
    try {
      mCameraManager = camera.getCameraManager(context);
      if (isEmpty(mCameraManager)) {
        console.info(this.TAG + "getCameraManager FAILED");
        isExecute = false;
        return isExecute;
      }
      console.info(this.TAG + 'Exit getCameraManagerInstance');
      mCameraDevicesArray = mCameraManager.getSupportedCameras();
      if (isEmpty(mCameraDevicesArray)) {
        isSupportedCameras = false;
      }
    } catch (err) {
      console.error(this.TAG + "getCameraManager FAILED. errorMessage:", err);
      isExecute = false;
      return isExecute;
    }
    if (cameraAvailable && isSupportedCameras) {
      isExecute = true;
    } else {
      isExecute = false;
    }
    return isExecute;
  }
}