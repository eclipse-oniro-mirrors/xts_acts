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

import camera from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import Context from "application.Context"
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const TAG = "CameraModuleTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraNum: number;

export default function cameraTorchTest() {

  let isEmpty01 = (data: camera.CameraManager) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty = (data: Array<camera.CameraDevice>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getCameraSupportDevicesArray = () => {
    hilog.info(0x0000, 'testTag', 'Enter getCameraSupportDevicesArray');

    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    /*
    mCameraManager.getSupportedCameras(async (err, data) => {
        hilog.info(0x0000, 'testTag', TAG + "Entering getCameraSupportDevicesArray callback");
        if (!err) {
            if (data != null || data != undefined) {
                mCameraDevicesArray = data;
                hilog.info(0x0000, 'testTag', TAG + "Entering getCameraSupportDevicesArray PASSED with CameraDevicesArray is: " + data);
            } else {
                hilog.info(0x0000, 'testTag', TAG + "Entering getCameraSupportDevicesArray FAILED with CameraDevicesArray is: " + data);
            }
        } else {
            hilog.info(0x0000, 'testTag', TAG + "Entering getCameraSupportDevicesArray FAILED : " + err.message);
        }
    })
    */
    if (isEmpty(mCameraDevicesArray)) {
      hilog.info(0x0000, 'testTag', TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;

    hilog.info(0x0000, 'testTag', TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    hilog.info(0x0000, 'testTag', 'Exit getCameraSupportDevicesArray');

    return true;
  }

  let getCameraManagerInstance = () => {
    hilog.info(0x0000, 'testTag', 'Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = camera.getCameraManager(appContext);
    if (isEmpty01(mCameraManager)) {
      hilog.info(0x0000, 'testTag', TAG + "getCameraManager FAILED");
      return false;
    }
    hilog.info(0x0000, 'testTag', 'Exit getCameraManagerInstance');
    return true;
  }

  describe('cameraTorchTest', () => {
    hilog.info(0x0000, 'testTag', TAG + '----------CameraSessionTest--------------')
    beforeAll(() => {
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'CameraTorchTest beforeEach case');
    })

    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'CameraTorchTest afterEach case');
    })

    afterAll(() => {
      hilog.info(0x0000, 'testTag', 'CameraTorchTest afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_STATIC_0100
     * @tc.desc   setTorchMode(); 设置手电筒模式开关 setTorchMode(ON)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        hilog.info(0x0000, 'testTag', `${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_STATIC_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          hilog.info(0x0000, 'testTag', `${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
            hilog.info(0x0000, 'testTag', `${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.ON);
              let torchMode = mCameraManager.getTorchMode()
              hilog.info(0x0000, 'testTag', `${TAG} torchMode: ${torchMode}`);
              expect(torchMode === camera.TorchMode.ON).assertTrue()
            }
          }
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', `${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_STATIC_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_STATIC_0100
     * @tc.desc   setTorchMode(); 设置手电筒模式开关 setTorchMode(OFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        hilog.info(0x0000, 'testTag', `${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_STATIC_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          hilog.info(0x0000, 'testTag', `${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
            hilog.info(0x0000, 'testTag', `${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.OFF);
              let torchMode = mCameraManager.getTorchMode()
              hilog.info(0x0000, 'testTag', `${TAG} torchMode: ${torchMode}`);
              expect(torchMode === camera.TorchMode.OFF).assertTrue()
            }
          }
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', `${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_STATIC_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_STATIC_0100
     * @tc.desc   setTorchMode(); 设置手电筒模式开关 setTorchMode(AUTO)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        hilog.info(0x0000, 'testTag', `${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_STATIC_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          hilog.info(0x0000, 'testTag', `${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            hilog.info(0x0000, 'testTag', `${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              let torchMode = mCameraManager.getTorchMode()
              hilog.info(0x0000, 'testTag', `${TAG} torchMode: ${torchMode}`);
              expect(torchMode === camera.TorchMode.AUTO).assertTrue()
            }
          }
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', `${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_STATIC_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0100
     * @tc.desc   on 监听，手电筒更改模式OFF2ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.OFF);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} torchStatusInfo.isTorchAvailable: ${torchStatusInfo!.isTorchAvailable}`);
                console.info(`${TAG} torchStatusInfo.isTorchActive: ${torchStatusInfo!.isTorchActive}`);
                console.info(`${TAG} torchStatusInfo.torchLevel: ${torchStatusInfo!.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.ON);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0200
     * @tc.desc   on 监听，手电筒更改模式OFF2AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0200 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.OFF);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} torchStatusInfo.isTorchAvailable: ${torchStatusInfo!.isTorchAvailable}`);
                console.info(`${TAG} torchStatusInfo.isTorchActive: ${torchStatusInfo!.isTorchActive}`);
                console.info(`${TAG} torchStatusInfo.torchLevel: ${torchStatusInfo!.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.AUTO);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0200 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0300
     * @tc.desc   on 监听，手电筒更改模式ON2OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0300 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.ON);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} torchStatusInfo.isTorchAvailable: ${torchStatusInfo!.isTorchAvailable}`);
                console.info(`${TAG} torchStatusInfo.isTorchActive: ${torchStatusInfo!.isTorchActive}`);
                console.info(`${TAG} torchStatusInfo.torchLevel: ${torchStatusInfo!.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.OFF);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0300 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0400
     * @tc.desc   on 监听，手电筒更改模式ON2AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0400 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.ON);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  mCameraManager.offTorchStatusChange();
                  expect().assertFail();
                }
                console.info(`${TAG} torchStatusInfo.isTorchAvailable: ${torchStatusInfo!.isTorchAvailable}`);
                console.info(`${TAG} torchStatusInfo.isTorchActive: ${torchStatusInfo!.isTorchActive}`);
                console.info(`${TAG} torchStatusInfo.torchLevel: ${torchStatusInfo!.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.AUTO);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0400 err` + JSON.stringify(error));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0500
     * @tc.desc   on 监听，手电筒更改模式AUTO2OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0500 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} torchStatusInfo.isTorchAvailable: ${torchStatusInfo!.isTorchAvailable}`);
                console.info(`${TAG} torchStatusInfo.isTorchActive: ${torchStatusInfo!.isTorchActive}`);
                console.info(`${TAG} torchStatusInfo.torchLevel: ${torchStatusInfo!.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.OFF);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0500 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0600
     * @tc.desc   on 监听，手电筒更改模式AUTO2ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0600 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} torchStatusInfo.isTorchAvailable: ${torchStatusInfo!.isTorchAvailable}`);
                console.info(`${TAG} torchStatusInfo.isTorchActive: ${torchStatusInfo!.isTorchActive}`);
                console.info(`${TAG} torchStatusInfo.torchLevel: ${torchStatusInfo!.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.ON);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_STATIC_0600 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_STATIC_0100
     * @tc.desc   OFF torchStatusChange after ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_STATIC_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.onTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                expect().assertFail();
              });
              mCameraManager.offTorchStatusChange((err: BusinessError | null, torchStatusInfo: camera.TorchStatusInfo | undefined) => {
                if (err !== undefined && err!.code !== 0) {
                  console.info(TAG + "enter torchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.ON);
                console.info(`${TAG} setTorchMode ON success`);
              }
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_STATIC_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
  })
}