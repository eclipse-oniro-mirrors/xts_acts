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
import {
  cameraConcurrentType,
  cameraErrorCode,
  checkBackCamera,
  driveFn,
  getPermission,
  isEmpty,
} from '../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.CameraInputBackTest";
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
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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

export default function CameraInputBackTest() {
  describe('CameraInputBackTest', () => {
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
     * @tc.number    : CAMERA_INPUT_BACK_001
     * @tc.name      : open_callback_back_001
     * @tc.desc      : No abnormal scenarios-0 param, callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
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
     * @tc.number    : CAMERA_INPUT_BACK_002
     * @tc.name      : open_promise_back_001
     * @tc.desc      : No abnormal scenarios-0 param, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          await cameraInput.open().then(async () => {
            console.info(TAG, testName + ' camera opened successfully.');
            expect(true).assertTrue();
          })
            .catch((error: BusinessError) => {
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
     * @tc.number    : CAMERA_INPUT_BACK_003 //TODO
     * @tc.name      : open_promise_secure_photo_back_001
     * @tc.desc      : No abnormal scenarios -> isSecureEnabled-true, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*
        it('open_promise_secure_photo_back_001', Level.LEVEL2, async (done: Function) => {
          const testName = 'open_promise_secure_photo_back_001';
          console.info(TAG, testName + ' begin.');
          if (!checkBackCamera()) {
            console.info(TAG, testName + ' the current device does not have a rear camera.');
            done();
            return;
          }
          try {
            if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
              console.info(TAG, testName + ' cameraManager is null.');
              expect().assertFail();
            } else {
              let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
              expect(isEmpty(cameraInput)).assertFalse();
              if (mSupportedModes.includes(sceneMode.SECURE_PHOTO)) {
                mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
                  cameraStatusOnCallback(error, cameraStatusInfo);
                })
                await cameraInput.open(true).then(async (seqId: bigint) => {
                  console.info(TAG, testName + ' camera opened successfully. bigint: ' + JSON.stringify(seqId));
                  expect(true).assertTrue();
                })
                  .catch((error: BusinessError) => {
                    if (error !== undefined && error.code !== 0) {
                      console.error(TAG,
                        testName + ' failed to open the camera, err: ' + error.code + ', msg: ' + error.message);
                      expect().assertFail();
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
    */

    /**
     * @tc.number    : CAMERA_INPUT_BACK_004
     * @tc.name      : open_promise_secure_photo_back_002
     * @tc.desc      : No abnormal scenarios -> isSecureEnabled-false, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('open_promise_secure_photo_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_secure_photo_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
          expect(isEmpty(cameraInput)).assertFalse();
          mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
            cameraStatusOnCallback(error, cameraStatusInfo);
          })
          await cameraInput.open(false).then(async (seqId: bigint) => {
            console.info(TAG, testName + ' camera opened successfully. bigint: ' + JSON.stringify(seqId));
            expect(true).assertTrue();
          })
            .catch((error: BusinessError) => {
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
     * @tc.number    : CAMERA_INPUT_BACK_005
     * @tc.name      : open_promise_with_concurrent_back_001
     * @tc.desc      : No abnormal scenarios -> CameraConcurrentType-CAMERA_LIMITED_CAPABILITY, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('open_promise_with_concurrent_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_with_concurrent_back_001';
      await openWithCameraConcurrentType(done, testName, cameraConcurrentType.CAMERA_LIMITED_CAPABILITY);
    })

    /**
     * @tc.number    : CAMERA_INPUT_BACK_006
     * @tc.name      : open_promise_with_concurrent_back_002
     * @tc.desc      : No abnormal scenarios -> CameraConcurrentType-CAMERA_FULL_CAPABILITY, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('open_promise_with_concurrent_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_with_concurrent_back_002';
      await openWithCameraConcurrentType(done, testName, cameraConcurrentType.CAMERA_FULL_CAPABILITY);
    })

    /**
     * @tc.number    : CAMERA_INPUT_BACK_007
     * @tc.name      : open_promise_with_concurrent_abnormal_back_001
     * @tc.desc      : CameraConcurrentType->abnormalType, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_with_concurrent_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_promise_with_concurrent_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG, testName + ' cameraInput created successfully. ');
          if (getCameraConcurrentInfos()) {
            mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
              cameraStatusOnCallback(error, cameraStatusInfo);
            });
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
     * @tc.number    : CAMERA_INPUT_BACK_008 // TODO
     * @tc.name      : open_promise_abnormal_back_001
     * @tc.desc      : No abnormal scenarios-0 param, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'open_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
     * @tc.number    : CAMERA_INPUT_BACK_009
     * @tc.name      : close_callback_back_001
     * @tc.desc      : No abnormal scenarios-0 param, callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
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
     * @tc.number    : CAMERA_INPUT_BACK_010
     * @tc.name      : close_promise_back_001
     * @tc.desc      : No abnormal scenarios-0 param, promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
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
     * @tc.number    : CAMERA_INPUT_BACK_011
     * @tc.name      : on_off_error_Listen_back_001
     * @tc.desc      : No abnormal scenarios-error listen
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_off_error_Listen_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_error_Listen_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
     * @tc.number    : CAMERA_INPUT_BACK_012
     * @tc.name      : on_off_error_Listen_back_002
     * @tc.desc      : error listen-cameraDevice-abnormal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('on_off_error_Listen_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'on_off_error_Listen_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
     * @tc.number    : CAMERA_INPUT_BACK_013
     * @tc.name      : on_off_error_Listen_back_003
     * @tc.desc      : error listen-two input
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('on_off_error_Listen_back_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'on_off_error_Listen_back_003';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
     * @tc.number    : CAMERA_INPUT_BACK_014
     * @tc.name      : open_close_abnormal_back_001
     * @tc.desc      : Wrong order-first close, then open
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('open_close_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_close_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
     * @tc.number    : CAMERA_INPUT_BACK_015
     * @tc.name      : open_promise_abnormal_back_002
     * @tc.desc      : Wrong order-open twice -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('open_promise_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'open_promise_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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