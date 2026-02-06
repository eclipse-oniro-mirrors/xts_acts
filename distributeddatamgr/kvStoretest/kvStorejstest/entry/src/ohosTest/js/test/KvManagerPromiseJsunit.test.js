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
            console.info('beforeAll end');
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
        try {
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
                console.info('afterEach closeKVStore success');
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                    console.info('afterEach deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err) => {
                    console.info('afterEach deleteKVStore err ' + err);
                    done();
                });
            }).catch((err) => {
                console.info('afterEach closeKVStore err ' + err);
                done();
            });

        } catch (e) {
            console.info('afterEach catch e ' + e);
            done();
        }
    })

    /**
     * @tc.name   testKVManagerGetKVStore001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1800
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKVManagerGetKVStore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   testKVManagerGetKVStore002
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1900
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKVManagerGetKVStore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   testKVManagerGetKVStore003
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2000
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore003 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore004
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2100
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testKVManagerGetKVStore005
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2200
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore005 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore006
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2300
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore006 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore007
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2400
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore007 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore008
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2500
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore008 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore009
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2600
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore009 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore010
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2700
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore010 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore011
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2800
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore011 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore012
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_2900
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore012 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore013
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3000
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                kvStore = store;
                expect(store != null).assertTrue();
                done();
            }).catch((err) => {
                console.info('testKVManagerGetKVStore013 getKVStore err ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore013 getKVStore e ' + e);
            done();
        }
        
    })

    /**
     * @tc.name   testKVManagerGetKVStore014
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3100
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            expect(err !== undefined).assertTrue();
        });
        done();
    })

    /**
     * @tc.name   testKVManagerGetKVStore015
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3200
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            expect(err !== undefined).assertTrue();
        });
        done();
    })

    /**
     * @tc.name   testKVManagerGetKVStore016
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3300
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            expect(err !== undefined).assertTrue();
        });
        done();
    })

    /**
     * @tc.name   testKVManagerGetKVStore017
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3400
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            expect(err !== undefined).assertTrue();
        });
        done();
    })

    /**
     * @tc.name   testKVManagerGetKVStore018
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3500
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            expect(err !== undefined).assertTrue();
        });
        done();
    })

    /**
     * @tc.name   testKVManagerGetKVStore019
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3600
     * @tc.desc   Test Js Api KVManager.GetKVStore testcase 019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetKVStore019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            done();
        }).catch((err) => {
            console.info('testKVManagerGetKVStore019 getKVStore err ' + err);
            expect(err !== undefined).assertTrue();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerCloseKVStore001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0400
     * @tc.desc   Test Js Api KVManager.CloseKVStore testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerCloseKVStore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerCloseKVStore001');
        await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
            console.info('testKVManagerCloseKVStore001 getKVStore success');
            kvStore = store;
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
            console.info('testKVManagerCloseKVStore001 closeKVStore redo.');
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(() => {
                console.info('testKVManagerCloseKVStore001 closeKVStore twice');
                expect(err == null).assertTrue();
                done();
            }).catch((err) => {
                console.info('testKVManagerCloseKVStore001 closeKVStore twice err ' + err);
                expect(null).assertFail();
                done();
            });

        });

    })

    /**
     * @tc.name   testKVManagerDeleteKVStore001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0900
     * @tc.desc   Test Js Api KVManager.DeleteKVStore testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerDeleteKVStore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerDeleteKVStore001');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info('testKVManagerDeleteKVStore001 deleteKVStore success');
            expect(null).assertFail();
            done();
        }).catch((err) => {
            console.info('testKVManagerDeleteKVStore001 deleteKVStore err ' + err);
            expect(err != null).assertTrue();
            done();
        });
    })

    /**
     * @tc.name   testKVManagerGetAllKVStoreId001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1400
     * @tc.desc   Test Js Api KVManager.GetAllKVStoreId testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetAllKVStoreId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetAllKVStoreId001');
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
            console.info('testKVManagerGetAllKVStoreId001 getAllKVStoreId success');
            console.info('testKVManagerGetAllKVStoreId001 size = ' + data.length);
            expect(0).assertEqual(data.length);
            done();
        }).catch((err) => {
            console.info('testKVManagerGetAllKVStoreId001 getAllKVStoreId err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerGetAllKVStoreId002
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1500
     * @tc.desc   Test Js Api KVManager.GetAllKVStoreId testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerGetAllKVStoreId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                done();
            }).catch((err) => {
                console.info('testKVManagerGetAllKVStoreId002 getAllKVStoreId err ' + err);
                expect(null).assertFail();
                done();
            });
        }).catch((err) => {
            console.info('testKVManagerGetAllKVStoreId002 getKVStore err ' + err);
            expect(null).assertFail();
            done();
        });
        
    })

    /**
     * @tc.name   testKVManagerOn001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6100
     * @tc.desc   Test Js Api KVManager.On testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        console.info('testKVManagerOn001');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.name   testKVManagerOn002
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6200
     * @tc.desc   Test Js Api KVManager.On testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
     * @tc.name   testKVManagerOn003
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6300
     * @tc.desc   Test Js Api KVManager.On testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
     * @tc.name   testKVManagerOff001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5600
     * @tc.desc   Test Js Api KVManager.Off testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        console.info('testKVManagerOff001');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.name   testKVManagerOff002
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5700
     * @tc.desc   Test Js Api KVManager.Off testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        console.info('testKVManagerOff002');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    /**
     * @tc.name   testKVManagerOff003
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5800
     * @tc.desc   Test Js Api KVManager.Off testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOff003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
     * @tc.name   testKVManagerOff004
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5900
     * @tc.desc   Test Js Api KVManager.Off testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOff004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
     * @tc.name   testKVManagerOff005
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6000
     * @tc.desc   Test Js Api KVManager.Off testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVManagerOff005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
        console.info('testKVManagerOff001');
        var deathCallback = function () {
            console.info('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie');
        done();
    })

    /**
     * @tc.name   testKVStorePut001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0200
     * @tc.desc   Test Js Api KVManager.Put testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVStorePut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   testKVStoreDelete001
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0300
     * @tc.desc   Test Js Api KVManager.Delete testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKVStoreDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
     * @tc.name   SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6500
     * @tc.desc   Test Js Api createKVManager testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
      * @tc.name   SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0200
      * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6600
      * @tc.desc   Test Js Api createKVManager testcase 001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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