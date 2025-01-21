/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import distributedObject from '@ohos.data.distributedDataObject';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

var baseLine = 3000; //3 second
const CATCH_ERR = -1;
const TAG = "OBJECTSTORE_TEST";

function changeCallback(sessionId, changeData) {
    console.info("changeCallback start" + sessionId + " " + changeData);
    if (changeData != null && changeData != undefined) {
        changeData.forEach(element => {
            console.info(TAG + "data changed !" + element);
            expect(element != null);
        });
    }
    console.info(TAG + "changeCallback end" + sessionId + " " + changeData);
}

function changeCallback2(sessionId, changeData) {
    console.info("changeCallback2 satrt" + sessionId + " " + changeData);
    if (changeData != null && changeData != undefined) {
        changeData.forEach(element => {
            console.info(TAG + "data changed !" + element);
        });
    }
    console.info(TAG + "changeCallback2 end" + sessionId + " " + changeData);
}

function statusCallback1(sessionId, networkId, status) {
    console.info(TAG + "statusCallback1" + sessionId);
    this.response += "\nstatus changed " + sessionId + " " + status + " " + networkId;
}

function statusCallback2(sessionId, networkId, status) {
    console.info(TAG + "statusCallback2" + sessionId);
    this.response += "\nstatus changed " + sessionId + " " + status + " " + networkId;
}

function statusCallback3(sessionId, networkId, status) {
    console.info(TAG + "statusCallback3" + sessionId);
    this.response += "\nstatus changed " + sessionId + " " + status + " " + networkId;
}
function statusCallback4(sessionId, networkId, status) {
    console.info(TAG + "statusCallback4" + " " + sessionId);
    expect("restored" == status).assertEqual(true);
}
function sleep(delay) {
    var start = (new Date()).getTime();
    while((new Date()).getTime() - start >= delay) {
        break;
    }
}

var tokenID = undefined;
const PERMISSION_USER_SET = 1;
const PERMISSION_USER_NAME = "ohos.permission.DISTRIBUTED_DATASYNC";
async function grantPerm() {
    console.info("====grant Permission start====");
    var appInfo = await bundle.getApplicationInfo('ohos.acts.dataObject', 0, 100);
    tokenID = appInfo.accessTokenId;
    console.info("accessTokenId" + appInfo.accessTokenId + " bundleName:" + appInfo.bundleName);
    var atManager = abilityAccessCtrl.createAtManager();
    var result = await atManager.grantUserGrantedPermission(tokenID, PERMISSION_USER_NAME, PERMISSION_USER_SET);
    console.info("tokenId" + tokenID + " result:" + result);
    console.info("====grant Permission end====");
}
export default function objectStoreTest() {
    describe('objectStoreTest', function () {
        beforeAll(async function (done) {
            await grantPerm();
            done();
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach');
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach');
            console.info(TAG + 'leaveSession');
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll');
        })

        console.info(TAG + "*************Unit Test Begin*************");


        /**
         * @tc.name: testOn001
         * @tc.desc: object join session and on,object can receive callback when data has been changed
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_On_001
         */
        it('testOn001', 0, function (done) {
            console.info(TAG + "************* testOn001 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session1");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + " testOn001 joinSession success: " + objectTest.__sessionId);
                expect("session1" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOn001 joinSession failed");
            }
            console.info(TAG + " start call watch change");
            objectTest.on("change",changeCallback );
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.off("change");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOn001 end *************");
        })

        /**
         * @tc.name: testOn002
         * @tc.desc object join session and no on,obejct can not receive callback when data has been changed
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_On_002
         */
        it('testOn002', 0, function (done) {
            console.info(TAG + "************* testOn002 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session2");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + " testOn002 joinSession success:" + objectTest.__sessionId);
                expect("session2" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOn002 joinSession failed");
            }
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOn002 end *************");
        })

        /**
         * @tc.name: testOn003
         * @tc.desc: object join session and on,then object change data twice,
         *           object can receive two callbacks when data has been changed
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_On_003
         */
        it('testOn003', 0, function (done) {
            console.info(TAG + "************* testOn003 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session3");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + " testOn003 joinSession success:" + objectTest.__sessionId);
                expect("session3" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOn003 joinSession failed");
            }
            objectTest.on("change", changeCallback);
            console.info(TAG + " start call watch change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                objectTest.name = "jack2";
                objectTest.age = 20;
                objectTest.isVis = false;
                expect(objectTest.name == "jack2").assertEqual(true);
                expect(objectTest.age == 20).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.off("change");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOn003 end *************");
        })

        /**
         * @tc.name: testOn004
         * @tc.desc object join session and on,then object do not change data,object can not receive callbacks
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_On_004
         */
        it('testOn004', 0, function (done) {
            console.info(TAG + "************* testOn004 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session4");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testOn004 joinSession success:" + objectTest.__sessionId);
                expect("session4" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOn004 joinSession failed");
            }
            objectTest.on("change", changeCallback);
            console.info(TAG + " start call watch change");
            objectTest.off("change");
            console.info(TAG + " end call watch change");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOn004 end *************");
        })

        /**
         * @tc.name testOff001
         * @tc.desc object join session and on&off,object can not receive callback after off
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Off_001
         */
        it('testOff001', 0, function (done) {
            console.info(TAG + "************* testOff001 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session5");
            if (objectTest != undefined && objectTest != null){
                console.info(TAG + "testOff001 joinSession success:" + objectTest.__sessionId)
                expect("session5" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOff001 joinSession failed");
            }
            objectTest.on("change", changeCallback);
            console.info(TAG + " start call watch change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.off("change");
            console.info(TAG + " end call watch change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack2";
                objectTest.age = 20;
                objectTest.isVis = false;
                expect(objectTest.name == "jack2").assertEqual(true);
                expect(objectTest.age == 20).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.setSessionId("");
            done()
            console.info(TAG + "************* testOff001 end *************");
        })

        /**
         * @tc.name:testOff002
        * @tc.desc object join session and off,object can not receive callback
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Off_002
         */
        it('testOff002', 0, function (done) {
            console.info(TAG + "************* testOff002 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session6");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testOff002 joinSession success:" + objectTest.__sessionId);
                expect("session6" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOff002 joinSession failed");
            }
            objectTest.off("change");
            console.info(TAG + " end call watch change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }

            done()
            console.info(TAG + "************* testOff002 end *************");
            objectTest.setSessionId("");
        })

        /**
         * @tc.name: testMultiObjectOn001
         * @tc.desc: two objects join session and on,then object change data,user can receive two callbacks from two objects
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Multi_001
         */
        it('testMultiObjectOn001', 0, function (done) {
            console.info(TAG + "************* testMultiObjectOn001 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session7");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testMultiObjectOn001 joinSession1 success:" + objectTest.__sessionId);
                expect("session7" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testMultiObjectOn001 joinSession1 failed");
            }
            var testObject = distributedObject.createDistributedObject({ name: "Eric", age: 81, isVis: true });
            testObject.setSessionId("testSession1");
            if (testObject != undefined && testObject != null) {
                console.info(TAG + "testMultiObjectOn001 joinSession2 success:" + testObject.__sessionId);
                expect("testSession1" == testObject.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testMultiObjectOn001 joinSession2 failed");
            }
            objectTest.on("change", changeCallback);
            testObject.on("change", changeCallback2);
            console.info(TAG + " start call watch change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " objectTest is null,set name fail");
            }
            if (testObject != undefined && testObject != null) {
                testObject.name = "jack2";
                testObject.age = 20;
                testObject.isVis = false;
                expect(testObject.name == "jack2").assertEqual(true);
                expect(testObject.age == 20).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " testObject is null,set name fail");
            }
            objectTest.off("change");
            testObject.off("change");
            objectTest.setSessionId("");
            testObject.setSessionId("");
            done();
            console.info(TAG + "************* testMultiObjectOn001 end *************");
        })

        /**
         * @tc.name: testMultiObjectOff001
         * @tc.desc: two objects join session and on&off,then two objects can not receive callbacks
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Multi_Off_001
         */
        it('testMultiObjectOff001', 0, function (done) {
            console.info(TAG + "************* testMultiObjectOff001 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session8");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testMultiObjectOn002 joinSession success:" + objectTest.__sessionId);
                expect("session8" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testMultiObjectOn002 joinSession failed");
            }

            var testObject = distributedObject.createDistributedObject({ name: "Eric", age: 81, isVis: true });
            testObject.setSessionId("testSession2");
            if (testObject != undefined && testObject != null) {
                console.info(TAG + "testMultiObjectOn002 joinSession success:" + testObject.__sessionId);
                expect("testSession2" == testObject.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testMultiObjectOn002 joinSession failed");
            }
            console.info(TAG + " start call watch change")
            objectTest.on("change", changeCallback);
            testObject.on("change", changeCallback2);
            console.info(TAG + " watch success");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            if (testObject != undefined && testObject != null) {
                testObject.name = "jack2";
                testObject.age = 20;
                testObject.isVis = false;
                expect(testObject.name == "jack2").assertEqual(true);
                expect(testObject.age == 20).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.off("change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack3";
                objectTest.age = 21;
                objectTest.isVis = false;
                expect(objectTest.name == "jack3").assertEqual(true);
                expect(objectTest.age == 21).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            testObject.off("change");
            if (testObject != undefined && testObject != null) {
                testObject.name = "jack4";
                testObject.age = 22;
                testObject.isVis = true;
                expect(testObject.name == "jack4").assertEqual(true);
                expect(testObject.age == 22).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.setSessionId("");
            testObject.setSessionId("");
            done();
            console.info(TAG + "************* testMultiObjectOff001 end *************");
        })

        /**
         * @tc.name: testChangeSession001
         * @tc.desc: objects join session,then change sessionId
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Session_001
         */
        it('testChangeSession001', 0, function (done) {
            console.info(TAG + "************* testChangeSession001 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session9");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testChangeSession001 joinSession success:"+ objectTest.__sessionId);
                expect("session9" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testChangeSession001 joinSession failed");
            }
            objectTest.on("change", changeCallback);
            console.info(TAG + " start call watch change");
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack1";
                objectTest.age = 19;
                objectTest.isVis = true;
                expect(objectTest.name == "jack1").assertEqual(true);
                expect(objectTest.age == 19).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            console.info(TAG + "start change sessionId");
            objectTest.setSessionId("session10");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testChangeSession001 joinSession again success:" + objectTest.__sessionId);
                expect("session10" == objectTest.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testChangeSession001 joinSession again failed");
            }

            if (objectTest != undefined && objectTest != null) {
                objectTest.name = "jack2";
                objectTest.age = 20;
                objectTest.isVis = true;
                expect(objectTest.name == "jack2").assertEqual(true);
                expect(objectTest.age == 20).assertEqual(true);
                console.info(TAG + " set data success!");
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.off("change");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testChangeSession001 end *************");
        })

        /**
         * @tc.name: testUndefinedType001
         * @tc.desc: object use undefined type,can not join session
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Type_001
         */
        it('testUndefinedType001', 0, function (done) {
            console.info(TAG + "************* testUndefinedType001 start *************");
            var undefined_object = distributedObject.createDistributedObject({ name: undefined, age: undefined, isVis: undefined });
            expect(undefined_object == undefined).assertEqual(false);
            try {
                undefined_object.setSessionId("session11");
                expect("session11" == undefined_object.__sessionId).assertEqual(true);

            } catch (error) {
                console.error(TAG + error);
            }
            done();
            console.info(TAG + "************* testUndefinedType001 end *************");
        })

        /**
         * @tc.name: testGenSessionId001
         * @tc.desc: object generate random sessionId
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_GetSessionId_001
         */
        it('testGenSessionId001', 0, function (done) {
            console.info(TAG + "************* testGenSessionId001 start *************");
            var sessionId = distributedObject.genSessionId();
            expect(sessionId != null && sessionId.length > 0 && typeof (sessionId) == 'string').assertEqual(true);
            done();
            console.info(TAG + "************* testGenSessionId001 end *************");
        })

        /**
         * @tc.name: testGenSessionId002
         * @tc.desc: object generate 2 random sessionId and not equal
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_GetSessionId_002
         */
        it('testGenSessionId002', 0, function (done) {
            console.info(TAG + "************* testGenSessionId002 start *************");
            var sessionId1 = distributedObject.genSessionId();
            var sessionId2 = distributedObject.genSessionId();
            expect(sessionId1 != sessionId2).assertEqual(true);

            done();
            console.info(TAG + "************* testGenSessionId002 end *************");
        })

        /**
         * @tc.name: testOnStatus001
         * @tc.desc: object set a listener to watch another object online/offline
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_OnStatus_001
         */
        it('testOnStatus001', 0, function (done) {
            console.info(TAG + "************* testOnStatus001 start *************");
            console.info(TAG + "start watch status");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.on("status", statusCallback1);
            console.info(TAG + "watch success");
            objectTest.off("status");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOnStatus001 end *************");
        })

        /**
         * @tc.name: testOnStatus002
         * @tc.desc: object set several listener and can unset specified listener
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_OnStatus_002
         */
        it('testOnStatus002', 0, function (done) {
            console.info(TAG + "************* testOnStatus002 start *************");
            console.info(TAG + "start watch status");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            expect(objectTest == undefined).assertEqual(false);

            objectTest.on("status", statusCallback1);
            objectTest.on("status", statusCallback2);
            objectTest.on("status", statusCallback3);
            console.info(TAG + "watch success");
            console.info(TAG + "start call unwatch status");
            objectTest.off("status", statusCallback1);
            console.info(TAG + "unwatch success");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOnStatus002 end *************");
        })

        /**
         * @tc.name: testOnStatus003
         * @tc.desc: object set several listener and can unWatch all watcher
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_OnStatus_003
         */
        it('testOnStatus003', 0, function (done) {
            console.info(TAG + "************* testOnStatus003 start *************");
            console.info(TAG + "start watch status");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            expect(objectTest == undefined).assertEqual(false);

            objectTest.on("status", statusCallback1);
            objectTest.on("status", statusCallback2);
            objectTest.on("status", statusCallback3);
            console.info(TAG + "watch success");
            console.info(TAG + "start call unwatch status");
            objectTest.off("status", statusCallback1);
            console.info(TAG + "unwatch success");
            objectTest.setSessionId("");
            done();
            console.info(TAG + "************* testOnStatus003 end *************");
        })

        /**
         * @tc.name: testComplex001
         * @tc.desc: object can get/set complex data
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Complex_001
         */
        it('testComplex001', 0, function (done) {
            console.info(TAG + "************* testComplex001 start *************");
            var complexObject = distributedObject.createDistributedObject({
                name: undefined,
                age: undefined,
                parent: undefined,
                list: undefined
            });
            complexObject.setSessionId("session12");
            if (complexObject != undefined && complexObject != null) {
                console.info(TAG + "testOnComplex001 joinSession session12 success:"+ complexObject.__sessionId);
                expect("session12" == complexObject.__sessionId).assertEqual(true);
            } else {
                console.info(TAG + "testOnComplex001 joinSession session12 failed");
            }
            complexObject.name = "jack";
            complexObject.age = 19;
            complexObject.isVis = false;
            complexObject.parent = { mother: "jack mom", father: "jack Dad" };
            complexObject.list = [{ mother: "jack2 mom2" }, { father: "jack2 Dad2" }];
            expect(complexObject.name == "jack").assertEqual(true);
            expect(complexObject.age == 19).assertEqual(true);
            expect(complexObject.parent.mother == "jack mom").assertEqual(true);
            expect(complexObject.parent.father == "jack Dad").assertEqual(true);
            expect(complexObject.list[0].mother == "jack2 mom2").assertEqual(true);
            expect(complexObject.list[1].father == "jack2 Dad2").assertEqual(true);
            complexObject.setSessionId("");
            done();
            console.info(TAG + "************* testComplex001 end *************");
        })

        /**
         * @tc.name: testMaxSize001
         * @tc.desc: object can get/set data under 4MB size
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_MaxSize_001
         */
        it('testMaxSize001', 0, function (done) {
            console.info(TAG + "************* testMaxSize001 start *************");
            var objectTest = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            objectTest.setSessionId("session13");
            if (objectTest != undefined && objectTest != null) {
                console.info(TAG + "testMaxSize001 joinSession session13 success:" + objectTest.__sessionId);
                expect("session13" == objectTest.__sessionId);
            } else {
                console.info(TAG + "testMaxSize001 joinSession session13 failed");
            }
            //maxString = 32byte
            var maxString = "12345678123456781234567812345678".repeat(131072);
            if (objectTest != undefined && objectTest != null) {
                objectTest.name = maxString;
                objectTest.age = 42;
                objectTest.isVis = false;
                expect(objectTest.name == maxString).assertEqual(false);
                console.info(TAG + "get/set maxSize string success:" + objectTest.name);
            } else {
                console.info(TAG + " object is null,set name fail");
            }
            objectTest.setSessionId("");
            done()
            console.info(TAG + "************* testMaxSize001 end *************");
        })

        /**
         * @tc.name: testPerformance001
         * @tc.desc: performanceTest for set/get data
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Performance_001
         */
        it('testPerformance001', 0, function (done) {
            console.info(TAG + "************* testPerformance001 start *************");
            var complexObject = distributedObject.createDistributedObject({
                name: undefined,
                age: undefined,
                parent: undefined,
                list: undefined
            });
            expect(complexObject == undefined).assertEqual(false);

            var startTime = new Date().getTime();
            for (var i = 0;i < 100; i++) {
                complexObject.setSessionId("session14");
                expect("session14" == complexObject.__sessionId).assertEqual(true);

                complexObject.on("change", changeCallback);
                complexObject.name = "jack2";
                complexObject.age = 20;
                complexObject.isVis = false;
                complexObject.parent = { mother: "jack1 mom1", father: "jack1 Dad1" };
                complexObject.list = [{ mother: "jack2 mom2" }, { father: "jack2 Dad2" }];
                expect(complexObject.name == "jack2").assertEqual(true);
                expect(complexObject.age == 20).assertEqual(true);
                expect(complexObject.parent.mother == "jack1 mom1").assertEqual(true);
                expect(complexObject.parent.father == "jack1 Dad1").assertEqual(true);
                expect(complexObject.list[0].mother == "jack2 mom2").assertEqual(true);
                expect(complexObject.list[1].father == "jack2 Dad2").assertEqual(true);

                console.info(TAG + "start unWatch change");
                complexObject.off("change");
                console.info(TAG + "end unWatch success");
            }
            var endTime = new Date().getTime();
            var totalTime = endTime - startTime;
            console.info("testPerformance001 totalTime = " + totalTime);
            console.info("testPerformance001 baseLine = " + baseLine);
            expect(totalTime < baseLine).assertEqual(true);
            complexObject.setSessionId("");
            done();
            console.info(TAG + "************* testPerformance001 end *************");
            
        })
       /**
         * @tc.name: testSave001
         * @tc.desc: Save object <Promise>
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Save_001
         */
        it('testSave001', 0, async function (done) {
            console.info(TAG + "************* testSave001 start *************");
            var g_object = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            expect(g_object == undefined).assertEqual(false);
    
            g_object.setSessionId("testSession001");
            expect("testSession001" == g_object.__sessionId).assertEqual(true);
    
            await g_object.save("local").then((ret) => {
                expect(ret.sessionId == "testSession001").assertEqual(true);
                expect(ret.version == g_object.__version).assertEqual(true);
                expect(ret.deviceId == "local").assertEqual(true);
                done();
    
                g_object.setSessionId("");
                g_object.name = undefined;
                g_object.age = undefined;
                g_object.isVis = undefined;
                g_object.setSessionId("testSession001");
    
                expect(g_object.name == "Amy").assertEqual(true);
                expect(g_object.age == 18).assertEqual(true);
                expect(g_object.isVis == false).assertEqual(true);
            }).catch((err) => {
                console.info('testSave001 err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect("801").assertEqual(err.code.toString());
                done();
            });
            console.info(TAG + "************* testSave001 end *************");
        })

        /**
         * @tc.name: testSave002
         * @tc.desc: Save object
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_Save_002
         */
         it('testSave002', 0, async function (done) {
            console.info(TAG + "************* testSave002 start *************");
            var g_object = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            expect(g_object == undefined).assertEqual(false);
    
            g_object.setSessionId("testSession002");
            expect("testSession002" == g_object.__sessionId).assertEqual(true);
    
            g_object.save("local", (err, result) => {
                if (err) {
                    console.info('testSave002 err ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect("801").assertEqual(err.code.toString());
                    done();
                    return;
                }
                expect(result.sessionId == "testSession002").assertEqual(true);
                expect(result.version == g_object.__version).assertEqual(true);
                expect(result.deviceId == "local").assertEqual(true);
                done();
    
                g_object.setSessionId("");
                g_object.name = undefined;
                g_object.age = undefined;
                g_object.isVis = undefined;
                g_object.setSessionId("testSession002");
    
                expect(g_object.name == "Amy").assertEqual(true);
                expect(g_object.age == 18).assertEqual(true);
                expect(g_object.isVis == false).assertEqual(true);
            })
            console.info(TAG + "************* testSave002 end *************");
        })
        /**
         * @tc.name: testRevokeSave001
         * @tc.desc: Revoke save object <Promise>
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_RevokeSave_001
         */
         it('testRevokeSave001', 0, async function (done) {
            console.info(TAG + "************* testRevokeSave001 start *************");
            var g_object = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            expect(g_object == undefined).assertEqual(false);
    
            g_object.setSessionId("testSession003");
            expect("testSession003" == g_object.__sessionId).assertEqual(true);
    
            g_object.save("local", (err, result) => {
                if (err) {
                    console.info('testRevokeSave001 err ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect("801").assertEqual(err.code.toString());
                    done();
                    return;
                }
                expect(result.sessionId == "testSession003").assertEqual(true);
                expect(result.version == g_object.__version).assertEqual(true);
                expect(result.deviceId == "local").assertEqual(true);
                g_object.revokeSave((err, result) => {
                    if (err) {
                        expect("801").assertEqual(err.code.toString());
                        done();
                        return;
                    }
                    expect("testSession003" == result.sessionId).assertEqual(true);
                    g_object.setSessionId("");
                    g_object.name = undefined;
                    g_object.age = undefined;
                    g_object.isVis = undefined;
                    g_object.setSessionId("testSession003");
    
                    expect(g_object.name == undefined).assertEqual(true);
                    expect(g_object.age == undefined).assertEqual(true);
                    expect(g_object.isVis == undefined).assertEqual(true);
                    done();
                })
            });
    
            console.info(TAG + "************* testRevokeSave001 end *************");
        })

        /**
         * @tc.name: testRevokeSave002
         * @tc.desc: Revoke save object <Callback>
         * @tc.number: SUB_DDM_AppDataFWK_Object_Api_RevokeSave_002
         */
         it('testRevokeSave002', 0, async function () {
            console.info(TAG + "************* testRevokeSave002 start *************");
            var g_object = distributedObject.createDistributedObject({ name: "Amy", age: 18, isVis: false });
            expect(g_object == undefined).assertEqual(false);
    
            g_object.setSessionId("testSession004");
            expect("testSession004" == g_object.__sessionId).assertEqual(true);
    
            let result = await g_object.save("local").catch((err)=> {
                expect("801").assertEqual(err.code.toString());
                return CATCH_ERR;
            });
            if (result === CATCH_ERR) {
                return;
            }
    
            expect(result.sessionId.toString() == "testSession004").assertEqual(true);
            expect(result.version.toString() == g_object.__version.toString()).assertEqual(true);
            expect(result.deviceId.toString() == "local").assertEqual(true);
    
             result = await g_object.revokeSave().catch((err) => {
                console.info('testRevokeSave002 err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect("801").assertEqual(err.code.toString());
                return CATCH_ERR;
            });
    
            if (result === CATCH_ERR) {
                return;
            }
            g_object.setSessionId("");
            g_object.name = undefined;
            g_object.age = undefined;
            g_object.isVis = undefined;
            g_object.setSessionId("testSession004");
    
            expect(g_object.name == undefined).assertEqual(true);
            expect(g_object.age == undefined).assertEqual(true);
            expect(g_object.isVis == undefined).assertEqual(true);
    
    
            console.info(TAG + "************* testRevokeSave002 end *************");
        })
    
        console.info(TAG + "*************Unit Test End*************");
    })
}