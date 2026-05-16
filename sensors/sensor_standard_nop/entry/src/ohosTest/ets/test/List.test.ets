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

import accelerometer_nop_Test from './SensorOnOff_Accelerometer_nop_Test.test';
import accelerometer_Uncalibrated_nop_Test from './SensorOnOff_Accelerometer_Uncalibrated_nop_Test.test';
import gyroscope_nop_Test from './SensorOnOff_Gyroscope_nop_Test.test';
import gyroscope_uncalibrated_nop_Test from './SensorOnOff_Gyroscope_Uncalibrated_nop_Test.test';
import linear_Accelerometer_nop_Test from './SensorOnOff_Linear_Accelerometer_nop_Test.test';
import pedometerDetection_nop_Test from './SensorOnOff_Pedometer_Detection_nop_Test.test';
import pedometer_nop_Test from './SensorOnOff_Pedometer_nop_Test.test';
import heart_rate_nop_Test from './SensorOn_Heart_Rate_nop_Test.test';

export default function testsuite() {
  pedometerDetection_nop_Test();
  pedometer_nop_Test();
  linear_Accelerometer_nop_Test();
  accelerometer_Uncalibrated_nop_Test();
  accelerometer_nop_Test();
  heart_rate_nop_Test();
  gyroscope_nop_Test();
  gyroscope_uncalibrated_nop_Test();
}