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
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function telephony_data_NopTest() {
  describe('telephony_data_NopTest', () => {
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
     * @tc.number:SUB_telephony_data_nop0100
     * @tc.name: testTelephonyDataNop0100
     * @tc.desc:Using the isCellularDataEnabled (callback) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testTelephonyDataNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop001----before----');
      try {
        data.isCellularDataEnabled().then((data: boolean) => {
          console.log(`isCellularDataEnabled success, promise: data->${JSON.stringify(data)}`);
        }).catch((err: BusinessError) => {
          console.error(`telephony_data_nop001 fail, promise: err->${JSON.stringify(err)}`);
          if (err.code === PERMISSION_DENIED_CODE) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        console.error("telephony_data_nop001 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------telephony_data_nop001----after----');
    })

    /*
     * @tc.number:SUB_telephony_data_nop002
     * @tc.name: testTelephonyDataNop0200
     * @tc.desc:Using the isCellularDataEnabled (callback) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testTelephonyDataNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop002----before----');
      try {
        data.isCellularDataEnabled((err: BusinessError, data: boolean) => {
          if(err){
            console.error(`telephony_data_nop002 fail, promise: err->${JSON.stringify(err)}`);
            if (err.code === PERMISSION_DENIED_CODE) {
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          }else{
            console.log(`telephony_data_nop002 success`);
          }
        });
      } catch (err) {
        console.error("telephony_data_nop002 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------telephony_data_nop002----after----');
    })

    /*
     * @tc.number:SUB_telephony_data_nop003
     * @tc.name: testTelephonyDataNop0300
     * @tc.desc:Using the isCellularDataRoamingEnabled (then) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testTelephonyDataNop0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop003----before----');
      try {
        data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
          console.log(`isCellularDataRoamingEnabled success, promise: data->${JSON.stringify(data)}`);
        }).catch((err: BusinessError) => {
          console.error(`telephony_data_nop003 fail, promise: err->${JSON.stringify(err)}`);
          if (err.code === PERMISSION_DENIED_CODE) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        console.error("telephony_data_nop003 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------telephony_data_nop003----after----');
    })

    /*
     * @tc.number:SUB_telephony_data_nop004
     * @tc.name: testTelephonyDataNop0400
     * @tc.desc:Using the isCellularDataRoamingEnabled (callback) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testTelephonyDataNop0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop004----before----');
      try {
        data.isCellularDataRoamingEnabled(0,(err: BusinessError, data: boolean) => {
          if(err){
            console.error(`telephony_data_nop004 fail, promise: err->${JSON.stringify(err)}`);
            if (err.code === PERMISSION_DENIED_CODE) {
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          }else{
            console.log(`telephony_data_nop004 success`);
          }
        });
      } catch (err) {
        console.error("telephony_data_nop004 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------telephony_data_nop004----after----');
    })
  })
}

