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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_63() {
describe("SensorJsTest_sensor_63", function () {
    function callback(data) {
        console.info('callback' + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual('number');
        expect(typeof(data.y)).assertEqual('number');
        expect(typeof(data.z)).assertEqual('number');
    }

    function callback2(data) {
        console.info('callback2' + JSON.stringify(data));
        expect(typeof(data.alpha)).assertEqual('number');
        expect(typeof(data.beta)).assertEqual('number');
        expect(typeof(data.gamma)).assertEqual('number');
    }

    beforeAll(async function() {
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called')
    })

    afterAll(function() {
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called')
    })

    beforeEach(function() {
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach called')
    })

    afterEach(function() {
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    const PERMISSION_DENIED_CODE = 201
    const PARAMETER_ERROR_CODE = 401
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const PERMISSION_DENIED_MSG = 'Permission denied.'    

    /*
     * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0010
     * @tc.desc:verify app info is not null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.require: Issue Number
     * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0010
     */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 'game'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0020
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0020
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (err, data) => {
                    if (err) {
                        console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 'ui'});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.ACCELEROMETER);
                            done();
                        }, 500);
                    } catch (err) {
                        console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                console.error('Sensor is not support');
                expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0030
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0030
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0030---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 'normal'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0040
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0040
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0040---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.GYROSCOPE, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 'game'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0050
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0050
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0050---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.GYROSCOPE, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 'ui'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0060
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0060
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0060---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.GYROSCOPE, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 'normal'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0070
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0070
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0070---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ORIENTATION, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.ORIENTATION, callback2, {'interval': 'game'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ORIENTATION);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0080
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0080
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0080---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ORIENTATION, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.ORIENTATION, callback2, {'interval': 'ui'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ORIENTATION);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
    * @tc.name:SUB_SensorsSystem_NewFrequency_JSTest_0090
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUB_SensorsSystem_NewFrequency_JSTest_0090
    */
    it("SUB_SensorsSystem_NewFrequency_JSTest_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUB_SensorsSystem_NewFrequency_JSTest_0090---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ORIENTATION, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.ORIENTATION, callback2, {'interval': 'normal'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ORIENTATION);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
})}