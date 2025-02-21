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

export default function SensorJsTest_sensor_60() {
describe("SensorJsTest_sensor_60", function () {

    beforeAll(function() {
		
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll caled')
    })
    
    afterAll(function() {
		
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll caled')
    })
    
    beforeEach(function() {
		
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach caled')
    })
    
    afterEach(function() {
		
         /*
         * @tc.teardown: teardown invoked after each testcases
         */
         console.info('afterEach caled')
    })

    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'

    let GEOMAGNETIC_COMPONENT_YEAR_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875, 55000.0703125],
        [6554.17041015625, -87.19947052001953, 54649.078125, -0.7622424364089966, 83.16046905517578, 6554.75048828125, 55040.7734375],
        [6537.99169921875, -28.231582641601562, 54692.02734375, -0.24740631878376007, 83.18303680419922, 6538.052734375, 55081.4296875],
        [6521.81201171875, 30.73670768737793, 54734.97265625, 0.2700277864933014, 83.20502471923828, 6521.88427734375, 55122.15625],
        [6505.6328125, 89.70511627197266, 54777.90625, 0.7899921536445618, 83.22642517089844, 6506.2509765625, 55162.9453125]]

    let GEOMAGNETIC_COMPONENT_COORDINATES_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875, 55000.0703125],
        [39624.28125, 109.8766098022461, -10932.4638671875, 0.15887857973575592, -15.424291610717773, 39624.43359375, 41104.921875],
        [37636.72265625, 104.90892791748047, -10474.810546875, 0.15970633924007416, -15.552550315856934, 37636.8671875, 39067.3203125],
        [5940.583984375, 15772.0927734375, -52480.7578125, 69.36103820800781, -72.19599914550781, 16853.765625, 55120.58984375],
        [5744.87255859375, 14799.48046875, -49969.40234375, 68.78474426269531, -72.37483215332031, 15875.3955078125, 52430.61328125]]

    let GEOMAGNETIC_COORDINATES = [[80, 0, 0],
                                   [0, 120, 0],
                                   [0, 120, 100000],
                                   [-80, 240, 0],
                                   [-80, 240, 100000]]

    let timeMillis = [1580486400000, 1612108800000, 1643644800000, 1675180800000, 1706716800000]

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0520
    */
    it('Sensor_GetGeomagneticInfo_001', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_001----------------------------------");
        let  promiseArray = []
        for (let i = 0; i < timeMillis.length; i++) {
            promiseArray.push(new Promise((resolve, reject) => {
                let j = i
                sensor.getGeomagneticInfo({'latitude':80, 'longitude':0, 'altitude':0}, timeMillis[j], (error, data) => {
                    if (error) {
                        console.info('Sensor_GetGeomagneticInfo_001 failed');
                        expect(false).assertTrue();
                        setTimeout(() =>{
                            reject()
                        }, 500)
                    } else {
                        console.info('Sensor_GetGeomagneticInfo_001 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                        expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][0])
                        expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][1])
                        expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][2])
                        expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][3])
                        expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][4])
                        expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][5])
                        expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][6])
                        setTimeout(() =>{
                            resolve()
                        }, 500)
                    }
                })
            }))
        }
        Promise.all(promiseArray).then(done)
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0530
    */
    it('Sensor_GetGeomagneticInfo_002', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_002----------------------------------");
        let  promiseArray = []
        for (let i = 0; i < GEOMAGNETIC_COORDINATES.length; i++) {
            promiseArray.push(new Promise((resolve, reject) => {
                let j = i
                sensor.getGeomagneticInfo({'latitude':GEOMAGNETIC_COORDINATES[j][0], 'longitude':GEOMAGNETIC_COORDINATES[j][1],
				'altitude':GEOMAGNETIC_COORDINATES[j][2]}, timeMillis[0], (error, data) => {
                    if (error) {
                        console.info('Sensor_GetGeomagneticInfo_002 failed');
                        expect(false).assertTrue();
                        setTimeout(() =>{
                            reject()
                        }, 500)
                    } else {
                        console.info('Sensor_GetGeomagneticInfo_002 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                        expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][0])
                        expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][1])
                        expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][2])
                        expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][3])
                        expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][4])
                        expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][5])
                        expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][6])
                        setTimeout(() =>{
                            resolve()
                        }, 500)
                    }
                })
            }))
        }
        Promise.all(promiseArray).then(done)
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0540
    */
    it('Sensor_GetGeomagneticInfo_003', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_003----------------------------------");
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125,
            -27.667943954467773, -12.610970497131348, 28465.9765625, 32141.2109375]
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':0}, Number.MIN_VALUE, (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_003 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_003 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0550
    */
    it('Sensor_GetGeomagneticInfo_004', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_004----------------------------------");
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422, 3.6568238735198975, 1827.8634033203125, 56757.21484375]
        sensor.getGeomagneticInfo({'latitude':Number.MAX_VALUE, 'longitude':0, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_004 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_004 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0560
    */
    it('Sensor_GetGeomagneticInfo_005', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_005----------------------------------");
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422, 3.6568238735198975, 1827.8634033203125, 56757.21484375]
        sensor.getGeomagneticInfo({'latitude':Number.NaN, 'longitude':0, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_005 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_005 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0570
    */
    it('Sensor_GetGeomagneticInfo_006', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_006----------------------------------");
        let geomagneticComponent = [14425.57421875, -17156.767578125, -52023.21484375, -66.69005584716797, -49.94255447387695, 22415.4375, 56646.859375]
        sensor.getGeomagneticInfo({'latitude':Number.NEGATIVE_INFINITY, 'longitude':0, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_006 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_006 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0580
    */
    it('Sensor_GetGeomagneticInfo_007', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_007----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.MAX_VALUE, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_007 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_007 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue();
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0590
    */
    it('Sensor_GetGeomagneticInfo_008', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_008----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NaN, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_008 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_008 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0600
    */
    it('Sensor_GetGeomagneticInfo_009', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_009----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NEGATIVE_INFINITY, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_009 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_009 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0610
    */
    it('Sensor_GetGeomagneticInfo_010', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_010----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MAX_VALUE}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_010 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_010 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

     /*
     * @tc.name:Sensor_GetGeomagneticInfo_011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0620
     */
    it('Sensor_GetGeomagneticInfo_011', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_011----------------------------------");
        let geomagneticComponent = [27536.40234375, -2248.586669921875, -16022.4306640625, -30.110872268676758, -4.66834020614624, 27628.05859375, 31937.875]
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MIN_VALUE}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_011 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_011 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_012
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0630
    */
    it('Sensor_GetGeomagneticInfo_012', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_012----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NaN}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_012 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_012 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_013
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0640
    */
    it('Sensor_GetGeomagneticInfo_013', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_013----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_013 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_013 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_014
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0650
    */
    it('Sensor_GetGeomagneticInfo_014', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_014----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NaN, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_014 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_014 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_015
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0660
    */
    it('Sensor_GetGeomagneticInfo_015', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_015----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NEGATIVE_INFINITY, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_015 once success');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_015 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_016
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0670
    */
    it('Sensor_GetGeomagneticInfo_016', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_016----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MAX_VALUE}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_016 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_016 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_017
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0680
    */
    it('Sensor_GetGeomagneticInfo_017', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_017----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NaN}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_017 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_017 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_018
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0690
    */
    it('Sensor_GetGeomagneticInfo_018', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_018----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_018 failed');
                expect(false).assertfalse();
            } else {
                console.info('Sensor_GetGeomagneticInfo_018 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_019
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0700
    */
    it('Sensor_GetGeomagneticInfo_019', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_019----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.MAX_VALUE, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_019 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_019 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue();
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_020
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0710
    */
    it('Sensor_GetGeomagneticInfo_020', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_020----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NaN, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_020 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_020 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_021
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0720
    */
    it('Sensor_GetGeomagneticInfo_021', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_021----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NEGATIVE_INFINITY, 'altitude':0}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_021 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_021 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_022
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0730
    */
    it('Sensor_GetGeomagneticInfo_022', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_022----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MAX_VALUE}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_022 failed');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_022 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_023
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0740
    */
    it('Sensor_GetGeomagneticInfo_023', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_023----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NaN}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_023 once success');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_023 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_024
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0750
    */
    it('Sensor_GetGeomagneticInfo_024', 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_024----------------------------------");
        sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticInfo_024 once success');
                expect(false).assertTrue();
            } else {
                console.info('Sensor_GetGeomagneticInfo_024 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }
            setTimeout(() =>{
                done()
            }, 500)
        })
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_025
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0760
    */
    it("Sensor_GetGeomagneticInfo_025", 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_025----------------------------------");
        for (var i = 0; i < timeMillis.length; i++) {
            await sensor.getGeomagneticInfo({'latitude':80, 'longitude':0, 'altitude':0}, timeMillis[i]).then((data) => {
                console.info('Sensor_GetGeomagneticInfo_025 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity);
                expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0])
                expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1])
                expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2])
                expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3])
                expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4])
                expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5])
                expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6])
            }).catch((error) => {
                console.info("Sensor_GetGeomagneticInfo_025 promise::catch" + error);
            })
        }
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_026
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0770
    */
    it("Sensor_GetGeomagneticInfo_026", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_026---------------------------');
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773, -12.610970497131348, 28465.9765625, 32141.2109375]
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':0}, Number.MIN_VALUE).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_026 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(data.x).assertEqual(geomagneticComponent[0])
            expect(data.y).assertEqual(geomagneticComponent[1])
            expect(data.z).assertEqual(geomagneticComponent[2])
            expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
            expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
            expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_026 promise::catch" + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_027
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0780
    */
    it("Sensor_GetGeomagneticInfo_027", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_027---------------------------');
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422, 3.6568238735198975, 1827.8634033203125, 56757.21484375]
        await sensor.getGeomagneticInfo({'latitude':Number.MAX_VALUE, 'longitude':0, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_027 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(data.x).assertEqual(geomagneticComponent[0])
            expect(data.y).assertEqual(geomagneticComponent[1])
            expect(data.z).assertEqual(geomagneticComponent[2])
            expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
            expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
            expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_027 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_028
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0790
    */
    it("Sensor_GetGeomagneticInfo_028", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_028---------------------------');
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422, 3.6568238735198975, 1827.8634033203125, 56757.21484375]
        await sensor.getGeomagneticInfo({'latitude':Number.NaN, 'longitude':0, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_028 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(data.x).assertEqual(geomagneticComponent[0])
            expect(data.y).assertEqual(geomagneticComponent[1])
            expect(data.z).assertEqual(geomagneticComponent[2])
            expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
            expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
            expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_028 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_029
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0800
    */
    it("Sensor_GetGeomagneticInfo_029", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_029---------------------------');
        let geomagneticComponent = [14425.57421875, -17156.767578125, -52023.21484375, -66.69005584716797, -49.94255447387695, 22415.4375, 56646.859375]
        await sensor.getGeomagneticInfo({'latitude':Number.NEGATIVE_INFINITY, 'longitude':0, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_029 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(data.x).assertEqual(geomagneticComponent[0])
            expect(data.y).assertEqual(geomagneticComponent[1])
            expect(data.z).assertEqual(geomagneticComponent[2])
            expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
            expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
            expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_029 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_030
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0810
    */
    it("Sensor_GetGeomagneticInfo_030", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_030---------------------------');
        let geomagneticComponent = [NaN, NaN, NaN]
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.MAX_VALUE, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_030 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_030 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_031
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0820
    */
    it("Sensor_GetGeomagneticInfo_031", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_031---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NaN, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_031 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_031 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_032
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0830
    */
    it("Sensor_GetGeomagneticInfo_032", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_032---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NEGATIVE_INFINITY, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_032 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_032 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_033
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0840
    */
    it("Sensor_GetGeomagneticInfo_033", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_033---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MAX_VALUE}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_033 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_033 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_034
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0850
    */
    it("Sensor_GetGeomagneticInfo_034", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_034---------------------------');
        let geomagneticComponent = [27536.40234375, -2248.586669921875, -16022.4306640625, -30.110872268676758, -4.66834020614624, 27628.05859375, 31937.875]
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MIN_VALUE}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_034 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(data.x).assertEqual(geomagneticComponent[0])
            expect(data.y).assertEqual(geomagneticComponent[1])
            expect(data.z).assertEqual(geomagneticComponent[2])
            expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
            expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
            expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
            expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_034 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_035
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0860
    */
    it("Sensor_GetGeomagneticInfo_035", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_035---------------------------start');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NaN}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_035 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_035 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_036
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0870
    */
    it("Sensor_GetGeomagneticInfo_036", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_036---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_036 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_036 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_037
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0880
    */
    it('Sensor_GetGeomagneticInfo_037', 0, async function (done) {
        for (var i = 0; i < timeMillis.length; i++) {
            console.info('----------------------Sensor_GetGeomagneticInfo_037---------------------------');
            await sensor.getGeomagneticInfo({'latitude':80, 'longitude':0, 'altitude':0}, timeMillis[i]).then((data) => {
               console.info('Sensor_GetGeomagneticInfo_037 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
               + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity);
               expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0])
               expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1])
               expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2])
               expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3])
               expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4])
               expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5])
               expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6])
            }).catch((error) => {
               console.info("Sensor_GetGeomagneticInfo_037 promise::catch" + error)
            });
        }
        done()
   })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_038
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0890
    */
    it("Sensor_GetGeomagneticInfo_038", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_038---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NaN, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_038 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_038 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_039
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0900
    */
    it("Sensor_GetGeomagneticInfo_039", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_039---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NEGATIVE_INFINITY, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_039 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_039 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_040
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0910
    */
    it("Sensor_GetGeomagneticInfo_040", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_040 max ---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MAX_VALUE}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_040 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_040 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_041
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0920
    */
    it("Sensor_GetGeomagneticInfo_041", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_041---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NaN}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_041 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_041 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_042
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0930
    */
    it("Sensor_GetGeomagneticInfo_042", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_042---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_042 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_042 promise::catch" + error)
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_043
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0940
    */
   it('Sensor_GetGeomagneticInfo_043', 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_043---------------------------');
       for (var i = 0; i < GEOMAGNETIC_COORDINATES.length; i++) {
            await sensor.getGeomagneticInfo({'latitude':GEOMAGNETIC_COORDINATES[i][0], 'longitude':GEOMAGNETIC_COORDINATES[i][1], 
			'altitude':GEOMAGNETIC_COORDINATES[i][2]}, timeMillis[0]).then((data) => {
               console.info('Sensor_GetGeomagneticInfo_043 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
               + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
               expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][0])
               expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][1])
               expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][2])
               expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][3])
               expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][4])
               expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][5])
               expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][6])
           }).catch((error) => {
               console.info("Sensor_GetGeomagneticInfo_043 promise::catch" + error);
           });
       }
       done()
   })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_044
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0950
    */
    it("Sensor_GetGeomagneticInfo_044", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_044---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.MAX_VALUE, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_044 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue();
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_044 promise::catch" + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_045
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0960
    */
    it("Sensor_GetGeomagneticInfo_045", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_045---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NaN, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_045 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_045 promise::catch" + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_046
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0970
    */
    it("Sensor_GetGeomagneticInfo_046", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_046---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':Number.NEGATIVE_INFINITY, 'altitude':0}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_046 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_046 promise::catch" + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_047
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0980
    */
    it("Sensor_GetGeomagneticInfo_047", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_047---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.MAX_VALUE}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_047 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_047 promise::catch" + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_048
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_0990
    */
    it("Sensor_GetGeomagneticInfo_048", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_048---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NaN}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_048 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_048 promise::catch" + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_049
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1000
    */
    it("Sensor_GetGeomagneticInfo_049", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_049---------------------------');
        await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0]).then((data) => {
            console.info('Sensor_GetGeomagneticInfo_049 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
            expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
        }).catch((error) => {
            console.info("Sensor_GetGeomagneticInfo_049 promise::catch", + error);
        });
        done()
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_050
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1010
    */
    it("Sensor_GetGeomagneticInfo_050", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_050---------------------------');
        try {
            await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}).then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_050 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_051
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1020
    */
    it("Sensor_GetGeomagneticInfo_051", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_051---------------------------');
        try {
            await sensor.getGeomagneticInfo(-1, timeMillis[0]).then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_051 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_052
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1030
    */
    it("Sensor_GetGeomagneticInfo_052", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_052---------------------------');
        try {
            await sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, 'invalid').then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_052 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_053
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1040
    */
    it("Sensor_GetGeomagneticInfo_053", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_053---------------------------');
        try {
            await sensor.getGeomagneticInfo({'invalid':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0]).then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_053 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_054
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1050
    */
    it("Sensor_GetGeomagneticInfo_054", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_054---------------------------');
        try {
            sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, (err, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_054 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_055
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1060
    */
    it("Sensor_GetGeomagneticInfo_055", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_055---------------------------');
        try {
            await sensor.getGeomagneticInfo(-1, timeMillis[0], (err, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_055 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_056
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1070
    */
    it("Sensor_GetGeomagneticInfo_056", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_056---------------------------');
        try {
            sensor.getGeomagneticInfo({'latitude':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, 'invalid', (err, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_056 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetGeomagneticInfo_057
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1080
    */
    it("Sensor_GetGeomagneticInfo_057", 0, async function (done) {
        console.info('----------------------Sensor_GetGeomagneticInfo_057---------------------------');
        try {
            sensor.getGeomagneticInfo({'invalid':0, 'longitude':0, 'altitude':Number.NEGATIVE_INFINITY}, timeMillis[0], (err, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(err) {
			console.info("Sensor_GetGeomagneticInfo_057 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    var SENSOR_DATA_MATRIX = [
        {
            "rotation": [-0.7980074882507324, 0.5486301183700562, 0.24937734007835388, -0.17277367413043976,
                -0.6047078967094421, 0.7774815559387207, 0.5773502588272095, 0.5773502588272095,0.5773502588272095],
            "inclination":[1, 0, 0, 0, 0.20444221794605255,0.9788785576820374, 0, -0.9788785576820374, 0.20444221794605255]
        },
        {
            "rotation": [-0.8206444382667542, 0.3832680284976959, 0.42384934425354004, 0.021023601293563843,
                -0.7209705710411072,0.6926466822624207, 0.5710522532463074,0.57732754945755,0.5836028456687927],
            "inclination":[1, 0, 0, 0, 0.2584352493286133,0.9660285115242004, 0, -0.9660285115242004, 0.2584352493286133]
        },
        {
            "rotation": [0.9583651423454285, 0.08038506656885147, -0.27399733662605286, 0.160231813788414,
                -0.9456362724304199, 0.2830156981945038, -0.23635157942771912, -0.3151354491710663, -0.9191450476646423],
            "inclination":[1, 0, 0, 0, 0.34239840507507324, 0.9395548701286316, 0, -0.9395548701286316, 0.34239840507507324]
        },
        {
            "rotation":[null, null, null, null, null, null, null, null, null],
            "inclination":[1, 0, 0, 0, null, null, 0, null ,null]
        },
        {
            "rotation":[null, null, null, null, null, null,0, 0, 0],
            "inclination":[1, 0, 0, 0, null, 0, 0, 0, null]
        }
    ]

    let GET_DIRECTION = [
        [ 0.38050639629364014, -0.9783217310905457, -0.6610431671142578],
        [-2.7610862255096436, 1.5018651485443115, 2.987273931503296],
        [0.32175055146217346, -1.006853699684143, -0.6857295036315918],
        [1.3332617282867432, -1.5440233945846558, -0.6627295017242432],
        [NaN, NaN, NaN],
        [0.7853981852531433, -0.6154797077178955, -0.7853981852531433],
        [0.7853981852531433, -0.7853981852531433, -0.7853981852531433],
        [0.785398, -0.615480, -0.785398],
        [0.785398, -0.785398, -0.785398]
    ]

    let rotationMatrix = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9],
        [-1, -2, -3, -4, -5, -6, -7, -78, -45],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
        [11111111, 21111111, 31111111, 4111111, 5111111, 61111111, 71111111, 811111111, 91111111],
        [NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN],
        [3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
        [3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39],
        [3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
        [3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39]
    ]

    let gravity = [
        [9, 9, 9], [91, 92, 93], [-9, -12, -35], [NaN, NaN, NaN], [3.40282e+38, 3.40282e+38, 3.40282e+38], [3.40282e+39, 3.40282e+39, 3.40282e+39]
    ]
    let geomagnetic = [
        [30, 25, 41], [3, 2, 4], [-123, -456, -564], [3.40282e+38, 3.40282e+38, 3.40282e+38], [NaN, NaN, NaN]
    ]

    /*
    * @tc.name:Sensor_CreateRotationMatrix_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1090
    */
     it('Sensor_CreateRotationMatrix_001', 0, async function (done) {
        sensor.getRotationMatrix(gravity[0], geomagnetic[0], (error,data)=>{
            if (error) {
                console.info('Sensor_CreateRotationMatrix_001 failed');
                expect(false).assertTrue();
            } else {
                console.info("Sensor_CreateRotationMatrix_001" + JSON.stringify(data))
                expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[0]))
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1100
    */
    it('Sensor_CreateRotationMatrix_002', 0, async function (done) {
        sensor.getRotationMatrix(gravity[2],geomagnetic[2],(error,data)=>{
            if (error) {
                console.info('Sensor_CreateRotationMatrix_002 failed');
                expect(false).assertTrue();
            } else {
                console.info("Sensor_CreateRotationMatrix_002" + JSON.stringify(data))
                expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[2]))
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1110
    */
     it('Sensor_CreateRotationMatrix_003', 0, async function (done) {
        sensor.getRotationMatrix(gravity[0],geomagnetic[0]).then((data) => {
            console.info("Sensor_CreateRotationMatrix_003" + JSON.stringify(data))
            expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[0]))
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1120
    */
    it('Sensor_CreateRotationMatrix_004', 0, async function (done) {
        sensor.getRotationMatrix(gravity[1],geomagnetic[1]).then((data) => {
            console.info("Sensor_CreateRotationMatrix_004" + JSON.stringify(data))
            expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[1]))
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1130
    */
    it('Sensor_CreateRotationMatrix_005', 0, async function (done) {
        sensor.getRotationMatrix(gravity[2],geomagnetic[2]).then((data) => {
            console.info("Sensor_CreateRotationMatrix_005" + JSON.stringify(data))
            expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[2]))
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1140
    */
     it('Sensor_CreateRotationMatrix_006', 0, async function (done) {
        try {
            sensor.getRotationMatrix()
        } catch (err) {
			console.info("Sensor_CreateRotationMatrix_006 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1150
    */
     it('Sensor_CreateRotationMatrix_007', 0, async function (done) {
        try {
            sensor.getRotationMatrix(-1)
        } catch (err) {
			console.info("Sensor_CreateRotationMatrix_007 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1160
    */
     it('Sensor_CreateRotationMatrix_008', 0, async function (done) {
        try {
            sensor.getRotationMatrix(gravity[2], -1)
        } catch (err) {
			console.info("Sensor_CreateRotationMatrix_008 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1170
    */
     it('Sensor_CreateRotationMatrix_009', 0, async function (done) {
        try {
            sensor.getRotationMatrix().then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(true).assertfalse()
                done()
            })
        } catch (err) {
			console.info("Sensor_CreateRotationMatrix_009 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1180
    */
    it('Sensor_CreateRotationMatrix_010', 0, async function (done) {
        try {
            sensor.getRotationMatrix(-1).then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(true).assertfalse()
                done()
            })
        } catch (err) {
			console.info("Sensor_CreateRotationMatrix_010 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_011
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1190
    */
     it('Sensor_CreateRotationMatrix_011', 0, async function (done) {
        try {
            sensor.getRotationMatrix(gravity[2], -1).then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(true).assertfalse()
                done()
            })
        } catch (err) {
			console.info("Sensor_CreateRotationMatrix_011 catch error " + err);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(err.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    let createRotationMatrixResult = [
        [0.6724675297737122,-0.10471208393573761,0.7326819896697998,0.06531608104705811,0.9944750070571899,
            0.08217836916446686,-0.7372390031814575,-0.007406365126371384,0.6755914688110352],
        [1,0,0,0,1,0,0,0,1]
        ]
		
    /*
    * @tc.name:Sensor_CreateRotationMatrix_012
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1200
    */
    it('Sensor_CreateRotationMatrix_012', 0, async function (done) {
        console.info("Sensor_CreateRotationMatrix_012 start");
        sensor.getRotationMatrix([-0.0245, 0.402, 0.0465], (error, data) =>{
            console.info("Sensor_CreateRotationMatrix_012");
            if (error) {
                console.info('Sensor_CreateRotationMatrix_012 failed');
                expect(false).assertTrue();
            } else {
                for(var i = 0;i < data.length; i++) {
                    console.info("Sensor_CreateRotationMatrix_012 [" + i + ") = " + data[i]);
                    expect(data[i]).assertEqual(createRotationMatrixResult[0][i])
                }
            }
            done()
        })
        console.info("Sensor_CreateRotationMatrix_012 end");
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_013
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1210
    */
    it('Sensor_CreateRotationMatrix_013', 0,async function (done) {
        console.info('Sensor_CreateRotationMatrix_013 start')
        sensor.getRotationMatrix([-0.0245, 0.402, 0.0465]).then((data) => {
            for(var i = 0;i < data.length; i++) {
                console.info("Sensor_CreateRotationMatrix_013 [" + i + "] : " + data[i]);
                expect(data[i]).assertEqual(createRotationMatrixResult[0][i])
            }
            done()
        },(error) => {
            console.info('Sensor_CreateRotationMatrix_013 promise failed' + error)			
            expect(false).assertTrue();
            done()
        })
        console.info( "Sensor_CreateRotationMatrix_013 end")
    })

    /*
    * @tc.name:Sensor_CreateRotationMatrix_014
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1220
    */
    it('Sensor_CreateRotationMatrix_014', 0,async function (done) {
        console.info('Sensor_CreateRotationMatrix_014 start')
        sensor.getRotationMatrix([0, 0, 0]).then((data) => {
            for(var i = 0;i < data.length; i++) {
                console.info("Sensor_CreateRotationMatrix_014 [" + i + "] : " + data[i]);
                expect(data[i]).assertEqual(createRotationMatrixResult[1][i])
            }
            done()
        }, (error) => {
			console.info('Sensor_CreateRotationMatrix_014 promise failed' + error)
            expect(false).assertTrue();
            done()
        })
        console.info( "Sensor_CreateRotationMatrix_014 end")
    })

     /*
     * @tc.name:Sensor_GetDirection_001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1230
     */
    it('Sensor_GetDirection_001', 0, async function (done) {
        sensor.getOrientation(rotationMatrix[0],(error,data)=>{
            if (error) {
                console.info('Sensor_GetDirection_001 failed');
                expect(false).assertTrue();
            } else {
                for (var i = 1; i < data.length; i++) {
                    console.info("Sensor_GetDirection_001" + data[i])
                    expect(data[i]).assertEqual(GET_DIRECTION[0][i])
                }
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetDirection_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1240
    */
    it('Sensor_GetDirection_002', 0, async function (done) {
        sensor.getOrientation(rotationMatrix[1],function(error,data){
            if (error) {
                console.info('Sensor_GetDirection_002 failed');
                expect(false).assertTrue();
            } else {
                for (var i = 1; i < data.length; i++) {
                    console.info("Sensor_GetDirection_002" + data[i])
                    expect(data[i]).assertEqual(GET_DIRECTION[1][i])
                }
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetDirection_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1250
    */
    it('Sensor_GetDirection_003', 0, async function (done) {
        sensor.getOrientation(rotationMatrix[0]).then((data) => {
            for (var i = 0; i<data.length; i++) {
                console.info("Sensor_GetDirection_003" + data[i])
                expect(data[i]).assertEqual(GET_DIRECTION[0][i])
            }
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetDirection_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1260
    */
    it('Sensor_GetDirection_004', 0, async function (done) {
        sensor.getOrientation(rotationMatrix[1]).then((data) => {
            for (var i = 0; i<data.length; i++) {
                console.info("Sensor_GetDirection_004" + data[i])
                expect(data[i]).assertEqual(GET_DIRECTION[1][i])
            }
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetDirection_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1270
    */
    it('Sensor_GetDirection_005', 0, async function (done) {
        try  {
            sensor.getOrientation([1,2,3,1,2,3,1,2,3,0]).then((data) => {
                for (var i = 0; i<data.length; i++) {
                    console.info("Sensor_GetDirection_005 failed")
                    expect(false).assertTrue();
                }
                done()
            }, (error) =>{
                expect(false).assertTrue();
                console.info("Sensor_GetDirection_005 success")
                done()
            })
        } catch (error) {
			console.info("Sensor_GetDirection_005 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

     /*
     * @tc.name:Sensor_GetDirection_006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1280
     */
     it('Sensor_GetDirection_006', 0, async function (done) {
        try {
            sensor.getRotationMatrix()
        } catch (error) {
			console.info("Sensor_GetDirection_006 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

     /*
     * @tc.name:Sensor_GetDirection_007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1290
     */
     it('Sensor_GetDirection_007', 0, async function (done) {
        try {
            sensor.getRotationMatrix(-1)
        } catch (error) {
			console.info("Sensor_GetDirection_007 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

     /*
     * @tc.name:Sensor_GetDirection_008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1300
     */
     it('Sensor_GetDirection_008', 0, async function (done) {
        try {
            sensor.getRotationMatrix(rotationMatrix[1], -1)
        } catch (error) {
			console.info("Sensor_GetDirection_008 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

     /*
     * @tc.name:Sensor_GetDirection_009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1310
     */
     it('Sensor_GetDirection_009', 0, async function (done) {
        try {
            sensor.getRotationMatrix().then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(true).assertfalse()
                done()
            })
        } catch (error) {
			console.info("Sensor_GetDirection_009 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

     /*
     * @tc.name:Sensor_GetDirection_010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1320
     */
    it('Sensor_GetDirection_010', 0, async function (done) {
        try {
            sensor.getRotationMatrix(-1).then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(true).assertfalse()
                done()
            })
        } catch (error) {
			console.info("Sensor_GetDirection_010 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

     /*
     * @tc.name:Sensor_GetDirection_011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1330
     */
     it('Sensor_GetDirection_011', 0, async function (done) {
        try {
            sensor.getRotationMatrix(rotationMatrix[1], -1).then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(true).assertfalse()
                done()
            })
        } catch (error) {
			console.info("Sensor_GetDirection_011 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    let ANGLECHANGE_9_RESULT = [
        [0.7853981852531433, NaN, -0.32175055146217346],  //123123123
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE
        [0.0, -0.0, -0.0],                                //FLOAT.MINVALUE
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE+1
        ];

    /*
    * @tc.name:Sensor_GetAngleModify_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1340
    */
    it('Sensor_GetAngleModify_001', 0, async function (done) {
        console.info("SensorJsAPI--->Sensor_GetAngleModify_001");
        sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], [2,2,2,2,2,2,2,2,2], function(error, data) {
            if (error) {
                console.info('Sensor_GetAngleModify_001 failed');
                expect(false).assertTrue();
            } else {
                for(var i = 0; i < data.length; i++) {
                    console.info("Sensor_GetAngleModify_001 [" + i + "] = " + data[i]);
                    expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]) && expect(Number.isNaN(data[1])).assertTrue() &&
                    expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
                }
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1350
    */
    it('Sensor_GetAngleModify_002', 0, async function (done) {
        console.info("Sensor_GetAngleModify_002");
        sensor.getAngleVariation([3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
            [3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
            function(error, data) {
                if (error) {
                    console.info('Sensor_GetAngleModify_002 failed');
                    expect(false).assertTrue();
                } else {
                    for(var i = 0; i < data.length; i++) {
                        console.info("Sensor_GetAngleModify_002 [" + i + "] = " + data[i]);
                        expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[1][0]) && expect(Number.isNaN(data[1])).assertTrue() &&
                        expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[1][2]);
                    }
                }
                done()
            })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1360
    */
    it('Sensor_GetAngleModify_003', 0, async function (done) {
        console.info("Sensor_GetAngleModify_003 in");
        sensor.getAngleVariation([1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38],
            [1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38],
            function(error, data) {
                if (error) {
                    console.info('Sensor_GetAngleModify_003 failed');
                    expect(false).assertTrue();
                } else {
                    for(var i = 0; i < data.length; i++) {
                        console.info("Sensor_GetAngleModify_003 [" + i + "] = " + data[i]);
                        expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[2][0])
                        && expect(data[1]).assertEqual(ANGLECHANGE_9_RESULT[2][1])
                        && expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[2][2]);
                    }
                }
                done()
            });
    })

    /*
    * @tc.name:Sensor_GetAngleModify_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1370
    */
    it('Sensor_GetAngleModify_004', 0, async function (done) {
        console.info("Sensor_GetAngleModify_004");
        sensor.getAngleVariation([3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1],
            [3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1, 3.40282e+38+1],
            function(error, data) {
                if (error) {
                    console.info('Sensor_GetAngleModify_004 failed');
                    expect(false).assertTrue();
                } else {
                    for(var i = 0; i < data.length; i++) {
                        console.info("Sensor_GetAngleModify_004 [" + i + "] = " + data[i]);
                        expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[3][0]) && expect(Number.isNaN(data[1])).assertTrue() && expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[3][2]);
                    }
                }
                done()
            });
    })

    /*
    * @tc.name:Sensor_GetAngleModify_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1380
    */
    it('Sensor_GetAngleModify_005', 0, async function (done) {
        console.info("Sensor_GetAngleModify_005 in");
        sensor.getAngleVariation([0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
            [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
            function(error, data) {
                if (error) {
                    console.info('Sensor_GetAngleModify_005 failed');
                    expect(false).assertTrue();
                } else {
                    for(var i = 0; i < data.length; i++) {
                        console.info("Sensor_GetAngleModify_005 [" + i + "] = " + data[i]);
                        expect(Number.isNaN(data[0]) && Number.isNaN(data[1]) && Number.isNaN(data[2])).assertTrue();
                    }
                }
                done()
            });
    })

    /*
    * @tc.name:Sensor_GetAngleModify_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1390
    */
    it('Sensor_GetAngleModify_006', 0, async function (done) {
        console.info("Sensor_GetAngleModify_006 in");
        sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], [2,2,2,2,2,2,2,2,2]).then((data) => {
            for(var i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_006 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]) && expect(Number.isNaN(data[1])).assertTrue() &&
                expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
            }
            done();
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1400
    */
    it('Sensor_GetAngleModify_007', 0, async function (done) {
        console.info("Sensor_GetAngleModify_007 in");
        sensor.getAngleVariation([3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
            [3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38]).then((data) => {
            for(var i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_007 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[1][0]) && expect(Number.isNaN(data[1])).assertTrue() && expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[1][2]);
            }
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1410
    */
    it('Sensor_GetAngleModify_008', 0, async function (done) {
        console.info("Sensor_GetAngleModify_008 in");
        sensor.getAngleVariation([1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38],
            [1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38, 1.17549e-38]).then((data) => {
            for(var i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_008 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[2][0])
                && expect(data[1]).assertEqual(ANGLECHANGE_9_RESULT[2][1])
                && expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[2][2]);
            }
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1420
    */
    it('Sensor_GetAngleModify_009', 0, async function (done) {
        console.info("Sensor_GetAngleModify_009 in");
        sensor.getAngleVariation([3.40282e+38 + 1,3.40282e+38 + 1,3.40282e+38 + 1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1],
            [3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1,3.40282e+38+1])
        .then((data) => {
            for(var i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_009 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[3][0]) && expect(Number.isNaN(data[1])).assertTrue() && expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[3][2]);
            }
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1430
    */
    it('Sensor_GetAngleModify_010', 0, async function (done) {
        console.info("Sensor_GetAngleModify_010 in");
        sensor.getAngleVariation([0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
            [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0]).then((data) => {
            for(var i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_010 [" + i + "] = " + data[i]);
                expect(Number.isNaN(data[0]) && Number.isNaN(data[1]) && Number.isNaN(data[2])).assertTrue();
            }
            done()
        }, (error) =>{
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_GetAngleModify_011
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1440
    */
    it("Sensor_GetAngleModify_011", 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_011---------------------------');
        try {
            await sensor.getAngleVariation([1,2,3,1,2,3,1,2,3]).then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(error) {
			console.info("Sensor_GetAngleModify_011 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetAngleModify_012
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1450
    */
    it("Sensor_GetAngleModify_012", 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_012---------------------------');
        try {
            await sensor.getAngleVariation(-1, [2,2,2,2,2,2,2,2,2]).then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(error) {
			console.info("Sensor_GetAngleModify_012 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetAngleModify_013
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1460
    */
    it("Sensor_GetAngleModify_013", 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_013---------------------------');
        try {
            await sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], 'invalid').then((data) => {
                expect(true).assertfalse()
            }).catch((error) => {
                expect(true).assertfalse()
            });
            done()
        } catch(error) {
			console.info("Sensor_GetAngleModify_013 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetAngleModify_014
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1470
    */
    it("Sensor_GetAngleModify_014", 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_014---------------------------');
        try {
            sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], (error, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(error) {
			console.info("Sensor_GetAngleModify_014 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetAngleModify_015
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1480
    */
    it("Sensor_GetAngleModify_015", 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_015---------------------------');
        try {
            await sensor.getAngleVariation(-1, [2,2,2,2,2,2,2,2,2], (error, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(error) {
			console.info("Sensor_GetAngleModify_015 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_GetAngleModify_016
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1490
    */
    it("Sensor_GetAngleModify_016", 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_016---------------------------');
        try {
            sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], 'invalid', (error, data) => {
                expect(false).assertTrue()
                setTimeout(() =>{
                    done()
                }, 500)
            });
        } catch(error) {
			console.info("Sensor_GetAngleModify_016 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    var result = [
        [0.7441122531890869, 0.5199999809265137, -0.335999995470047, -0.25099998712539673],
        [0, 3.402820018375656e+38, 3.402820018375656e+38, 3.402820018375656e+38],
        [1, 0, 0, 0],
        [0.7183529734611511, -0.32499998807907104, -0.5619999766349792, -0.25],
        [0, 0, 0, 0]
    ]

    /*
    * @tc.name:Sensor_CreateQuaterniont_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1500
    */
    it('Sensor_CreateQuaterniont_001', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_001 start')
        sensor.getQuaternion([0.52, -0.336, -0.251], (error, data) =>{
            console.info('Sensor_CreateQuaterniont_001' + 'lengh:' + data.length);
            if (error) {
                console.info('Sensor_CreateQuaterniont_001 failed');
                expect(false).assertTrue();
            } else {
                for (var i = 0; i < data.length; i++) {
                    console.info("data[" + i + "]: " + data[i])
                    expect(data[i]).assertEqual(result[0][i])
                }
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1510
    */
    it('Sensor_CreateQuaterniont_002', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_002 start')
        sensor.getQuaternion([3.40282e+38, 3.40282e+38, 3.40282e+38], (error, data) =>{
            if (error) {
                console.info('Sensor_CreateQuaterniont_002 failed');
                expect(false).assertTrue();
            } else {
                for (var i = 0; i < data.length; i++) {
                    console.info("data[" + i + "]: " + data[i])
                    expect(data[i]).assertEqual(result[1][i])
                }
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1520
    */
    it('Sensor_CreateQuaterniont_003', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_003 start')
        sensor.getQuaternion([0, 0, 0], (error, data) =>{
            if (error) {
                console.info('Sensor_CreateQuaterniont_003 failed');
                expect(false).assertTrue();
            } else {
                for (var i = 0; i < data.length; i++) {
                    console.info("data[" + i + "]: " + data[i])
                    expect(data[i]).assertEqual(result[2][i])
                }
            }
            done()
        })
        console.info("Sensor_CreateQuaterniont_003 end")
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1530
    */
    it('Sensor_CreateQuaterniont_004', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_004 start')
        sensor.getQuaternion([-0.325, -0.562, -0.25], (error, data) =>{
            if (error) {
                console.info('Sensor_CreateQuaterniont_004 failed');
                expect(false).assertTrue();
            } else {
                for (var i = 0; i < data.length; i++) {
                    console.info("data[" + i + "]: " + data[i])
                    expect(data[i]).assertEqual(result[3][i])
            }
            }
            done()
        })
        console.info("Sensor_CreateQuaterniont_004 end")
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1540
    */
    it('Sensor_CreateQuaterniont_005', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_005 start')
        try {
            sensor.getQuaternion([0.25, 0.14], (error, data) =>{
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                done()
            })
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_005 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
        console.info("Sensor_CreateQuaterniont_005 end")
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1550
    */
    it('Sensor_CreateQuaterniont_006', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_006 start')
        sensor.getQuaternion([0.52, -0.336, -0.251]).then((data) => {
            console.info('Sensor_CreateQuaterniont_006');
            for (var i = 0; i < data.length; i++) {
                console.info("data[" + i + "]: " + data[i]);
                expect(data[i]).assertEqual(result[0][i])
            }
            done()
        }, (error) => {
			console.info("Sensor_CreateQuaterniont_006 promise failed error:" + error);
            expect(false).assertTrue();
            done()
        })
        console.info("Sensor_CreateQuaterniont_006 end")
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1560
    */
    it('Sensor_CreateQuaterniont_007', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_007 start')
        try {
            sensor.getQuaternion([0, 0]).then((data) => {
                console.info('Sensor_CreateQuaterniont_007');
                expect(false).assertTrue();
                done()
            }, (error) => {
                expect(false).assertTrue();
                console.info('promise failed')
                done()
            })
        } catch (error) {
			console.info('Sensor_CreateQuaterniont_007 catch error' + error)
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
        console.info("Sensor_CreateQuaterniont_007 end")
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1570
    */
    it('Sensor_CreateQuaterniont_008', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_008 start')
        sensor.getQuaternion([0, 0, 0]).then((data) => {
            console.info('Sensor_CreateQuaterniont_008---------------in-----------');
            for (var i = 0; i < data.length; i++) {
                console.info("data[" + i + "]: " + data[i]);
                expect(data[i]).assertEqual(result[2][i])
            }
            done()
        }, (error) => {
            console.info('Sensor_CreateQuaterniont_008 promise failed')            
			expect(false).assertTrue();
            done()
        })
        console.info("Sensor_CreateQuaterniont_008 end")
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1580
    */
    it('Sensor_CreateQuaterniont_009', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_009 start')
        sensor.getQuaternion([-0.325, -0.562, -0.25]).then((data) => {
            console.info('Sensor_CreateQuaterniont_009');
            for (var i = 0; i < data.length; i++) {
                console.info("data[" + i + "]: " + data[i]);
                expect(data[i]).assertEqual(result[3][i])
            }
            done()
        },(error) => {
            console.info('Sensor_CreateQuaterniont_009 promise failed')
			expect(false).assertTrue();
            done()
        })
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1590
    */
    it('Sensor_CreateQuaterniont_010', 0,async function (done) {
        console.info('Sensor_CreateQuaterniont_010 start')
        try {
            sensor.getQuaternion([0.25, 0.14]).then((data) => {
                console.info('Sensor_CreateQuaterniont_010');
                expect(false).assertTrue();
                done()
            },(error) => {
                expect(false).assertTrue();
                console.info('promise failed')
                done()
            })
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_010 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_011
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1600
    */
     it('Sensor_CreateQuaterniont_011', 0, async function (done) {
        try {
            sensor.createQuaternion()
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_011 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_012
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1610
    */
     it('Sensor_CreateQuaterniont_012', 0, async function (done) {
        try {
            sensor.createQuaternion(-1)
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_012 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_013
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1620
    */
     it('Sensor_CreateQuaterniont_013', 0, async function (done) {
        try {
            sensor.createQuaternion([0.52, -0.336, -0.251], -1)
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_013 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_014
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1630
    */
     it('Sensor_CreateQuaterniont_014', 0, async function (done) {
        try {
            sensor.createQuaternion().then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(false).assertfalse()
                done()
            })
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_014 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_015
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1640
    */
    it('Sensor_CreateQuaterniont_015', 0, async function (done) {
        try {
            sensor.createQuaternion(-1).then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(false).assertfalse()
                done()
            })
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_015 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    /*
    * @tc.name:Sensor_CreateQuaterniont_016
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1650
    */
     it('Sensor_CreateQuaterniont_016', 0, async function (done) {
        try {
            sensor.createQuaternion([0.52, -0.336, -0.251], -1).then((data) => {
                expect(true).assertfalse()
                done()
            }, (error) =>{
                expect(false).assertfalse()
                done()
            })
        } catch (error) {
			console.info("Sensor_CreateQuaterniont_016 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
    })

    var getGeomagneticDipResult = [ 0.8760581016540527, 0.862170, -Infinity, 44330]

    /*
    * @tc.name:Sensor_GetGeomagneticDip_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1660
    */
    it('Sensor_GetGeomagneticDip_001', 0, async function (done) {
        console.info('Sensor_GetGeomagneticDip_001 start')
        sensor.getInclination([1, 2, 3, 4, 5, 6, 7, 8, 9], (error, data) => {
            if (error) {
                console.info('Sensor_GetGeomagneticDip_001 failed');
                expect(false).assertTrue();
            } else {
               console.info("Sensor_GetGeomagneticDip_001" + data)
               expect(data).assertEqual(getGeomagneticDipResult[0])
            }
            console.info('Sensor_GetGeomagneticDip_001' + 'lengh:' + data.length);
			done()
        })
        console.info("Sensor_GetGeomagneticDip_001 end")
    })

    /*
    * @tc.name:Sensor_GetGeomagneticDip_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1670
    */
    it('Sensor_GetGeomagneticDip_002', 0, async function (done) {
        console.info('Sensor_GetGeomagneticDip_002 start')
        try {
            sensor.getInclination([1, 2, 3, 4], (error,data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                done()
            })
        } catch (error) {
			console.info("Sensor_GetGeomagneticDip_002 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done()
        }
        console.info("Sensor_GetGeomagneticDip_002 end")
    })

    /*
    * @tc.name:Sensor_GetGeomagneticDip_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1680
    */
    it('Sensor_GetGeomagneticDip_003', 0, async function (done) {
        console.info('Sensor_GetGeomagneticDip_003 start')
        try {
            sensor.getInclination()
        } catch(error) {
            console.info("Sensor_GetGeomagneticDip_003 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetGeomagneticDip_003 end")
    })

    /*
    * @tc.name:Sensor_GetGeomagneticDip_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1690
    */
    it('Sensor_GetGeomagneticDip_004', 0, async function (done) {
        console.info('Sensor_GetGeomagneticDip_004 start')
        try {
            sensor.getInclination(-1, (error, data) => {
                if (error) {
                    console.info('Sensor_GetGeomagneticDip_004 failed');
                    expect(false).assertTrue();
                } else {
                   console.info("Sensor_GetGeomagneticDip_004" + data)
                   expect(data).assertEqual(getGeomagneticDipResult[0])
                }
                done()
                console.info('Sensor_GetGeomagneticDip_004' + 'lengh:' + data.length);
            })
        } catch(error) {
            console.info("Sensor_GetGeomagneticDip_004 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetGeomagneticDip_004 end")
    })

    /*
    * @tc.name:Sensor_GetGeomagneticDip_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1700
    */
    it('Sensor_GetGeomagneticDip_005', 0, async function (done) {
        console.info('Sensor_GetGeomagneticDip_005 start')
        try {
            sensor.getInclination().then((data)=>{
                console.info("Sensor_GetGeomagneticDip_005" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_GetGeomagneticDip_005 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetGeomagneticDip_005 end")
    })

    /*
    * @tc.name:Sensor_GetGeomagneticDip_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1710
    */
    it('Sensor_GetGeomagneticDip_006', 0, async function (done) {
        console.info('Sensor_GetGeomagneticDip_006 start')
        try {
            sensor.getInclination(-1).then((data)=>{
                console.info("Sensor_GetGeomagneticDip_006" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_GetGeomagneticDip_006 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetGeomagneticDip_006 end")
    })

    /*
    * @tc.name:Sensor_GetAltitude_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1720
    */
    it('Sensor_GetAltitude_001', 0, async function (done) {
        console.info('Sensor_GetAltitude_001 start')
        sensor.getDeviceAltitude(0, 100, (error, data) => {
            if (error) {
                console.info('Sensor_GetAltitude_001 failed');
                expect(false).assertTrue();
            } else {
               console.info("Sensor_GetAltitude_001" + data)
               expect(data).assertEqual(getGeomagneticDipResult[2])
            }
            done()
            console.info("Sensor_GetAltitude_001 end")
        })
    })

    /*
    * @tc.name:Sensor_GetAltitude_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1730
    */
    it('Sensor_GetAltitude_002', 0, async function (done) {
        console.info('Sensor_GetAltitude_002 start')
        sensor.getDeviceAltitude(5, 0, (error, data) => {
            if (error) {
                console.info('Sensor_GetAltitude_002 failed');
                expect(false).assertTrue();
            } else {
               console.info("Sensor_GetAltitude_002" + data)
               expect(data).assertEqual(getGeomagneticDipResult[3])
            }
            done()
        })
        console.info("Sensor_GetAltitude_002 end")
    })

    /*
    * @tc.name:Sensor_GetAltitude_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1740
    */
    it('Sensor_GetAltitude_003', 0, async function (done) {
        sensor.getDeviceAltitude(0, 100).then((data)=>{
            console.info("Sensor_GetAltitude_003" + data)
            expect(data).assertEqual(getGeomagneticDipResult[2])
            done()
        }, (error)=>{
            console.info('Sensor_GetAltitude_003 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name:Sensor_GetAltitude_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1750
    */
    it('Sensor_GetAltitude_004', 0, async function (done) {
        sensor.getDeviceAltitude(5, 0).then((data)=>{
            console.info("Sensor_GetAltitude_004" + data)
            expect(data).assertEqual(getGeomagneticDipResult[3])
            done()
        }, (error)=>{
            console.info('Sensor_GetAltitude_004 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name:Sensor_GetAltitude_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1760
    */
    it('Sensor_GetAltitude_005', 0, async function (done) {
        console.info('Sensor_GetAltitude_005 start')
        try {
            sensor.getDeviceAltitude()
        } catch(error) {
            console.info("Sensor_GetAltitude_005 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetAltitude_005 end")
    })

    /*
    * @tc.name:Sensor_GetAltitude_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1770
    */
    it('Sensor_GetAltitude_006', 0, async function (done) {
        console.info('Sensor_GetAltitude_006 start')
        try {
            sensor.getDeviceAltitude("invalid", 0, (error, data) => {
                if (error) {
                    console.info('Sensor_GetAltitude_006 failed');
                    expect(false).assertTrue();
                } else {
                   console.info("Sensor_GetAltitude_006" + data)
                   expect(data).assertEqual(getGeomagneticDipResult[0])
                }
                done()
                console.info('Sensor_GetAltitude_006' + 'lengh:' + data.length);
            })
        } catch(error) {
            console.info("Sensor_GetAltitude_006 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetGeomagneticDip_004 end")
    })

    /*
    * @tc.name:Sensor_GetAltitude_007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1780
    */
    it('Sensor_GetAltitude_007', 0, async function (done) {
        console.info('Sensor_GetAltitude_007 start')
        try {
            sensor.getDeviceAltitude().then((data)=>{
                console.info("Sensor_GetAltitude_007" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_GetAltitude_007 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetAltitude_007 end")
    })

    /*
    * @tc.name:Sensor_GetAltitude_008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1790
    */
    it('Sensor_GetAltitude_008', 0, async function (done) {
        console.info('Sensor_GetAltitude_008 start')
        try {
            sensor.getDeviceAltitude("invalid", 0).then((data)=>{
                console.info("Sensor_GetAltitude_008" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_GetAltitude_008 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetAltitude_008 end")
    })

    let transformCoordinateSystemResult = [
    [1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000],
    [340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
     340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
     340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000],
     [Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity]]

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1800
    */
     it('Sensor_TransformCoordinateSystem_001', 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_001----------------------------------");
        sensor.transformRotationMatrix([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {'x':1, 'y':2}, (error, data) => {
            if (error) {
                console.info('Sensor_TransformCoordinateSystem_001 failed');
                expect(false).assertTrue();
            } else {
                console.info("Sensor_TransformCoordinateSystem_001 " + JSON.stringify(data));
                expect(JSON.stringify(data)).assertEqual(JSON.stringify(transformCoordinateSystemResult[0]))
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1810
    */
    it('Sensor_TransformCoordinateSystem_002', 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_002----------------------------------");
        sensor.transformRotationMatrix([3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 
		3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38], {'x':1, 'y':2}, (error, data) => {
            if (error) {
                console.info('Sensor_TransformCoordinateSystem_002 failed');
                expect(false).assertTrue();
            } else {
                console.info("Sensor_TransformCoordinateSystem_002 " + JSON.stringify(data));
                expect(JSON.stringify(data)).assertEqual(JSON.stringify(transformCoordinateSystemResult[1]))
            }
            done()
        })
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1820
    */
    it("Sensor_TransformCoordinateSystem_003", 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_003----------------------------------");
        sensor.transformRotationMatrix([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {'x':1, 'y':2}).then((data) => {
            for (var i = 0; i < data.length; i++) {
                console.info("Sensor_TransformCoordinateSystem_003 data[ " + i + "] = " + data[i]);
                expect(data[i]).assertEqual(transformCoordinateSystemResult[0][i]);
            }
            done()
        }, (error)=>{
            console.info('Sensor_TransformCoordinateSystem_003 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1830
    */
    it("Sensor_TransformCoordinateSystem_004", 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_004----------------------------------");
        sensor.transformRotationMatrix([3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 
		3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39],{'x':1, 'y':3}).then((data) => {
            for (var i = 0; i < data.length; i++) {
                console.info("Sensor_TransformCoordinateSystem_004 data[ " + i + "] = " + data[i]);
                expect(data[i]).assertEqual(transformCoordinateSystemResult[2][i]);
            }
            done()
        }, (error)=>{
            console.info('Sensor_TransformCoordinateSystem_004 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1840
    */
    it('Sensor_TransformCoordinateSystem_005', 0, async function (done) {
        console.info('Sensor_TransformCoordinateSystem_005 start')
        try {
            sensor.transformRotationMatrix()
        } catch(error) {
            console.info("Sensor_TransformCoordinateSystem_005 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_TransformCoordinateSystem_005 end")
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1850
    */
    it('Sensor_TransformCoordinateSystem_006', 0, async function (done) {
        console.info('Sensor_TransformCoordinateSystem_006 start')
        try {
            sensor.transformRotationMatrix("invalid", 0, (error, data) => {
                if (error) {
                    console.info('Sensor_TransformCoordinateSystem_006 failed');
                    expect(false).assertTrue();
                } else {
                   console.info("Sensor_TransformCoordinateSystem_006" + data)
                   expect(data).assertEqual(getGeomagneticDipResult[0])
                }
                done()
            })
        } catch(error) {
            console.info("Sensor_TransformCoordinateSystem_006 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_GetGeomagneticDip_004 end")
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1860
    */
    it('Sensor_TransformCoordinateSystem_007', 0, async function (done) {
        console.info('Sensor_TransformCoordinateSystem_007 start')
        try {
            sensor.transformRotationMatrix().then((data)=>{
                console.info("Sensor_TransformCoordinateSystem_007" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_TransformCoordinateSystem_007 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_TransformCoordinateSystem_007 end")
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1870
    */
    it('Sensor_TransformCoordinateSystem_008', 0, async function (done) {
        console.info('Sensor_TransformCoordinateSystem_008 start')
        try {
            sensor.transformRotationMatrix("invalid", 0).then((data)=>{
                console.info("Sensor_TransformCoordinateSystem_008" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_TransformCoordinateSystem_008 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_TransformCoordinateSystem_008 end")
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1880
    */
    it('Sensor_TransformCoordinateSystem_009', 0, async function (done) {
        console.info('Sensor_TransformCoordinateSystem_008 start')
        try {
            sensor.transformRotationMatrix([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], 
			{'x':1, 'y':1}).then((data)=>{
                console.info("Sensor_TransformCoordinateSystem_009" + data)
                expect(true).assertfalse()
                done()
            }, (error)=>{
                expect(true).assertfalse()
                done()
            })
        } catch(error) {
            console.info("Sensor_TransformCoordinateSystem_009 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_TransformCoordinateSystem_009 end")
    })

    /*
    * @tc.name:Sensor_TransformCoordinateSystem_010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorsSystem_GeomagneticAlgorithm_JSTest_1890
    */
    it('Sensor_TransformCoordinateSystem_010', 0, async function (done) {
        console.info('Sensor_TransformCoordinateSystem_010 start')
        try {
            sensor.transformRotationMatrix([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
			{'x':1, 'y':1}, (error, data) => {
                if (error) {
                    console.info('Sensor_TransformCoordinateSystem_010 failed');
                    expect(false).assertTrue();
                } else {
                   console.info("Sensor_TransformCoordinateSystem_010" + data)
                   expect(data).assertEqual(getGeomagneticDipResult[0])
                }
                done()
            })
        } catch(error) {
            console.info("Sensor_TransformCoordinateSystem_010 catch error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        console.info("Sensor_TransformCoordinateSystem_010 end")
    })
})}