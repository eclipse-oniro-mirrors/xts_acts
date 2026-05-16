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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import factory from '@ohos.data.distributedKVStore'
import abilityFeatureAbility from '@ohos.ability.featureAbility';

var context = abilityFeatureAbility.getContext();
var contextApplication = context.getApplicationContext()

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;
const STORE_KEY = 'key_test_string';
const STORE_VALUE = 'value-test-string';
var kvStoreNew = null;
export default function KVManagerPromiseTest(){
describe('KVManagerPromiseTest', function () {
    const config = {
        bundleName: TEST_BUNDLE_NAME,
        context:context
    }

    const options = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: true,
        kvStoreType: factory.KVStoreType.SINGLE_VERSION,
        schema: '',
        securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
        console.info('beforeAll');
        kvManager = factory.createKVManager(config)
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            console.info("beforeAll getKVStore success");
            kvStoreNew = store;
            done();
        }).catch((err) => {
            console.info("beforeAll getKVStore err: "  + JSON.stringify(err));
            done();
        });

    })

    afterAll(async function (done) {
        console.info('afterAll');
        kvManager = null;
        kvStore = null;
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach');
        done();
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.info('afterEach deleteKVStore success');
                kvStore = null;
                done();
            }).catch((err) => {
                console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                done();
            });
        }).catch((err) => {
            console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            done();
        });

    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0600
     * @tc.desc   Test Js Api KVManager.GetKVStore() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0100');
        try {
            await kvManager.getKVStore(TEST_STORE_ID).then((store) => {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0100 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0100 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0100 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0700
     * @tc.desc   Test Js Api KVManager.GetKVStore() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0200');
        try {
            await kvManager.getKVStore(options).then((store) => {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0200 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0200 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0200 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0800
     * @tc.desc   Test Js Api KVManager.GetKVStore() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0300');
        const optionsInfo = {
            createIfMissing: false,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S1,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0300 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_PROMISE_0300 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(err.code == 401).assertTrue();
        });
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0100
     * @tc.desc   Test Js Api KVManager.CloseKVStore() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_PROMISE_0100');
        await kvManager.getKVStore(TEST_STORE_ID, options).then( async () => {
            console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_PROMISE_0100 getKVStore success');
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_PROMISE_0100 closeKVStore success');
                done();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_PROMISE_0100 closeKVStore twice err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
                done();
            });
        });
        
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_GETALLKVSTORE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0500
     * @tc.desc   Test Js Api KVManager.GetAllKVStoreId() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_GETALLKVSTORE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTORE_PROMISE_0100');
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
            console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTORE_PROMISE_0100 getAllKVStoreId success');
            console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTORE_PROMISE_0100 size = ' + data.length);
            expect(0).assertEqual(data.length);
            done();
        }).catch((err) => {
            console.error('SUB_DDM_DKV_KVMANAGER_GETALLKVSTORE_PROMISE_0100 getAllKVStoreId err ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
        });
        
    })
    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1400
     * @tc.desc   Test Js Api KVManager.On() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100');
            var deathCallback = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100 death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback);
            kvManager.off('distributedDataServiceDie', deathCallback);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
        
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1500
     * @tc.desc   Test Js Api KVManager.On() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200');
            var deathCallback1 = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200 death callback call');
            }
            var deathCallback2 = function () {
                console.info('death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback1);
            kvManager.on('distributedDataServiceDie', deathCallback2);
            kvManager.off('distributedDataServiceDie', deathCallback1);
            kvManager.off('distributedDataServiceDie', deathCallback2);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1800
     * @tc.desc   Test Js Api KVManager.On() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300');
            var deathCallback = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300 death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback);
            kvManager.on('distributedDataServiceDie', deathCallback);
            kvManager.off('distributedDataServiceDie', deathCallback);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0900
     * @tc.desc   Test Js Api KVManager.Off() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100');
            var deathCallback = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100 death callback call');
            }
            kvManager.off('distributedDataServiceDie', deathCallback);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1000
     * @tc.desc   Test Js Api KVManager.Off() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0200');
            var deathCallback = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0200 death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback);
            kvManager.off('distributedDataServiceDie', deathCallback);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0200 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1100
     * @tc.desc   Test Js Api KVManager.Off() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0300');
            var deathCallback1 = function () {
                console.info('death callback call');
            }
            var deathCallback2 = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0300 death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback1);
            kvManager.on('distributedDataServiceDie', deathCallback2);
            kvManager.off('distributedDataServiceDie', deathCallback1);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0300 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1200
     * @tc.desc   Test Js Api KVManager.Off() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0400');
            var deathCallback = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0400 death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback);
            kvManager.off('distributedDataServiceDie', deathCallback);
            kvManager.off('distributedDataServiceDie', deathCallback);
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0400 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1300
     * @tc.desc   Test Js Api KVManager.Off() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        try{
            console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0500');
            var deathCallback = function () {
                console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0500 death callback call');
            }
            kvManager.on('distributedDataServiceDie', deathCallback);
            kvManager.off('distributedDataServiceDie');
        } catch(e) {
            console.log(`SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0500 error.code is ${e.code},message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_PUT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1900
     * @tc.desc   Test Js Api KVStore.Put() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_PUT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_PUT_PROMISE_0100');
        try {
            await kvStoreNew.put(TEST_BUNDLE_NAME, TEST_STORE_ID).then((data) => {
                if (err != undefined){
                    console.info('SUB_DDM_DKV_KVMANAGER_PUT_PROMISE_0100 put promise fail');
                } else {
                    console.info('SUB_DDM_DKV_KVMANAGER_PUT_PROMISE_0100 put promise success');
                    expect(null).assertFail();
                }
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_PUT_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            done();
        }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0400
     * @tc.desc   Test Js Api KVManager.Delete testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100');
        try {
            kvStoreNew.put(STORE_KEY, STORE_VALUE).then((data) => {
                console.info('SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100 getKVStore success');
                kvStoreNew.delete(STORE_KEY).then((data) => {
                    console.info("testKVStoreDelete001  promise delete success");
                    expect(null).assertFail();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100 promise delete fail err' + `, error code is ${err.code}, message is ${err.message}`);
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100 promise delete fail err' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_DELETE_PROMISE_0100 promise delete fail err' + `, error code is ${err.code}, message is ${err.message}`);
        }
        done();
    })

     /**
      * @tc.name   SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100
      * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0200
      * @tc.desc   Test Js Api createKVManager testcase 001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100');
        const config = {
            bundleName: TEST_BUNDLE_NAME,
            context:context
        }
        try {
            kvManager = factory.createKVManager(config)
            kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
                console.info("testcreateKVManager001 getKVStore success");
                store.put(STORE_KEY, STORE_VALUE).then(async (data) => {
                    console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100 put data success');
                    store.get(STORE_KEY).then((data) => {
                        console.info("SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100  get data success");
                        expect(data).assertEqual(STORE_VALUE);
                        done();
                    }).catch((err) => {
                        console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100 get data err' + `, error code is ${err.code}, message is ${err.message}`);
                        expect(null).assertFail();
                    });
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100 put data err' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info("testcreateKVManager001 getKVStore err: "  + JSON.stringify(err));
                expect(null).assertFail();
            });
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0100 promise delete fail err' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }

    })

     /**
      * @tc.name   SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200
      * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0300
      * @tc.desc   Test Js Api createKVManager testcase 002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200');
        const config = {
            bundleName: TEST_BUNDLE_NAME,
            context:contextApplication
        }
        try {
            kvManager = factory.createKVManager(config)
            kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
                console.info("testcreateKVManager002 getKVStore success");
                store.put(STORE_KEY, STORE_VALUE).then(async (data) => {
                    console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200 put data success');
                    store.get(STORE_KEY).then((data) => {
                        console.info("SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200  get data success");
                        expect(data).assertEqual(STORE_VALUE);
                        done();
                    }).catch((err) => {
                        console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200 get data err' + `, error code is ${err.code}, message is ${err.message}`);
                        expect(null).assertFail();
                    });
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200 put data err' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
                
            }).catch((err) => {
                console.info("testcreateKVManager002 getKVStore err: "  + JSON.stringify(err));
                expect(null).assertFail();
            });
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_PROMISE_0200 promise delete fail err' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
        }
        
    })
})
}