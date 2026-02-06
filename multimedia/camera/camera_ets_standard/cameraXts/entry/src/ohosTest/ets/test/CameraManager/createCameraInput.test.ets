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
import { cameraErrorCode, cameraPosition, cameraType, driveFn, getPermission, isEmpty } from '../common';

const TAG = "CameraXts.createCameraInputTest";
const abnormalValue = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
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

function getInputWithOneParamTest(done: Function, testName: string, device: camera.CameraDevice | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mCameraManager.createCameraInput(device);
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

function getInputWithTwoParamsTest(done: Function, testName: string, position: camera.CameraPosition | undefined | null,
  type: camera.CameraType | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mCameraManager.createCameraInput(position as camera.CameraPosition, type as camera.CameraType);
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT || error.code == cameraErrorCode.SERVICE_FATAL_ERROR)
      .assertTrue();
    done();
  }
}

export default function createCameraInputTest() {
  describe('createCameraInputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      await getPermission();
      await driveFn();
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
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_001
     * @tc.name      : createCameraInput_001
     * @tc.desc      : No abnormal scenarios - 1 param -> pass
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createCameraInput_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'createCameraInput_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[i]);
            expect(isEmpty(cameraInput)).assertFalse();
            console.info(TAG, testName + ' i: ' + i + ', cameraInput: ' + cameraInput);
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
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_002
     * @tc.name      : createCameraInput_002
     * @tc.desc      : No abnormal scenarios - 2 params -> pass
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createCameraInput_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'createCameraInput_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let cameraInput =
              mCameraManager.createCameraInput(mCameraDeviceArray[i].cameraPosition, mCameraDeviceArray[i].cameraType);
            expect(isEmpty(cameraInput)).assertFalse();
            console.info(TAG, testName + ' i: ' + i + ', cameraInput: ' + cameraInput);
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
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_003
     * @tc.name      : createCameraInput_abnormal_001
     * @tc.desc      : camaraDevice->invalid -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createCameraInput_abnormal_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'createCameraInput_abnormal_001';
      let cameraDevice: camera.CameraDevice = mCameraDeviceArray[abnormalValue];
      getInputWithOneParamTest(done, testName, cameraDevice);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_004
     * @tc.name      : createCameraInput_abnormal_002
     * @tc.desc      : camaraDevice->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_abnormal_002';
      let cameraDevice: camera.CameraDevice | undefined = undefined;
      getInputWithOneParamTest(done, testName, cameraDevice);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_005
     * @tc.name      : createCameraInput_abnormal_003
     * @tc.desc      : camaraDevice->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_abnormal_003';
      let cameraDevice: camera.CameraDevice | null = null;
      getInputWithOneParamTest(done, testName, cameraDevice);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_006
     * @tc.name      : createCameraInput_two_params_abnormal_001
     * @tc.desc      : cameraPosition->invalid, normal cameraType -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_abnormal_001';
      let position: camera.CameraPosition = abnormalValue;
      let type: camera.CameraType = mCameraDeviceArray[0].cameraType;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_007
     * @tc.name      : createCameraInput_two_params_abnormal_002
     * @tc.desc      : cameraPosition->null, normal cameraType -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_abnormal_002';
      let position: camera.CameraPosition | null = null;
      let type: camera.CameraType = mCameraDeviceArray[0].cameraType;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_008
     * @tc.name      : createCameraInput_two_params_abnormal_003
     * @tc.desc      : cameraPosition->undefined, normal cameraType -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_abnormal_003';
      let position: camera.CameraPosition | undefined = undefined;
      let type: camera.CameraType = mCameraDeviceArray[0].cameraType;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_009
     * @tc.name      : createCameraInput_two_params_abnormal_004
     * @tc.desc      : normal cameraPosition, cameraType->invalid -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_abnormal_004';
      let position: camera.CameraPosition = mCameraDeviceArray[0].cameraPosition;
      let type: camera.CameraType = abnormalValue;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_010
     * @tc.name      : createCameraInput_two_params_abnormal_005
     * @tc.desc      : normal cameraPosition, cameraType->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_abnormal_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_abnormal_005';
      let position: camera.CameraPosition = mCameraDeviceArray[0].cameraPosition;
      let type: camera.CameraType | null = null;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_011
     * @tc.name      : createCameraInput_two_params_abnormal_006
     * @tc.desc      : normal cameraPosition, cameraType->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_abnormal_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_abnormal_006';
      let position: camera.CameraPosition = mCameraDeviceArray[0].cameraPosition;
      let type: camera.CameraType | undefined = undefined;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_012
     * @tc.name      : createCameraInput_two_params_001
     * @tc.desc      : cameraPosition->CAMERA_POSITION_UNSPECIFIED, cameraType->CAMERA_TYPE_DEFAULT -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_001';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_UNSPECIFIED;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_DEFAULT;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_013
     * @tc.name      : createCameraInput_two_params_002
     * @tc.desc      : cameraPosition->CAMERA_POSITION_UNSPECIFIED, cameraType->CAMERA_TYPE_WIDE_ANGLE -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_002';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_UNSPECIFIED;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_WIDE_ANGLE;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_014
     * @tc.name      : createCameraInput_two_params_003
     * @tc.desc      : cameraPosition->CAMERA_POSITION_UNSPECIFIED, cameraType->CAMERA_TYPE_ULTRA_WIDE -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_003';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_UNSPECIFIED;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_ULTRA_WIDE;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_015
     * @tc.name      : createCameraInput_two_params_004
     * @tc.desc      : cameraPosition->CAMERA_POSITION_UNSPECIFIED, cameraType->CAMERA_TYPE_TELEPHOTO -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_004';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_UNSPECIFIED;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_TELEPHOTO;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_016
     * @tc.name      : createCameraInput_two_params_005
     * @tc.desc      : cameraPosition->CAMERA_POSITION_UNSPECIFIED, cameraType->CAMERA_TYPE_TRUE_DEPTH -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_005';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_UNSPECIFIED;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_TRUE_DEPTH;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_017
     * @tc.name      : createCameraInput_two_params_006
     * @tc.desc      : cameraPosition->CAMERA_POSITION_BACK, cameraType->CAMERA_TYPE_DEFAULT -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_006';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_BACK;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_DEFAULT;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_018
     * @tc.name      : createCameraInput_two_params_007
     * @tc.desc      : cameraPosition->CAMERA_POSITION_BACK, cameraType->CAMERA_TYPE_WIDE_ANGLE -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_007';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_BACK;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_WIDE_ANGLE;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_019
     * @tc.name      : createCameraInput_two_params_008
     * @tc.desc      : cameraPosition->CAMERA_POSITION_BACK, cameraType->CAMERA_TYPE_ULTRA_WIDE -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_008';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_BACK;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_ULTRA_WIDE;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_020
     * @tc.name      : createCameraInput_two_params_009
     * @tc.desc      : cameraPosition->CAMERA_POSITION_BACK, cameraType->CAMERA_TYPE_TELEPHOTO -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_009';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_BACK;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_TELEPHOTO;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_021
     * @tc.name      : createCameraInput_two_params_010
     * @tc.desc      : cameraPosition->CAMERA_POSITION_BACK, cameraType->CAMERA_TYPE_TRUE_DEPTH -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_010';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_BACK;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_TRUE_DEPTH;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_022
     * @tc.name      : createCameraInput_two_params_011
     * @tc.desc      : cameraPosition->CAMERA_POSITION_FRONT, cameraType->CAMERA_TYPE_DEFAULT -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_011';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_FRONT;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_DEFAULT;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_023
     * @tc.name      : createCameraInput_two_params_012
     * @tc.desc      : cameraPosition->CAMERA_POSITION_FRONT, cameraType->CAMERA_TYPE_WIDE_ANGLE -> pass
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_012';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_FRONT;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_WIDE_ANGLE;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_024
     * @tc.name      : createCameraInput_two_params_013
     * @tc.desc      : cameraPosition->CAMERA_POSITION_FRONT, cameraType->CAMERA_TYPE_ULTRA_WIDE -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_013';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_FRONT;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_ULTRA_WIDE;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_025
     * @tc.name      : createCameraInput_two_params_014
     * @tc.desc      : cameraPosition->CAMERA_POSITION_FRONT, cameraType->CAMERA_TYPE_TELEPHOTO -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_014';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_FRONT;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_TELEPHOTO;
      getInputWithTwoParamsTest(done, testName, position, type);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_CAMERA_INPUT_026
     * @tc.name      : createCameraInput_two_params_015
     * @tc.desc      : cameraPosition->CAMERA_POSITION_FRONT, cameraType->CAMERA_TYPE_TRUE_DEPTH -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createCameraInput_two_params_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'createCameraInput_two_params_015';
      let position: camera.CameraPosition = cameraPosition.CAMERA_POSITION_FRONT;
      let type: camera.CameraType = cameraType.CAMERA_TYPE_TRUE_DEPTH;
      getInputWithTwoParamsTest(done, testName, position, type);
    })
  })
}