/*
* Copyright (c) 2022-2023 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import storage from '@system.storage';

const TAG = '[SYSTEM_STORAGE_JSKITS_TEST]'

export default function SystemStorageJsunit(){
    describe('systemStorageTest', function () {
        beforeAll(function () {
            console.info(TAG + 'beforeAll')
        })

        beforeEach(function () {
            console.info(TAG + 'beforeEach')
        })

        afterEach(async function (done) {
            console.info(TAG + 'afterEach')
            let promise = await storage.clear({
                success: function (data) {
                    console.info("Succeeded in clearing.");
                    expect(data!=undefined).assertTrue();
                    done();
                },
                fail: function (data, errCode) {
                    console.info("Failed to clearr");
                    expect(false).assertTrue();
                    done();
                }
            });
            done();
        })

        afterAll(function () {
            console.info(TAG + 'afterAll')
        })

        /**
         * @tc.name testSet001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_1200
         * @tc.desc set and can get correct value in success callback, finally get complete callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testSet001 start *************');
            let completeRet = false;
            let successRet = false;
            let promise1 = await storage.set({
                key: 'storageKey',
                value: 'testVal',
                success: async function () {
                    successRet = true;
                    await expect(successRet).assertTrue();
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            });
            let promise2 = await storage.get({
                key: 'storageKey',
                success: async function (data) {
                    await expect(data).assertEqual('testVal');
                }
            })

            await expect(successRet).assertTrue();
            await expect(completeRet).assertTrue();
            done();

            console.info(TAG + '************* testSet001 end *************');
        })

        /**
         * @tc.name testSet002
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0900
         * @tc.desc set null key can receive fail callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testSet002 start *************');
            let testData = undefined;
            let testErrCode = undefined;
            let compelteRet = false;
            let promise = await storage.set({
                key: '',
                value: 'testValue',
                success: async function () {
                    await expect(false).assertTrue();
                },
                fail: async function (data, errCode) {
                    testData = data;
                    testErrCode = errCode;
                },
                complete: async function () {
                    compelteRet = true;
                    await expect(compelteRet).assertTrue();
                }
            })
            await expect("The key string is null or empty.").assertEqual(testData);
            await expect(-1006).assertEqual(testErrCode);
            await expect(compelteRet).assertTrue();

            done();

            console.info(TAG + '************* testSet002 end *************');
        })

        /**
         * @tc.name testSet003
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_1000
         * @tc.desc set key which size over 32 bytes and can receive fail callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testSet003 start *************');
            let testData = undefined;
            let testErrCode = undefined;
            let compelteRet = false;
            let promise = await storage.set({
                key: 'x'.repeat(33),
                value: 'testValue',
                success: async function () {
                    await expect(false).assertTrue();
                },
                fail: async function (data, errCode) {
                    testData = data;
                    testErrCode = errCode;
                },
                complete: async function () {
                    compelteRet = true;
                    await expect(compelteRet).assertTrue();
                }
            })
            await expect("The key string length should shorter than 32.").assertEqual(testData);
            await expect(-1016).assertEqual(testErrCode);
            await expect(compelteRet).assertTrue();

            done();

            console.info(TAG + '************* testSet003 end *************');
        })


        /**
         * @tc.name testSet004
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_1100
         * @tc.desc set value which size over 128 bytes and can receive fail callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testSet004 start *************');
            let testData = undefined;
            let testErrCode = undefined;
            let compelteRet = false;
            let promise = await storage.set({
                key: 'testKey',
                value: 'x'.repeat(129),
                success: async function () {
                    await expect(false).assertTrue();
                },
                fail: async function (data, errCode) {
                    testData = data;
                    testErrCode = errCode;
                },
                complete: async function () {
                    compelteRet = true;
                }
            })
            await expect("The value string length should shorter than 128.").assertEqual(testData);
            await expect(-1017).assertEqual(testErrCode);
            await expect(compelteRet).assertTrue();

            done();

            console.info(TAG + '************* testSet004 end *************');
        })

        /**
         * @tc.name testGet001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0800
         * @tc.desc set and can get correct value in success callback, finally receive a get complete callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testGet001 start *************');
            let completeRet = false;
            let promise1 = await storage.set({
                key: 'storageKey',
                value: 'storageVal',
                success:async function (data) {
                    console.info("Set is success.");
                    await expect(data != undefined).assertTrue();
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
            });

            let promise2 = await storage.get({
                key: 'storageKey',
                success: async function (data) {
                    await expect('storageVal').assertEqual(data);
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            });

            await expect(completeRet).assertTrue();

            done();

            console.info(TAG + '************* testGet001 end *************');
        })

        /*
         * @tc.name testGet002
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0700
         * @tc.desc get value without set any value and can get default in success callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testGet002 start *************');
            let completeRet = false;
            let promise = await storage.get({
                key: 'storageKey',
                default: '123',
                success: async function (data) {
                    await expect('123').assertEqual(data);
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            })

            await expect(completeRet).assertTrue();

            done();

            console.info(TAG + '************* testGet002 end *************');
        })


        /*
         * @tc.name testGet003
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0500
         * @tc.desc get default size over 128 and can receive fail callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testGet003 start *************');
            let testVal = undefined;
            let testData = undefined;
            let testErrCode = undefined;
            let completeRet = false;
            let failRet = false;
            let promise = await storage.get({
                key: 'storageKey',
                default: 'x'.repeat(129),
                success: async function (data) {
                    testVal = data;
                },
                fail: async function (data, errCode) {
                    testErrCode = errCode;
                    testData = data;
                    failRet = true;
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            })

            expect(failRet).assertTrue();
            expect(completeRet).assertTrue();
            expect(-1018).assertEqual(testErrCode);
            expect('The default string length should shorter than 128.').assertEqual(testData);
            expect(testVal == undefined).assertTrue();

            done();

            console.info(TAG + '************* testGet003 end *************');
        })

        /*
         * @tc.name testGet004
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0600
         * @tc.desc get null key and can return default value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testGet004 start *************');
            let testVal = undefined;
            let completeRet = false;
            let promise = await storage.get({
                key: '',
                default: 'storageVal',
                success: async function (data) {
                    await expect(data).assertEqual('storageVal');
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            })

            await expect(completeRet).assertTrue();

            done();

            console.info(TAG + '************* testGet004 end *************');
        })

        /*
         * @tc.name testDelete001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0400
         * @tc.desc delete value and can not get value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testDelete001 start *************');
            let completeRet = false;
            let successRet = false;
            let promise1 = await storage.set({
                key: 'storageKey',
                value: 'storageVal',
                success:async function (data) {
                    console.info("Set is success.");
                    await expect(data != undefined).assertTrue();
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
            })

            let promise2 = await storage.delete({
                key: "storageKey",
                success: async function () {
                    successRet = true;
                    await expect(successRet).assertTrue();
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            });

            let promise3 = await storage.get({
                key: 'storageKey',
                default: 'testVal',
                success: async function (data) {
                    await expect(data).assertEqual('testVal');
                }
            })

            await expect(completeRet).assertTrue();
            await expect(successRet).assertTrue();

            done();

            console.info(TAG + '************* testDelete001 end *************');
        })

        /*
         * @tc.name testDelete002
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0200
         * @tc.desc delete null key and can get fail callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testDelete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testDelete002 start *************');
            let testData = undefined;
            let testErrCode = undefined;
            let completeRet = false;
            let failRet = false;
            let promise1 = await storage.set({
                key: 'storageKey',
                value: 'storageVal',
                success:async function (data) {
                    console.info("Set is success.");
                    await expect(data != undefined).assertTrue();
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
            })

            let promise2 = await storage.delete({
                key: '',
                success: async function () {
                    await expect(false).assertTrue();
                },
                fail: async function (data, err) {
                    testErrCode = err;
                    testData = data;
                    failRet = true;
                },
                complete: async function () {
                    completeRet = true;
                    await expect(completeRet).assertTrue();
                }
            })

            await expect(completeRet).assertTrue();
            await expect("The key string is null or empty.").assertEqual(testData);
            await expect(-1006).assertEqual(testErrCode);
            await expect(failRet).assertTrue();

            done();

            console.info(TAG + '************* testDelete002 end *************');
        })

        /*
         * @tc.name testDelete003
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0300
         * @tc.desc delete incorrect key and can get success callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testDelete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testDelete003 start *************');
            let completeRet = false;
            let promise1 = await storage.set({
                key: 'storageKey',
                value: 'test',
                success:async function (data) {
                    console.info("Set is success.");
                    await expect(data != undefined).assertTrue();
                },
                fail: async function () {
                    await expect(false).assertTrue();
                },
            });

            let promise2 = await storage.delete({
                key: '123',
                success: async function (data) {
                    console.info("delete is success.");
                    await expect(data != undefined).assertTrue();
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
                complete: async function () {
                    completeRet = true;
                    expect(completeRet).assertTrue();
                }
            });

            let promise3 = await storage.get({
                key: 'storageKey',
                success: async function (data) {
                    await expect(data).assertEqual('test');
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                }
            })

            await expect(completeRet).assertTrue();

            done();

            console.info(TAG + '************* testDelete003 end *************');
        })

        /*
         * @tc.name testClear001
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSystemApiTest_0100
         * @tc.desc clear and can receive success callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info(TAG + '************* testClear001 start *************');
            let successRet = false;
            let compelteRet = false;
            let promise1 = await storage.set({
                key: 'storageKey1',
                value: 'storageVal1',
                success:async function (data) {
                    console.info("Set is success.");
                    await expect(data != undefined).assertTrue();
                },
                fail:async function () {
                    await expect(false).assertTrue();
                },
            });

            let promise2 = await storage.set({
                key: 'storageKey2',
                value: 'storageVal2',
                success:async function (data) {
                    console.info("Set is success.")
                    await expect(data != undefined).assertTrue();
                },
                fail:async function () {
                    await expect(false).assertTrue();
                },
            });

            let promise3 = await storage.clear({
                success:async function() {
                    successRet = true;
                    await expect(successRet).assertTrue();
                },
                fail: async function (data, err) {
                    await expect(false).assertTrue();
                },
                complete: async function () {
                    compelteRet = true;
                    await expect(compelteRet).assertTrue();
                }
            });

            await expect(successRet).assertTrue();

            done();

            console.info(TAG + '************* testClear001 end *************');
        })

    })
}