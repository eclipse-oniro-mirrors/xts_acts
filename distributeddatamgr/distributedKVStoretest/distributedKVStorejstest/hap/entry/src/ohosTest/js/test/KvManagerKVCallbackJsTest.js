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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import factory from '@ohos.data.distributedKVStore'
import abilityFeatureAbility from '@ohos.ability.featureAbility'

var context = abilityFeatureAbility.getContext();
const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'storeId';
const STORE_KEY = 'key_test_string';
const STORE_VALUE = 'value-test-string';
var kvManager = null;
var kvStore = null;
export default function kvManagerCallbackTest(){
describe('kvManagerCallbackTest', function () {
    const config = {
        bundleName : TEST_BUNDLE_NAME,
        context: context
    }

    const options = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
        console.info('beforeAll');
        kvManager = factory.createKVManager(config);
        console.info('beforeAll end');
        done();
    })

    afterAll(async function (done) {
        console.info('afterAll');
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach');
        done();
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function () {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function () {
                console.info('afterEach deleteKVStore success');
                done();
            });
        });
        kvStore = null;
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1100
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 001
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0100');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
                expect((err == undefined) && (store != null)).assertTrue();
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0100 getKVStore success');
                kvStore = store;
                kvStore.getSecurityLevel().then((data) => {
                    console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0100 securityLevel = ' + data);
                    expect((data == factory.SecurityLevel.S2)).assertTrue();
                });
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0100 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1200
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 002
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0200');
        try {
            await kvManager.getKVStore(options, function (err, store) {
                if (err == undefined) {
                    console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0200 getKVStore success');
                    expect(null).assertFail();
                    done();
                } else {
                    console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0200 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                    done();
                }
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0200 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0600
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 003
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0300');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0300 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0300 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0700
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 004
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0400');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S1,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0400 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0400 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0800
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 005
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0500', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0500');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0500 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0500 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0900
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 006
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0600', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0600');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S3,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0600 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0600 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1000
     * @tc.desc Test Js Api KVManager.GetKVStore() testcase 007
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetKVStore() testcase 007
     */
    it('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0700', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0700');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S4,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0700 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETKVSTORE_0600 getKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1400
     * @tc.desc Test Js Api KVManager.CloseKVStore() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.CloseKVStore() testcase 001
     */
    it('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0100');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0100 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
                    console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0100 closeKVStore success');
                    expect((err == undefined) && (data == undefined)).assertTrue();
                    done();
                });
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1500
     * @tc.desc Test Js Api KVManager.CloseKVStore() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.CloseKVStore() testcase 002
     */
    it('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.closeKVStore(TEST_BUNDLE_NAME, function (err, data) {
                        if (err == undefined) {
                            console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200 closeKVStore success');
                            expect(null).assertFail();
                            done();
                        } else {
                            console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200 closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                            expect(null).assertFail();
                            done();
                        }
                    });
                } catch (e) {
                    console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200 closeKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
                    expect(e.code == 401).assertTrue();
                    done();
                }
            });
        } catch (ee) {
            console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0200 getKVStore ee ' + `, error code is ${ee.code}, message is ${ee.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1600
     * @tc.desc Test Js Api KVManager.CloseKVStore() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.CloseKVStore() testcase 003
     */
    it('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 getKVStore success');
                try {
                    await kvManager.closeKVStore(TEST_STORE_ID, function (err) {
                        if (err == undefined) {
                            console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 closeKVStore success');
                            expect(null).assertFail();
                            done();
                        } else {
                            console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 closeKVStore err  ' + `, error code is ${err.code}, message is ${err.message}`);
                            expect(null).assertFail();
                            done();
                        }
                    });
                } catch (e) {
                    console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 closeKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
                    expect(e.code == 401).assertTrue();
                    done();
                }
            });
        } catch (ee) {
            console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 getKVStore ee ' + `, error code is ${ee.code}, message is ${ee.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1700
     * @tc.desc Test Js Api KVManager.CloseKVStore() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.CloseKVStore() testcase 004
     */
    it('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0400');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0400 getKVStore success');

                kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                    if (err == undefined) {
                        console.info('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 closeKVStore success');
                        expect(err == undefined).assertTrue();
                        done();
                    } else {
                        console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0300 closeKVStore err  ' + `, error code is ${err.code}, message is ${err.message}`);
                        expect(null).assertFail();
                        done();
                    }
                })

            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CLOSEKVSTORE_0400 closeKVStore twice e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1800
     * @tc.desc Test Js Api KVManager.DeleteKVStore() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.DeleteKVStore() testcase 001
     */
    it('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.deleteKVStore(TEST_BUNDLE_NAME, function (err, data) {
                        if (err == undefined) {
                            console.info('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100 deleteKVStore success');
                            expect(null).assertFail();
                            done();
                        } else {
                            console.info('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100 deleteKVStore fail');
                            expect(null).assertFail();
                            done();
                        }
                    });
                } catch (e) {
                    console.error('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100 deleteKVStore e ' + `, error code is ${e.code}, message is ${e.message}`);
                    expect(e.code == 401).assertTrue();
                    done();
                }
            });
        } catch (ee) {
            console.error('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0100 getKVStore ee ' + `, error code is ${ee.code}, message is ${ee.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1900
     * @tc.desc Test Js Api KVManager.DeleteKVStore() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.DeleteKVStore() testcase 002
     */
    it('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0200');
        try {
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                if (err == undefined){
                    console.info('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0200 deleteKVStore success');
                    expect(null).assertFail();
                    done();
                } else {
                    console.error('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0200 err ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(err.code == 15100004).assertTrue();
                    done();
                }
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_DLETEKVSTORE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_1300
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KVManager.GetAllKVStoreId() testcase 001
     */
    it('SUB_DDM_DKV_KVMANAGER_GETALLKVSTOREID_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTOREID_0100');
        try {
            await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, function (err, data) {
                console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTOREID_0100 getAllKVStoreId success');
                console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTOREID_0100 size = ' + data.length);
                console.info('SUB_DDM_DKV_KVMANAGER_GETALLKVSTOREID_0100 err is: ' + err);
                expect(err == undefined).assertTrue();
                expect(0).assertEqual(data.length);
                done();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_GETALLKVSTOREID_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_500
     * @tc.desc Test Js Api KVStore.Put() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KVStore.Put() testcase 001
     */
    it('SUB_DDM_DKV_KVMANAGER_PUT_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_PUT_0100');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('SUB_DDM_DKV_KVMANAGER_PUT_0100 getKVStore success');
                kvStore = store;
                    await kvStore.put(STORE_KEY, STORE_VALUE, function (err, data) {
                        console.info('SUB_DDM_DKV_KVMANAGER_PUT_0100 put callback success');
                        expect(err == undefined).assertTrue();
                        done();
                    });
                });
        } catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_PUT_0100 callback e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0100
     * @tc.desc Test Js Api  createKVManager() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api createKVManager() testcase 001
     */
    it('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0100');
        const config = {
            bundleName: [TEST_BUNDLE_NAME],
            context:context
        }
        try {
            kvManager = factory.createKVManager(config);
            console.info('Create kvManager success');
            expect(null).assertFail();
            done();
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0100 fail err' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0300
     * @tc.desc Test Js Api  createKVManager() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api createKVManager() testcase 002
     */
    it('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0200');
        const config = {
            bundleName: TEST_BUNDLE_NAME,
            context:"context"
        }
        try {
            kvManager = factory.createKVManager(config);
            console.info('Create kvManager success');
            expect(null).assertFail();
            done();
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0200 fail err' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
            done();
        }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0400
     * @tc.desc Test Js Api  createKVManager() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api createKVManager() testcase 003
     */
    it('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0300 start ');
        try {
            kvManager = factory.createKVManager("kvManagerConfig");
            console.info('Create kvManager success');
            expect(null).assertFail();
            done();
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0300 fail err' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerCallbackJsApiTest_0200
     * @tc.desc Test Js Api  createKVManager() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api createKVManager() testcase 004
     */
    it('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0400 start ');
        try {
            kvManager = factory.createKVManager();
            console.info('Create kvManager success');
            expect(null).assertFail();
            done();
        }catch (e) {
            console.error('SUB_DDM_DKV_KVMANAGER_CREATEKVMANAGER_0300 fail err' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
            done();
        }
    })
})
}