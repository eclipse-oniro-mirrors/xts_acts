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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { cameraConcurrentType, cameraErrorCode, driveFn, getPermission, isEmpty, sceneMode } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.CameraInputTest";
const abnormalType = -1;
const abnormalIndex = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraConcurrentInfos: Array<camera.CameraConcurrentInfo>;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  return true;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}

function getSupportedModes() {
  console.info(TAG, 'getSupportedModes.');
  for (let i = 0; i < mCameraDeviceArray.length; i++) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
    if (isEmpty(mSupportedModes)) {
      return false;
    }
    console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
  }
  return true;
}

function getCameraConcurrentInfos() {
  console.info(TAG, 'getCameraConcurrentInfos.');
  mCameraConcurrentInfos = mCameraManager.getCameraConcurrentInfos(mCameraDeviceArray);
  if (isEmpty(mCameraConcurrentInfos)) {
    console.info(TAG, 'No supported concurrent.');
    return false;
  }
  console.info(TAG, 'getCameraConcurrentInfos length: ' + mCameraConcurrentInfos.length);
  return true;
}

function cameraStatusOnCallback(error: BusinessError, cameraStatusInfo: camera.CameraStatusInfo) {
  if (error !== undefined && error.code !== 0) {
    console.error(TAG, 'callback error, code: ' + error.code + ', msg: ' + error.message);
    return;
  }
  console.info(TAG, 'camera: ' + JSON.stringify(cameraStatusInfo.camera) + ', status: ' +
  JSON.stringify(cameraStatusInfo.status));
}

async function openWithCameraConcurrentType(done: Function, testName: string, type: camera.CameraConcurrentType) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let isSupportedConcurrent: boolean = getCameraConcurrentInfos();
      if (isSupportedConcurrent && mCameraConcurrentInfos.length > 0) {
        mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
          cameraStatusOnCallback(error, cameraStatusInfo);
        });
        let cameraInput = mCameraManager.createCameraInput(mCameraConcurrentInfos[0].device);
        expect(isEmpty(cameraInput)).assertFalse();
        await cameraInput.open(type).then(async () => {
          console.info(TAG, testName + ' camera opened successfully. ');
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          if (error !== undefined && error.code !== 0) {
            console.error(TAG,
              testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
          }
        });
        mCameraManager.off('cameraStatus');
        await cameraInput.close();
      } else {
        console.info(TAG, testName + ' Not supporting concurrency. ');
        expect(false).assertFalse();
      }
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

export default function CameraInputTest() {
  describe('CameraInputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      mCameraManager.off('cameraStatus');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   open_callback_001
     * @tc.number CAMERA_INPUT_001
     * @tc.desc   No abnormal scenarios-0 param, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_callback_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          cameraInput.open(async (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            }
            console.info(TAG, testName + ' camera opened successfully.');
            expect(true).assertTrue();
          })
          await cameraInput.close();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   open_promise_001
     * @tc.number CAMERA_INPUT_002
     * @tc.desc   No abnormal scenarios-0 param, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_promise_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          await cameraInput.open().then(async () => {
            console.info(TAG, testName + ' camera opened successfully.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            }
          })
          await cameraInput.close();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code === cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   open_promise_secure_photo_001
     * @tc.number CAMERA_INPUT_003
     * @tc.desc   No abnormal scenarios -> isSecureEnabled-true, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('open_promise_secure_photo_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_secure_photo_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          if (mSupportedModes.includes(sceneMode.SECURE_PHOTO)) {
            mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
              cameraStatusOnCallback(error, cameraStatusInfo);
            })
            await cameraInput.open(true).then(async (seqId: bigint) => {
              console.info(TAG, testName + ' camera opened successfully. bigint: ' + JSON.stringify(seqId));
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
                expect(false).assertFalse();
              }
            })
            await cameraInput.close();
          } else {
            console.info(TAG, testName + ' No secure mode. ');
            expect(false).assertFalse();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code === cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   open_promise_secure_photo_002
     * @tc.number CAMERA_INPUT_004
     * @tc.desc   No abnormal scenarios -> isSecureEnabled-false, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('open_promise_secure_photo_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_secure_photo_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          await cameraInput.open(false).then(async (seqId: bigint) => {
            console.info(TAG, testName + ' camera opened successfully. bigint: ' + JSON.stringify(seqId));
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
              expect(false).assertFalse();
            }
          })
          await cameraInput.close();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code === cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   open_promise_with_concurrent_001
     * @tc.number CAMERA_INPUT_005
     * @tc.desc   No abnormal scenarios -> CameraConcurrentType-CAMERA_LIMITED_CAPABILITY, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('open_promise_with_concurrent_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_with_concurrent_001';
      await openWithCameraConcurrentType(done, testName, cameraConcurrentType.CAMERA_LIMITED_CAPABILITY);
    })

    /**
     * @tc.name   open_promise_with_concurrent_002
     * @tc.number CAMERA_INPUT_006
     * @tc.desc   No abnormal scenarios -> CameraConcurrentType-CAMERA_FULL_CAPABILITY, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('open_promise_with_concurrent_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_with_concurrent_002';
      await openWithCameraConcurrentType(done, testName, cameraConcurrentType.CAMERA_FULL_CAPABILITY);
    })

    /**
     * @tc.name   open_promise_with_concurrent_abnormal_001
     * @tc.number CAMERA_INPUT_007
     * @tc.desc   CameraConcurrentType->abnormalType, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_promise_with_concurrent_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_promise_with_concurrent_abnormal_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG, testName + ' cameraInput created successfully. ');
          if (getCameraConcurrentInfos()) {
            mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
              cameraStatusOnCallback(error, cameraStatusInfo);
            })
            await cameraInput.open(abnormalType).then(async () => {
              console.info(TAG, testName + ' camera opened successfully. ');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              }
            });
            await cameraInput.close();
          } else {
            console.info(TAG, testName + ' Not supporting concurrency. ');
            expect(false).assertFalse();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code === cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   open_promise_abnormal_001
     * @tc.number CAMERA_INPUT_008 // TODO
     * @tc.desc   No abnormal scenarios-0 param, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('open_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_promise_abnormal_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            let cameraInput2 = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            expect(isEmpty(cameraInput2)).assertFalse();
            await cameraInput.open();
            console.info(TAG, testName + ' cameraInput opened successfully.');
            await cameraInput2.open();
            console.info(TAG, testName + ' cameraInput2 opened successfully.');
            await cameraInput.close();
            await cameraInput2.close();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   close_callback_001
     * @tc.number CAMERA_INPUT_009
     * @tc.desc   No abnormal scenarios-0 param, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('close_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_callback_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          await cameraInput.open();
          console.info(TAG, testName + ' cameraInput opened successfully.');
          cameraInput.close(async (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to close the camera, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            }
            console.info(TAG, testName + ' camera close successfully.');
            expect(true).assertTrue();
          })
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   close_promise_001
     * @tc.number CAMERA_INPUT_010
     * @tc.desc   No abnormal scenarios-0 param, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('close_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_promise_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          await cameraInput.open();
          console.info(TAG, testName + ' cameraInput opened successfully.');
          await cameraInput.close().then(async () => {
            console.info(TAG, testName + ' camera close successfully.');
            expect(true).assertTrue();
          })
            .catch((error: BusinessError) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to close the camera, err: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              }
            })
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   on_off_error_Listen_001
     * @tc.number CAMERA_INPUT_011
     * @tc.desc   No abnormal scenarios-error listen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_error_Listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_error_Listen_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            cameraInput.on('error', mCameraDeviceArray[i], (error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' camera input error, code: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              }
            })
            await cameraInput.open();
            console.info(TAG, testName + ' cameraInput opened.');
            await cameraInput.close();
            cameraInput.off('error', mCameraDeviceArray[i]);
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   on_off_error_Listen_002
     * @tc.number CAMERA_INPUT_012
     * @tc.desc   error listen-cameraDevice-abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('on_off_error_Listen_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'on_off_error_Listen_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            cameraInput.on('error', mCameraDeviceArray[abnormalIndex], (error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' camera input error, code: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              }
            })
            await cameraInput.open();
            console.info(TAG, testName + ' cameraInput opened.');
            await cameraInput.close();
            cameraInput.off('error', mCameraDeviceArray[i]);
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   on_off_error_Listen_003
     * @tc.number CAMERA_INPUT_013
     * @tc.desc   error listen-two input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('on_off_error_Listen_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'on_off_error_Listen_003';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            let cameraInput2 = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            expect(isEmpty(cameraInput2)).assertFalse();
            cameraInput2.on('error', mCameraDeviceArray[i], (error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' camera input error, code: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              }
            })
            await cameraInput.open();
            await cameraInput2.open();
            console.info(TAG, testName + ' cameraInput opened.');
            await cameraInput.close();
            await cameraInput2.close();
            cameraInput2.off('error', mCameraDeviceArray[i]);
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   open_close_abnormal_001
     * @tc.number CAMERA_INPUT_014
     * @tc.desc   Wrong order-first close, then open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('open_close_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_close_abnormal_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            await cameraInput.close();
            console.info(TAG, testName + ' cameraInput close.');
            await cameraInput.open();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   open_promise_abnormal_002
     * @tc.number CAMERA_INPUT_015
     * @tc.desc   Wrong order-open twice -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('open_promise_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_abnormal_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            await cameraInput.open();
            console.info(TAG, testName + ' cameraInput opened once.');
            await cameraInput.open();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        done();
      }
    })
  })
}