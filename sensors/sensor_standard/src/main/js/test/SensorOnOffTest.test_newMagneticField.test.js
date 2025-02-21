/*
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
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

export default function SensorJsTest_sensor_37() {
describe("SensorJsTest_sensor_37", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let invalid  = -1;

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0010
     * @tc.name: newMagneticField_SensorJsTest001
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newMagneticField_SensorJsTest001--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback);
                setTimeout(()=>{
                    sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                    done();
                }, 500);
            })
        } catch (error) {
            console.info('newMagneticField_SensorJsTest001 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0020
     * @tc.name: newMagneticField_SensorJsTest002
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newMagneticField_SensorJsTest002--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest002 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                            done();
                        }, 500);
                }
            })
        } catch (error) {
            console.info('newMagneticField_SensorJsTest002 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0030
     * @tc.name: newMagneticField_SensorJsTest003
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest003--------------');
        function onSensorCallback(data) {
            console.info('newMagneticField_SensorJsTest003 callback in');
            expect(false).assertTrue();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newMagneticField_SensorJsTest003 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0040
     * @tc.name: newMagneticField_SensorJsTest004
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest004--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest004 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newMagneticField_SensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticField_SensorJsTest004 off end--------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('newMagneticField_SensorJsTest004 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0050
     * @tc.name: newMagneticField_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest005--------------');
        function onSensorCallback(data) {
            console.info('newMagneticField_SensorJsTest005  callback in');
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest005 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newMagneticField_SensorJsTest005 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticField_SensorJsTest005 off end--------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest005 Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0060
     * @tc.name: newMagneticField_SensorJsTest006
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest006 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.MAGNETIC_FIELD, callback);
                    setTimeout(()=>{
                        expect(true).assertTrue();
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest006 Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0070
     * @tc.name: newMagneticField_SensorJsTest007
     * @tc.desc: Use case of illegal parameter passed into once interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newMagneticField_SensorJsTest007 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newMagneticField_SensorJsTest007 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0080
     * @tc.name: newMagneticField_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newMagneticField_SensorJsTest008  on error');
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest008 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.MAGNETIC_FIELD, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest008 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0090
     * @tc.name: newMagneticField_SensorJsTest009
     * @tc.desc: Use case of illegal parameter passed into off interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newMagneticField_SensorJsTest009 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0100
     * @tc.name: newMagneticField_SensorJsTest010
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newMagneticField_SensorJsTest010 callback in');
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest010 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, onSensorCallback);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest010 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0110
     * @tc.name: newMagneticField_SensorJsTest011
     * @tc.desc:SensorId1000000 of incoming exception
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newMagneticField_SensorJsTest011 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newMagneticField_SensorJsTest011 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0120
     * @tc.name: newMagneticField_SensorJsTest012
     * @tc.desc:Call interface multiple times
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest012 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
                        console.info("newMagneticField_SensorJsTest012 callback: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
                        console.info("newMagneticField_SensorJsTest012 callback2: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newMagneticField_SensorJsTest012 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticField_SensorJsTest012 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest012 Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0130
     * @tc.name: newMagneticField_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            sensor.off(sensor.SensorId.MAGNETIC_FIELD, 5);
        } catch (error) {
            console.info('newMagneticField_SensorJsTest013 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0140
     * @tc.name: newMagneticField_SensorJsTest014
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest012 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
                        console.info("newMagneticField_SensorJsTest014 callback: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
                        console.info("newMagneticField_SensorJsTest014 callback2: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newMagneticField_SensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticField_SensorJsTest014 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest014 Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0150
     * @tc.name: newMagneticField_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest015--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest015 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
                        console.info("newMagneticField_SensorJsTest015 callback: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
                        console.info("newMagneticField_SensorJsTest015 callback2: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newMagneticField_SensorJsTest015 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticField_SensorJsTest015 off end--------------');
                        done();
                    }, 1000);
                }
        })
    } catch (error) {
        console.info("newMagneticField_SensorJsTest015 Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0160
     * @tc.name: newMagneticField_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest016--------------');
        try {
            sensor.on();
        } catch (error) {
            console.info("newMagneticField_SensorJsTest016_on error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
            console.info("newMagneticField_SensorJsTest016_once error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
            console.info("newMagneticField_SensorJsTest016_off error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0170
     * @tc.name: newMagneticField_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticField_SensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest017 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback);
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback2);
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback);
                        } catch (error) {
                        console.info("newMagneticField_SensorJsTest017 error:" + error);
                        }
                        console.info('----------------------newMagneticField_SensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest017 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback2);
                        console.info('----------------------newMagneticField_SensorJsTest017 off end--------------');
                        done();
                    }, 1000);
                }
            })
    } catch (error) {
        console.info("newMagneticField_SensorJsTest017 Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0180
     * @tc.name: newMagneticField_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticField_SensorJsTest018--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest017 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest018 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback);
                        } catch (error) {
                        console.info("newMagneticField_SensorJsTest018 error:" + error);
                        }
                        console.info('----------------------newMagneticField_SensorJsTest018 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest018_2 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback2);
                        console.info('----------------------newMagneticField_SensorJsTest018_2 off end--------------');
                        done();
                    }, 1000);
                }
            })
    } catch (error) {
        console.info("newMagneticField_SensorJsTest018 Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0190
     * @tc.name: newMagneticField_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticField_SensorJsTest019--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest019 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newMagneticField_SensorJsTest019 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newMagneticField_SensorJsTest019 off end--------------');
                    } catch (error) {
                        console.info("newMagneticField_SensorJsTest019 error:" + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
    } catch (error) {
        console.info("newMagneticField_SensorJsTest019 Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0200
     * @tc.name: newMagneticField_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticField_SensorJsTest020--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest020 error');
                } else {
                    try {
                        sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, {'interval': -100000000});
                        console.info('----------------------newMagneticField_SensorJsTest020 off in---------------------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('----------------------newMagneticField_SensorJsTest020 off end---------------------------');
                        done();
                    } catch (error) {
                        console.info('newMagneticField_SensorJsTest020 On fail, errCode:' + error.code + ' ,msg:' + error.message);
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                }
            })
    } catch (error) {
        console.info("newMagneticField_SensorJsTest020 Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0210
     * @tc.name: newMagneticField_SensorJsTest021
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest021 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, undefined);
                    try{
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('newMagneticField_SensorJsTest021 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest021 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        } catch (error) {
                        console.info("newMagneticField_SensorJsTest021 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('newMagneticField_SensorJsTest021 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0220
     * @tc.name: newMagneticField_SensorJsTest022
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest022--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest022 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, null);
                    try{
                        sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': null });
                        } catch(error){
                            console.info('newMagneticField_SensorJsTest022 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest022 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                            } catch (error) {
                        console.info("newMagneticField_SensorJsTest022 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('newMagneticField_SensorJsTest022 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0230
     * @tc.name: newMagneticField_SensorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticField_SensorJsTest023--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest023 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest023 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        } catch (error) {
                        console.info("newMagneticField_SensorJsTest023 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest023 Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0240
     * @tc.name: newMagneticField_SensorJsTest024
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest024 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("newMagneticField_SensorJsTest024 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest024 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                            } catch (error) {
                        console.info("newMagneticField_SensorJsTest024 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------newMagneticField_SensorJsTest024 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("newMagneticField_SensorJsTest024 Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0250
     * @tc.name: newMagneticField_SensorJsTest025
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticField_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newMagneticField_SensorJsTest025--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('newMagneticField_SensorJsTest025 error');
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newMagneticField_SensorJsTest025 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback);
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback2);
                        } catch (error) {
                        console.info("newMagneticField_SensorJsTest025 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------newMagneticField_SensorJsTest025 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('newMagneticField_SensorJsTest025 Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
})}
