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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
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

        /**
         * @tc.name   SUB_DMS_AbilityConstant_0100
         * @tc.number SUM_DMS_AbilityConstant_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DMS_AbilityConstant_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
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

        /**
         * @tc.name   testRegister001
         * @tc.number testRegister001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister002
         * @tc.number testRegister002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister003
         * @tc.number testRegister003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister004
         * @tc.number testRegister004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister005
         * @tc.number testRegister005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister006
         * @tc.number testRegister006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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


        /**
         * @tc.name   testRegister007
         * @tc.number testRegister007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister008
         * @tc.number testRegister008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister009
         * @tc.number testRegister009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister010
         * @tc.number testRegister010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegister011
         * @tc.number testRegister011
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation001
         * @tc.number testRegisterContinuation001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation002
         * @tc.number testRegisterContinuation002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation003
         * @tc.number testRegisterContinuation003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation004
         * @tc.number testRegisterContinuation004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation005
         * @tc.number testRegisterContinuation005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation006
         * @tc.number testRegisterContinuation006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation007
         * @tc.number testRegisterContinuation007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation008
         * @tc.number testRegisterContinuation008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation009
         * @tc.number testRegisterContinuation009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterContinuation010
         * @tc.number testRegisterContinuation010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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


        /**
         * @tc.name   testRegisterContinuation011
         * @tc.number testRegisterContinuation011
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testRegisterContinuation011 start----------------------");
            let token = -1;
            try {
                await continuationManager.registerContinuation()
                    .then((data) => {
                        console.log('testRegisterContinuation011 data is' + data);
                        token = data;
                        expect(typeof (data) == 'number').assertTrue();
                    }).catch((err) => {
                        console.log('testRegisterContinuation011 err code is' + err.code);
                        expect().assertFail();
                    });
                try {
                    await continuationManager.on("deviceSelected", token, (data) => {
                        console.info('onDeviceSelected len: ' + data.length);
                        expect(data.length == 0).assertTrue()
                    });
                } catch (error) {
                    console.info("testRegisterContinuation011 continuationManager.on catch error is" + error);
                    expect().assertFail();
                }
            } catch (error) {
                console.info("testRegisterContinuation011 continuationManager.registerContinuation catch error is" + error);
                expect().assertFail();
            }
            console.info("----------------------testRegisterContinuation011 end----------------------");
            done();
        })

        /**
         * @tc.name   testRegisterContinuation012
         * @tc.number testRegisterContinuation012
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testRegisterContinuation012 start----------------------");
            let token = -1;
            try {
                await continuationManager.registerContinuation()
                    .then((data) => {
                        console.log('testRegisterContinuation012 data is' + data);
                        token = data;
                        expect(typeof (data) == 'number').assertTrue();
                    }).catch((err) => {
                        console.log('testRegisterContinuation012 err code is' + err.code);
                        expect().assertFail();
                    });
                try {
                    await continuationManager.on("deviceSelected", token, (data) => {
                        console.log('testRegisterContinuation012 onDeviceSelected len: ' + data.length);
                        expect(data.length > 0).assertTrue()
                    });
                } catch (error) {
                    console.log("testRegisterContinuation012 continuationManager.on catch error is" + error);
                    expect().assertFail();
                }
            } catch (error) {
                console.log("testRegisterContinuation012 continuationManager.registerContinuation catch error is" + error);
                expect().assertFail();
            }
            console.log("----------------------testRegisterContinuation012 end----------------------");
            done();
        })

        /**
         * @tc.name   testRegisterContinuation013
         * @tc.number testRegisterContinuation013
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testRegisterContinuation013 start----------------------");
            let token = -1;
            try {
                await continuationManager.registerContinuation()
                    .then((data) => {
                        console.log('testRegisterContinuation013 data is' + data);
                        token = data;
                        expect(typeof (data) == 'number').assertTrue();
                    }).catch((err) => {
                        console.log('testRegisterContinuation013 err code is' + err.code);
                        expect().assertFail();
                    });
                try {
                    await continuationManager.on("deviceUnselected", token, (data) => {
                        console.log('testRegisterContinuation013 onDeviceUnselected len: ' + data.length);
                        expect(data.length == 0).assertTrue()
                    });
                } catch (error) {
                    console.log("testRegisterContinuation013 continuationManager.on catch error is" + error);
                    expect().assertFail();
                }
            } catch (error) {
                console.log("testRegisterContinuation013 continuationManager.registerContinuation catch error is" + error);
                expect().assertFail();
            }
            console.log("----------------------testRegisterContinuation013 end----------------------");
            done();
        })

        /**
         * @tc.name   testRegisterContinuation014
         * @tc.number testRegisterContinuation014
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterContinuation014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testRegisterContinuation014 start----------------------");
            let token = -1;
            try {
                await continuationManager.registerContinuation()
                    .then((data) => {
                        console.log('testRegisterContinuation014 data is' + data);
                        token = data;
                        expect(typeof (data) == 'number').assertTrue();
                    }).catch((err) => {
                        console.log('testRegisterContinuation014 err code is' + err.code);
                        expect().assertFail();
                    });
                try {
                    await continuationManager.on("deviceUnselected", token, (data) => {
                        console.log('testRegisterContinuation014 onDeviceUnselected len: ' + data.length);
                        expect(data.length > 0).assertTrue()
                    });
                } catch (error) {
                    console.log("testRegisterContinuation014 continuationManager.on catch error is" + error);
                    expect().assertFail();
                }
            } catch (error) {
                console.log("testRegisterContinuation014 continuationManager.registerContinuation catch error is" + error);
                expect().assertFail();
            }
            console.log("----------------------testRegisterContinuation014 end----------------------");
            done();
        })

        /**
         * @tc.name   testUnregister001
         * @tc.number testUnregister001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregister001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregister002
         * @tc.number testUnregister002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregister002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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


        /**
         * @tc.name   testUnregister003
         * @tc.number testUnregister003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregister003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregister004
         * @tc.number testUnregister004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregister004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregister005
         * @tc.number testUnregister005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregister005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregister006
         * @tc.number testUnregister006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregister006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregisterContinuation001
         * @tc.number testUnregisterContinuation001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregisterContinuation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregisterContinuation002
         * @tc.number testUnregisterContinuation002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregisterContinuation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregisterContinuation003
         * @tc.number testUnregisterContinuation003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregisterContinuation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregisterContinuation004
         * @tc.number testUnregisterContinuation004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregisterContinuation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregisterContinuation005
         * @tc.number testUnregisterContinuation005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregisterContinuation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUnregisterContinuation006
         * @tc.number testUnregisterContinuation006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUnregisterContinuation006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn001
         * @tc.number testOn001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn002
         * @tc.number testOn002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn003
         * @tc.number testOn003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn004
         * @tc.number testOn004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn005
         * @tc.number testOn005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn006
         * @tc.number testOn006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn007
         * @tc.number testOn007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn008
         * @tc.number testOn008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn009
         * @tc.number testOn009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOn010
         * @tc.number testOn010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOn010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOff001
         * @tc.number testOff001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOff002
         * @tc.number testOff002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOff003
         * @tc.number testOff003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOff003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOff004
         * @tc.number testOff004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOff004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOff005
         * @tc.number testOff005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOff005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testOff006
         * @tc.number testOff006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOff006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager001
         * @tc.number testStartDeviceManager001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager002
         * @tc.number testStartDeviceManager002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager003
         * @tc.number testStartDeviceManager003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager004
         * @tc.number testStartDeviceManager004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager005
         * @tc.number testStartDeviceManager005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager006
         * @tc.number testStartDeviceManager006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager007
         * @tc.number testStartDeviceManager007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager008
         * @tc.number testStartDeviceManager008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartDeviceManager009
         * @tc.number testStartDeviceManager009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartDeviceManager009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager001
         * @tc.number testStartContinuationDeviceManager001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager002
         * @tc.number testStartContinuationDeviceManager002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager003
         * @tc.number testStartContinuationDeviceManager003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager004
         * @tc.number testStartContinuationDeviceManager004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager005
         * @tc.number testStartContinuationDeviceManager005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager006
         * @tc.number testStartContinuationDeviceManager006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager007
         * @tc.number testStartContinuationDeviceManager007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager008
         * @tc.number testStartContinuationDeviceManager008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testStartContinuationDeviceManager009
         * @tc.number testStartContinuationDeviceManager009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus001
         * @tc.number testUpdateConnectStatus001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus002
         * @tc.number testUpdateConnectStatus002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus003
         * @tc.number testUpdateConnectStatus003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus004
         * @tc.number testUpdateConnectStatus004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus005
         * @tc.number testUpdateConnectStatus005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus006
         * @tc.number testUpdateConnectStatus006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus007
         * @tc.number testUpdateConnectStatus007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus008
         * @tc.number testUpdateConnectStatus008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus009
         * @tc.number testUpdateConnectStatus009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus010
         * @tc.number testUpdateConnectStatus010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus011
         * @tc.number testUpdateConnectStatus011
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus012
         * @tc.number testUpdateConnectStatus012
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateConnectStatus013
         * @tc.number testUpdateConnectStatus013
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateConnectStatus013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateContinuationState001
         * @tc.number testUpdateContinuationState001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateContinuationState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateContinuationState002
         * @tc.number testUpdateContinuationState002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateContinuationState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateContinuationState003
         * @tc.number testUpdateContinuationState003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateContinuationState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateContinuationState004
         * @tc.number testUpdateContinuationState004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateContinuationState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateContinuationState005
         * @tc.number testUpdateContinuationState005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateContinuationState005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testUpdateContinuationState006
         * @tc.number testUpdateContinuationState006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testUpdateContinuationState006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testRegisterdeviceSelected0010
         * @tc.number testRegisterdeviceSelected0010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegisterdeviceSelected0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testRegisterdeviceSelected0010 start----------------------");
            let token = -1;
            try {
                continuationManager.on(null, token, (data) => {
                    console.log('testRegisterdeviceSelected0010 onDeviceSelected len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testRegisterdeviceSelected0010 continuationManager.on catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.log("----------------------testRegisterdeviceSelected0010 end----------------------");
            done();
        })

        /**
         * @tc.name   testOndeviceSelected0020
         * @tc.number testOndeviceSelected0020
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceSelected0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testOndeviceSelected0020 start----------------------");
            let token = -1;
            try {
                continuationManager.on(undefined, token, (data) => {
                    console.log('testOndeviceSelected0020 onDeviceSelected len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceSelected0020 continuationManager.on catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.log("----------------------testOndeviceSelected0020 end----------------------");
            done();
        })

        /**
         * @tc.name   testOndeviceSelected0030
         * @tc.number testOndeviceSelected0030
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceSelected0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testOndeviceSelected0030 start----------------------");
            try {
                continuationManager.on("deviceSelected", null, (data) => {
                    console.log('testOndeviceSelected0030 onDeviceSelected len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceSelected0030 continuationManager.on catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.log("----------------------testOndeviceSelected0030 end----------------------");
            done();
        })

        /**
         * @tc.name   testOndeviceSelected0040
         * @tc.number testOndeviceSelected0040
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceSelected0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testOndeviceSelected0040 start----------------------");
            try {
                continuationManager.on("deviceSelected", undefined, (data) => {
                    console.log('testOndeviceSelected0040 onDeviceSelected len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceSelected0040 continuationManager.on catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.log("----------------------testOndeviceSelected0040 end----------------------");
            done();
        })

        /**
         * @tc.name   testOffdeviceSelected0010
         * @tc.number testOffdeviceSelected0010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceSelected0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceSelected0010 start----------------------");
            let token = 1;
            try {
                continuationManager.off(null, token);
                expect().assertFail()
                done();
            } catch (error) {
                console.info("testOffdeviceSelected0010 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testOffdeviceSelected0010 end----------------------");
        })

        /**
         * @tc.name   testOffdeviceSelected0002
         * @tc.number testOffdeviceSelected0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceSelected0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceSelected0002 start----------------------");
            let token = 1;
            try {
                continuationManager.off(undefined, token);
                expect().assertFail()
                done();
            } catch (error) {
                console.info("testOffdeviceSelected0002 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testOffdeviceSelected0002 end----------------------");
        })

        /**
         * @tc.name   testOffdeviceSelected0030
         * @tc.number testOffdeviceSelected0030
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceSelected0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceSelected0030 start----------------------");
            try {
                continuationManager.off("deviceSelected", null);
                expect().assertFail()
                done();
            } catch (error) {
                console.info("testOffdeviceSelected0030 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testOffdeviceSelected0030 end----------------------");
        })

        /**
         * @tc.name   testOffdeviceSelected0040
         * @tc.number testOffdeviceSelected0040
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceSelected0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceSelected0040 start----------------------");
            try {
                continuationManager.off("deviceSelected", undefined);
                expect().assertFail()
                done();
            } catch (error) {
                console.info("testOffdeviceSelected0040 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testOffdeviceSelected0040 end----------------------");
        })

        /**
         * @tc.name   testOndeviceUnselected0001
         * @tc.number testOndeviceUnselected0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceUnselected0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testOndeviceUnselected0001 start----------------------");
            try {
                continuationManager.on("deviceUnselected", null, (data) => {
                    console.log('testOndeviceUnselected0001 onDeviceSelected len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceUnselected0010 continuationManager.on catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.log("----------------------testOndeviceUnselected0001 end----------------------");
            done();
        })

        /**
         * @tc.name   testOndeviceUnselected0020
         * @tc.number testOndeviceUnselected0020
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceUnselected0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log("----------------------testOndeviceUnselected0020 start----------------------");
            try {
                continuationManager.on("deviceUnselected", undefined, (data) => {
                    console.log('testOndeviceUnselected0020 onDeviceSelected len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceUnselected0020 continuationManager.on catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.log("----------------------testOndeviceUnselected0020 end----------------------");
            done();
        })

        /**
         * @tc.name   testOndeviceUnselected0010
         * @tc.number testOndeviceUnselected0010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceUnselected0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOndeviceUnselected0010 start----------------------");
            try {
                continuationManager.off("deviceUnselected", null);
                expect().assertFail()
            } catch (error) {
                console.info("testOndeviceUnselected0010 catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testOndeviceUnselected0010 end----------------------");
            done()
        })

        /**
         * @tc.name   testOffdeviceSelected0020
         * @tc.number testOffdeviceSelected0020
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceSelected0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceSelected0020 start----------------------");
            try {
                continuationManager.off("deviceUnselected", undefined);
                expect().assertFail()
            } catch (error) {
                console.info("testOffdeviceSelected0020 catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testOffdeviceSelected0020 end----------------------");
            done()
        })

        /**
         * @tc.name   testOndeviceConnect0010
         * @tc.number testOndeviceConnect0010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceConnect0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOndeviceConnect0010 start----------------------");
            try {
                continuationManager.on(undefined, (data) => {
                    console.log('testOndeviceConnect0010 deviceConnect len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceConnect0010 deviceConnect catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testOndeviceConnect0010 end----------------------");
            done()
        })

        /**
         * @tc.name   testOndeviceConnect0020
         * @tc.number testOndeviceConnect0020
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOndeviceConnect0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOndeviceConnect0020 start----------------------");
            try {
                continuationManager.on(null, (data) => {
                    console.log('testOndeviceConnect0020 deviceConnect len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOndeviceConnect0020 deviceConnect catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testOndeviceConnect0020 end----------------------");
            done()
        })

        /**
         * @tc.name   testOffdeviceConnect0030
         * @tc.number testOffdeviceConnect0030
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceConnect0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceConnect0030 start----------------------");
            try {
                continuationManager.off(undefined, (data) => {
                    console.log('testOffdeviceConnect0030 deviceConnect len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOffdeviceConnect0030 deviceConnect catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testOffdeviceConnect0030 end----------------------");
            done()
        })

        /**
         * @tc.name   testOffdeviceConnect0040
         * @tc.number testOffdeviceConnect0040
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceConnect0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceConnect0040 start----------------------");
            try {
                continuationManager.off(null, (data) => {
                    console.log('testOffdeviceConnect0040 deviceConnect len: ' + data.length);
                    expect().assertFail()
                });
            } catch (error) {
                console.log("testOffdeviceConnect0040 deviceConnect catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testOffdeviceConnect0040 end----------------------");
            done()
        })

        /**
         * @tc.name   testOffdeviceDisconnect0010
         * @tc.number testOffdeviceDisconnect0010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceDisconnect0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceDisconnect0010 start----------------------");
            try {
                continuationManager.off(undefined);
                expect().assertFail()
                done();
            } catch (error) {
                console.info("testOffdeviceDisconnect0010 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testOffdeviceDisconnect0010 end----------------------");
        })

        /**
         * @tc.name   testOffdeviceDisconnect0020
         * @tc.number testOffdeviceDisconnect0020
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffdeviceDisconnect0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testOffdeviceDisconnect0020 start----------------------");
            try {
                continuationManager.off(null);
                expect().assertFail()
                done();
            } catch (error) {
                console.info("testOffdeviceDisconnect0020 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testOffdeviceDisconnect0020 end----------------------");
        })

        /**
         * @tc.name   testRegister0001
         * @tc.number testRegister0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testRegister0001 start----------------------");
            try {
                continuationManager.register(undefined, (err, data) => {
                    if (err.code != 0) {
                        console.log('testRegister0001 get register is faild' + err.code)
                        expect().assertFail()
                    }
                    console.log('testRegister0001 get register is success' + data)
                    expect().assertFail()
                })
                done();
            } catch (error) {
                console.info("testRegister0001 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testRegister0001 end----------------------");
        })

        /**
         * @tc.name   testRegister0002
         * @tc.number testRegister0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testRegister0002 start----------------------");
            try {
                continuationManager.register(null, (err, data) => {
                    if (err.code != 0) {
                        console.log('testRegister0002 get register is faild' + err.code)
                        expect().assertFail()
                    }
                    console.log('testRegister0002 get register is success' + data)
                    expect().assertFail()
                })
                done();
            } catch (error) {
                console.info("testRegister001 catch error is" + error);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testRegister0002 end----------------------");
        })

        /**
         * @tc.name   testRegister0003
         * @tc.number testRegister0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testRegister0003 start----------------------");
            await continuationManager.register(undefined).then((data) => {
                console.info('register finished, ' + JSON.stringify(data));
                expect(data != -1).assertTrue();
            }).catch((error) => {
                console.error('register failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            })
            console.info("----------------------testRegister0003 end----------------------");
            done();
        })

        /**
         * @tc.name   testRegister0004
         * @tc.number testRegister0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRegister0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testRegister0004 start----------------------");
            await continuationManager.register(null).then((data) => {
                console.info('register finished, ' + JSON.stringify(data));
                expect(data != -1).assertTrue();
            }).catch((error) => {
                console.error('register failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            })
            console.info("----------------------testRegister0004 end----------------------");
            done();
        })

        /**
         * @tc.name   testunregister0001
         * @tc.number testunregister0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregister0001 start----------------------");
            continuationManager.unregister(undefined, (err, data) => {
                if (err.code != 0) {
                    console.log('testunregister0001 get unregister is faild' + err.code)
                    expect(err.code).assertEqual(-1)
                }
                console.log('testunregister0001 get unregister is success' + data)
                expect(data).assertEqual(undefined)
            })
            console.info("----------------------testunregister0001 end----------------------");
            done();
        })

        /**
         * @tc.name   testunregister0002
         * @tc.number testunregister0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregister0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregister0002 start----------------------");
            continuationManager.unregister(null, (err, data) => {
                if (err.code != 0) {
                    console.log('testunregister0002 get unregister is faild' + err.code)
                    expect(err.code).assertEqual(-1)

                }
                console.log('testunregister0002 get unregister is success' + data)
                expect(data).assertEqual(undefined)
            })
            done();
            console.info("----------------------testunregister0002 end----------------------");
        })

        /**
         * @tc.name   testunregister0003
         * @tc.number testunregister0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregister0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregister0003 start----------------------");
            continuationManager.unregister(undefined).then((data) => {
                console.info('unregister finished, ' + JSON.stringify(data));
                expect(data).assertEqual(undefined)
            }).catch((error) => {
                console.error('unregister failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1)
            })
            console.info("----------------------testunregister0003 end----------------------");
            done();
        })

        /**
         * @tc.name   testunregister0004
         * @tc.number testunregister0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregister0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregister0004 start----------------------");
            continuationManager.unregister(null).then((data) => {
                console.info('unregister finished, ' + JSON.stringify(data));
                expect(data == undefined).assertTrue()
            }).catch((error) => {
                console.error('unregister failed, cause: ' + JSON.stringify(error.code));
                expect(err.code).assertEqual(-1)
            })
            console.info("----------------------testunregister0004 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0001
         * @tc.number testupdateConnectStatus0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0001 start----------------------");
            try {
                continuationManager.updateConnectStatus(undefined, TEST_DEVICE_ID, continuationManager.DeviceConnectState.IDLE, (err, data) => {
                    if (err.code != 0) {
                        console.info('updateConnectStatus failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1)
                    }
                })
            } catch (error) {
                console.error('unregister failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testupdateConnectStatus0001 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0002
         * @tc.number testupdateConnectStatus0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0002 start----------------------");
            try {
                continuationManager.updateConnectStatus(null, TEST_DEVICE_ID, continuationManager.DeviceConnectState.CONNECTING, (err) => {
                    if (err.code != 0) {
                        console.info('updateConnectStatus failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1)
                    }
                    console.info('unregister finished');
                })
            } catch (error) {
                console.error('unregister failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testupdateConnectStatus0002 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0003
         * @tc.number testupdateConnectStatus0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0003 start----------------------");
            let token = 1;
            try {
                continuationManager.updateConnectStatus(token, '', continuationManager.DeviceConnectState.CONNECTED, (err) => {
                    if (err.code != 0) {
                        console.info('updateConnectStatus failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(7)
                    }
                    console.info('unregister finished');
                })
            } catch (error) {
                console.error('unregister failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testupdateConnectStatus0003 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0004
         * @tc.number testupdateConnectStatus0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0004 start----------------------");
            let token = 1;
            try {
                continuationManager.updateConnectStatus(token, undefined, continuationManager.DeviceConnectState.DISCONNECTING, (err) => {
                    if (err.code != 0) {
                        console.info('updateConnectStatus failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1);
                    }
                    console.info('unregister finished');
                })
            } catch (error) {
                console.error('unregister failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testupdateConnectStatus0004 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0005
         * @tc.number testupdateConnectStatus0005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0005 start----------------------");
            let token = 1;
            try {
                continuationManager.updateConnectStatus(token, null, continuationManager.DeviceConnectState.CONNECTED, (err) => {
                    if (err.code != 0) {
                        console.info('updateConnectStatus failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1)
                    }
                    console.info('updateConnectStatus finished');
                })
            } catch (error) {
                console.error('updateConnectStatus failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testupdateConnectStatus0005 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0006
         * @tc.number testupdateConnectStatus0006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0006 start----------------------");
            await continuationManager.updateConnectStatus(undefined, TEST_DEVICE_ID, continuationManager.DeviceConnectState.CONNECTED).then(() => {
                console.info('testupdateConnectStatus0006 updateConnectStatus finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('updateConnectStatus failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1);
            })
            console.info("----------------------testupdateConnectStatus0006 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0007
         * @tc.number testupdateConnectStatus0007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0007 start----------------------");
            await continuationManager.updateConnectStatus(null, TEST_DEVICE_ID, continuationManager.DeviceConnectState.CONNECTED).then(() => {
                console.info('testupdateConnectStatus0007 updateConnectStatus finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('updateConnectStatus failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1)
            })
            console.info("----------------------testupdateConnectStatus0007 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0008
         * @tc.number testupdateConnectStatus0008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0008 start----------------------");
            let token = 1;
            await continuationManager.updateConnectStatus(token, '', continuationManager.DeviceConnectState.CONNECTED).then(() => {
                console.info('testupdateConnectStatus0008 updateConnectStatus finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('updateConnectStatus failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(7)
            })
            console.info("----------------------testupdateConnectStatus0008 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0009
         * @tc.number testupdateConnectStatus0009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0009 start----------------------");
            let token = 1;
            await continuationManager.updateConnectStatus(token, undefined, continuationManager.DeviceConnectState.CONNECTED).then(() => {
                console.info('testupdateConnectStatus0009 updateConnectStatus finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('updateConnectStatus failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1);
            })
            console.info("----------------------testupdateConnectStatus0009 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateConnectStatus0100
         * @tc.number testupdateConnectStatus0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateConnectStatus0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateConnectStatus0100 start----------------------");
            let token = 1;
            await continuationManager.updateConnectStatus(token, null, continuationManager.DeviceConnectState.CONNECTED).then(() => {
                console.info('testupdateConnectStatus0100 updateConnectStatus finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('updateConnectStatus failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1)
            })
            console.info("----------------------testupdateConnectStatus0100 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0001
         * @tc.number teststartDeviceManager0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0001 start----------------------");
            try {
                continuationManager.startDeviceManager(undefined, (err) => {
                    if (err.code != 0) {
                        console.info('startDeviceManager failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1);
                    }
                    console.info('startDeviceManager finished');
                })
            } catch (error) {
                console.error('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------teststartDeviceManager0001 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0002
         * @tc.number teststartDeviceManager0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0002 start----------------------");
            try {
                continuationManager.startDeviceManager(null, (err) => {
                    if (err.code != 0) {
                        console.info('startDeviceManager failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1);
                    }
                    console.info('startDeviceManager finished');
                })
            } catch (error) {
                console.error('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------teststartDeviceManager0002 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0003
         * @tc.number teststartDeviceManager0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0003 start----------------------");
            let token = 1;
            try {
                continuationManager.startDeviceManager(token, undefined, (err) => {
                    if (err.code != 0) {
                        console.info('startDeviceManager failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1)
                    }
                    console.info('startDeviceManager finished');
                })
            } catch (error) {
                console.error('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------teststartDeviceManager0003 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0004
         * @tc.number teststartDeviceManager0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0004 start----------------------");
            let token = 1;
            try {
                continuationManager.startDeviceManager(token, null, (err) => {
                    if (err.code != 0) {
                        console.info('startDeviceManager failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1);
                    }
                    console.info('startDeviceManager finished');
                })
            } catch (error) {
                console.error('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------teststartDeviceManager0004 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0005
         * @tc.number teststartDeviceManager0005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0005 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };
            try {
                continuationManager.startDeviceManager(undefined, continuationExtraParams, (err) => {
                    if (err.code != 0) {
                        console.info('startDeviceManager failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1);
                    }
                    console.info('startDeviceManager finished');
                })
            } catch (error) {
                console.error('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------teststartDeviceManager0005 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0006
         * @tc.number teststartDeviceManager0006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0006 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };
            try {
                continuationManager.startDeviceManager(null, continuationExtraParams, (err) => {
                    if (err.code != 0) {
                        console.info('startDeviceManager failed, ' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(-1)
                    }
                    console.info('startDeviceManager finished');
                })
            } catch (error) {
                console.error('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------teststartDeviceManager0006 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0007
         * @tc.number teststartDeviceManager0007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0007 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };
            await continuationManager.startDeviceManager(undefined, continuationExtraParams).then(() => {
                console.info('teststartDeviceManager0007 startDeviceManager finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1)
            })
            console.info("----------------------teststartDeviceManager0007 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0008
         * @tc.number teststartDeviceManager0008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0008 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };
            await continuationManager.startDeviceManager(null, continuationExtraParams).then(() => {
                console.info('teststartDeviceManager0008 startDeviceManager finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1)
            })
            console.info("----------------------teststartDeviceManager0008 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager0009
         * @tc.number teststartDeviceManager0009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager0009 start----------------------");
            let token = 1;
            await continuationManager.startDeviceManager(token, undefined).then(() => {
                console.info('teststartDeviceManager0009 startDeviceManager finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(29360208)
            })
            console.info("----------------------teststartDeviceManager0009 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager010
         * @tc.number teststartDeviceManager010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager010 start----------------------");
            let token = 1;
            await continuationManager.startDeviceManager(token, null).then(() => {
                console.info('teststartDeviceManager010 startDeviceManager finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(29360208)
            })
            console.info("----------------------teststartDeviceManager010 end----------------------");
            done();
        })

        /**
         * @tc.name   teststartDeviceManager011
         * @tc.number teststartDeviceManager011
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('teststartDeviceManager011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------teststartDeviceManager011 start----------------------");
            await continuationManager.startDeviceManager(undefined).then(() => {
                console.info('teststartDeviceManager011 startDeviceManager finished');
                expect().assertFail()
            }).catch((error) => {
                console.info('startDeviceManager failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(-1)
            })
            console.info("----------------------teststartDeviceManager011 end----------------------");
            done();
        })

        /**
         * @tc.name   testregisterContinuation0001
         * @tc.number testregisterContinuation0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testregisterContinuation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testregisterContinuation0001 start----------------------");
            try {
                continuationManager.registerContinuation(undefined, (err) => {
                    if (err.code != 0) {
                        console.info('registerContinuation failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('registerContinuation finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('registerContinuation failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testregisterContinuation0001 end----------------------");
            done();
        })

        /**
         * @tc.name   testregisterContinuation0002
         * @tc.number testregisterContinuation0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testregisterContinuation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testregisterContinuation0002 start----------------------");
            try {
                continuationManager.registerContinuation(null, (err) => {
                    if (err.code != 0) {
                        console.info('registerContinuation failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('registerContinuation finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('registerContinuation failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testregisterContinuation0002 end----------------------");
            done();
        })

        /**
         * @tc.name   testregisterContinuation0003
         * @tc.number testregisterContinuation0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testregisterContinuation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testregisterContinuation0003 start----------------------");
            try {
                await continuationManager.registerContinuation(undefined).then((data) => {
                    console.info('testregisterContinuation0003 registerContinuation finished' + data);
                    expect(data != -1).assertTrue()
                }).catch((error) => {
                    console.info('registerContinuation failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.info('registerContinuation catch failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testregisterContinuation0003 end----------------------");
            done();
        })

        /**
         * @tc.name   testregisterContinuation0004
         * @tc.number testregisterContinuation0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testregisterContinuation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testregisterContinuation0004 start----------------------");
            try {
                await continuationManager.registerContinuation(null).then((data) => {
                    console.info('registerContinuation finished' + data);
                    expect(data != -1).assertTrue()
                }).catch((error) => {
                    console.info('registerContinuation failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.info('registerContinuation catch failed, cause: ' + JSON.stringify(error.code));
                expect().assertFail()
            }
            console.info("----------------------testregisterContinuation0004 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState0001
         * @tc.number testupdateContinuationState0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState0001 start----------------------");
            try {
                continuationManager.updateContinuationState(undefined, TEST_DEVICE_ID, continuationManager.DeviceConnectState.IDLE, (err) => {
                    if (err.code != 0) {
                        console.info('updateContinuationState failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState0001 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState0002
         * @tc.number testupdateContinuationState0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState0002 start----------------------");
            try {
                continuationManager.updateContinuationState(null, TEST_DEVICE_ID, continuationManager.DeviceConnectState.CONNECTING, (err) => {
                    if (err.code != 0) {
                        console.info('updateContinuationState failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState0002 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState0003
         * @tc.number testupdateContinuationState0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState0003 start----------------------");
            try {
                continuationManager.updateContinuationState(token, '', continuationManager.DeviceConnectState.CONNECTED, (err) => {
                    if (err.code != 0) {
                        console.info('updateContinuationState failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState0003 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState0004
         * @tc.number testupdateContinuationState0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState0004 start----------------------");
            try {
                continuationManager.updateContinuationState(token, null, continuationManager.DeviceConnectState.DISCONNECTING, (err) => {
                    if (err.code != 0) {
                        console.info('updateContinuationState failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState0004 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState0005
         * @tc.number testupdateContinuationState0005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState0005 start----------------------");
            try {
                continuationManager.updateContinuationState(token, undefined, continuationManager.DeviceConnectState.DISCONNECTING, (err) => {
                    if (err.code != 0) {
                        console.info('updateContinuationState failed, ' + JSON.stringify(err.code));
                        expect().assertFail()
                    }
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState0005 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState0006
         * @tc.number testupdateContinuationState0006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState0006 start----------------------");
            try {
                await continuationManager.updateContinuationState(undefined, TEST_DEVICE_ID, continuationManager.DeviceConnectState.DISCONNECTING).then(() => {
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                }).catch((error) => {
                    console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState catch failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState0006 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState007
         * @tc.number testupdateContinuationState007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState007 start----------------------");
            try {
                await continuationManager.updateContinuationState(null, TEST_DEVICE_ID, continuationManager.DeviceConnectState.DISCONNECTING).then(() => {
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                }).catch((error) => {
                    console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState catch failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState007 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState008
         * @tc.number testupdateContinuationState008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState008 start----------------------");
            try {
                await continuationManager.updateContinuationState(token, '', continuationManager.DeviceConnectState.DISCONNECTING).then(() => {
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                }).catch((error) => {
                    console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState catch failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState008 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState009
         * @tc.number testupdateContinuationState009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState009 start----------------------");
            try {
                await continuationManager.updateContinuationState(token, null, continuationManager.DeviceConnectState.DISCONNECTING).then(() => {
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                }).catch((error) => {
                    console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState catch failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }

            console.info("----------------------testupdateContinuationState009 end----------------------");
            done();
        })

        /**
         * @tc.name   testupdateContinuationState010
         * @tc.number testupdateContinuationState010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testupdateContinuationState010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testupdateContinuationState010 start----------------------");
            try {
                await continuationManager.updateContinuationState(token, undefined, continuationManager.DeviceConnectState.DISCONNECTING).then(() => {
                    console.info('updateContinuationState finished');
                    expect().assertFail()
                }).catch((error) => {
                    console.error('updateContinuationState failed, cause: ' + JSON.stringify(error.code));
                    expect().assertFail()
                })
            } catch (error) {
                console.error('updateContinuationState catch failed, cause: ' + JSON.stringify(error.code));
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testupdateContinuationState010 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0001
         * @tc.number testStartContinuationDeviceManager0001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0001 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager(undefined, (err, data) => {
                    console.info("testStartContinuationDeviceManager0001 data is" + data);
                    expect().assertFail()
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager0001 catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testStartContinuationDeviceManager0001 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0002
         * @tc.number testStartContinuationDeviceManager0002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0002 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager(null, (err, data) => {
                    console.info("startContinuationDeviceManager data is" + data + err.code);
                    expect().assertFail()
                });
            } catch (error) {
                console.info("testStartContinuationDeviceManager0002 catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testStartContinuationDeviceManager0002 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0003
         * @tc.number testStartContinuationDeviceManager0003
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0003 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };

            try {
                continuationManager.startContinuationDeviceManager(undefined, continuationExtraParams, (err, data) => {
                    if (err.code != 0) {
                        console.info("startContinuationDeviceManager err is" + err.code);
                        expect().assertFail()
                        done();
                    }
                });
            } catch (error) {
                console.info("startContinuationDeviceManager catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager0003 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0004
         * @tc.number testStartContinuationDeviceManager0004
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0004 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };

            try {
                continuationManager.startContinuationDeviceManager(null, continuationExtraParams, (err, data) => {
                    if (err.code != 0) {
                        console.info("startContinuationDeviceManager err is" + err.code);
                        expect().assertFail()
                        done();
                    }
                });
            } catch (error) {
                console.info("startContinuationDeviceManager catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager0004 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0005
         * @tc.number testStartContinuationDeviceManager0005
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0005 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager(token, undefined, (err, data) => {
                    console.info("startContinuationDeviceManager data is" + data + err.code);
                    expect(data == undefined).assertTrue()
                    done();
                });
            } catch (error) {
                console.info("startContinuationDeviceManager catch error is" + error);
                expect(error.code).assertEqual(16600002)
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager0005 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0006
         * @tc.number testStartContinuationDeviceManager0006
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0006 start----------------------");
            try {
                continuationManager.startContinuationDeviceManager(token, null, (err, data) => {
                    console.info("startContinuationDeviceManager data is" + data + err.code);
                    expect(data == undefined).assertTrue()
                    done();
                });
            } catch (error) {
                console.info("startContinuationDeviceManager catch error is" + error);
                expect(error.code).assertEqual(16600002)
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager0006 end----------------------");
            done();
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0007
         * @tc.number testStartContinuationDeviceManager0007
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0007 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };

            try {
                await continuationManager.startContinuationDeviceManager(undefined, continuationExtraParams).then((data) => {
                    console.log('startContinuationDeviceManager data is' + data);
                    expect().assertFail();
                    done();
                }).catch((error) => {
                    console.log('startContinuationDeviceManager err code is' + error.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log('startContinuationDeviceManager catch err code is' + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager0007 end----------------------");
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0008
         * @tc.number testStartContinuationDeviceManager0008
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0008 start----------------------");
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: { "name": "authInfo", "length": 8 },
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: { "name": "authInfo", "length": 8 }
            };

            try {
                await continuationManager.startContinuationDeviceManager(null, continuationExtraParams).then((data) => {
                    console.log('testStartContinuationDeviceManager0008 data is' + data);
                    expect().assertFail();
                    done();
                }).catch((error) => {
                    console.log('testStartContinuationDeviceManager0008 err code is' + error.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log('testStartContinuationDeviceManager0008 catch err code is' + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testStartContinuationDeviceManager0008 end----------------------");
        })

        /**
         * @tc.name   testStartContinuationDeviceManager0009
         * @tc.number testStartContinuationDeviceManager0009
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager0009 start----------------------");
            await continuationManager.startContinuationDeviceManager(token, undefined).then((data) => {
                console.log('testStartContinuationDeviceManager0009 data is' + data);
                expect().assertFail();
                done();
            }).catch((error) => {
                console.log('testStartContinuationDeviceManager0009 err code is' + error.code);
                expect(error.code).assertEqual(16600002)
                done();
            });
            console.info("----------------------testStartContinuationDeviceManager0009 end----------------------");
        })

        /**
         * @tc.name   testStartContinuationDeviceManager010
         * @tc.number testStartContinuationDeviceManager010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStartContinuationDeviceManager010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testStartContinuationDeviceManager010 start----------------------");
            await continuationManager.startContinuationDeviceManager(token, null).then((data) => {
                console.log('testStartContinuationDeviceManager010 data is' + data);
                expect().assertFail();
                done();
            }).catch((error) => {
                console.log('testStartContinuationDeviceManager010 err code is' + error.code);
                expect(error.code).assertEqual(16600002)
                done();
            });
            console.info("----------------------testStartContinuationDeviceManager010 end----------------------");
        })

        /**
         * @tc.name   testunregisterContinuation010
         * @tc.number testunregisterContinuation010
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregisterContinuation010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregisterContinuation010 start----------------------");
            try {
                await continuationManager.unregisterContinuation(undefined).then((data) => {
                    console.info("testunregisterContinuation010 " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testunregisterContinuation010 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testunregisterContinuation010 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testunregisterContinuation010 end----------------------");
        })

        /**
         * @tc.name   testunregisterContinuation020
         * @tc.number testunregisterContinuation020
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregisterContinuation020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregisterContinuation020 start----------------------");
            try {
                await continuationManager.unregisterContinuation(null).then((data) => {
                    console.info("testunregisterContinuation020 " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('testunregisterContinuation020 err code is' + err.code);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("testunregisterContinuation020 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testunregisterContinuation020 end----------------------");
        })

        /**
         * @tc.name   testunregisterContinuation030
         * @tc.number testunregisterContinuation030
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregisterContinuation030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregisterContinuation030 start----------------------");
            try {
                continuationManager.unregisterContinuation(undefined, (err) => {
                    if (err != 0) {
                        console.log('testunregisterContinuation030 err code is' + err.code);
                        expect().assertFail();
                    }
                    console.info("testunregisterContinuation030 success");
                })
            } catch (error) {
                console.info("testunregisterContinuation030 catch error is" + error.code);
                expect(error.code).assertEqual(401)
                done();
            }
            console.info("----------------------testunregisterContinuation030 end----------------------");
        })

        /**
         * @tc.name   testunregisterContinuation040
         * @tc.number testunregisterContinuation040
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testunregisterContinuation040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("----------------------testunregisterContinuation040 start----------------------");
            try {
                continuationManager.unregisterContinuation(null, (err) => {
                    if (err != 0) {
                        console.log('testunregisterContinuation040 err code is' + err.code);
                        expect().assertFail();
                    }
                    console.info("testunregisterContinuation040 success");
                })
            } catch (error) {
                console.info("testunregisterContinuation040 catch error is" + error.code);
                expect(error.code).assertEqual(401)
            }
            console.info("----------------------testunregisterContinuation040 end----------------------");
            done();
        })
    })
}