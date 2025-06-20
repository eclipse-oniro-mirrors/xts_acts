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
import observer from '@ohos.telephony.observer';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function
observerNopTest() {
  describe('observerNopTest', () => {
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
     * @tc.number:SUB_observerNop001
     * @tc.name: observerNop001
     * @tc.desc:Using the observer on ('networkStateChange',options,callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("observerNop001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------observerNop0001----before----');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.on('networkStateChange', options, (data: observer.NetworkState) => {
          console.log("on observer, data:" + JSON.stringify(data));
        });
      } catch (err) {
        console.error("observerNop001 error:" + JSON.stringify(err));
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        done()
      }
      console.info('--------observerNop001----after----');
    })

    /*
     * @tc.number:SUB_observerNop002
     * @tc.name: observerNop002
     * @tc.desc:Using the observer on ('networkStateChange',callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("observerNop002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------observerNop002----before----');
      try {
        observer.on('networkStateChange', (data: observer.NetworkState) => {
          console.log("observerNop002, data:" + JSON.stringify(data));
        });
      } catch (err) {
        console.error("observerNop002 error:" + JSON.stringify(err));
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
        done()
      }
      console.info('--------observerNop002----after----');
    })
  })
}

