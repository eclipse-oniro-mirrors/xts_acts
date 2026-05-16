'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF Any KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import Utils from './Util.test';
import {sensor} from '@kit.SensorServiceKit'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';

export default function attachThreadFfrtTest() {
  describe('attachThreadFfrtTest', () => {
    afterEach(async () => {
      await Utils.msSleep(100);
    });
    /**
     * @tc.name   SensorJsTest_ffrt_attachCurrentThread
     * @tc.number SUB_BUILTINS_FFRT_ATTACHCURRENTTHREAD_0001
     * @tc.desc   The test subsystem submits the task attachCurrentThread on the ffrt thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SensorJsTest_ffrt_attachCurrentThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------SensorJsTest_ffrt_attachCurrentThread--------------');
        try {
          let accUnreliable: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_UNRELIABLE;
          let accLow: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_LOW;
          let accMedium: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_MEDIUM;
          let accHigh: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_HIGH;
          let orientationResponseParam: sensor.OrientationResponse = {
            accuracy: accUnreliable,
            timestamp: 100000000,
            beta: 1.0,
            gamma: 2.0,
            alpha: 3.0,
          };
          expect(orientationResponseParam !== null).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingParamError_SensorJsTest_static_050 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
      });
  });
}
