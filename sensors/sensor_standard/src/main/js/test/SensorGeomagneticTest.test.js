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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_2() {
describe("SensorJsTest_sensor_2", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll caled')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll caled')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach caled')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    let GEOMAGNETIC_COMPONENT_YEAR_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875,
        55000.0703125],
        [6554.17041015625, -87.19947052001953, 54649.078125, -0.7622424364089966, 83.16046905517578, 6554.75048828125,
        55040.7734375],
        [6537.99169921875, -28.231582641601562, 54692.02734375, -0.24740631878376007, 83.18303680419922,
        6538.052734375, 55081.4296875],
        [6521.81201171875, 30.73670768737793, 54734.97265625, 0.2700277864933014, 83.20502471923828, 6521.88427734375,
        55122.15625],
        [6505.6328125, 89.70511627197266, 54777.90625, 0.7899921536445618, 83.22642517089844, 6506.2509765625,
        55162.9453125]]

    let GEOMAGNETIC_COMPONENT_COORDINATES_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875,
        55000.0703125],
        [39624.28125, 109.8766098022461, -10932.4638671875, 0.15887857973575592, -15.424291610717773, 39624.43359375,
        41104.921875],
        [37636.72265625, 104.90892791748047, -10474.810546875, 0.15970633924007416, -15.552550315856934, 37636.8671875,
        39067.3203125],
        [5940.583984375, 15772.0927734375, -52480.7578125, 69.36103820800781, -72.19599914550781, 16853.765625,
        55120.58984375],
        [5744.87255859375, 14799.48046875, -49969.40234375, 68.78474426269531, -72.37483215332031, 15875.3955078125,
        52430.61328125]]

    let GEOMAGNETIC_COORDINATES = [[80, 0, 0],
    [0, 120, 0],
    [0, 120, 100000],
    [-80, 240, 0],
    [-80, 240, 100000]]

    let timeMillis = [1580486400000, 1612108800000, 1643644800000, 1675180800000, 1706716800000]

    const EPS = 0.01

    /**
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0010
    * @tc.name: SensorGeomagenticAlgorithmJSTest001
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it('SensorGeomagenticAlgorithmJSTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest001-------------------------");
        let promiseArray = []
        for (let i = 0; i < timeMillis.length; i++) {
            promiseArray.push(new Promise((resolve, reject) => {
                let j = i
                sensor.getGeomagneticField({ 'latitude': 80, 'longitude': 0, 'altitude': 0 }, timeMillis[j],
                    (error, data) => {
                        if (error) {
                            console.info('SensorGeomagenticAlgorithmJSTest001 failed');
                            expect(false).assertTrue();
                            setTimeout((err) => {
                                reject(err)
                            }, 500)
                        } else {
                            console.info('SensorGeomagenticAlgorithmJSTest001 success x: ' + data.x + ',y: '
                            + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: '
                            + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                            expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][0]) < EPS).assertTrue()
                            expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][1]) < EPS).assertTrue()
                            expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][2]) < EPS).assertTrue()
                            expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][3]) < EPS).assertTrue()
                            expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][4]) < EPS).assertTrue()
                            expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][5]) < EPS).assertTrue()
                            expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][6]) < EPS).assertTrue()
                            setTimeout(() => {
                                resolve()
                            }, 500)
                        }
                    })
            }))
        }
        Promise.all(promiseArray).then(done)
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0020
     * @tc.name: SensorGeomagenticAlgorithmJSTest002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest002-------------------------");
        let promiseArray = []
        for (let i = 0; i < GEOMAGNETIC_COORDINATES.length; i++) {
            promiseArray.push(new Promise((resolve, reject) => {
                let j = i
                sensor.getGeomagneticField({
                    'latitude': GEOMAGNETIC_COORDINATES[j][0],
                    'longitude': GEOMAGNETIC_COORDINATES[j][1], 'altitude': GEOMAGNETIC_COORDINATES[j][2]
                }, timeMillis[0], (error, data) => {
                    if (error) {
                        console.info('SensorGeomagenticAlgorithmJSTest002 failed');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err)
                        }, 500)
                    } else {
                        console.info('SensorGeomagenticAlgorithmJSTest002 success x: ' + data.x + ',y: '
                        + data.y + ',z: '
                        + data.z + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                        expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][0]) < EPS).assertTrue()
                        expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][1]) < EPS).assertTrue()
                        expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][2]) < EPS).assertTrue()
                        expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][3]) < EPS).assertTrue()
                        expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][4]) < EPS).assertTrue()
                        expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][5]) < EPS).assertTrue()
                        expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][6]) < EPS).assertTrue()
                        setTimeout(() => {
                            resolve()
                        }, 500)
                    }
                })
            }))
        }
        Promise.all(promiseArray).then(done)
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0030
     * @tc.name: SensorGeomagenticAlgorithmJSTest003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest003-------------------------");
        let geomagneticComponent = [-1417119616, 23146989568, -6406359552, -15.442885398864746,
        93.50342559814453, 23190329344, 24058943488, -1417119360, 23146989568, -6406359552, -15.442885398864746,
        93.50342559814453, 23190329344, 24058943488]
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 }, 9223372036854775807,
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest003 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest003 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
					expect((Math.abs(data.x - geomagneticComponent[0]) < EPS) 
					|| (Math.abs(data.x - geomagneticComponent[7]) < EPS)).assertTrue();
					expect((Math.abs(data.y - geomagneticComponent[1]) < EPS) 
					|| (Math.abs(data.y - geomagneticComponent[8]) < EPS)).assertTrue();	
					expect((Math.abs(data.z - geomagneticComponent[2]) < EPS) 
					|| (Math.abs(data.z - geomagneticComponent[9]) < EPS)).assertTrue();	
					expect((Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS) 
					|| (Math.abs(data.geomagneticDip - geomagneticComponent[10]) < EPS)).assertTrue();	
					expect((Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS) 
					|| (Math.abs(data.deflectionAngle - geomagneticComponent[11]) < EPS)).assertTrue();	
					expect((Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS) 
					|| (Math.abs(data.levelIntensity - geomagneticComponent[12]) < EPS)).assertTrue();	
					expect((Math.abs(data.totalIntensity - geomagneticComponent[6]) < EPS) 
					|| (Math.abs(data.totalIntensity - geomagneticComponent[13]) < EPS)).assertTrue();	
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })
	
    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0040
     * @tc.name: SensorGeomagenticAlgorithmJSTest004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest004-------------------------");
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773,
        -12.610970497131348, 28465.9765625, 32141.2109375]
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 }, Number.MIN_VALUE,
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest004 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest004 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
                    expect(Math.abs(data.y - geomagneticComponent[1]) < EPS).assertTrue()
                    expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
                    expect(Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS).assertTrue()
                    expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
                    expect(Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS).assertTrue()
                    expect(Math.abs(data.totalIntensity - geomagneticComponent[6]) < EPS).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0050
     * @tc.name: SensorGeomagenticAlgorithmJSTest005
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest005-------------------------");
        let geomagneticComponent = [1824.141845703125, 2.9950538714314696e+33, 56727.7734375, 1.0852099087396978e-27,
		90, 2.9950538714314696e+33, Infinity]
        sensor.getGeomagneticField({ 'latitude': Number.MAX_VALUE, 'longitude': 0, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest005 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest005 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip + ',deflectionAngle: ' + data.deflectionAngle
					+ ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                    expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
                    expect(Math.abs((data.y - geomagneticComponent[1]) / 1.0e+33) < EPS).assertTrue()
                    expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
                    expect(Math.abs((data.geomagneticDip - geomagneticComponent[3]) / 1.0e-27) < EPS).assertTrue()
                    expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
                    expect(Math.abs((data.levelIntensity - geomagneticComponent[5]) / 1.0e+33) < EPS).assertTrue()
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0060
     * @tc.name: SensorGeomagenticAlgorithmJSTest006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest006-------------------------");
        let geomagneticComponent = [1824.141845703125, 2.9950538714314696e+33, 56727.7734375, 1.0852099087396978e-27,
		90, 2.9950538714314696e+33, Infinity]
        sensor.getGeomagneticField({ 'latitude': Number.NaN, 'longitude': 0, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest006 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest006 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
                    expect(Math.abs((data.y - geomagneticComponent[1]) / 1.0e+33) < EPS).assertTrue()
                    expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
                    expect(Math.abs((data.geomagneticDip - geomagneticComponent[3]) / 1.0e-27) < EPS).assertTrue()
                    expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
                    expect(Math.abs((data.levelIntensity - geomagneticComponent[5]) / 1.0e+33) < EPS).assertTrue()
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0070
     * @tc.name: SensorGeomagenticAlgorithmJSTest007
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest007-------------------------");
        let geomagneticComponent = [14425.57421875, -4.4076765967073136e+35, -52023.21484375, -6.76254414480036e-30,
		-90, 4.4076765967073136e+35, Infinity]
        sensor.getGeomagneticField({ 'latitude': Number.NEGATIVE_INFINITY, 'longitude': 0, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest007 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest007 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
                    expect(Math.abs((data.y - geomagneticComponent[1]) / 1.0e+35) < EPS).assertTrue()
                    expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
                    expect(Math.abs((data.geomagneticDip - geomagneticComponent[3]) / 1.0e-30) < EPS).assertTrue()
                    expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
                    expect(Math.abs((data.levelIntensity - geomagneticComponent[5]) / 1.0e+35) < EPS).assertTrue()
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0080
     * @tc.name: SensorGeomagenticAlgorithmJSTest008
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest008-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest008 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest008 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue();
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0090
     * @tc.name: SensorGeomagenticAlgorithmJSTest009
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest009-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest009 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest009 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0100
     * @tc.name: SensorGeomagenticAlgorithmJSTest010
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest010-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest010 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest010 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0110
     * @tc.name: SensorGeomagenticAlgorithmJSTest011
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest011-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest011 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest011 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0120
     * @tc.name: SensorGeomagenticAlgorithmJSTest012
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest012-------------------------");
        let geomagneticComponent = [27536.40234375, -2248.586669921875, -16022.4306640625, -30.110872268676758,
        -4.66834020614624, 27628.05859375, 31937.875]
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MIN_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest012 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest012 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
                    expect(Math.abs(data.y - geomagneticComponent[1]) < EPS).assertTrue()
                    expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
                    expect(Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS).assertTrue()
                    expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
                    expect(Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS).assertTrue()
                    expect(Math.abs(data.totalIntensity - geomagneticComponent[6]) < EPS).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0130
     * @tc.name: SensorGeomagenticAlgorithmJSTest013
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest013-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest013 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest013 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0140
     * @tc.name: SensorGeomagenticAlgorithmJSTest014
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest014-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest014 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest014 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0150
     * @tc.name: SensorGeomagenticAlgorithmJSTest015
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest015-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest015 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest015 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0160
     * @tc.name: SensorGeomagenticAlgorithmJSTest016
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest016-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest016 once success');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest016 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0170
     * @tc.name: SensorGeomagenticAlgorithmJSTest017
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest017-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest017 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest017 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0180
     * @tc.name: SensorGeomagenticAlgorithmJSTest018
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest018-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest018 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest018 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0190
     * @tc.name: SensorGeomagenticAlgorithmJSTest019
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest019-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest019 failed');
                    expect(false).assertfalse();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest019 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0200
     * @tc.name: SensorGeomagenticAlgorithmJSTest020
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest020-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest020 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest020 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue();
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0210
     * @tc.name: SensorGeomagenticAlgorithmJSTest021
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest021-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest021 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest021 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0220
     * @tc.name: SensorGeomagenticAlgorithmJSTest022
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest022-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest022 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest022 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0230
     * @tc.name: SensorGeomagenticAlgorithmJSTest023
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest023-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest023 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest023 success x: ' + data.x + ',y: ' + data.y
                    + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0240
     * @tc.name: SensorGeomagenticAlgorithmJSTest024
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest024-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest024 once success');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest024 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0250
     * @tc.name: SensorGeomagenticAlgorithmJSTest025
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest025-------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticAlgorithmJSTest025 once success');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticAlgorithmJSTest025 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0260
     * @tc.name: SensorGeomagenticAlgorithmJSTest026
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SensorGeomagenticAlgorithmJSTest026-------------------------");
        for (let i = 0; i < timeMillis.length; i++) {
            await sensor.getGeomagneticField({ 'latitude': 80, 'longitude': 0, 'altitude': 0 },
                timeMillis[i]).then((data) => {
                console.info('SensorGeomagenticAlgorithmJSTest026 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                + ',totalIntensity: ' + data.totalIntensity);
                expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][0]) < EPS).assertTrue()
                expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][1]) < EPS).assertTrue()
                expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][2]) < EPS).assertTrue()
                expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][3]) < EPS).assertTrue()
                expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][4]) < EPS).assertTrue()
                expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][5]) < EPS).assertTrue()
                expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][6]) < EPS).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            })
        }
        done()
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0270
     * @tc.name: SensorGeomagenticAlgorithmJSTest027
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest027------------------');
        let geomagneticComponent = [-1417119616, 23146989568, -6406359552, -15.442885398864746,
        93.50342559814453, 23190329344, 24058943488, -1417119360, 23146989568, -6406359552, -15.442885398864746,
        93.50342559814453, 23190329344, 24058943488]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 },
            9223372036854775807).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest027 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
			expect((Math.abs(data.x - geomagneticComponent[0]) < EPS) 
			|| (Math.abs(data.x - geomagneticComponent[7]) < EPS)).assertTrue();
			expect((Math.abs(data.y - geomagneticComponent[1]) < EPS) 
			|| (Math.abs(data.y - geomagneticComponent[8]) < EPS)).assertTrue();	
			expect((Math.abs(data.z - geomagneticComponent[2]) < EPS) 
			|| (Math.abs(data.z - geomagneticComponent[9]) < EPS)).assertTrue();	
			expect((Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS) 
			|| (Math.abs(data.geomagneticDip - geomagneticComponent[10]) < EPS)).assertTrue();	
			expect((Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS) 
			|| (Math.abs(data.deflectionAngle - geomagneticComponent[11]) < EPS)).assertTrue();	
			expect((Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS) 
			|| (Math.abs(data.levelIntensity - geomagneticComponent[12]) < EPS)).assertTrue();	
			expect((Math.abs(data.totalIntensity - geomagneticComponent[6]) < EPS) 
			|| (Math.abs(data.totalIntensity - geomagneticComponent[13]) < EPS)).assertTrue();	
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })
	
    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0280
     * @tc.name: SensorGeomagenticAlgorithmJSTest028
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest028------------------');
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773,
        -12.610970497131348, 28465.9765625, 32141.2109375]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 },
            Number.MIN_VALUE).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest028 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
            expect(Math.abs(data.y - geomagneticComponent[1]) < EPS).assertTrue()
            expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
            expect(Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS).assertTrue()
            expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
            expect(Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS).assertTrue()
            expect(Math.abs(data.totalIntensity - geomagneticComponent[6]) < EPS).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0290
     * @tc.name: SensorGeomagenticAlgorithmJSTest029
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest029------------------');
        let geomagneticComponent = [1824.141845703125, 2.9950538714314696e+33, 56727.7734375, 1.0852099087396978e-27,
		90, 2.9950538714314696e+33, Infinity]
        await sensor.getGeomagneticField({ 'latitude': Number.MAX_VALUE, 'longitude': 0, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest029 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
            expect(Math.abs((data.y - geomagneticComponent[1]) / 1.0e+33) < EPS).assertTrue()
            expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
            expect(Math.abs((data.geomagneticDip - geomagneticComponent[3]) / 1.0e-27) < EPS).assertTrue()
            expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
            expect(Math.abs((data.levelIntensity - geomagneticComponent[5]) / 1.0e+33) < EPS).assertTrue()
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0300
     * @tc.name: SensorGeomagenticAlgorithmJSTest030
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest030------------------');
		let geomagneticComponent = [1824.141845703125, 2.9950538714314696e+33, 56727.7734375, 1.0852099087396978e-27,
		90, 2.9950538714314696e+33, Infinity]
        await sensor.getGeomagneticField({ 'latitude': Number.NaN, 'longitude': 0, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest030 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
            expect(Math.abs((data.y - geomagneticComponent[1]) / 1.0e+33) < EPS).assertTrue()
            expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
            expect(Math.abs((data.geomagneticDip - geomagneticComponent[3]) / 1.0e-27) < EPS).assertTrue()
            expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
            expect(Math.abs((data.levelIntensity - geomagneticComponent[5]) / 1.0e+33) < EPS).assertTrue()
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /**
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0310
     * @tc.name: SensorGeomagenticAlgorithmJSTest031
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest031------------------');
        let geomagneticComponent = [14425.57421875, -4.4076765967073136e+35, -52023.21484375, -6.76254414480036e-30,
		-90, 4.4076765967073136e+35, Infinity]
        await sensor.getGeomagneticField({ 'latitude': Number.NEGATIVE_INFINITY, 'longitude': 0, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest031 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
            expect(Math.abs((data.y - geomagneticComponent[1]) / 1.0e+35) < EPS).assertTrue()
            expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
            expect(Math.abs((data.geomagneticDip - geomagneticComponent[3]) / 1.0e-30) < EPS).assertTrue()
            expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
            expect(Math.abs((data.levelIntensity - geomagneticComponent[5]) / 1.0e+35) < EPS).assertTrue()
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0320
     * @tc.name: SensorGeomagenticAlgorithmJSTest032
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest032------------------');
        let geomagneticComponent = [NaN, NaN, NaN]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest032 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0330
     * @tc.name: SensorGeomagenticAlgorithmJSTest033
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest033------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest033 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0340
     * @tc.name: SensorGeomagenticAlgorithmJSTest034
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest034------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest034 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0350
     * @tc.name: SensorGeomagenticAlgorithmJSTest035
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest035------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest035 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0360
     * @tc.name: SensorGeomagenticAlgorithmJSTest036
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest036------------------');
        let geomagneticComponent = [27536.40234375, -2248.586669921875, -16022.4306640625, -30.110872268676758,
        -4.66834020614624, 27628.05859375, 31937.875]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MIN_VALUE },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest036 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
            expect(Math.abs(data.y - geomagneticComponent[1]) < EPS).assertTrue()
            expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
            expect(Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS).assertTrue()
            expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
            expect(Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS).assertTrue()
            expect(Math.abs(data.totalIntensity - geomagneticComponent[6]) < EPS).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0370
     * @tc.name: SensorGeomagenticAlgorithmJSTest037
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest037------------------start');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest037 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0380
     * @tc.name: SensorGeomagenticAlgorithmJSTest038
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest038------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest038 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0390
     * @tc.name: SensorGeomagenticAlgorithmJSTest039
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        for (let i = 0; i < timeMillis.length; i++) {
            console.info('------------------SensorGeomagenticAlgorithmJSTest039------------------');
            await sensor.getGeomagneticField({ 'latitude': 80, 'longitude': 0, 'altitude': 0 },
                timeMillis[i]).then((data) => {
                console.info('SensorGeomagenticAlgorithmJSTest039 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                + ',totalIntensity: ' + data.totalIntensity);
                expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][0]) < EPS).assertTrue()
                expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][1]) < EPS).assertTrue()
                expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][2]) < EPS).assertTrue()
                expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][3]) < EPS).assertTrue()
                expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][4]) < EPS).assertTrue()
                expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][5]) < EPS).assertTrue()
                expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][6]) < EPS).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        }
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0400
     * @tc.name: SensorGeomagenticAlgorithmJSTest040
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest040------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest040 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0410
     * @tc.name: SensorGeomagenticAlgorithmJSTest041
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest041------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest041 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0420
     * @tc.name: SensorGeomagenticAlgorithmJSTest042
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest042 max ------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest042 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0430
     * @tc.name: SensorGeomagenticAlgorithmJSTest043
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest043------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest043 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0440
     * @tc.name: SensorGeomagenticAlgorithmJSTest044
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest044------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest044 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error)
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0450
     * @tc.name: SensorGeomagenticAlgorithmJSTest045
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SensorGeomagenticAlgorithmJSTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest045------------------');
        for (let i = 0; i < GEOMAGNETIC_COORDINATES.length; i++) {
            await sensor.getGeomagneticField({
                'latitude': GEOMAGNETIC_COORDINATES[i][0],
                'longitude': GEOMAGNETIC_COORDINATES[i][1], 'altitude': GEOMAGNETIC_COORDINATES[i][2]
            },
                timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticAlgorithmJSTest045 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                + ',totalIntensity: ' + data.totalIntensity)
                expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][0]) < EPS).assertTrue()
                expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][1]) < EPS).assertTrue()
                expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][2]) < EPS).assertTrue()
                expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][3]) < EPS).assertTrue()
                expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][4]) < EPS).assertTrue()
                expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][5]) < EPS).assertTrue()
                expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][6]) < EPS).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        }
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0460
     * @tc.name: SensorGeomagenticAlgorithmJSTest046
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest046------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest046 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue();
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0470
     * @tc.name: SensorGeomagenticAlgorithmJSTest047
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest047------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest047 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0480
     * @tc.name: SensorGeomagenticAlgorithmJSTest048
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest048------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest048 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0490
     * @tc.name: SensorGeomagenticAlgorithmJSTest049
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest049------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest049 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0500
     * @tc.name: SensorGeomagenticAlgorithmJSTest050
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest050------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest050 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })

    /*
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0510
     * @tc.name: SensorGeomagenticAlgorithmJSTest051
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorGeomagenticAlgorithmJSTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('------------------SensorGeomagenticAlgorithmJSTest051------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0]).then((data) => {
            console.info('SensorGeomagenticAlgorithmJSTest051 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
            + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
            + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("promise::catch", error);
        });
        done()
    })
})
}
