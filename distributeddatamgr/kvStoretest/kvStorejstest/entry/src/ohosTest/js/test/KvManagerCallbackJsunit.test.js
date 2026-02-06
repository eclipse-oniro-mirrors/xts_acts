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

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
const STORE_KEY = 'key_test_string';
const STORE_VALUE = 'value-test-string';
var kvManager = null;
var kvStore = null;

export default function kvManagerCallbackTest(){
describe('kvManagerCallbackTest', function () {
    const config = {
        bundleName : TEST_BUNDLE_NAME,
        userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
        }
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
        await factory.createKVManager(config, function (err, manager) {
            kvManager = manager;
            done();
        });
        console.info('beforeAll end');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4600
     * @tc.name testKVManagerGetKVStore101
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testKVManagerGetKVStore101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testKVManagerGetKVStore101');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
                expect((err == undefined) && (store != null)).assertTrue();
                console.info('testKVManagerGetKVStore101 getKVStore success');
                kvStore = store;
                kvStore.getSecurityLevel().then((data) => {
                    console.info('testKVManagerGetKVStore101 securityLevel = ' + data);
                    expect((data == factory.SecurityLevel.S2)).assertTrue();
                });
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore101 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3800
     * @tc.name testKVManagerGetKVStore102
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testKVManagerGetKVStore102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testKVManagerGetKVStore102');
        try {
            await kvManager.getKVStore(options, function (err, store) {
                if (err == undefined) {
                    console.info('testKVManagerGetKVStore102 getKVStore success');
                    expect(null).assertFail();
                } else {
                    expect((err != undefined)).assertTrue();
                    console.info('testKVManagerGetKVStore102 getKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore102 getKVStore e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3900
     * @tc.name testKVManagerGetKVStore103
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore103');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.NO_LEVEL,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore103 getKVStore success');
                console.info('testKVManagerGetKVStore103 err ' + err + ' store ' + store);
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore103 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4000
     * @tc.name testKVManagerGetKVStore104
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore104');
        const optionsInfo = {
            createIfMissing : false,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S0,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                if (err == undefined) {
                    console.info('testKVManagerGetKVStore104 getKVStore success');
                    expect(null).assertFail();
                } else {
                    console.info('testKVManagerGetKVStore104 getKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore104 getKVStore e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4100
     * @tc.name testKVManagerGetKVStore105
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 105
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore105');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : true,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S1,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore105 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore105 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4200
     * @tc.name testKVManagerGetKVStore106
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 106
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore106');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore106 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore106 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4300
     * @tc.name testKVManagerGetKVStore107
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 107
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore107');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : true,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S3,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore107 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore107 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4400
     * @tc.name testKVManagerGetKVStore108
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 108
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore108');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S4,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore108 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore108 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4500
     * @tc.name testKVManagerGetKVStore109
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 109
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore109');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.NO_LEVEL,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore109 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore109 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_3700
     * @tc.name testKVManagerGetKVStore110
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 110
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore110');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : false,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S0,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore110 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore110 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4700
     * @tc.name testKVManagerGetKVStore111
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 111
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore111');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S1,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore111 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore111 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4800
     * @tc.name testKVManagerGetKVStore112
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 112
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore112');
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
                console.info('testKVManagerGetKVStore112 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore112 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_4900
     * @tc.name testKVManagerGetKVStore113
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 113
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore113');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S3,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                if (err == undefined) {
                    console.info('testKVManagerGetKVStore113 getKVStore success');
                    expect((err == undefined) && (store != null)).assertTrue();
                } else {
                    console.info('testKVManagerGetKVStore113 getKVStore fail');
                    expect(null).assertFail();
                }
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore113 getKVStore e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5000
     * @tc.name testKVManagerGetKVStore114
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 114
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore114');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S4,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore114 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore114 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5100
     * @tc.name testKVManagerGetKVStore115
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 115
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore115');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.NO_LEVEL,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore115 getKVStore err=' + err);
                expect(err !== undefined).assertTrue();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore115 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5200
     * @tc.name testKVManagerGetKVStore116
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 116
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore116');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S0,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.info('testKVManagerGetKVStore116 getKVStore err=' + err);
                expect(err !== undefined).assertTrue();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore116 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5300
     * @tc.name testKVManagerGetKVStore117
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 117
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore117');
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
                console.info('testKVManagerGetKVStore117 getKVStore err=' + err);
                expect(err !== undefined).assertTrue();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore117 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5400
     * @tc.name testKVManagerGetKVStore118
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 118
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore118');
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
                console.info('testKVManagerGetKVStore118 getKVStore err=' + err);
                expect(err !== undefined).assertTrue();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore118 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_5500
     * @tc.name testKVManagerGetKVStore119
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 119
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore119');
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
                console.info('testKVManagerGetKVStore119 getKVStore err=' + err);
                expect(err !== undefined).assertTrue();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore119 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6400
     * @tc.name testKVManagerGetKVStore120
     * @tc.desc Test Js Api KVManager.GetKVStore testcase 120
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetKVStore120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetKVStore120');
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
                console.info('testKVManagerGetKVStore120 getKVStore err=' + err);
                expect(err !== undefined).assertTrue();
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetKVStore119 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0500
     * @tc.name testKVManagerCloseKVStore101
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerCloseKVStore101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerCloseKVStore101');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerCloseKVStore101 getKVStore success');
                kvStore = store;
                await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
                    console.info('testKVManagerCloseKVStore101 closeKVStore success');
                    expect((err == undefined) && (data == undefined)).assertTrue();
                    done();
                });
            });
        } catch (e) {
            console.info('testKVManagerCloseKVStore101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0600
     * @tc.name testKVManagerCloseKVStore102
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerCloseKVStore102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerCloseKVStore102');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerCloseKVStore102 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.closeKVStore(TEST_BUNDLE_NAME, function (err, data) {
                        if (err == undefined) {
                            console.info('testKVManagerCloseKVStore102 closeKVStore success');
                            expect(null).assertFail();
                        } else {
                            console.info('testKVManagerCloseKVStore102 closeKVStore fail');
                        }
                        done();
                    });
                } catch (e) {
                    console.info('testKVManagerCloseKVStore102 closeKVStore e ' + e);
                    done();
                }
            });
        } catch (ee) {
            console.info('testKVManagerCloseKVStore102 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0700
     * @tc.name testKVManagerCloseKVStore103
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerCloseKVStore103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerCloseKVStore103');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerCloseKVStore103 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                        if (err == undefined) {
                            console.info('testKVManagerCloseKVStore103 closeKVStore success');
                            expect(null).assertFail();
                        } else {
                            console.info('testKVManagerCloseKVStore103 closeKVStore fail');
                        }
                        done();
                    });
                } catch (e) {
                    console.info('testKVManagerCloseKVStore103 closeKVStore e ' + e);
                    done();
                }
            });
        } catch (ee) {
            console.info('testKVManagerCloseKVStore103 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0800
     * @tc.name testKVManagerCloseKVStore104
     * @tc.desc Test Js Api KVManager.CloseKVStore testcase 104
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerCloseKVStore104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerCloseKVStore104');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerCloseKVStore104 getKVStore success');
                kvStore = store;
                await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
            });
            console.info('testKVManagerCloseKVStore104 closeKVStore redo.');
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
                console.info('testKVManagerCloseKVStore104 closeKVStore twice ' + err);
                if (err == undefined) {
                    expect(null).assertFail();
                }
            });
        } catch (e) {
            console.info('testKVManagerCloseKVStore104 closeKVStore twice e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1100
     * @tc.name testKVManagerDeleteKVStore101
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerDeleteKVStore101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerDeleteKVStore101');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerDeleteKVStore101 getKVStore success');
                kvStore = store;
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                    console.info('testKVManagerDeleteKVStore101 deleteKVStore success');
                    expect((err == undefined) && (data == undefined)).assertTrue();
                    done();
                });
            });
        } catch (e) {
            console.info('testKVManagerDeleteKVStore101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1200
     * @tc.name testKVManagerDeleteKVStore102
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerDeleteKVStore102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerDeleteKVStore102');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerDeleteKVStore102 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.deleteKVStore(TEST_BUNDLE_NAME, function (err, data) {
                        if (err == undefined) {
                            console.info('testKVManagerDeleteKVStore102 deleteKVStore success');
                            expect(null).assertFail();
                        } else {
                            console.info('testKVManagerDeleteKVStore102 deleteKVStore fail');
                        }
                        done();
                    });
                } catch (e) {
                    console.info('testKVManagerDeleteKVStore102 deleteKVStore e ' + e);
                    done();
                }
            });
        } catch (ee) {
            console.info('testKVManagerDeleteKVStore102 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1300
     * @tc.name testKVManagerDeleteKVStore103
     * @tc.desc Test Js Api KVManager.DeleteKVStore testcase 103
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerDeleteKVStore103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerDeleteKVStore103');
        try {
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                if (err == undefined){
                    console.info('testKVManagerDeleteKVStore103 deleteKVStore success');
                    expect(null).assertFail();
                } else {
                    console.info('testKVManagerDeleteKVStore103 deleteKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.info('testKVManagerDeleteKVStore103 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1600
     * @tc.name testKVManagerGetAllKVStoreId101
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId testcase 101
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetAllKVStoreId101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetAllKVStoreId101');
        try {
            await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, function (err, data) {
                console.info('testKVManagerGetAllKVStoreId101 getAllKVStoreId success');
                console.info('testKVManagerGetAllKVStoreId101 size = ' + data.length);
                expect(0).assertEqual(data.length);
                done();
            });
        } catch (e) {
            console.info('testKVManagerGetAllKVStoreId101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1700
     * @tc.name testKVManagerGetAllKVStoreId102
     * @tc.desc Test Js Api KVManager.GetAllKVStoreId testcase 102
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVManagerGetAllKVStoreId102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVManagerGetAllKVStoreId102');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVManagerGetAllKVStoreId102 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, function (err, data) {
                        console.info('testKVManagerGetAllKVStoreId002 getKVStore success');
                        console.info('testKVManagerGetAllKVStoreId002 getkvmanager success: ' + kvManager)
                        console.info('testKVManagerGetAllKVStoreId002 get kvstore: ' + store)
                        console.info('testKVManagerGetAllKVStoreId102 getAllKVStoreId success');
                        console.info('testKVManagerGetAllKVStoreId102 size = ' + data.length);
                        expect(1).assertEqual(data.length);
                        console.info('testKVManagerGetAllKVStoreId102 data[0] = ' + data[0]);
                        expect(TEST_STORE_ID).assertEqual(data[0]);
                        done();
                    });
                } catch (e) {
                    console.info('testKVManagerGetAllKVStoreId102 getAllKVStoreId e ' + e);
                    expect(null).assertFail();
                    done();
                }
            });
        } catch (ee) {
            console.info('testKVManagerGetAllKVStoreId102 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })
    
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_0100
     * @tc.name testKVStorePut100
     * @tc.desc Test Js Api KVManager.Put testcase 100
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKVStorePut100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testKVStorePut100');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.info('testKVStorePut100 getKVStore success');
                kvStore = store;
                    await kvStore.put(STORE_KEY, STORE_VALUE, function (err, data) {
                        if (err != undefined){
                            console.info('testKVStorePut100 put callback fail');
                            expect(null).assertFail();
                        } else {
                            console.info('testKVStorePut100 put callback success');
                            expect(err === undefined).assertTrue();
                        }
                        done();
                    });
                });

        } catch (e) {
            console.info('testKVStorePut100 callback e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
      * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_1000
      * @tc.name SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_CALLBACK_0100
      * @tc.desc Test Js Api createKVManager testcase 001
      * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_CALLBACK_0100 start');
        const kvManagerConfig = {
            bundleName: [TEST_BUNDLE_NAME],
            userInfo: {
                userId: '0',
                userType: factory.UserType.SAME_USER_ID
            }
        }
        factory.createKVManager(kvManagerConfig, (err, data) => {
            if(err != null){
                console.info(`Create kvManager error: ${err}`)
                done()
            }else{
                console.info("Create kvManager success")
                expect(false).assertTrue();
                done();
            }
        })
    })

    /**
      * @tc.number SUB_DistributedData_KVStore_SDK_KVStoreJsApiTest_6700
      * @tc.name SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_CALLBACK_0200
      * @tc.desc Test Js Api createKVManager testcase 001
      * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DISTRIBUTEDDATAMGR_CREATEKVMANAGER_CALLBACK_0200 start');
        try{
            factory.createKVManager("kvManagerConfig", (err, data) => {
                if(err != null){
                    console.info(`Create kvManager error: ${err}`)
                    done()
                }else{
                    console.info("Create kvManager success")
                    expect(false).assertTrue();
                    done();
                }
            })
        }catch(err){
            console.info(`Create kvManager error: ${err}`)
            expect(err != null).assertTrue();
            done();
        }
    })
})
}