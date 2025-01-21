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

export default function continuationManagerTest() {
describe('continuationManagerTest', function() {

    beforeAll(async function (done) {
        console.info('beforeAll');
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        await sleep(20000)
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
                console.info("beforeEach promise error: " + e);
            });
        } catch (e) {
            console.info("beforeEach try error: " + e);
        }
        console.info('beforeEach end');
    })

    afterEach(async function (done) {
        console.info('afterEach');
        try {
            await continuationManager.unregisterContinuation(token).then((data) => {
                console.info('afterEach unregisterContinuation success');
                done();
            })
            .catch((e) => {
                console.info("afterEach promise error: " + e);
            });
        } catch (e) {
            console.info("afterEach try error: " + e);
        }
        console.info('afterEach end');
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0100
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 001
     */
    it('testRegister001', 0, async function(done) {
        try {
            console.info("testRegister001Begin ");
            continuationManager.register(function (err, data) {
                expect(err.code == 0).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0200
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 002
     */
    it('testRegister002', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: [],
                targetBundle: "",
                description: "",
                filter: "",
                continuationMode: null,
                authInfo: {}
            };
            continuationManager.register(continuationExtraParams, function(err, data){
                console.info("testRegister002 " + err.message);
                expect(err.message == "Invalidate params.").assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0300
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 003
     */
    it('testRegister003', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 10,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams, function(err, data) {
                expect(err.code == 29360216).assertTrue();
                console.info("testRegister003 "+ err);
                done();
            });
        } catch (e) {
            console.info("testRegister003 " + e);
            expect(null).assertFail();
            done();
        }
    })

     /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0400
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 004
     */
    it('testRegister004', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams, function(err, data) {
                expect(err.code == 0).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister004 " + e);
            expect(null).assertFail();
            done();
        }
    })


     /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0500
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 005
     */
      it('testRegister005', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams, function(err, data) {
                expect(err.code == 0).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0600
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 006
     */
     it('testRegister006', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister006 " + e);
            expect(null).assertFail();
        }
        done();
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0700
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 007
     */
     it('testRegister007', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister007 " + e);
            expect(null).assertFail();
        }
        done();
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0800
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 008
     */
     it('testRegister008', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: [],
                description: "",
                filter: "",
                continuationMode: null,
                authInfo: {}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister008 " + e);
            expect(null).assertFail();
        }
        done();
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0900
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 009
     */
     it('testRegister009', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 10,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testRegister009 " + e);
            expect(null).assertFail();
            done();
        }
    })

    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_1000
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 010
     */
     it('testRegister010', 0, async function(done) {
        try {
            continuationManager.register().then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister010 " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0100
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 001
     */
    it('testRegisterContinuation001', 0, async function(done) {
        try {
            console.info("testRegisterContinuation001Begin ");
            continuationManager.registerContinuation(function (err, data) {
                expect(err.code == 0).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegisterContinuation001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0200
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 002
     */
    it('testRegisterContinuation002', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: [],
                targetBundle: "",
                description: "",
                filter: "",
                continuationMode: null,
                authInfo: {}
            };
            continuationManager.registerContinuation(continuationExtraParams, function(err, data){
                console.info("testRegisterContinuation002 " + err.message);
                expect(err.code == 401).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegisterContinuation002 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0300
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 003
     */
    it('testRegisterContinuation003', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 10,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.registerContinuation(continuationExtraParams, function(err, data) {
                expect(err.code == 401).assertTrue();
                console.info("testRegisterContinuation003 "+ err);
                done();
            });
        } catch (e) {
            console.info("testRegisterContinuation003 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0400
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 004
     */
    it('testRegisterContinuation004', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.registerContinuation(continuationExtraParams, function(err, data) {
                expect(err.code == 0).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegisterContinuation004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0500
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 005
     */
    it('testRegisterContinuation005', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.registerContinuation(continuationExtraParams, function(err, data) {
                expect(err.code == 0).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegisterContinuation005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0600
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 006
     */
    it('testRegisterContinuation006', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
        } catch (e) {
            console.info("testRegisterContinuation006 " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0700
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 007
     */
    it('testRegisterContinuation007', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
        } catch (e) {
            console.info("testRegisterContinuation007 " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0800
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 008
     */
    it('testRegisterContinuation008', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: [],
                description: "",
                filter: "",
                continuationMode: null,
                authInfo: {}
            };
            continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 401).assertTrue();
            });
        } catch (e) {
            console.info("testRegisterContinuation008 " + e);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0900
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 009
     */
    it('testRegisterContinuation009', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 10,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.registerContinuation(continuationExtraParams).then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testRegisterContinuation009 " + e);
            expect(null).assertFail();
            done();
        }
    })
    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_1000
     * @tc.name [JS-API9]ContinuationManager.registerContinuation().
     * @tc.desc Test Js Api ContinuationManager.registerContinuation() testcase 010
     */
    it('testRegisterContinuation010', 0, async function(done) {
        try {
            continuationManager.registerContinuation().then((data) => {
                expect(data != -1).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
        } catch (e) {
            console.info("testRegisterContinuation010 " + e);
            expect(null).assertFail();
        }
        done();
    })
    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0100
     * @tc.name [JS-API8]ContinuationManager.unregister().
     * @tc.desc Test Js Api ContinuationManager.unregister() testcase 001
     */
    it('testUnregister001', 0, async function(done) {
        try {
            continuationManager.unregister(token, function (err, data) {
                expect(err.code == 0).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0200
     * @tc.name [JS-API8]ContinuationManager.unregister().
     * @tc.desc Test Js Api ContinuationManager.unregister() testcase 002
     */
    it('testUnregister002', 0, async function(done) {
        try {
            continuationManager.unregister(null, function (err, data) {
                console.info("testUnregister002 " + data);
                expect(err.message == "Invalidate params.").assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister002 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0300
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 003
    */
    it('testUnregister003', 0, async function(done) {
        try {
            continuationManager.unregister(300, function (err, data) {
                expect(err.code == 29360208).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister003 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0400
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 004
    */
     it('testUnregister004', 0, async function(done) {
        try {
            continuationManager.unregister(300, function (data) {
                expect(data.code == 29360208).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    
    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0500
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 005
    */
     it('testUnregister005', 0, async function(done) {
        try {
            continuationManager.unregister(token, function (data) {
                console.info("testUnregister005 " + JSON.stringify(data));
                expect(data.code == 0).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0600
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 006
    */
    it('testUnregister006', 0, async function(done) {
        try {
            continuationManager.unregister(token).then((data) => {
                console.info("testUnregister006 " + JSON.stringify(data));
                expect(data.code == 0).assertTrue();
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testUnregister006 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0100
     * @tc.name [JS-API9]ContinuationManager.unregisterContinuation().
     * @tc.desc Test Js Api ContinuationManager.unregisterContinuation() testcase 001
     */
    it('testUnregisterContinuation001', 0, async function(done) {
        try {
            continuationManager.unregisterContinuation(token, function (err, data) {
                expect(err.code == 0).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregisterContinuation001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0200
     * @tc.name [JS-API9]ContinuationManager.unregisterContinuation().
     * @tc.desc Test Js Api ContinuationManager.unregisterContinuation() testcase 002
     */
    it('testUnregisterContinuation002', 0, async function(done) {
        try {
            continuationManager.unregisterContinuation("invalid token", function (err, data) {
                console.info("testUnregisterContinuation002 " + data);
                expect(err.code == 401).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregisterContinuation002 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0300
    * @tc.name [JS-API9]ContinuationManager.unregisterContinuation().
    * @tc.desc Test Js Api ContinuationManager.unregisterContinuation() testcase 003
    */
    it('testUnregisterContinuation003', 0, async function(done) {
        try {
            continuationManager.unregisterContinuation(300, function (err, data) {
                expect(err.code == 16600002).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregisterContinuation003 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0400
    * @tc.name [JS-API9]ContinuationManager.unregisterContinuation().
    * @tc.desc Test Js Api ContinuationManager.unregisterContinuation() testcase 004
    */
    it('testUnregisterContinuation004', 0, async function(done) {
        try {
            continuationManager.unregisterContinuation(300, function (data) {
                expect(data.code == 16600002).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregisterContinuation004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    
    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0500
    * @tc.name [JS-API9]ContinuationManager.unregisterContinuation().
    * @tc.desc Test Js Api ContinuationManager.unregisterContinuation() testcase 005
    */
    it('testUnregisterContinuation005', 0, async function(done) {
        try {
            continuationManager.unregisterContinuation(token, function (data) {
                console.info("testUnregisterContinuation005 " + JSON.stringify(data));
                expect(data.code == 0).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregisterContinuation005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTERCONTINUATION_0600
    * @tc.name [JS-API8]ContinuationManager.unregisterContinuation().
    * @tc.desc Test Js Api ContinuationManager.unregisterContinuation() testcase 006
    */
     it('testUnregisterContinuation006', 0, async function(done) {
        try {
            continuationManager.unregisterContinuation(token).then((data) => {
                console.info("testUnregisterContinuation006 " + JSON.stringify(data));
                expect(data.code == 0).assertTrue();
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testUnregisterContinuation006 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0100
     * @tc.name [JS-API8]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 001
     */
    it('testOn001', 0, async function(done) {
        try {
            continuationManager.on("deviceConnect", function (data) {
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOn001 " + e);
            expect(e.toString().includes("must be 3")).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0200
     * @tc.name [JS-API8]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 002
     */
    it('testOn002', 0, async function(done) {
        try {
            continuationManager.on("deviceDisconnect", function (data) {
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOn002 " + e);
            expect(e.toString().includes("must be 3")).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0300
     * @tc.name [JS-API9]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 003
     */
    it('testOn003', 0, async function(done) {
        try {
            continuationManager.on("deviceSelected", "invalid token", function (data) {
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testOn003 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0400
     * @tc.name [JS-API9]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 004
     */
    it('testOn004', 0, async function(done) {
        try {
            continuationManager.on("deviceUnselected", "invalid token", function (data) {
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testOn004 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0100
     * @tc.name [JS-API8]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 001
     */
    it('testOff001', 0, async function(done) {
        try {
            continuationManager.off("deviceConnect", function (data) {
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOff001 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0200
     * @tc.name [JS-API8]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 002
     */
    it('testOff002', 0, async function(done) {
        try {
            continuationManager.off("deviceDisconnect", function (data) {
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOff002 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0300
     * @tc.name [JS-API9]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 003
     */
    it('testOff003', 0, async function(done) {
        try {
            continuationManager.off("deviceSelected", "invalid token");
            done();
        } catch (e) {
            console.info("testOff003 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0400
     * @tc.name [JS-API9]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 004
     */
    it('testOff004', 0, async function(done) {
        try {
            continuationManager.off("deviceUnselected", "invalid token");
            done();
        } catch (e) {
            console.info("testOff004 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0100
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 001
     */
    it('testStartDeviceManager001', 0, async function(done) {
        try {
            continuationManager.startDeviceManager(token, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0200
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 002
     */
     it('testStartDeviceManager002', 0, async function(done) {
        try {
            continuationManager.startDeviceManager(null, function (err, data) {
                expect(err.code == -1).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0300
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 003
     */
    it('testStartDeviceManager003', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(null, continuationExtraParams, function (err, data) {
                expect(err.code == -1).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager003 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0400
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 004
     */
    it('testStartDeviceManager004', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(52, continuationExtraParams, function (err, data) {
                console.info("testStartDeviceManager004 " + err.code);
                expect(err.code == 29360208).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0500
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 005
     */
    it('testStartDeviceManager005', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 30,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                console.info("testStartDeviceManager005 " + err.code);
                expect(err.code == 29360216).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0600
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 006
     */
    it('testStartDeviceManager006', 0, async function(done) {
        try {
            let continuationExtraParams = {
            };
            continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                console.info("testStartDeviceManager006 " + err.code);
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager006 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0700
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 007
     */
    it('testStartDeviceManager007', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager007 " + e);
            expect(null).assertFail();
            done();
        }
    })
    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0800
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 008
     */
     it('testStartDeviceManager008', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(token, continuationExtraParams).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager008 " + e);
            expect(null).assertFail();
            done();
        }
    })

        
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0900
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 009
     */
     it('testStartDeviceManager009', 0, async function(done) {
        try {
            continuationManager.startDeviceManager(token).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager009 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0100
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 001
     */
    it('testStartContinuationDeviceManager001', 0, async function(done) {
        try {
            continuationManager.startContinuationDeviceManager(token, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0200
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 002
     */
    it('testStartContinuationDeviceManager002', 0, async function(done) {
        try {
            continuationManager.startContinuationDeviceManager("invalid token", function (err, data) {
                expect(err.code == 401).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager002 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0300
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 003
     */
    it('testStartContinuationDeviceManager003', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startContinuationDeviceManager("invalid token", continuationExtraParams, function (err, data) {
                expect(err.code == 401).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager003 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0400
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 004
     */
    it('testStartContinuationDeviceManager004', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startContinuationDeviceManager(52, continuationExtraParams, function (err, data) {
                console.info("testStartContinuationDeviceManager004 " + err.code);
                expect(err.code == 16600002).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0500
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 005
     */
    it('testStartContinuationDeviceManager005', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 30,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startContinuationDeviceManager(token, continuationExtraParams, function (err, data) {
                console.info("testStartContinuationDeviceManager005 " + err.code);
                expect(err.code == 401).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0600
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 006
     */
    it('testStartContinuationDeviceManager006', 0, async function(done) {
        try {
            let continuationExtraParams = {
            };
            continuationManager.startContinuationDeviceManager(token, continuationExtraParams, function (err, data) {
                console.info("testStartContinuationDeviceManager006 " + err.code);
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager006 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0700
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 007
     */
    it('testStartContinuationDeviceManager007', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startContinuationDeviceManager(token, continuationExtraParams, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager007 " + e);
            expect(null).assertFail();
            done();
        }
    })
    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0800
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 008
     */
    it('testStartContinuationDeviceManager008', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startContinuationDeviceManager(token, continuationExtraParams).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager008 " + e);
            expect(null).assertFail();
            done();
        }
    })

        
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0900
     * @tc.name [JS-API9]ContinuationManager.startContinuationDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startContinuationDeviceManager() testcase 009
     */
    it('testStartContinuationDeviceManager009', 0, async function(done) {
        try {
            continuationManager.startContinuationDeviceManager(token).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartContinuationDeviceManager009 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0100
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 001
     */
    it('testUpdateConnectStatus001', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus001 " + e);
            expect(null).assertFail();  
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0200
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 002
     */
    it('testUpdateConnectStatus002', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(null, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                console.info("testUpdateConnectStatus002 " + err.code);
                expect(err.code == -1).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0300
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 003
     */
    it('testUpdateConnectStatus003', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, -2, function (err, data) {
                console.info("testUpdateConnectStatus003 " + err.code);
                expect(err.code == 29360215).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus003 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0400
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 004
     */
     it('testUpdateConnectStatus004', 0, async function(done) {
        try {
            console.info('testUpdateConnectStatus004 begin');
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.IDLE).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus004 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0500
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 005
     */
     it('testUpdateConnectStatus005', 0, async function(done) {
        try {
            console.info('testUpdateConnectStatus005 begin');
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.CONNECTING).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus005 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0600
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 006
     */
     it('testUpdateConnectStatus006', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.DISCONNECTING).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus006 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0100
     * @tc.name [JS-API9]ContinuationManager.updateContinuationState().
     * @tc.desc Test Js Api ContinuationManager.updateContinuationState() testcase 001
     */
    it('testUpdateContinuationState001', 0, async function(done) {
        try {
            continuationManager.updateContinuationState(token, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateContinuationState001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0200
     * @tc.name [JS-API9]ContinuationManager.updateContinuationState().
     * @tc.desc Test Js Api ContinuationManager.updateContinuationState() testcase 002
     */
    it('testUpdateContinuationState002', 0, async function(done) {
        try {
            continuationManager.updateContinuationState("invalid token", TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                console.info("testUpdateContinuationState002 " + err.code);
                expect(err.code == 401).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateContinuationState002 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0300
     * @tc.name [JS-API9]ContinuationManager.updateContinuationState().
     * @tc.desc Test Js Api ContinuationManager.updateContinuationState() testcase 003
     */
    it('testUpdateContinuationState003', 0, async function(done) {
        try {
            continuationManager.updateContinuationState(token, TEST_DEVICE_ID, -2, function (err, data) {
                console.info("testUpdateContinuationState003 " + err.code);
                expect(err.code == 401).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateContinuationState003 " + e);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0400
     * @tc.name [JS-API9]ContinuationManager.updateContinuationState().
     * @tc.desc Test Js Api ContinuationManager.updateContinuationState() testcase 004
     */
     it('testUpdateContinuationState004', 0, async function(done) {
        try {
            console.info('testUpdateContinuationState004 begin');
            continuationManager.updateContinuationState(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.IDLE).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateContinuationState004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0500
     * @tc.name [JS-API9]ContinuationManager.updateContinuationState().
     * @tc.desc Test Js Api ContinuationManager.updateContinuationState() testcase 005
     */
    it('testUpdateContinuationState005', 0, async function(done) {
        try {
            console.info('testUpdateContinuationState005 begin');
            continuationManager.updateContinuationState(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.CONNECTING).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateContinuationState005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0600
     * @tc.name [JS-API9]ContinuationManager.updateContinuationState().
     * @tc.desc Test Js Api ContinuationManager.updateContinuationState() testcase 006
     */
    it('testUpdateContinuationState006', 0, async function(done) {
        try {
            continuationManager.updateContinuationState(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.DISCONNECTING).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 16600002).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateContinuationState006 " + e);
            expect(null).assertFail();
            done();
        }
    })

})}
