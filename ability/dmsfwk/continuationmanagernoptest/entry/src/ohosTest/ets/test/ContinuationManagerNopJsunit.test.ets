/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import vibrator from '@ohos.vibrator';
import continuationManager from '@ohos.continuation.continuationManager';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'
const TEST_DEVICE_ID = "test_deviceId";
const TEST_CONNECT_STATUS = continuationManager.DeviceConnectState.CONNECTED;
let token = -1;

export default function continuationManagerNopTest() {
  describe('continuationManagerNopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number:continuationManager_nop_Test01
     * @tc.name: No permission test registerContinuation callback
     * @tc.desc:Using the registerContinuation (options callback) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_registerContinuation_nop_Test01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.registerContinuation(
          {
            deviceType: ["00E"]
          },
          (err, data) => {
            if(err.code === PERMISSION_DENIED_CODE){
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            }else {
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
            console.info('continuationManager_nop_Test01 finished, ' + JSON.stringify(data));
            token = data;
          });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        done()
        console.error('catch continuationManager_nop_Test01 registerContinuation failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
   * @tc.number:continuationManager_nop_Test02
   * @tc.name: No permission test registerContinuation callback
   * @tc.desc:Using the registerContinuation (callback) method without permission
   * @tc.level:Level 0
   * @tc.type:Function
   * @tc.size:MediumTest
   */
    it("continuationManager_registerContinuation_nop_Test02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.registerContinuation((err, data) => {
          if (err.code != 0) {
            console.error('continuationManager_nop_Test02 failed, cause: ' + JSON.stringify(err));
            if(err.code === PERMISSION_DENIED_CODE){
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            }else {
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          }
          console.info('registerContinuation finished, ' + JSON.stringify(data));
          token = data;
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        done()
        console.error('catch continuationManager_nop_Test02 failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test03
     * @tc.name: No permission test registerContinuation then
     * @tc.desc:Using the registerContinuation (then) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_registerContinuation_nop_Test03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.registerContinuation(
          {
            deviceType: ["00E"]
          }).then((data) => {
          console.info('registerContinuation finished, ' + JSON.stringify(data));
          token = data;
        }).catch((err: BusinessError) => {
          if(err.code === PERMISSION_DENIED_CODE){
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }else {
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
          console.error('registerContinuation continuationManager_nop_Test03 failed, cause: ' + JSON.stringify(err));
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('catch registerContinuation failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test04
     * @tc.name: No permission test unregisterContinuation callback
     * @tc.desc:Using the unregisterContinuation (callback) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_unregisterContinuation_nop_Test04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.unregisterContinuation(token, (err) => {
          if (err.code != 0) {
            console.error('unregisterContinuation failed, cause: ' + JSON.stringify(err));
          }
          console.info('unregisterContinuation finished. ');
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('catch continuationManager_nop_Test04 failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test05
     * @tc.name: No permission test unregisterContinuation then
     * @tc.desc:Using the unregisterContinuation (then) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_unregisterContinuation_nop_Test05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.unregisterContinuation(token).then(() => {
          console.info('unregisterContinuation finished. ');
        }).catch((err: BusinessError) => {
          console.error('unregisterContinuation failed, cause: ' + JSON.stringify(err));
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('catch continuationManager_nop_Test05 failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test06
     * @tc.name: No permission test on callback
     * @tc.desc:Using the on (callback) method without permission,type is deviceUnselected type
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_on_nop_Test06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.on("deviceUnselected", token, (data) => {
          console.info('onDeviceUnselected len: ' + data.length);
          console.info('onDeviceUnselected finished.');
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('on failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test07
     * @tc.name: No permission test on callback
     * @tc.desc:Using the on (callback) method without permission,type is deviceSelected type
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_on_nop_Test07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.on("deviceSelected", token, (data) => {
          console.info('onDeviceSelected len: ' + data.length);
          for (let i = 0; i < data.length; i++) {
            console.info('onDeviceSelected deviceId: ' + JSON.stringify(data[i].id));
            console.info('onDeviceSelected deviceType: ' + JSON.stringify(data[i].type));
            console.info('onDeviceSelected deviceName: ' + JSON.stringify(data[i].name));
          }
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('on failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test08
     * @tc.name: No permission test off
     * @tc.desc:Using the off method without permission,type is deviceSelected type
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_off_nop_Test08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.off("deviceSelected", token);
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('off failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test09
     * @tc.name: No permission test off
     * @tc.desc:Using the off  method without permission,type is deviceUnselected type
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_off_nop_Test09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.off("deviceUnselected", token);
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('off failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test10
     * @tc.name: No permission test startContinuationDeviceManager callback
     * @tc.desc:Using the startContinuationDeviceManager  method without permission,parameter(token、callback)
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_startContinuationDeviceManager_nop_Test10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.startContinuationDeviceManager(token, (err) => {
          if (err.code != 0) {
            console.error('startContinuationDeviceManager failed, cause: ' + JSON.stringify(err));
            return;
          }
          console.info('startContinuationDeviceManager finished. ');
        });
      } catch (err) {
        console.error('startContinuationDeviceManager failed, cause: ' + JSON.stringify(err));
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test11
     * @tc.name: No permission test startContinuationDeviceManager callback
     * @tc.desc:Using the startContinuationDeviceManager  method without permission,parameter(token、callback、options)
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_startContinuationDeviceManager_nop_Test11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.startContinuationDeviceManager(
          token,
          {
            deviceType: ["00E"]
          },
          (err) => {
            if (err.code != 0) {
              console.error('startContinuationDeviceManager failed, cause: ' + JSON.stringify(err));
              return;
            }
            console.info('startContinuationDeviceManager finished. ');
          });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('startContinuationDeviceManager failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test12
     * @tc.name: No permission test startContinuationDeviceManager then
     * @tc.desc:Using the startContinuationDeviceManager method without permission,parameter(token、options)
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_startContinuationDeviceManager_nop_Test12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      try {
        continuationManager.startContinuationDeviceManager(
          token,
          {
            deviceType: ["00E"]
          }).then(() => {
          console.info('startContinuationDeviceManager finished. ');
        }).catch((err: BusinessError) => {
          console.error('startContinuationDeviceManager failed, cause: ' + JSON.stringify(err));
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('startContinuationDeviceManager failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test13
     * @tc.name: No permission test updateContinuationState callback
     * @tc.desc:Using the updateContinuationState method without permission,parameter(token、deviceId、status、callback)
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_updateContinuationState_nop_Test13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      let deviceId: string = "test deviceId";
      try {
        continuationManager.updateContinuationState(token, deviceId, continuationManager.DeviceConnectState.CONNECTED, (err) => {
          if (err.code != 0) {
            console.error('updateContinuationState failed, cause: ' + JSON.stringify(err));
            return;
          }
          console.info('updateContinuationState finished. ');
        });
      } catch (err) {
        if(err.code === PERMISSION_DENIED_CODE){
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        console.error('updateContinuationState failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })

    /*
     * @tc.number:continuationManager_nop_Test14
     * @tc.name: No permission test updateContinuationState then
     * @tc.desc:Using the updateContinuationState method without permission,parameter(token、deviceId、status)
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("continuationManager_updateContinuationState_nop_Test14", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('beforeEach');
      let deviceId: string = "test deviceId";
      try {
        continuationManager.updateContinuationState(token, deviceId, continuationManager.DeviceConnectState.CONNECTED)
          .then(() => {
            console.info('updateContinuationState finished. ');
          })
          .catch((err: BusinessError) => {
            console.error('updateContinuationState failed, cause: ' + JSON.stringify(err));
          });
      } catch (err) {
        if (err.code === PARAMETER_ERROR_CODE) {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
          done();
        } else {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE)
          done();
        }
        console.error('updateContinuationState failed, cause: ' + JSON.stringify(err));
      }
      console.info('beforeEach end');
    })
  })
}