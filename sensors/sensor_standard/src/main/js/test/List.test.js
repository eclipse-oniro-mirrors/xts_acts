/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import SystemParameterTest from './SensorOnOffTest.test.js'
import SensorJsTest_sensor_2 from './SensorGeomagneticTest.test.js'
import SensorJsTest_sensor_1 from './SensorGeneralalgorithm.test.js'
import SensorJsTest_sensor_60 from './SensorOnOffTest.test_newSensorGeomagnetic.js'
import SensorJsTest_sensor_3 from './SensorOnOffTest.test_oldAccelerometer.js'
import SensorJsTest_sensor_25 from './Subscribe_subscribeAccelerometer.js'
import SensorJsTest_sensor_39 from './SensorOnOffTest.test_newAccelerometer.js'
import SensorJsTest_sensor_43 from './SensorOnOffTest.test_newGyroScope.js'

export default function testsuite() {
SensorJsTest_sensor_1()
SensorJsTest_sensor_2()
SensorJsTest_sensor_60()
SystemParameterTest()
SensorJsTest_sensor_3()
SensorJsTest_sensor_25()
SensorJsTest_sensor_39()
SensorJsTest_sensor_43()
}
