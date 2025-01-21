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
import factory from '@ohos.data.distributedData';
import abilityFeatureAbility from '@ohos.ability.featureAbility';

var context = abilityFeatureAbility.getContext();
var contextApplication = context.getApplicationContext()

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;
const STORE_KEY = 'key_test_string';
const STORE_VALUE = 'value-test-string';
var kvStoreNew = null;

export default function kvManagerPromiseTest(){
describe('kvManagerPromiseTest', function () {
    const config = {
        bundleName: TEST_BUNDLE_NAME,
        userInfo: {
            userId: '0',
            userType: factory.UserType.SAME_USER_ID
        }
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
        await factory.createKVManager(config).then((manager) => {
            kvManager = manager;
            console.info('beforeAll createKVManager success');
        }).catch((err) => {
            console.info('beforeAll createKVManager err ' + err);
        });
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            console.info("beforeAll getKVStore success");
            kvStoreNew = store;
        }).catch((err) => {
            console.info("beforeAll getKVStore err: "  + JSON.stringify(err));
        });
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
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.info('afterEach deleteKVStore success');
            }).catch((err) => {
                console.info('afterEach deleteKVStore err ' + err);
            });
        }).catch((err) => {
            console.info('afterEach closeKVStore err ' + err);
        });
        kvStore = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1800
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 001
     */
    it('testKVManagerGetKVStore001', 0, async function (done) {
        console.info('testKVManagerGetKVStore001');
        try {
            await kvManager.getKVStore(TEST_STORE_ID).then((store) => {
                console.info('testKVManagerGetKVStore001 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testKVManagerGetKVStore001 getKVStore err ' + err);
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore001 getKVStore e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1900
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 002
     */
    it('testKVManagerGetKVStore002', 0, async function (done) {
        console.info('testKVManagerGetKVStore002');
        try {
            await kvManager.getKVStore(options).then((store) => {
                console.info('testKVManagerGetKVStore002 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testKVManagerGetKVStore002 getKVStore err ' + err);
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore002 getKVStore e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2000
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 003
     */
    it('testKVManagerGetKVStore003', 0, async function (done) {
        console.info('testKVManagerGetKVStore003');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.NO_LEVEL,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore003 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore003 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2100
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 004
     */
    it('testKVManagerGetKVStore004', 0, async function (done) {
        console.info('testKVManagerGetKVStore004');
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
            console.info('testKVManagerGetKVStore004 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore004 getKVStore err ' + err);
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2200
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 005
     */
    it('testKVManagerGetKVStore005', 0, async function (done) {
        console.info('testKVManagerGetKVStore005');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: true,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore005 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore005 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2300
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 006
     */
    it('testKVManagerGetKVStore006', 0, async function (done) {
        console.info('testKVManagerGetKVStore006');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S3,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore006 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore006 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2400
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 007
     */
    it('testKVManagerGetKVStore007', 0, async function (done) {
        console.info('testKVManagerGetKVStore006');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: true,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S4,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore007 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore007 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2500
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 008
     */
    it('testKVManagerGetKVStore008', 0, async function (done) {
        console.info('testKVManagerGetKVStore008');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: '',
            securityLevel: factory.SecurityLevel.NO_LEVEL,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore008 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore008 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2600
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 009
     */
    it('testKVManagerGetKVStore009', 0, async function (done) {
        console.info('testKVManagerGetKVStore009');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: '',
            securityLevel: factory.SecurityLevel.S0,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore009 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore009 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2700
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 010
     */
    it('testKVManagerGetKVStore010', 0, async function (done) {
        console.info('testKVManagerGetKVStore010');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: false,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: '',
            securityLevel: factory.SecurityLevel.S1,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore010 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore010 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2800
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 011
     */
    it('testKVManagerGetKVStore011', 0, async function (done) {
        console.info('testKVManagerGetKVStore011');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: '',
            securityLevel: factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore011 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore011 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2900
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 012
     */
    it('testKVManagerGetKVStore012', 0, async function (done) {
        console.info('testKVManagerGetKVStore012');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: '',
            securityLevel: factory.SecurityLevel.S3,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore012 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore012 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3000
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 013
     */
    it('testKVManagerGetKVStore013', 0, async function (done) {
        console.info('testKVManagerGetKVStore013');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
            schema: '',
            securityLevel: factory.SecurityLevel.S4,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
                console.info('testKVManagerGetKVStore013 getKVStore success');
            }).catch((err) => {
                console.info('testKVManagerGetKVStore013 getKVStore err ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore013 getKVStore e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3100
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 014
     */
    it('testKVManagerGetKVStore014', 0, async function (done) {
        console.info('testKVManagerGetKVStore014');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.MULTI_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.NO_LEVEL,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore014 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore014 getKVStore err ' + err);
            expect(true).assertTrue();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3200
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 015
     */
    it('testKVManagerGetKVStore015', 0, async function (done) {
        console.info('testKVManagerGetKVStore015');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.MULTI_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S0,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore015 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore015 getKVStore err ' + err);
            expect(true).assertTrue();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3300
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 016
     */
    it('testKVManagerGetKVStore016', 0, async function (done) {
        console.info('testKVManagerGetKVStore016');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.MULTI_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S1,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore016 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore016 getKVStore err ' + err);
            expect(true).assertTrue();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3400
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 017
     */
    it('testKVManagerGetKVStore017', 0, async function (done) {
        console.info('testKVManagerGetKVStore017');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.MULTI_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore017 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore017 getKVStore err ' + err);
            expect(true).assertTrue();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3500
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 018
     */
    it('testKVManagerGetKVStore018', 0, async function (done) {
        console.info('testKVManagerGetKVStore018');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.MULTI_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S3,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore018 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore018 getKVStore err ' + err);
            expect(true).assertTrue();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3600
     * @tc.name [JS-API8]KVManager.GetKVStore.
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 019
     */
    it('testKVManagerGetKVStore019', 0, async function (done) {
        console.info('testKVManagerGetKVStore019');
        const optionsInfo = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.MULTI_VERSION,
            schema: '',
            securityLevel: factory.SecurityLevel.S4,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.info('testKVManagerGetKVStore019 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore019 getKVStore err ' + err);
            expect(true).assertTrue();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0400
     * @tc.name [JS-API8]KVManager.CloseKVStore.
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 001
     */
    it('testKVManagerCloseKVStore001', 0, async function (done) {
        console.info('testKVManagerCloseKVStore004');
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
            console.info('testKVManagerCloseKVStore001 getKVStore success');
            kvStore = store;
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
        });
        console.info('testKVManagerCloseKVStore001 closeKVStore redo.');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(() => {
            console.info('testKVManagerCloseKVStore001 closeKVStore twice');
            expect(null).assertFail();
        }).catch((err) => {
            console.info('testKVManagerCloseKVStore001 closeKVStore twice err ' + err);
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0900
     * @tc.name [JS-API8]KVManager.DeleteKVStore.
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 001
     */
    it('testKVManagerDeleteKVStore001', 0, async function (done) {
        console.info('testKVManagerDeleteKVStore001');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info('testKVManagerDeleteKVStore001 deleteKVStore success');
        }).catch((err) => {
            expect(null).assertFail();
            console.info('testKVManagerDeleteKVStore001 deleteKVStore err ' + err);
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1400
     * @tc.name [JS-API8]KVManager.GetAllKVStoreId.
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId testcase 001
     */
    it('testKVManagerGetAllKVStoreId001', 0, async function (done) {
        console.info('testKVManagerGetAllKVStoreId001');
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
            console.info('testKVManagerGetAllKVStoreId001 getAllKVStoreId success');
            console.info('testKVManagerGetAllKVStoreId001 size = ' + data.length);
            expect(0).assertEqual(data.length);
        }).catch((err) => {
            console.info('testKVManagerGetAllKVStoreId001 getAllKVStoreId err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1500
     * @tc.name [JS-API8]KVManager.GetAllKVStoreId.
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId testcase 002
     */
    it('testKVManagerGetAllKVStoreId002', 0, async function (done) {
        console.info('testKVManagerGetAllKVStoreId002');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.info('testKVManagerGetAllKVStoreId002 getKVStore success');
            kvStore = store;
            await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
                console.info('testKVManagerGetAllKVStoreId002 getAllKVStoreId success');
                console.info('testKVManagerGetAllKVStoreId002 size = ' + data.length);
                expect(1).assertEqual(data.length);
                console.info('testKVManagerGetAllKVStoreId002 data[0] = ' + data[0]);
                expect(TEST_STORE_ID).assertEqual(data[0]);
            }).catch((err) => {
                console.info('testKVManagerGetAllKVStoreId002 getAllKVStoreId err ' + err);
                expect(null).assertFail();
            });
        }).catch((err) => {
            console.info('testKVManagerGetAllKVStoreId002 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6100
     * @tc.name [JS-API8]KVManager.On.
     * @tc.desc Test Js Api KVManager.On testcase 001
     */
    it('testKVManagerOn001', 0, function (done) {
        console.info('testKVManagerOn001');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6200
     * @tc.name [JS-API8]KVManager.On.
     * @tc.desc Test Js Api KVManager.On testcase 002
     */
    it('testKVManagerOn002', 0, function (done) {
        console.info('testKVManagerOn002');
        var deathCallback1 = function () {
            console.info('death callback call');
        }
        var deathCallback2 = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback1);
        kvManager.on('distributedDataServiceDie', deathCallback2);
        kvManager.off('distributedDataServiceDie', deathCallback1);
        kvManager.off('distributedDataServiceDie', deathCallback2);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6300
     * @tc.name [JS-API8]KVManager.On.
     * @tc.desc Test Js Api KVManager.On testcase 003
     */
    it('testKVManagerOn003', 0, function (done) {
        console.info('testKVManagerOn003');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5600
     * @tc.name [JS-API8]KVManager.Off.
     * @tc.desc Test Js Api KVManager.Off testcase 001
     */
    it('testKVManagerOff001', 0, function (done) {
        console.info('testKVManagerOff001');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5700
     * @tc.name [JS-API8]KVManager.Off.
     * @tc.desc Test Js Api KVManager.Off testcase 002
     */
    it('testKVManagerOff002', 0, function (done) {
        console.info('testKVManagerOff002');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5800
     * @tc.name [JS-API8]KVManager.Off.
     * @tc.desc Test Js Api KVManager.Off testcase 003
     */
    it('testKVManagerOff003', 0, function (done) {
        console.info('testKVManagerOff003');
        var deathCallback1 = function () {
            console.info('death callback call');
        }
        var deathCallback2 = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback1);
        kvManager.on('distributedDataServiceDie', deathCallback2);
        kvManager.off('distributedDataServiceDie', deathCallback1);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5900
     * @tc.name [JS-API8]KVManager.Off.
     * @tc.desc Test Js Api KVManager.Off testcase 004
     */
    it('testKVManagerOff004', 0, function (done) {
        console.info('testKVManagerOff004');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6000
     * @tc.name [JS-API8]KVManager.Off.
     * @tc.desc Test Js Api KVManager.Off testcase 005
     */
    it('testKVManagerOff005', 0, function (done) {
        console.info('testKVManagerOff001');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie');
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0200
     * @tc.name [JS-API8]KVStore.Put
     * @tc.desc Test Js Api KVManager.Put testcase 001
     */
    it('testKVStorePut001', 0, async function (done) {
        console.info('testKVStorePut001');
        try {
            await kvStoreNew.put(TEST_BUNDLE_NAME, TEST_STORE_ID).then((err,data) => {
                if (err != undefined){
                    console.info('testKVStorePut001 put promise fail');
                } else {
                    console.info('testKVStorePut001 put promise success');
                    expect(null).assertFail();
                }
                done();
            });
        } catch (e) {
            console.info('testKVStorePut001 e ' + e);
            done();
        }
    })

    /**
      * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0300
      * @tc.name [JS-API8]KVStore.Delete
      * @tc.desc Test Js Api KVManager.Delete testcase 001
      */
    it('testKVStoreDelete001', 0, async function (done) {
        console.info('testKVStoreDelete001');
        try {
            kvStoreNew.put(STORE_KEY, STORE_VALUE).then((data) => {
                console.info('testKVStoreDelete001 getKVStore success');
                kvStoreNew.delete(STORE_KEY).then((data) => {
                    console.info("testKVStoreDelete001  promise delete success");
                    expect(null).assertFail();
                }).catch((err) => {
                    console.info('testKVStoreDelete001 promise delete fail err' + err);
                });
            }).catch((err) => {
                console.info('testKVStoreDelete001 promise delete fail err' + err);
            });
        }catch (err) {
            console.info('testKVStoreDelete001 promise delete fail err' + err);
        }
        done();
    })
    
    /**
      * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6500
      * @tc.name [JS-API8]createKVManager
      * @tc.desc Test Js Api createKVManager testcase 001
      */
    it('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0100 start');
        const kvManagerConfig = {
            bundleName: [TEST_BUNDLE_NAME],
            userInfo: {
                userId: '0',
                userType: factory.UserType.SAME_USER_ID
            },
            context:contextApplication
        }
        factory.createKVManager(kvManagerConfig).then((manager) => {
            console.info("Create kvManager success")
            expect(false).assertTrue();
            done();
        }).catch((err) => {
            console.info(`Create kvManager error: ${err}`)
            done()
        })
    })

    /**
      * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6600
      * @tc.name [JS-API8]createKVManager
      * @tc.desc Test Js Api createKVManager testcase 001
      */
     it('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0200 start');
        factory.createKVManager("kvManagerConfig").then((manager) => {
            console.info("Create kvManager success")
            expect(false).assertTrue();
            done();
        }).catch((err) => {
            console.info(`Create kvManager error: ${err}`)
            expect(err != null).assertTrue();
            done();
        })
    })
})
}