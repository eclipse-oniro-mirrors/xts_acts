/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import continuationManager from '@ohos.continuation.continuationManager';

const TEST_DEVICE_ID = "test_deviceId";
const TEST_CONNECT_STATUS = continuationManager.DeviceConnectState.CONNECTED;
let token = -1;
import featureAbility from '@ohos.ability.featureAbility';
import { UiDriver, BY } from '@ohos.UiTest'
import abilityConstant from '@ohos.app.ability.AbilityConstant'

export default function continuationManagerTest() {
    describe('continuationManagerTest', function () {

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function requestPermission() {
            try {
                let context = featureAbility.getContext();
                await context.requestPermissionsFromUser(['ohos.permission.DISTRIBUTED_DATASYNC'], 666, (data) => {
                    console.info('TestApplication requestPermission data: ' + JSON.stringify(data));
                });
            } catch (err) {
                console.error('TestApplication permission' + JSON.stringify(err));
            }
        }

        async function driveFn() {
            try {
                let driver = await UiDriver.create();
                console.info(`come in driveFn`);
                console.info(`driver is ${JSON.stringify(driver)}`);
                await sleep(1000);
                let button = await driver.findComponent(BY.text('允许'));
                console.info(`button is ${JSON.stringify(button)}`);
                await sleep(1000);
                await button.click();
            } catch (err) {
                console.info('err code is ' + err);
                return;
            }
        }

        beforeAll(async function (done) {
            console.info('beforeAll');
            await requestPermission();
            await sleep(1000);
            await driveFn();
            await sleep(1000);
            done();
        })

        afterAll(async function (done) {
            console.info('afterAll');
            done();
        })

        beforeEach(async function (done) {
            console.info('beforeEach');
            try {
                await continuationManager.registerContinuation().then((data) => {
                    token = data;
                    console.info('beforeEach registerContinuation success');
                    done();
                })
                    .catch((e) => {
                        console.info("beforeEach promise error: catch error is" + error);
                    });
            } catch (error) {
                console.info("beforeEach try error: catch error is" + error);
            }
            console.info('beforeEach end');
        })

        afterEach(async function (done) {
            console.info('afterEach');
            try {
                await continuationManager.unregisterContinuation(token).then((data) => {
                    console.info('afterEach unregisterContinuation success');
                })
                    .catch((e) => {
                        console.info("afterEach promise error: catch error is" + error);
                    });
            } catch (error) {
                console.info("afterEach try error: catch error is" + error);
            }
            done();
            console.info('afterEach end');
        })

        /*
        * @tc.number  SUM_DMS_AbilityConstant_0100
        * @tc.name    Test abilityConstant
        * @tc.desc    Function test
        * @tc.size    MediumTest
        * @tc.type:   Function
        * @tc.level   Level3
        */
        it('SUB_DMS_AbilityConstant_0100', 0, async (done) => {
            console.log("----------------------SUB_DMS_AbilityConstant_0100 start----------------------");
            try {
                console.log("--------------------PREPARE_CONTINUATION--------------------" + abilityConstant.LaunchReason.PREPARE_CONTINUATION);
                expect(10).assertEqual(abilityConstant.LaunchReason.PREPARE_CONTINUATION);
            } catch (error) {
                console.log("----------------------SUB_DMS_AbilityConstant_0100----------------------" + error);
            }
            console.log("----------------------SUB_DMS_AbilityConstant_0100 end----------------------");
            done();
        })

        /*
        * @tc.number  testRegister001
        * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
        * @tc.desc  Function test
        * @tc.size  MediumTest
        * @tc.type:  Function
        * @tc.level  Level0
        */
        it('testRegister001', 0, async function (done) {
            console.info("----------------------testRegister001 start----------------------");
            try {
                continuationManager.register(function (err, data) {
                    console.info("testRegister001 err is" + JSON.stringify(err));
                    console.info("testRegister001 data is" + data);
                    expect(err.code == 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister001 end----------------------");
        })

        /*
        * @tc.number  testRegister002
        * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
        * @tc.desc  Function test
        * @tc.size  MediumTest
        * @tc.type:  Function
        * @tc.level  Level0
        */
        it('testRegister002', 0, async function (done) {
            console.info("----------------------testRegister002 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: [],
                    targetBundle: "",
                    description: "",
                    filter: "",
                    continuationMode: null,
                    authInfo: {}
                };
                continuationManager.register(continuationExtraParams, function (err) {
                    console.info("testRegister002 err.message is" + err.message);
                    expect(err.message == "Invalidate params.").assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister002 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister002 end----------------------");
        })

        /*
         * @tc.number  testRegister003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister003', 0, async function (done) {
            console.info("----------------------testRegister003 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 10,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.register(continuationExtraParams, function (err) {
                    console.info("testRegister003 err is" + JSON.stringify(err));
                    expect(err.code == 29360216).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister003 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister003 end----------------------");
        })

        /*
         * @tc.number  testRegister004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister004', 0, async function (done) {
            console.info("----------------------testRegister004 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.register(continuationExtraParams, function (err) {
                    console.info("testRegister004 err is" + JSON.stringify(err));
                    expect(err.code == 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister004 end----------------------");
        })

        /*
         * @tc.number  testRegister005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister005', 0, async function (done) {
            console.info("----------------------testRegister005 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.register(continuationExtraParams, function (err, data) {
                    console.info("testRegister005 err.code is" + err.code);
                    console.info("testRegister005 data is" + data);
                    expect(err.code == 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister005 end----------------------");
        })

        /*
         * @tc.number  testRegister006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister006', 0, async function (done) {
            console.info("----------------------testRegister006 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.register(continuationExtraParams).then((data) => {
                    console.info("testRegister006 data is" + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("testRegister006 err is" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testRegister006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister006 end----------------------");
        })


        /*
         * @tc.number  testRegister007
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister007', 0, async function (done) {
            console.info("----------------------testRegister007 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.register(continuationExtraParams).then((data) => {
                    console.log('testRegister007 data is' + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testRegister007 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testRegister007 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister007 end----------------------");
        })

        /*
         * @tc.number  testRegister008
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister008', 0, async function (done) {
            console.info("----------------------testRegister008 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: [],
                    description: "",
                    filter: "",
                    continuationMode: null,
                    authInfo: {}
                };
                continuationManager.register(continuationExtraParams).then((data) => {
                    console.log('testRegister008 data is' + data)
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testRegister008 err code is' + err.code)
                    expect(err.code == -1).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister008 catch error is" + error);
                expect(null).assertFail();
                done()
            }
            console.info("----------------------testRegister008 end----------------------");
        })

        /*
         * @tc.number  testRegister009
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister009', 0, async function (done) {
            console.info("----------------------testRegister009 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 10,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.register(continuationExtraParams).then((data) => {
                    console.log('testRegister009 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testRegister009 err code is' + err.code);
                    expect(err.code == 29360216).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister009 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister009 end----------------------");
        })

        /*
         * @tc.number  testRegister010
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister010', 0, async function (done) {
            console.info("----------------------testRegister010 start----------------------");
            try {
                continuationManager.register({
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 10,
                    authInfo: { "name": "authInfo", "length": 8 }
                }).then((data) => {
                    console.log('testRegister010 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testRegister010 err code is' + err.code);
                    expect(err.code == 29360216).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegister010 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister010 end----------------------");
        })

        /*
         * @tc.number  testRegister011
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegister011', 0, async function (done) {
            console.info("----------------------testRegister011 start----------------------");
            try {
                continuationManager.register().then((data) => {
                    console.log('testRegister010 data is' + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testRegister011 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testRegister011 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegister011 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation001', 0, async function (done) {
            console.info("----------------------testRegisterContinuation001 start----------------------");
            try {
                continuationManager.registerContinuation(function (err, data) {
                    console.info("testRegisterContinuation001 err is" + JSON.stringify(err));
                    console.info("testRegisterContinuation001 data is" + data);
                    expect(err.code == 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation001 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation002', 0, async function (done) {
            console.info("----------------------testRegisterContinuation002 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: [],
                    targetBundle: "",
                    description: "",
                    filter: "",
                    continuationMode: null,
                    authInfo: {}
                };
                continuationManager.registerContinuation(continuationExtraParams, function (err) {
                    console.info("testRegisterContinuation002 err is" + JSON.stringify(err));
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation002 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testRegisterContinuation002 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation003', 0, async function (done) {
            console.info("----------------------testRegisterContinuation003 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 10,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.registerContinuation(continuationExtraParams, function (err) {
                    console.info("testRegisterContinuation003 err is" + JSON.stringify(err));
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation003 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation003 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation004', 0, async function (done) {
            console.info("----------------------testRegisterContinuation004 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.registerContinuation(continuationExtraParams, function (err, data) {
                    console.info("testRegisterContinuation004 err is" + JSON.stringify(err));
                    console.info("testRegisterContinuation004 data is" + data);
                    expect(err.code == 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation004 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation005', 0, async function (done) {
            console.info("----------------------testRegisterContinuation005 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.registerContinuation(continuationExtraParams, function (err, data) {
                    console.info("testRegisterContinuation005 err is" + JSON.stringify(err));
                    console.info("testRegisterContinuation005 data is" + data);
                    expect(err.code == 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation005 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation006', 0, async function (done) {
            console.info("----------------------testRegisterContinuation006 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    targetBundle: "ohos.example.test",
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                    console.log('testRegisterContinuation006 data is' + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testRegisterContinuation006 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation006 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation007
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation007', 0, async function (done) {
            console.info("----------------------testRegisterContinuation007 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                    console.log('testRegisterContinuation007 data is' + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testRegisterContinuation007 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation007 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation007 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation008
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation008', 0, async function (done) {
            console.info("----------------------testRegisterContinuation008 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: [],
                    description: "",
                    filter: "",
                    continuationMode: null,
                    authInfo: {}
                };
                continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                    console.log('testRegisterContinuation008 data is' + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testRegisterContinuation008 err code is' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation008 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testRegisterContinuation008 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation009
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation009', 0, async function (done) {
            console.info("----------------------testRegisterContinuation009 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 10,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                    console.log('testRegisterContinuation009 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testRegisterContinuation009 err code is' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation009 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation009 end----------------------");
        })

        /*
         * @tc.number  testRegisterContinuation010
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testRegisterContinuation010', 0, async function (done) {
            console.info("----------------------testRegisterContinuation010 start----------------------");
            try {
                continuationManager.registerContinuation().then((data) => {
                    console.log('testRegisterContinuation010 data is' + data);
                    expect(data != -1).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testRegisterContinuation010 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testRegisterContinuation010 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testRegisterContinuation010 end----------------------");
        })

        /*
         * @tc.number  testUnregister001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregister001', 0, async function (done) {
            console.info("----------------------testUnregister001 start----------------------");
            try {
                continuationManager.unregister(token, function (err, data) {
                    console.info("testUnregister001 err is" + JSON.stringify(err));
                    console.info("testUnregister001 data is" + data);
                    if (err.code == 0) {
                        console.log("testUnregister001 err is" + JSON.stringify(err))
                        expect(err.code == 0).assertTrue();
                        done();
                    }
                    console.log("testUnregister001 data is" + data)
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregister001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregister001 end----------------------");
        })

        /*
        * @tc.number  testUnregister002
        * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
        * @tc.desc  Function test
        * @tc.size  MediumTest
        * @tc.type:  Function
        * @tc.level  Level0
        */
        it('testUnregister002', 0, async function (done) {
            console.info("----------------------testUnregister002 start----------------------");
            try {
                continuationManager.unregister(null, function (err, data) {
                    console.info("testUnregister002 err is" + JSON.stringify(err));
                    console.info("testUnregister002 data is" + data);
                    expect(err.message == "Invalidate params.").assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregister002 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregister002 end----------------------");
        })


        /*
         * @tc.number  testUnregister003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregister003', 0, async function (done) {
            console.info("----------------------testUnregister003 start----------------------");
            try {
                continuationManager.unregister(300, function (err, data) {
                    console.info("testUnregister003 err is" + JSON.stringify(err));
                    console.info("testUnregister003 data is" + data);
                    expect(err.code == 29360208).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregister003 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregister003 end----------------------");
        })

        /*
         * @tc.number  testUnregister004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregister004', 0, async function (done) {
            console.info("----------------------testUnregister004 start----------------------");
            try {
                continuationManager.unregister(300, function (err) {
                    console.info("testUnregister004 data is" + err.code);
                    expect(err.code == 29360208).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregister004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregister004 end----------------------");
        })

        /*
         * @tc.number  testUnregister005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregister005', 0, async function (done) {
            console.info("----------------------testUnregister005 start----------------------");
            try {
                continuationManager.unregister(token, function (err) {
                    console.info("testUnregister005 err.code is" + err.code);
                    expect(err.code == 0).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregister005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregister005 end----------------------");
        })

        /*
         * @tc.number  testUnregister006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregister006', 0, async function (done) {
            console.info("----------------------testUnregister006 start----------------------");
            try {
                continuationManager.unregister(token).then((data) => {
                    console.log('testUnregister006 data is' + data);
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testUnregister006 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testUnregister006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregister006 end----------------------");
        })

        /*
         * @tc.number  testUnregisterContinuation001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregisterContinuation001', 0, async function (done) {
            console.info("----------------------testUnregisterContinuation001 start----------------------");
            try {
                continuationManager.unregisterContinuation(token, function (err, data) {
                    console.info("testUnregisterContinuation001 err is" + JSON.stringify(err));
                    console.info("testUnregisterContinuation001 data is" + data);
                    expect(err.code == 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregisterContinuation001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregisterContinuation001 end----------------------");
        })

        /*
         * @tc.number  testUnregisterContinuation002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregisterContinuation002', 0, async function (done) {
            console.info("----------------------testUnregisterContinuation002 start----------------------");
            try {
                continuationManager.unregisterContinuation("invalid token", function (err, data) {
                    console.info("testUnregisterContinuation002 err is" + JSON.stringify(err));
                    console.info("testUnregisterContinuation002 data is" + data);
                    expect(err.code == 401).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregisterContinuation002 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testUnregisterContinuation002 end----------------------");
        })

        /*
         * @tc.number  testUnregisterContinuation003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregisterContinuation003', 0, async function (done) {
            console.info("----------------------testUnregisterContinuation003 start----------------------");
            try {
                continuationManager.unregisterContinuation(300, function (err, data) {
                    console.info("testUnregisterContinuation003 err is" + JSON.stringify(err));
                    console.info("testUnregisterContinuation003 data is" + data);
                    expect(err.code == 16600002).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregisterContinuation003 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregisterContinuation003 end----------------------");
        })

        /*
         * @tc.number  testUnregisterContinuation004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregisterContinuation004', 0, async function (done) {
            console.info("----------------------testUnregisterContinuation004 start----------------------");
            try {
                continuationManager.unregisterContinuation(300, function (err) {
                    console.info("testUnregisterContinuation004 err.code is" + err.code);
                    expect(err.code == 16600002).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregisterContinuation004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregisterContinuation004 end----------------------");
        })

        /*
         * @tc.number  testUnregisterContinuation005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregisterContinuation005', 0, async function (done) {
            console.info("----------------------testUnregisterContinuation005 start----------------------");
            try {
                continuationManager.unregisterContinuation(token, function (err) {
                    console.info("testUnregisterContinuation005 err.code is" + err.code);
                    expect(err.code == 0).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testUnregisterContinuation005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregisterContinuation005 end----------------------");
        })

        /*
         * @tc.number  testUnregisterContinuation006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUnregisterContinuation006', 0, async function (done) {
            console.info("----------------------testUnregisterContinuation006 start----------------------");
            try {
                continuationManager.unregisterContinuation(token).then((data) => {
                    console.info("testUnregisterContinuation006 " + JSON.stringify(data));
                    expect(data == null).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('testUnregisterContinuation006 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testUnregisterContinuation006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUnregisterContinuation006 end----------------------");
        })

        /*
         * @tc.number  testOn001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn001', 0, async function (done) {
            console.info("----------------------testOn001 start----------------------");
            try {
                continuationManager.on("deviceConnect", function (data) {
                    console.info("testOn001 data is" + data);
                    expect(data != null).assertFail();
                    done()
                });
            } catch (error) {
                console.info("testOn001 catch error is" + error);
                expect(error.toString().includes("must be 3")).assertTrue();
                done();
            }
            console.info("----------------------testOn001 end----------------------");
        })

        /*
         * @tc.number  testOn002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn002', 0, async function (done) {
            console.info("----------------------testOn002 start----------------------");
            try {
                continuationManager.on("deviceDisconnect", function (data) {
                    console.info("testOn002 data is" + data);
                    expect(data != null).assertFail();
                    done();
                });
            } catch (error) {
                console.info("testOn002 catch error is" + error);
                expect(error.toString().includes("must be 3")).assertTrue();
                done();
            }
            console.info("----------------------testOn002 end----------------------");
        })

        /*
         * @tc.number  testOn003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn003', 0, async function (done) {
            console.info("----------------------testOn003 start----------------------");
            try {
                continuationManager.on("deviceSelected", "invalid token", function (data) {
                    console.info("testOn003 data is" + data);
                    expect(data == undefined).assertTrue();
                    done();
                })
            } catch (error) {
                console.info("testOn003 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testOn003 end----------------------");
        })

        /*
         * @tc.number  testOn004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn004', 0, async function (done) {
            console.info("----------------------testOn004 start----------------------");
            try {
                continuationManager.on("deviceUnselected", "invalid token", function (data) {
                    console.info("testOn004 data is" + data);
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testOn004 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testOn004 end----------------------");
        })

        /*
         * @tc.number  testOn005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn005', 0, async function (done) {
            console.info("----------------------testOn005 start----------------------");
            try {
                continuationManager.on("deviceConnect", continuationManager.ContinuationResult, function (data) {
                    console.info("testOn005 data is" + data);
                    expect().assertFail();
                    done()
                });
            } catch (error) {
                console.info("testOn005 catch error is" + error);
                expect(error.toString().includes("Parameter error")).assertTrue();
                done();
            }
            console.info("----------------------testOn005 end----------------------");
        })

        /*
         * @tc.number  testOn006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn006', 0, async function (done) {
            console.info("----------------------testOn006 start----------------------");
            try {
                continuationManager.on("deviceSelected", token, (data) => {
                    console.info('testOn006  continuationManager.on success');
                    expect(data == undefined).assertTrue();
                    done()
                })
            } catch (error) {
                console.log("testOn006 catch error is" + error);
                expect().assertFail();
                done()
            }
            console.info("----------------------testOn006 end----------------------");
            done()
        })

        /*
         * @tc.number  testOn007
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn007', 0, async function (done) {
            console.info("----------------------testOn007 start----------------------");
            try {
                continuationManager.on("deviceUnselected", token, (data) => {
                    console.info('testOn006  continuationManager.on success');
                    expect(data == undefined).assertTrue();
                    done()
                })
            } catch (error) {
                console.log("testOn007 catch error is" + error);
                expect().assertFail();
                done()
            }
            console.info("----------------------testOn007 end----------------------");
            done()
        })

        /*
         * @tc.number  testOn008
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn008', 0, async function (done) {
            console.info("----------------------testOn008 start----------------------");
            try {
                continuationManager.on("deviceUnselected", (err) => {
                    console.info('testOn008 onDeviceSelected failed: ' + err.code);
                    expect().assertTrue();
                    done()
                })
            } catch (error) {
                console.info("testOn002 catch error is" + error);
                expect(error.toString().includes("must be 3")).assertTrue();
                done();
            }
            console.info("----------------------testOn008 end----------------------");
            done()
        })

        /*
         * @tc.number  testOn009
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOn009', 0, async function (done) {
            console.info("----------------------testOn009 start----------------------");
            try {
                continuationManager.on("deviceSelected", token, (data) => {
                    console.info('testOn009  continuationManager.on success');
                    expect().assertFail()
                })

                continuationManager.on("deviceSelected", token, (data) => {
                    console.info('testOn009  continuationManager.on success');
                    expect().assertFail()
                })
            } catch (error) {
                console.log("testOn009 catch error is" + error.code);
                expect(error.code == 16600004).assertTrue()
            }
            console.info("----------------------testOn009 end----------------------");
            done()
        })

        /*
        * @tc.number  testOn010
        * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
        * @tc.desc  Function test
        * @tc.size  MediumTest
        * @tc.type:  Function
        * @tc.level  Level0
        */
        it('testOn010', 0, async function (done) {
            console.info("----------------------testOn010 start----------------------");
            try {
                continuationManager.on("deviceUnselected", token, (data) => {
                    console.info('testOn010  continuationManager.on success');
                    expect().assertFail()
                })
                continuationManager.on("deviceUnselected", token, (data) => {
                    console.info('testOn010  continuationManager.on success');
                    expect().assertFail()
                })
            } catch (error) {
                console.log("testOn010 catch error is" + error.code);
                expect(error.code == 16600004).assertTrue()
            }
            console.info("----------------------testOn010 end----------------------");
            done()
        })

        /*
         * @tc.number  testOff001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOff001', 0, async function (done) {
            console.info("----------------------testOff001 start----------------------");
            try {
                continuationManager.off("deviceConnect", function (data) {
                    console.info("testOff001 data is" + data);
                    expect(data != null).assertFail();
                    done();
                });
            } catch (error) {
                console.info("testOff001 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testOff001 end----------------------");
        })

        /*
         * @tc.number  testOff002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOff002', 0, async function (done) {
            console.info("----------------------testOff002 start----------------------");
            try {
                continuationManager.off("deviceDisconnect", function (data) {
                    console.info("testOff002 data is" + data);
                    expect(data != null).assertFail();
                    done();
                });
            } catch (error) {
                console.info("testOff002 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testOff002 end----------------------");
        })

        /*
         * @tc.number  testOff003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOff003', 0, async function (done) {
            console.info("----------------------testOff003 start----------------------");
            try {
                continuationManager.off("deviceSelected", "invalid token");
                done();
            } catch (error) {
                console.info("testOff003 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testOff003 end----------------------");
        })

        /*
         * @tc.number  testOff004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOff004', 0, async function (done) {
            console.info("----------------------testOff004 start----------------------");
            try {
                continuationManager.off("deviceUnselected", "invalid token");
                done();
            } catch (error) {
                console.info("testOff004 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testOff004 end----------------------");
        })

        /*
         * @tc.number  testOff005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOff005', 0, async function (done) {
            console.info("----------------------testOff005 start----------------------");
            try {
                continuationManager.off("deviceSelected", token);
                console.log('testOff005 off failed');
                expect().assertFail()
                done()
            } catch (error) {
                console.log("testOff005 catch error is" + JSON.stringify(error));
                expect(error.code == 16600002).assertTrue()
                done();
            }
            console.info("----------------------testOff005 end----------------------");
            done()
        })

        /*
         * @tc.number  testOff006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testOff006', 0, async function (done) {
            console.info("----------------------testOff006 start----------------------");
            try {
                continuationManager.off("deviceUnselected", token);
                console.log('testOff006 off failed');
                expect().assertFail()
                done()
            } catch (error) {
                console.log("testOff006 catch error is" + error);
                expect(error.toString().includes("callback is not registered")).assertTrue();
                done();
            }
            console.info("----------------------testOff006 end----------------------");
            done()
        })

        /*
         * @tc.number  testStartDeviceManager001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager001', 0, async function (done) {
            console.info("----------------------testStartDeviceManager001 start----------------------");
            try {
                continuationManager.startDeviceManager(token, function (err, data) {
                    console.info("testStartDeviceManager001 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager001 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager001 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager002', 0, async function (done) {
            console.info("----------------------testStartDeviceManager002 start----------------------");
            try {
                continuationManager.startDeviceManager(null, function (err, data) {
                    console.info("testStartDeviceManager002 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager002 data is" + data);
                    expect(err.code == -1).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager002 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager002 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager003', 0, async function (done) {
            console.info("----------------------testStartDeviceManager003 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startDeviceManager(null, continuationExtraParams, function (err, data) {
                    console.info("testStartDeviceManager003 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager003 data is" + data);
                    if (err.code == -1) {
                        console.log('testStartDeviceManager003 err.code is' + err.code)
                        expect(err.code == -1).assertTrue();
                        done();
                    }
                    console.log('testStartDeviceManager003 data is' + data)
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager003 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager003 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager004', 0, async function (done) {
            console.info("----------------------testStartDeviceManager004 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startDeviceManager(52, continuationExtraParams, function (err, data) {
                    console.info("testStartDeviceManager004 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager004 data is" + data);
                    expect(err.code == 29360208).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager004 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager005', 0, async function (done) {
            console.info("----------------------testStartDeviceManager005 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 30,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                    console.info("testStartDeviceManager005 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager005 data is" + data);
                    expect(err.code == 29360216).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager005 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager006', 0, async function (done) {
            console.info("----------------------testStartDeviceManager006 start----------------------");
            try {
                let continuationExtraParams = {
                };
                continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                    console.info("testStartDeviceManager006 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager006 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager006 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager007
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager007', 0, async function (done) {
            console.info("----------------------testStartDeviceManager007 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                    console.info("testStartDeviceManager007 err is" + JSON.stringify(err));
                    console.info("testStartDeviceManager007 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager007 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager007 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager008
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager008', 0, async function (done) {
            console.info("----------------------testStartDeviceManager008 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startDeviceManager(token, continuationExtraParams).then((data) => {
                    console.log('testStartDeviceManager008 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testStartDeviceManager008 err code is' + err.code);
                    expect(err.code == 29360210).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager008 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager008 end----------------------");
        })

        /*
         * @tc.number  testStartDeviceManager009
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartDeviceManager009', 0, async function (done) {
            console.info("----------------------testStartDeviceManager009 start----------------------");
            try {
                continuationManager.startDeviceManager(token).then((data) => {
                    console.log('testStartDeviceManager009 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testStartDeviceManager009 err code is' + err.code);
                    expect(err.code == 29360210).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartDeviceManager009 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartDeviceManager009 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager001', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager001 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager(token, function (err, data) {
                    console.info("testStartContinuationDeviceManager001 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager001 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager001 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager002', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager002 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager("invalid token", function (err, data) {
                    console.info("testStartContinuationDeviceManager002 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager002 data is" + data);
                    expect(err.code == 401).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager002 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager002 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager003', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager003 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startContinuationDeviceManager("invalid token", continuationExtraParams, function (err, data) {
                    console.info("testStartContinuationDeviceManager003 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager003 data is" + data);
                    expect(err.code == 401).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager003 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager003 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager004', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager004 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startContinuationDeviceManager(52, continuationExtraParams, function (err, data) {
                    console.info("testStartContinuationDeviceManager004 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager004 data is" + data);
                    expect(err.code == 16600002).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager004 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager005', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager005 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: 30,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startContinuationDeviceManager(token, continuationExtraParams, function (err, data) {
                    console.info("testStartContinuationDeviceManager005 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager005 data is" + data);
                    expect(err.code == 401).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager005 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager006', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager006 start----------------------");
            try {
                let continuationExtraParams = {
                };
                continuationManager.startContinuationDeviceManager(token, continuationExtraParams, function (err, data) {
                    console.info("testStartContinuationDeviceManager006 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager006 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager006 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager007
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager007', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager007 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startContinuationDeviceManager(token, continuationExtraParams, function (err, data) {
                    console.info("testStartContinuationDeviceManager007 err is" + JSON.stringify(err));
                    console.info("testStartContinuationDeviceManager007 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager007 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager007 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager008
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager008', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager008 start----------------------");
            try {
                let continuationExtraParams = {
                    deviceType: ["00E"],
                    description: "description",
                    filter: { "name": "authInfo", "length": 8 },
                    continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                    authInfo: { "name": "authInfo", "length": 8 }
                };
                continuationManager.startContinuationDeviceManager(token, continuationExtraParams).then((data) => {
                    console.log('testStartContinuationDeviceManager008 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testStartContinuationDeviceManager008 err code is' + err.code);
                    expect(err.code == 16600002).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager008 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager008 end----------------------");
        })

        /*
         * @tc.number  testStartContinuationDeviceManager009
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testStartContinuationDeviceManager009', 0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager009 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager(token).then((data) => {
                    console.log('testStartContinuationDeviceManager009 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testStartContinuationDeviceManager009 err code is' + err.code);
                    expect(err.code == 16600002).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager009 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager009 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus001', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus001 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                    console.info("testUpdateConnectStatus001 err is" + JSON.stringify(err));
                    console.info("testUpdateConnectStatus001 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testUpdateConnectStatus001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus001 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus002', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus002 start----------------------");
            try {
                continuationManager.updateConnectStatus(null, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                    console.info("testUpdateConnectStatus002 err is" + JSON.stringify(err));
                    console.info("testUpdateConnectStatus002 data is" + data);
                    expect(err.code == -1).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testUpdateConnectStatus002 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus002 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus003', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus003 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, -2, function (err, data) {
                    console.info("testUpdateConnectStatus003 err is" + JSON.stringify(err));
                    console.info("testUpdateConnectStatus003 data is" + data);
                    expect(err.code == 29360215).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testUpdateConnectStatus003 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus003 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus004', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus004 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.IDLE).then((data) => {
                        console.log('testUpdateConnectStatus004 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus004 err code is' + err.code);
                        expect(err.code == 29360210).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus004 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus005', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus005 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.CONNECTING).then((data) => {
                        console.log('testUpdateConnectStatus005 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus005 err code is' + err.code);
                        expect(err.code == 29360210).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus005 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus006
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus006', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus006 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.DISCONNECTING).then((data) => {
                        console.log('testUpdateConnectStatus006 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus006 err code is' + err.code);
                        expect(err.code == 29360210).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus006 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus007
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus007', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus007 start----------------------");
            let token = -1;
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.DISCONNECTING).then((data) => {
                        console.log('testUpdateConnectStatus007 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus007 err code is' + err.code);
                        expect(err.code == 29360208).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus007 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus007 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus008
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus008', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus008 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.CONNECTED).then((data) => {
                        console.log('testUpdateConnectStatus008 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus008 err code is' + err.code);
                        expect(err.code == 29360210).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus008 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus008 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus009
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus009', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus009 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, continuationManager.DeviceConnectState.CONNECTED)
                    .then((data) => {
                        console.log('testUpdateConnectStatus009 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus009 err code is' + err.code);
                        expect(err.code == -1).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus009 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus009 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus010
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus010', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus010 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID)
                    .then((data) => {
                        console.log('testUpdateConnectStatus010 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus010 err code is' + err.code);
                        expect(err.code == -1).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus010 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus010 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus011
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus011', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus011 start----------------------");
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, continuationManager.DeviceConnectState.aaaa)
                    .then((data) => {
                        console.log('testUpdateConnectStatus011 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus011 err code is' + err.code);
                        expect(err.code == -1).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus011 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus011 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus012
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus012', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus012 start----------------------");
            let token = -1;
            try {
                continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, continuationManager.DeviceConnectState.CONNECTED)
                    .then((data) => {
                        console.log('testUpdateConnectStatus012 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus012 err code is' + err.code);
                        expect(err.code == 29360208).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus012 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus012 end----------------------");
        })

        /*
         * @tc.number  testUpdateConnectStatus013
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateConnectStatus013', 0, async function (done) {
            console.info("----------------------testUpdateConnectStatus013 start----------------------");
            try {
                continuationManager.updateConnectStatus(TEST_DEVICE_ID, continuationManager.DeviceConnectState.CONNECTED)
                    .then((data) => {
                        console.log('testUpdateConnectStatus013 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateConnectStatus013 err code is' + err.code);
                        expect(err.code == -1).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateConnectStatus013 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateConnectStatus013 end----------------------");
        })

        /*
         * @tc.number  testUpdateContinuationState001
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateContinuationState001', 0, async function (done) {
            console.info("----------------------testUpdateContinuationState001 start----------------------");
            try {
                continuationManager.updateContinuationState(token, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                    console.info("testUpdateContinuationState001 err is" + JSON.stringify(err));
                    console.info("testUpdateContinuationState001 data is" + data);
                    expect(err.code != 0).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testUpdateContinuationState001 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateContinuationState001 end----------------------");
        })

        /*
         * @tc.number  testUpdateContinuationState002
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateContinuationState002', 0, async function (done) {
            console.info("----------------------testUpdateContinuationState002 start----------------------");
            try {
                continuationManager.updateContinuationState("invalid token", TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                    console.info("testUpdateContinuationState002 err is" + JSON.stringify(err));
                    console.info("testUpdateContinuationState002 data is" + data);
                    expect(err.code == 401).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testUpdateContinuationState002 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testUpdateContinuationState002 end----------------------");
        })

        /*
         * @tc.number  testUpdateContinuationState003
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateContinuationState003', 0, async function (done) {
            console.info("----------------------testUpdateContinuationState003 start----------------------");
            try {
                continuationManager.updateContinuationState(token, TEST_DEVICE_ID, -2, function (err, data) {
                    console.info("testUpdateContinuationState003 err is" + JSON.stringify(err));
                    console.info("testUpdateContinuationState003 data is" + data);
                    expect(err.code == 401).assertTrue();
                    expect(data == undefined).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("testUpdateContinuationState003 catch error is" + error);
                expect(error.code == 401).assertTrue();
                done();
            }
            console.info("----------------------testUpdateContinuationState003 end----------------------");
        })

        /*
         * @tc.number  testUpdateContinuationState004
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateContinuationState004', 0, async function (done) {
            console.info("----------------------testUpdateContinuationState004 start----------------------");
            try {
                continuationManager.updateContinuationState(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.IDLE).then((data) => {
                        console.log('testUpdateContinuationState004 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateContinuationState004 err code is' + err.code);
                        expect(err.code == 16600002).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateContinuationState004 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateContinuationState004 end----------------------");
        })

        /*
         * @tc.number  testUpdateContinuationState005
         * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
         * @tc.desc  Function test
         * @tc.size  MediumTest
         * @tc.type:  Function
         * @tc.level  Level0
         */
        it('testUpdateContinuationState005', 0, async function (done) {
            console.info("----------------------testUpdateContinuationState005 start----------------------");
            try {
                continuationManager.updateContinuationState(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.CONNECTING).then((data) => {
                        console.log('testUpdateContinuationState005 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateContinuationState005 err code is' + err.code);
                        expect(err.code == 16600002).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateContinuationState005 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateContinuationState005 end----------------------");
        })

        /*
        * @tc.number  testUpdateContinuationState006
        * @tc.name  Continuation Manager-Modul bietet die Möglichkeit
        * @tc.desc  Function test
        * @tc.size  MediumTest
        * @tc.type:  Function
        * @tc.level  Level0
        */
        it('testUpdateContinuationState006', 0, async function (done) {
            console.info("----------------------testUpdateContinuationState006 start----------------------");
            try {
                continuationManager.updateContinuationState(token, TEST_DEVICE_ID,
                    continuationManager.DeviceConnectState.DISCONNECTING).then((data) => {
                        console.log('testUpdateContinuationState006 data is' + data);
                        expect().assertFail();
                        done();
                    }).catch((err) => {
                        console.log('testUpdateContinuationState006 err code is' + err.code);
                        expect(err.code == 16600002).assertTrue();
                        done();
                    });
            } catch (error) {
                console.info("testUpdateContinuationState006 catch error is" + error);
                expect(null).assertFail();
                done();
            }
            console.info("----------------------testUpdateContinuationState006 end----------------------");
        })
    })
}
