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
import vibrator from '@ohos.vibrator';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';

export default function VibratorTest() {
  let isAvailable;
  const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
  describe('VibratorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async function (done) {
      /*
        * @tc.setup: setup invoked before all testcases
        */
      console.info('beforeAll called')
      console.info('VibratorTest isAvailable = ' + isAvailable);
      try {
          const vibratorsList = vibrator.getVibratorInfoSync();
          if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
              (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
              isAvailable = false;
              console.info('VibratorTest isAvailable ' + isAvailable);
              done()
          }else {
              isAvailable = true;
              console.info('VibratorTest isAvailable ' + isAvailable);
              done()
          }
      } catch(error) {
          console.error('VibratorTest exception :' + JSON.stringify(error))
          done()
      }
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async function (done) {
      console.info('afterEach called');
      try{
          vibrator.stopVibration().then(() => {
              console.info("afterEach: Success in stopping vibration. ");
              setTimeout(() => {
                  done();
              }, 500);
          }, (error) => {
              console.info("afterEach: error in stopping vibration. error: " + JSON.stringify(error));
              done();
          })
      } catch(error){
          console.info("afterEach error: " + JSON.stringify(error));
          done();
      }
      console.info('afterEach end');
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   VibratorTest_0100
     * @tc.number SUB_SensorsSystem_VibratorTest0100
     * @tc.desc   stopVibrationSync(): void Device operation failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('VibratorTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'VibratorTest_0100';
      vibrator.startVibration(
        {
          type: "time",
          duration: 500
        },
        {
          usage: "alarm"
        },
        (error) => {
          if (error && !isAvailable) {
              console.info(TAG + `isAvailable1 is false error.Code: ${error.code}, error.message: ${error.message}`);
              expect(error.code).assertEqual(14600101);
              done();
          } else if (error && isAvailable) {
              console.info(TAG + `isAvailable1 is true startVibration error.Code: ${error.code}, error.message: ${error.message}`);
              expect(false).assertTrue();
              done();
          } else {
              console.info(TAG + " startVibration success");
              try {
                vibrator.stopVibrationSync();
                vibrator.stopVibrationSync();
                console.info(TAG + "stopVibrationSync success");
                done();
              } catch (error) {
                console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(14600101);
                done();
              }
          } 
        });
    })

    /**
     * @tc.name   VibratorTest_0200
     * @tc.number SUB_SensorsSystem_VibratorTest0200
     * @tc.desc   stopVibrationSync(): void Device operation failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('VibratorTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'VibratorTest_0200';
      vibrator.startVibration(
        {
          type: "time",
          duration: 3000
        },
        {
          usage: "alarm"
        },
        (error) => {
          if (error && !isAvailable) {
              console.info(TAG + `isAvailable1 is false error.Code: ${error.code}, error.message: ${error.message}`);
              expect(error.code).assertEqual(14600101);
              done();
          } else if (error && isAvailable) {
              console.info(TAG + `isAvailable1 is true startVibration error.Code: ${error.code}, error.message: ${error.message}`);
              expect(false).assertTrue();
              done();
          } else {
            console.info(TAG + "startVibration success");
            try {
              let ret = vibrator.isSupportEffectSync('haptic.clock.timer');
              ret = vibrator.isSupportEffectSync('haptic.clock.timer');
              console.info(`${TAG} The query result is ${ret}`);
              done();
            } catch (error) {
              console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
              expect(error.code).assertEqual(14600101);
              done();
            }
          }
        });
    })

    /**
     * @tc.name   VibratorTest_0300
     * @tc.number SUB_SensorsSystem_VibratorTest0300
     * @tc.desc   stopVibrationSync(): void Device operation failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('VibratorTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'VibratorTest_0300';
      vibrator.startVibration(
        {
          type: "time",
          duration: 3000
        },
        {
          usage: "alarm"
        },
        (error) => {
          if (error && !isAvailable) {
              console.info(TAG + `isAvailable1 is false error.Code: ${error.code}, error.message: ${error.message}`);
              expect(error.code).assertEqual(14600101);
              done();
          } else if (error && isAvailable) {
              console.info(TAG + `isAvailable1 is true startVibration error.Code: ${error.code}, error.message: ${error.message}`);
              expect(false).assertTrue();
              done();
          } else {
            console.info(TAG + "startVibration success");
            try {
              let ret = false;
              for (let index = 0; index < 5; index++) {
                vibrator.isHdHapticSupported('haptic.clock.timer');
                console.info(`${TAG} The query result is ${ret}`);
              }
              done();
            } catch (error) {
              console.error(`${TAG} Code: ${error.code}, message: ${error.message}`);
              expect(error.code).assertEqual(14600101);
              done();
            }
          }
        });
    })
  })
}