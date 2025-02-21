/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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
import SensorJsTest_sensor_60 from './SensorOnOffTest.test_newSensorGeomagnetic.test.js'
import SensorJsTest_sensor_38 from './SensorOnOffTest.test_newSensorGeomagneticOptions.test.js'
import SensorJsTest_sensor_35 from './SensorOnOffTest.test_newGetSensorList.test.js'
import SensorJsTest_sensor_36 from './SensorOnOffTest.test_newGetSingleSensor.test.js'
import SensorJsTest_sensor_3 from './SensorOnOffTest.test_oldAccelerometer.test.js'
import SensorJsTest_sensor_25 from './Subscribe_subscribeAccelerometer.test.js'
import SensorJsTest_sensor_39 from './SensorOnOffTest.test_newAccelerometer.test.js'
import SensorJsTest_sensor_43 from './SensorOnOffTest.test_newGyroScope.test.js'
import SensorJsTest_sensor_5 from './SensorOnOffTest.test_oldGyroScope.test.js'
import SensorJsTest_sensor_29 from './Subscribe_subscribeGyroscope.test.js'
import SensorJsTest_sensor_41 from './SensorOnOffTest.test_newAmbient_Light.test.js'
import SensorJsTest_sensor_4 from './SensorOnOffTest.test_oldAmbient_light.test.js'
import SensorJsTest_sensor_31 from './Subscribe_subscribeLight.test.js'
import SensorJsTest_sensor_42 from './SensorOnOffTest.test_newGravity.test.js'
import SensorJsTest_sensor_9 from './SensorOnOffTest.test_oldGravity.test.js'
import SensorJsTest_sensor_37 from './SensorOnOffTest.test_newMagneticField.test.js'
import SensorJsTest_sensor_15 from './SensorOnOffTest.test_oldMagneticField.test.js'
import SensorJsTest_sensor_49 from './SensorOnOffTest.test_newRotatingVector.test.js'
import SensorJsTest_sensor_20 from './SensorOnOffTest.test_oldRotatingVector.test.js'
import SensorJsTest_sensor_45 from './SensorOnOffTest.test_newHall.test.js'
import SensorJsTest_sensor_7 from './SensorOnOffTest.test_oldHall.test.js'
import SensorJsTest_sensor_48 from './SensorOnOffTest.test_newOrientating.test.js'
import SensorJsTest_sensor_16 from './SensorOnOffTest.test_oldOrientating.test.js'
import SensorJsTest_sensor_27 from './Subscribe_subscribeDeviceOrientation.test.js'
import SensorJsTest_sensor_53 from './SensorOnOffTest.test_newBarometer.test.js'
import SensorJsTest_sensor_8 from './SensorOnOffTest.test_oldBarometer.test.js'
import SensorJsTest_sensor_26 from './Subscribe_subscribeBarometer.test.js'
import SensorJsTest_sensor_57 from './SensorOnOffTest.test_newPedometer_Detection.test.js'
import SensorJsTest_sensor_17 from './SensorOnOffTest.test_oldPedometer_Detection.test.js'
import SensorJsTest_sensor_56 from './SensorOnOffTest.test_newPedometer.test.js'
import SensorJsTest_sensor_18 from './SensorOnOffTest.test_oldPedometer.test.js'
import SensorJsTest_sensor_61 from './SensorOnOffTest.test_newColor.test.js'
import SensorJsTest_sensor_62 from './SensorOnOffTest.test_newSar.test.js'
import SensorJsTest_sensor_63 from './SensorOnOffTest.test_SensorFrequencyTest.test.js'
import SensorJsTest_sensor_64 from './SensorOnOffTest.test_newSensorSync.test.js'
export default function testsuite() {
		SystemParameterTest()
		SensorJsTest_sensor_2()
		SensorJsTest_sensor_1()
		SensorJsTest_sensor_60()
		SensorJsTest_sensor_38()
		SensorJsTest_sensor_35()
		SensorJsTest_sensor_36()
		SensorJsTest_sensor_3()
		SensorJsTest_sensor_25()
		SensorJsTest_sensor_39()
		SensorJsTest_sensor_43()
		SensorJsTest_sensor_5()
		SensorJsTest_sensor_29()
		SensorJsTest_sensor_41()
		SensorJsTest_sensor_4()
		SensorJsTest_sensor_31()
		SensorJsTest_sensor_42()
		SensorJsTest_sensor_9()			
		SensorJsTest_sensor_37()
		SensorJsTest_sensor_15()
		SensorJsTest_sensor_49()
		SensorJsTest_sensor_20()
		SensorJsTest_sensor_45()
		SensorJsTest_sensor_7()
		SensorJsTest_sensor_48()
		SensorJsTest_sensor_16()
		SensorJsTest_sensor_27()
		SensorJsTest_sensor_53()
		SensorJsTest_sensor_8()
		SensorJsTest_sensor_26()
		SensorJsTest_sensor_57()
		SensorJsTest_sensor_17()
		SensorJsTest_sensor_56()
		SensorJsTest_sensor_18()
		SensorJsTest_sensor_61()
		SensorJsTest_sensor_62()
		SensorJsTest_sensor_63()
        SensorJsTest_sensor_64()
}                    
