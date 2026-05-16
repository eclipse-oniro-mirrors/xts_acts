/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../hypium';
import { camera } from '@kit.CameraKit';
import { Context } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import Utils from '../Util.test';
import { getPermission } from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';

let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
const TAG = "CameraCameraManagerStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDevicesArray: Array<camera.CameraDevice> = [];
let mCameraSession: camera.PhotoSession | undefined;

let mPhotoSurface: string = '';
let surfaceId: string = '';
let mCameraNum: number;

let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let isSessionCreated: boolean = false;

let receiver: image.ImageReceiver | undefined;

let isEmptyCameraCameraDevice = (data: camera.CameraDevice) => {
  if (data === null || data === undefined) {
    return true;
  }
  return false;
}

let isEmptyCameraConcurrentInfo = (data: camera.CameraConcurrentInfo[]) => {
  if (data === null || data === undefined) {
    return true;
  }
  return false;
}

let isEmptyBoolean = (data: boolean) => {
  if (data === null || data === undefined) {
    return true;
  }
  return false;
}

let isEmptyNumber = (data: number) => {
  if (data === null || data === undefined) {
    return true;
  }
  return false;
}

let getPreviewOutputSurface = () => {
  console.log(TAG + 'Entering getPreviewOutputSurface')
  try {
    surfaceId = Hypium.get('SurfaceId') as string;
  } catch (err) {
    console.info(TAG +
      "getPreviewOutputSurface FAILED err " + JSON.stringify(err));
  }
  if (surfaceId == '') {
    console.error(TAG + ' getPreviewOutputSurface surfaceId failed, surfaceId is null')
    expect().assertFail();
  }
  console.info(TAG + 'getPreviewOutputSurface surfaceId: ' + surfaceId)
}

export default function CameraManagerTest() {

  let getPhotoReceiverSurface = async (): Promise<void> => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({ height: 640, width: 480 } as image.Size, image.ImageFormat.JPEG, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + mPhotoSurface)
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = (): boolean => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = camera.getCameraManager(appContext);
    if (mCameraManager == null) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager!.getSupportedCameras();
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession =
        mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
    } catch (err) {
      console.info('createPhotoSession FAILED');
    }
    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    } else {
      isSessionCreated = true;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    console.info('Enter releaseCameraSessionInstance');
    if (isSessionCreated && mCameraSession != undefined) {
      await mCameraSession!.release();
      isSessionCreated = false;
    }
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[idx]);
    if (mCameraInput == undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await mCameraInput!.open();
    await Utils.msSleep(100);
    console.info(idx + 'CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');
    if (mCameraInput != undefined && mCameraInput != null) {
      await mCameraInput!.close();
    }
    console.info('Exit releaseInput');
    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap =
      mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[idx], camera.SceneMode.NORMAL_PHOTO);

    if (cameraOutputCap != undefined) {
      if (cameraOutputCap.previewProfiles != null) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (mPreviewOutput != undefined) {
            break;
          }
        }

        if (mPreviewOutput == undefined) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }

      if (cameraOutputCap.photoProfiles != null) {
        console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          mPhotoOutput = mCameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (mPhotoOutput != undefined) {
            break;
          }
        }

        if (mPhotoOutput == undefined) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (mPreviewOutput != undefined && mPreviewOutput != null) {
      await mPreviewOutput!.release();
    }

    if (mPhotoOutput != undefined && mPhotoOutput != null) {
      await mPhotoOutput!.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await Utils.msSleep(1000);

    mCameraSession!.beginConfig();

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to addInput");
      mCameraSession!.addInput(mCameraInput!);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession!.addOutput(mPreviewOutput!);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession!.addOutput(mPhotoOutput!);
    }

    await Utils.msSleep(300);

    await mCameraSession!.commitConfig();
    console.info(TAG + "commitConfig end");
    await Utils.msSleep(50);

    await mCameraSession!.start();

    await Utils.msSleep(100);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");
    await mCameraSession!.stop();
    await Utils.msSleep(100);
    mCameraSession!.beginConfig();

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession!.removeInput(mCameraInput!);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession!.removeOutput(mPreviewOutput!);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession!.removeOutput(mPhotoOutput!);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }
  let firstTypes = [
    camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
    camera.CameraPosition.CAMERA_POSITION_BACK,
    camera.CameraPosition.CAMERA_POSITION_FRONT,
  ]
  let secondTypes = [
    camera.CameraType.CAMERA_TYPE_DEFAULT,
    camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
    camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
    camera.CameraType.CAMERA_TYPE_TELEPHOTO,
    camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
  ]
  describe('CameraManagerTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await getPhotoReceiverSurface();
      getPreviewOutputSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await Utils.msSleep(500);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_CAMERA_MANAGER_IS_TORCH_SUPPORTED_STATIC_0100
     * @tc.number SUB_CAMERA_MANAGER_IS_TORCH_SUPPORTED_STATIC_0100
     * @tc.desc   isTorchSupported SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_IS_TORCH_SUPPORTED_STATIC_0100', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_IS_TORCH_SUPPORTED_STATIC_0100';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          let res = mCameraManager!.isTorchSupported();
          console.info(TAG, testName, 'isTorchSupported SUCCESS');
          expect(isEmptyBoolean(res)).assertFalse();
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0100
     * @tc.number SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0100
     * @tc.desc   isTorchModeSupported SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0100', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0100';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          if (mCameraManager!.isTorchSupported()) {
            let res = mCameraManager!.isTorchModeSupported(camera.TorchMode.OFF);
            console.info(TAG, testName, 'isTorchModeSupported SUCCESS');
            expect(isEmptyBoolean(res)).assertFalse();
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0200
     * @tc.number SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0200
     * @tc.desc   isTorchModeSupported SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0200', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0200';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          if (mCameraManager!.isTorchSupported()) {
            let res = mCameraManager!.isTorchModeSupported(camera.TorchMode.ON);
            console.info(TAG, testName, 'isTorchModeSupported SUCCESS');
            expect(isEmptyBoolean(res)).assertFalse();
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0300
     * @tc.number SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0300
     * @tc.desc   isTorchModeSupported SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0300', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_IS_TORCH_MODE_SUPPORTED_STATIC_0300';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          if (mCameraManager!.isTorchSupported()) {
            let res = mCameraManager!.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(TAG, testName, 'isTorchModeSupported SUCCESS');
            expect(isEmptyBoolean(res)).assertFalse();
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_STATIC_0100
     * @tc.number SUB_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_STATIC_0100
     * @tc.desc   onTorchStatusChange SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_STATIC_0100', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_ON_TORCH_STATUS_CHANGE_STATIC_0100';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        let isBool = false;
        try {
          mCameraManager!.onTorchStatusChange((error: BusinessError | null,
            torchStatusInfo: camera.TorchStatusInfo | undefined) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
              done();
            } else {
              expect(isEmptyBoolean(torchStatusInfo!.isTorchAvailable)).assertFalse();
              expect(isEmptyBoolean(torchStatusInfo!.isTorchActive)).assertFalse();
              expect(isEmptyNumber(torchStatusInfo!.torchLevel)).assertFalse();
              isBool = true;
            }
          });
          if (mCameraManager!.isTorchSupported()) {
            if (mCameraManager!.isTorchModeSupported(camera.TorchMode.ON)) {
              mCameraManager!.setTorchMode(camera.TorchMode.ON);
              await Utils.msSleep(1000);
              mCameraManager!.setTorchMode(camera.TorchMode.OFF);
              await Utils.msSleep(1000);
              mCameraManager!.offTorchStatusChange();
              expect(isBool).assertTrue();
            }
          }
          console.info(TAG, testName, 'onTorchStatusChange SUCCESS');
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100
     * @tc.desc   getCameraConcurrentInfos the first parameter is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          let res = mCameraManager!.getCameraConcurrentInfos([]);
          console.info(TAG, testName, 'getCameraConcurrentInfos SUCCESS');
          expect(isEmptyCameraConcurrentInfo(res)).assertFalse();
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0200
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0200
     * @tc.desc   getCameraConcurrentInfos success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0200', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_CONCURRENT_INFOS_STATIC_0200';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_FRONT) {
              for (let index1 = 0; index1 < mCameraDevicesArray.length; index1++) {
                let element1 = mCameraDevicesArray[index1];
                if (element1.cameraPosition == camera.CameraPosition.CAMERA_POSITION_BACK) {
                  let curCameraDev: camera.CameraDevice | undefined =
                    mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_FRONT,
                      camera.CameraType.CAMERA_TYPE_DEFAULT);
                  let curCameraDev1: camera.CameraDevice | undefined =
                    mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_BACK,
                      camera.CameraType.CAMERA_TYPE_DEFAULT);
                  if (curCameraDev && curCameraDev1) {
                    let res = mCameraManager!.getCameraConcurrentInfos([curCameraDev, curCameraDev1]);
                    console.info(TAG, testName, 'getCameraConcurrentInfos SUCCESS');
                    expect(isEmptyCameraConcurrentInfo(res)).assertFalse();
                  } else {
                    console.info(TAG, testName, 'curCameraDev or curCameraDev1 is null');
                  }
                }
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0100
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0100
     * @tc.desc   getCameraDevice the first parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0100', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0100';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_DEFAULT) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
                camera.CameraType.CAMERA_TYPE_DEFAULT);
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0200
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0200
     * @tc.desc   getCameraDevice the first parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0200', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0200';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_BACK &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_DEFAULT) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_BACK,
                camera.CameraType.CAMERA_TYPE_DEFAULT);
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0300
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0300
     * @tc.desc   getCameraDevice the first parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0300', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_STATIC_0300';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_DEFAULT) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
                camera.CameraType.CAMERA_TYPE_DEFAULT);
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0100
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0100
     * @tc.desc   getCameraDevice the second parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0100', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0100';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_FRONT &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_DEFAULT) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_FRONT,
                camera.CameraType.CAMERA_TYPE_DEFAULT);
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0200
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0200
     * @tc.desc   getCameraDevice the second parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0200', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0200';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_FRONT &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_WIDE_ANGLE) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_FRONT,
                camera.CameraType.CAMERA_TYPE_WIDE_ANGLE);
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0300
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0300
     * @tc.desc   getCameraDevice the second parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0300', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0300';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_FRONT &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_ULTRA_WIDE) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_FRONT,
                camera.CameraType.CAMERA_TYPE_ULTRA_WIDE);
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0400
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0400
     * @tc.desc   getCameraDevice the second parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0400', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0400';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_FRONT &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_TELEPHOTO) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_FRONT,
                camera.CameraType.CAMERA_TYPE_TELEPHOTO);
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0500
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0500
     * @tc.desc   getCameraDevice the second parameter EMU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0500', Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_SECOND_STATIC_0500';
      if (mCameraNum == 0) {
        console.info(TAG, testName, "Entering FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let index = 0; index < mCameraDevicesArray.length; index++) {
            let element = mCameraDevicesArray[index];
            if (element.cameraPosition == camera.CameraPosition.CAMERA_POSITION_FRONT &&
              element.cameraType == camera.CameraType.CAMERA_TYPE_TRUE_DEPTH) {
              let res = mCameraManager!.getCameraDevice(camera.CameraPosition.CAMERA_POSITION_FRONT,
                camera.CameraType.CAMERA_TYPE_TRUE_DEPTH);
              expect(isEmptyCameraCameraDevice(res)).assertFalse();
              console.info(TAG, testName, 'getCameraDevice SUCCESS');
            } else {
              console.info(TAG, testName, '该设备不支持指定的参数配置');
            }
          }
        } catch (error) {
          console.error(TAG, testName, error, error.code)
          expect().assertFail();
        }
        done();
      }
    })
  })
}