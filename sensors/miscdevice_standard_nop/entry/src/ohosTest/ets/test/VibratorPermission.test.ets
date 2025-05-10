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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import vibrator from '@ohos.vibrator';
import { BusinessError } from '@ohos.base';


export default function VibratorPermissionTest() {
  describe('VibratorPermissionTest', () => {
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
     * @tc.number:SUB_SensorsSystem_VibratorPermissionTest0100
     * @tc.name: testVibratorPermissionTest_0100
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorPermissionTest_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'VibratorPermissionTest_0100';
      try {
        vibrator.isSupportEffect('haptic.clock.timer', (error: BusinessError, state: boolean) => {
          if (error) {
            console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(201);
            done();
          }
          console.info(`${TAG} Succeed in querying effect, state: ${state}}`);
          if (state) {
            try {
              vibrator.startVibration(
                {
                  type: 'preset',
                  effectId: 'haptic.clock.timer',
                  count: 1,
                },
                {
                  usage: 'unknown'
                },
                (error: BusinessError) => {
                  if (error) {
                    console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
                    expect(error.code).assertEqual(201);
                    done();
                  } else {
                    console.info(`${TAG} Succeed in starting vibration`);
                  }
                });
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              console.error(`${TAG} catch Code: ${e.code}, message: ${e.message}`);
              expect(e.code).assertEqual(201);
              done();
            }
          }
        });
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`${TAG} catch Code: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(201);
        done();
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_VibratorPermissionTest0200
     * @tc.name: testVibratorPermissionTest_0200
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorPermissionTest_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'VibratorPermissionTest_0200';
      try {
        vibrator.isSupportEffect('haptic.clock.timer')
          .then((state: boolean) => {
            console.info(`${TAG} Succeed in querying effect, state: ${state}}`);
            if (state) {
              try {
                vibrator.startVibration({
                  type: 'preset',
                  effectId: 'haptic.clock.timer',
                  count: 1,
                }, {
                  usage: 'unknown' // 根据实际选择类型归属不同的开关管控
                }).then(() => {
                  console.info('Succeed in starting vibration');
                }).catch((error: BusinessError) => {
                  console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
                  expect(error.code).assertEqual(201);
                  done();
                });
              } catch (error) {
                console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(201);
                done();
              }
            }
          })
          .catch((error: BusinessError) => {
            console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(201);
            done();
          })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`${TAG} catch Code: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(201);
        done();
      }
    })
  })
}