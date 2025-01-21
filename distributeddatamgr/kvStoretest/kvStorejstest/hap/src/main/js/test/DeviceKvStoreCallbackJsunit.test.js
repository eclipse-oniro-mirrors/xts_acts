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
import factory from '@ohos.data.distributedData'

const KEY_TEST_INT_ELEMENT = 'key_test_int_2';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float_2';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean_2';
const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 1234;
const VALUE_TEST_FLOAT_ELEMENT = 4321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;
var localDeviceId = null;
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS =  [];  /* add you test device-ids here */
var syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function putBatchString(len, prefix) {
    let entries = [];
    for (let i = 0; i < len; i++) {
        var entry = {
            key : prefix + i,
            value : {
                type : factory.ValueType.STRING,
                value : 'batch_test_string_value'
            }
        }
        entries.push(entry);
    }
    return entries;
}
export default function deviceKvStoreCallbackTest(){
describe('deviceKvStoreCallbackTest', function () {
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
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
        console.info('beforeAll config:'+ JSON.stringify(config));
        await factory.createKVManager(config).then((manager) => {
            kvManager = manager;
            console.info('beforeAll createKVManager success');
        }).catch((err) => {
            console.info('beforeAll createKVManager err ' + err);
        });
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.info('beforeAll getKVStore for getDeviceId success');
        }).catch((err) => {
            console.info('beforeAll getKVStore err ' + err);
        });
        var getDeviceId = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function (data) {
                console.info('beforeAll on data change: ' + JSON.stringify(data));
                resolve(data.deviceId);
            });
            kvStore.put("getDeviceId", "byPut").then((data) => {
                console.info('beforeAll put success');
                expect(data == undefined).assertTrue();
            });
            setTimeout(() => {
                reject(new Error('not resolved in 2 second, reject it.'))
            }, 2000);
        });
        await getDeviceId.then(function(deviceId) {
            console.info('beforeAll getDeviceId ' + JSON.stringify(deviceId));
            localDeviceId = deviceId;
        }).catch((error) => {
            console.info('beforeAll can NOT getDeviceId, fail: ' + error);
            expect(null).assertFail();
        });
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        kvStore = null;
        console.info('beforeAll end');
        done();
    })

    afterAll(async function (done) {
        console.info('afterAll');
        kvManager = null;
        kvStore = null;
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach' + JSON.stringify(options));
        await kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
            kvStore = store;
            console.info('beforeEach getKVStore success');
            done();
        });
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                console.info('afterEach deleteKVStore success');
                done();
            });
        });
        kvStore = null;
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1290
     * @tc.name [JS-API8]DeviceKvStore.Put(String)
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 101
     */
    it('testDeviceKvStorePutString101', 0, async function (done) {
        console.info('testDeviceKvStorePutString101');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStorePutString101 put success');
                } else {
                    console.info('testDeviceKvStorePutString101 put fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch (e) {
            console.info('testDeviceKvStorePutString101 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1300
     * @tc.name [JS-API8]DeviceKvStore.Put(String)
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 102
     */
    it('testDeviceKvStorePutString102', 0, async function (done) {
        console.info('testDeviceKvStorePutString102');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT+'102', str, async function (err,data) {
                console.info('testDeviceKvStorePutString102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT+'102', function (err,data) {
                    console.info('testDeviceKvStorePutString102 get success');
                    expect(str == data).assertTrue();
                    done();
                });
            });
        }catch (e) {
            console.info('testDeviceKvStorePutString102 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0760
     * @tc.name [JS-API8]DeviceKvStore.Get(String)
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 101
     */
    it('testDeviceKvStoreGetString101', 0, async function (done) {
        console.info('testDeviceKvStoreGetString101');
        try{
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreGetString101 get success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreGetString101 get fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetString101 get e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0770
     * @tc.name [JS-API8]DeviceKvStore.Get(String)
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 102
     */
    it('testDeviceKvStoreGetString102', 0, async function (done) {
        console.info('testDeviceKvStoreGetString102');
        try{
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
                console.info('testDeviceKvStoreGetString102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreGetString102 get success');
                    expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.info('testDeviceKvStoreGetString102 get e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1210
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 101
     */
    it('testDeviceKvStorePutInt101', 0, async function (done) {
        console.info('testDeviceKvStorePutInt101');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
                console.info('testDeviceKvStorePutInt101 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStorePutInt101 get success');
                    expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.info('testDeviceKvStorePutInt101 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1220
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 102
     */
    it('testDeviceKvStorePutInt102', 0, async function (done) {
        console.info('testDeviceKvStorePutInt102');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
                console.info('testDeviceKvStorePutInt102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStorePutInt102 get success');
                    expect((err == undefined) && (intValue == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.info('testDeviceKvStorePutInt102 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1230
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 103
     */
    it('testDeviceKvStorePutInt103', 0, async function (done) {
        console.info('testDeviceKvStorePutInt103');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
                console.info('testDeviceKvStorePutInt103 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStorePutInt103 get success');
                    expect((err == undefined) && (intValue == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.info('testDeviceKvStorePutInt103 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1240
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 104
     */
    it('testDeviceKvStorePutInt104', 0, async function (done) {
        console.info('testDeviceKvStorePutInt104');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
                console.info('testDeviceKvStorePutInt104 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStorePutInt104 get success');
                    expect((err == undefined) && (intValue == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.info('testDeviceKvStorePutInt104 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0560
     * @tc.name [JS-API8]DeviceKvStore.Get(Int)
     * @tc.desc Test Js Api DeviceKvStore.Get(Int) testcase 101
     */
    it('testDeviceKvStoreGetInt101', 0, async function (done) {
        console.info('testDeviceKvStoreGetInt101');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
                console.info('testDeviceKvStoreGetInt101 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreGetInt101 get success');
                    expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetInt101 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0570
     * @tc.name [JS-API8]DeviceKvStore.Get(Int)
     * @tc.desc Test Js Api DeviceKvStore.Get(Int) testcase 102
     */
    it('testDeviceKvStoreGetInt102', 0, async function (done) {
        console.info('testDeviceKvStoreGetInt102');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreGetInt102 get success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreGetInt102 get fail');
                }
                done();
            })
        }catch(e) {
            console.info('testDeviceKvStoreGetInt102 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1110
     * @tc.name [JS-API8]DeviceKvStore.Put(Bool)
     * @tc.desc Test Js Api DeviceKvStore.Put(Bool) testcase 101
     */
    it('testDeviceKvStorePutBool101', 0, async function (done) {
        console.info('testDeviceKvStorePutBool101');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, function (err,data) {
                console.info('testDeviceKvStorePutBool101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBool101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0450
     * @tc.name [JS-API8]DeviceKvStore.Get(Bool)
     * @tc.desc Test Js Api DeviceKvStore.Get(Bool) testcase 101
     */
    it('testDeviceKvStoreGetBool101', 0, async function (done) {
        console.info('testDeviceKvStoreGetBool101');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreGetBool101 get success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreGetBool101 get fail' + err);
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetBool101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0460
     * @tc.name [JS-API8]DeviceKvStore.Get(Bool)
     * @tc.desc Test Js Api DeviceKvStore.Get(Bool) testcase 102
     */
    it('testDeviceKvStoreGetBool102', 0, async function (done) {
        console.info('testDeviceKvStoreGetBool102');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
                console.info('testDeviceKvStoreGetBool102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreGetBool102 get success');
                    expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.info('testDeviceKvStoreGetBool102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1130
     * @tc.name [JS-API8]DeviceKvStore.Put(Float)
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 101
     */
    it('testDeviceKvStorePutFloat101', 0, async function (done) {
        console.info('testDeviceKvStorePutFloat101');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.info('testDeviceKvStorePutFloat101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutFloat101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1140
     * @tc.name [JS-API8]DeviceKvStore.Put(Float)
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 102
     */
    it('testDeviceKvStorePutFloat102', 0, async function (done) {
        console.info('testDeviceKvStorePutFloat102');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
                console.info('testDeviceKvStorePutFloat102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
                    console.info('testDeviceKvStorePutFloat102 get success');
                    expect((err == undefined) && (floatValue == data)).assertTrue();
                    done();
                })
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutFloat102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1150
     * @tc.name [JS-API8]DeviceKvStore.Put(Float)
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 103
     */
    it('testDeviceKvStorePutFloat103', 0, async function (done) {
        console.info('testDeviceKvStorePutFloat103');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
                console.info('testDeviceKvStorePutFloat103 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
                    console.info('testDeviceKvStorePutFloat103 get success');
                    expect((err == undefined) && (floatValue == data)).assertTrue();
                    done();
                })
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutFloat103 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1160
     * @tc.name [JS-API8]DeviceKvStore.Put(Float)
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 104
     */
    it('testDeviceKvStorePutFloat104', 0, async function (done) {
        console.info('testDeviceKvStorePutFloat104');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
                console.info('testDeviceKvStorePutFloat104 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
                    console.info('testDeviceKvStorePutFloat104 get success');
                    expect((err == undefined) && (floatValue == data)).assertTrue();
                    done();
                })
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutFloat104 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0540
     * @tc.name [JS-API8]DeviceKvStore.Get(Float)
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 101
     */
    it('testDeviceKvStoreGetFloat101', 0, async function (done) {
        console.info('testDeviceKvStoreGetFloat101');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreGetFloat101 get success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreGetFloat101 get fail' + err);
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetFloat101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0340
     * @tc.name [JS-API8]DeviceKvStore.DeleteString()
     * @tc.desc Test Js Api DeviceKvStore.DeleteString testcase 101
     */
    it('testDeviceKvStoreDeleteString101', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteString101');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreDeleteString101 delete success');
                } else {
                    console.info('testDeviceKvStoreDeleteString101 delete fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteString101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0350
     * @tc.name [JS-API8]DeviceKvStore.DeleteString()
     * @tc.desc Test Js Api DeviceKvStore.DeleteString testcase 102
     */
    it('testDeviceKvStoreDeleteString102', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteString102');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err, data) {
                console.info('testDeviceKvStoreDeleteString102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreDeleteString102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.info('testDeviceKvStoreDeleteString102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0290
     * @tc.name [JS-API8]DeviceKvStore.DeleteInt()
     * @tc.desc Test Js Api DeviceKvStore.DeleteInt testcase 101
     */
    it('testDeviceKvStoreDeleteInt101', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteInt101');
        try{
            await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreDeleteInt101 get success');
                } else {
                    console.info('testDeviceKvStoreDeleteInt101 get fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteInt101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0300
     * @tc.name [JS-API8]DeviceKvStore.DeleteInt()
     * @tc.desc Test Js Api DeviceKvStore.DeleteInt testcase 102
     */
    it('testDeviceKvStoreDeleteInt102', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteInt102');
        try{
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
                console.info('testDeviceKvStoreDeleteInt102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreDeleteInt102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.info('testDeviceKvStoreDeleteInt102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0260
     * @tc.name [JS-API8]DeviceKvStore.DeleteFloat()
     * @tc.desc Test Js Api DeviceKvStore.DeleteFloat testcase 101
     */
    it('testDeviceKvStoreDeleteFloat101', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteFloat101');
        try{
            await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreDeleteFloat101 get success');
                } else {
                    console.info('testDeviceKvStoreDeleteFloat101 get fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteFloat101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0270
     * @tc.name [JS-API8]DeviceKvStore.DeleteFloat()
     * @tc.desc Test Js Api DeviceKvStore.DeleteFloat testcase 102
     */
    it('testDeviceKvStoreDeleteFloat102', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteFloat102');
        try{
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, async function (err, data) {
                console.info('testDeviceKvStoreDeleteFloat102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreDeleteFloat102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.info('testDeviceKvStoreDeleteFloat102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0230
     * @tc.name [JS-API8]DeviceKvStore.DeleteBool()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBool testcase 101
     */
    it('testDeviceKvStoreDeleteBool101', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBool101');
        try{
            await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreDeleteBool101 get success');
                } else {
                    console.info('testDeviceKvStoreDeleteBool101 get fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBool101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0240
     * @tc.name [JS-API8]DeviceKvStore.DeleteBool()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBool testcase 102
     */
    it('testDeviceKvStoreDeleteBool102', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBool102');
        try{
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
                console.info('testDeviceKvStoreDeleteBool102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                    console.info('testDeviceKvStoreDeleteBool102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBool102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0890
     * @tc.name [JS-API8]DeviceKvStore.OnChange()
     * @tc.desc Test Js Api DeviceKvStore.OnChange testcase 101
     */
    it('testDeviceKvStoreOnChange101', 0, async function (done) {
        console.info('testDeviceKvStoreOnChange101');
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.info('testDeviceKvStoreOnChange101 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.info('testDeviceKvStoreOnChange101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreOnChange101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0900
     * @tc.name [JS-API8]DeviceKvStore.OnChange()
     * @tc.desc Test Js Api DeviceKvStore.OnChange testcase 102
     */
    it('testDeviceKvStoreOnChange102', 0, async function (done) {
        console.info('testDeviceKvStoreOnChange102');
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.info('testDeviceKvStoreOnChange102 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.info('testDeviceKvStoreOnChange102 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreOnChange102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0910
     * @tc.name [JS-API8]DeviceKvStore.OnChange()
     * @tc.desc Test Js Api DeviceKvStore.OnChange testcase 103
     */
    it('testDeviceKvStoreOnChange103', 0, async function (done) {
        console.info('testDeviceKvStoreOnChange103');
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.info('testDeviceKvStoreOnChange103 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.info('testDeviceKvStoreOnChange103 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreOnChange103 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0950
     * @tc.name [JS-API8]DeviceKvStore.OnSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete testcase 101
     */
    it('testDeviceKvStoreOnSyncComplete101', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testDeviceKvStoreOnSyncComplete101 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnSyncComplete101 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnSyncComplete101 put failed:' + e);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PULL_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(e) {
                console.info('testDeviceKvStoreOnSyncComplete101 sync no peer device :e:' + e);
            }
        }catch(e) {
            console.info('testDeviceKvStoreOnSyncComplete101 no peer device :e:' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0960
     * @tc.name [JS-API8]DeviceKvStore.OnSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete testcase 102
     */
    it('testDeviceKvStoreOnSyncComplete102', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testDeviceKvStoreOnSyncComplete102 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnSyncComplete102 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnSyncComplete102 put failed:' + e);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(e) {
                console.info('testDeviceKvStoreOnSyncComplete102 sync no peer device :e:' + e);
            }
        }catch(e) {
            console.info('testDeviceKvStoreOnSyncComplete102 no peer device :e:' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0970
     * @tc.name [JS-API8]DeviceKvStore.OnSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete testcase 103
     */
    it('testDeviceKvStoreOnSyncComplete103', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testDeviceKvStoreOnSyncComplete103 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnSyncComplete103 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnSyncComplete103 put failed:' + e);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_PULL;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(e) {
                console.info('testDeviceKvStoreOnSyncComplete103 sync no peer device :e:' + e);
            }
        }catch(e) {
            console.info('testDeviceKvStoreOnSyncComplete103 no peer device :e:' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1480
     * @tc.name [JS-API8]DeviceKvStore.SetSyncRange()
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange testcase 101
     */
    it('testDeviceKvStoreSetSyncRange101', 0, async function (done) {
        console.info('testDeviceKvStoreSetSyncRange101');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
                console.info('testDeviceKvStoreSetSyncRange101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreSetSyncRange101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1490
     * @tc.name [JS-API8]DeviceKvStore.SetSyncRange()
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange testcase 102
     */
    it('testDeviceKvStoreSetSyncRange102', 0, async function (done) {
        console.info('testDeviceKvStoreSetSyncRange102');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
                console.info('testDeviceKvStoreSetSyncRange102 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreSetSyncRange102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1500
     * @tc.name [JS-API8]DeviceKvStore.SetSyncRange()
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange testcase 103
     */
    it('testDeviceKvStoreSetSyncRange103', 0, async function (done) {
        console.info('testDeviceKvStoreSetSyncRange103');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
                console.info('testDeviceKvStoreSetSyncRange103 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreSetSyncRange103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1040
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 101
     */
    it('testDeviceKvStorePutBatch101', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch101');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStorePutBatch101 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStorePutBatch101 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_string_key', function (err,entrys) {
                    console.info('testDeviceKvStorePutBatch101 getEntries success');
                    console.info('testDeviceKvStorePutBatch101 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch101 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1050
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 102
     */
    it('testDeviceKvStorePutBatch102', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch102');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_number_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.INTEGER,
                        value : 222
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStorePutBatch102 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStorePutBatch102 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
                    console.info('testDeviceKvStorePutBatch102 getEntries success');
                    console.info('testDeviceKvStorePutBatch102 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch102 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1060
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 103
     */
    it('testDeviceKvStorePutBatch103', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch103');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_number_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.FLOAT,
                        value : 2.0
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStorePutBatch103 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStorePutBatch103 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
                    console.info('testDeviceKvStorePutBatch103 getEntries success');
                    console.info('testDeviceKvStorePutBatch103 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch103 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1070
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 104
     */
    it('testDeviceKvStorePutBatch104', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch104');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_number_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.DOUBLE,
                        value : 2.00
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStorePutBatch104 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStorePutBatch104 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
                    console.info('testDeviceKvStorePutBatch104 getEntries success');
                    console.info('testDeviceKvStorePutBatch104 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch104 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch104 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1080
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 105
     */
    it('testDeviceKvStorePutBatch105', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch105');
        try {
            var bo = false;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BOOLEAN,
                        value : bo
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStorePutBatch105 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStorePutBatch105 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key', function (err,entrys) {
                    console.info('testDeviceKvStorePutBatch105 getEntries success');
                    console.info('testDeviceKvStorePutBatch105 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch105 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch105 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1090
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 106
     */
    it('testDeviceKvStorePutBatch106', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch106');
        try {
            var arr = new Uint8Array([21,31]);
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BYTE_ARRAY,
                        value : arr
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStorePutBatch106 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStorePutBatch106 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key', function (err,entrys) {
                    console.info('testDeviceKvStorePutBatch106 getEntries success');
                    console.info('testDeviceKvStorePutBatch106 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch106 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch106 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0190
     * @tc.name [JS-API8]DeviceKvStore.DeleteBatch()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch testcase 101
     */
    it('testDeviceKvStoreDeleteBatch101', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBatch101');
        try {
            let entries = [];
            let keys = [];
            for (var i = 0; i < 5; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
                keys.push(key + i);
            }
            console.info('testDeviceKvStoreDeleteBatch101 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStoreDeleteBatch101 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys, async function (err,data) {
                    console.info('testDeviceKvStoreDeleteBatch101 deleteBatch success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBatch101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0200
     * @tc.name [JS-API8]DeviceKvStore.DeleteBatch()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch testcase 102
     */
    it('testDeviceKvStoreDeleteBatch102', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBatch102');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys, function (err,data) {
                console.info('testDeviceKvStoreDeleteBatch102 deleteBatch success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBatch102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0210
     * @tc.name [JS-API8]DeviceKvStore.DeleteBatch()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch testcase 103
     */
    it('testDeviceKvStoreDeleteBatch103', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBatch103');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStoreDeleteBatch103 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStoreDeleteBatch103 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys, async function (err,data) {
                    console.info('testDeviceKvStoreDeleteBatch103 deleteBatch success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBatch103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1560
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction testcase 101
     */
    it('testDeviceKvStorestartTransaction101', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction101');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('testDeviceKvStorestartTransaction101 0' + data)
                count++;
            });
            await kvStore.startTransaction(async function (err,data) {
                console.info('testDeviceKvStorestartTransaction101 startTransaction success');
                expect(err == undefined).assertTrue();
                let entries = putBatchString(10, 'batch_test_string_key');
                console.info('testDeviceKvStorestartTransaction101 entries: ' + JSON.stringify(entries));
                await kvStore.putBatch(entries, async function (err,data) {
                    console.info('testDeviceKvStorestartTransaction101 putBatch success');
                    expect(err == undefined).assertTrue();
                    let keys = Object.keys(entries).slice(5); //delete 5 beginnings
                    await kvStore.deleteBatch(keys, async function (err,data) {
                        console.info('testDeviceKvStorestartTransaction101 deleteBatch success');
                        expect(err == undefined).assertTrue();
                        await kvStore.commit(async function (err,data) {
                            console.info('testDeviceKvStorestartTransaction101 commit success');
                            expect(err == undefined).assertTrue();
                            await sleep(2000);
                            expect(count == 1).assertTrue();
                            done();
                        });
                    });
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1570
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction testcase 102
     */
    it('testDeviceKvStorestartTransaction102', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction102');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('testDeviceKvStorestartTransaction102 0' + data)
                count++;
            });
            await kvStore.startTransaction(async function (err,data) {
                console.info('testDeviceKvStorestartTransaction102 startTransaction success');
                expect(err == undefined).assertTrue();
                let entries =  putBatchString(10, 'batch_test_string_key');
                console.info('testDeviceKvStorestartTransaction102 entries: ' + JSON.stringify(entries));
                await kvStore.putBatch(entries, async function (err,data) {
                    console.info('testDeviceKvStorestartTransaction102 putBatch success');
                    expect(err == undefined).assertTrue();
                    let keys = Object.keys(entries).slice(5); //delete 5 beginnings
                    await kvStore.deleteBatch(keys, async function (err,data) {
                        console.info('testDeviceKvStorestartTransaction102 deleteBatch success');
                        expect(err == undefined).assertTrue();
                        await kvStore.rollback(async function (err,data) {
                            console.info('testDeviceKvStorestartTransaction102 rollback success');
                            expect(err == undefined).assertTrue();
                            await sleep(2000);
                            expect(count == 0).assertTrue();
                            done();
                        });
                    });
                });
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1580
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction testcase 103
     */
    it('testDeviceKvStorestartTransaction103', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction103');
        try {
            await kvStore.startTransaction(1, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStorestartTransaction103 startTransaction success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStorestartTransaction103 startTransaction fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction103 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1590
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction testcase 104
     */
    it('testDeviceKvStorestartTransaction104', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction104');
        try {
            await kvStore.startTransaction('test_string', function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStorestartTransaction104 startTransaction success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStorestartTransaction104 startTransaction fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction104 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1600
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction testcase 105
     */
    it('testDeviceKvStorestartTransaction105', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction105');
        try {
            await kvStore.startTransaction(2.000, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStorestartTransaction105 startTransaction success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStorestartTransaction105 startTransaction fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction105 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0130
     * @tc.name [JS-API8]DeviceKvStore.Commit()
     * @tc.desc Test Js Api DeviceKvStore.Commit testcase 101
     */
    it('testDeviceKvStoreCommit101', 0, async function (done) {
        console.info('testDeviceKvStoreCommit101');
        try {
            await kvStore.commit(1, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreCommit101 commit success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreCommit101 commit fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreCommit101 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0140
     * @tc.name [JS-API8]DeviceKvStore.Commit()
     * @tc.desc Test Js Api DeviceKvStore.Commit testcase 102
     */
    it('testDeviceKvStoreCommit102', 0, async function (done) {
        console.info('testDeviceKvStoreCommit102');
        try {
            await kvStore.commit('test_string', function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreCommit102 commit success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreCommit102 commit fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreCommit102 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0150
     * @tc.name [JS-API8]DeviceKvStore.Commit()
     * @tc.desc Test Js Api DeviceKvStore.Commit testcase 103
     */
    it('testDeviceKvStoreCommit103', 0, async function (done) {
        console.info('testDeviceKvStoreCommit103');
        try {
            await kvStore.commit(2.000, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreCommit103 commit success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreCommit103 commit fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreCommit103 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1420
     * @tc.name [JS-API8]DeviceKvStore.Rollback()
     * @tc.desc Test Js Api DeviceKvStore.Rollback testcase 101
     */
    it('testDeviceKvStoreRollback101', 0, async function (done) {
        console.info('testDeviceKvStoreRollback101');
        try {
            await kvStore.rollback(1, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreRollback101 commit success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreRollback101 commit fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRollback101 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1430
     * @tc.name [JS-API8]DeviceKvStore.Rollback()
     * @tc.desc Test Js Api DeviceKvStore.Rollback testcase 102
     */
    it('testDeviceKvStoreRollback102', 0, async function (done) {
        console.info('testDeviceKvStoreRollback102');
        try {
            await kvStore.rollback('test_string', function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreRollback102 commit success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreRollback102 commit fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRollback102 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1440
     * @tc.name [JS-API8]DeviceKvStore.Rollback()
     * @tc.desc Test Js Api DeviceKvStore.Rollback testcase 103
     */
    it('testDeviceKvStoreRollback103', 0, async function (done) {
        console.info('testDeviceKvStoreRollback103');
        try {
            await kvStore.rollback(2.000, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreRollback103 commit success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreRollback103 commit fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRollback103 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0400
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync testcase 101
     */
    it('testDeviceKvStoreEnableSync101', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync101');
        try {
            await kvStore.enableSync(true, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreEnableSync101 enableSync success');
                    expect(err == undefined).assertTrue();
                } else {
                    console.info('testDeviceKvStoreEnableSync101 enableSync fail');
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0410
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync testcase 102
     */
    it('testDeviceKvStoreEnableSync102', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync102');
        try {
            await kvStore.enableSync(false, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreEnableSync102 enableSync success');
                    expect(err == undefined).assertTrue();
                } else {
                    console.info('testDeviceKvStoreEnableSync102 enableSync fail');
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0420
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync testcase 103
     */
    it('testDeviceKvStoreEnableSync103', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync103');
        try {
            await kvStore.enableSync(function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreEnableSync103 enableSync success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreEnableSync103 enableSync fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync103 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0430
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync testcase 104
     */
    it('testDeviceKvStoreEnableSync104', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync104');
        try {
            await kvStore.enableSync(null, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreEnableSync104 enableSync success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreEnableSync104 enableSync fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync104 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1350
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData testcase 101
     */
    it('testDeviceKvStoreRemoveDeviceData101', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData101');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
                console.info('testDeviceKvStoreRemoveDeviceData101 put success');
                expect(err == undefined).assertTrue();
                var deviceid = 'no_exist_device_id';
                await kvStore.removeDeviceData(deviceid, async function (err,data) {
                    if (err == undefined) {
                        console.info('testDeviceKvStoreRemoveDeviceData101 removeDeviceData success');
                        expect(null).assertFail();
                        done();
                    } else {
                        console.info('testDeviceKvStoreRemoveDeviceData101 removeDeviceData fail');
                        await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, async function (err,data) {
                            console.info('testDeviceKvStoreRemoveDeviceData101 get success');
                            expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                            done();
                        });
                    }
                });
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1360
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData testcase 102
     */
    it('testDeviceKvStoreRemoveDeviceData102', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData102');
        try {
            await kvStore.removeDeviceData(function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreRemoveDeviceData102 removeDeviceData success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreRemoveDeviceData102 removeDeviceData fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData101 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1370
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData testcase 103
     */
     it('testDeviceKvStoreRemoveDeviceData103', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData103');
        try {
            await kvStore.removeDeviceData('', function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreRemoveDeviceData103 removeDeviceData success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreRemoveDeviceData103 removeDeviceData fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData103 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1380
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData testcase 104
     */
    it('testDeviceKvStoreRemoveDeviceData104', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData104');
        try {
            await kvStore.removeDeviceData(null, function (err,data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreRemoveDeviceData104 removeDeviceData success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreRemoveDeviceData104 removeDeviceData fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData104 e ' + e);
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0640
     * @tc.name [JS-API8]DeviceKvStore.GetResultSet()
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 101
     */
    it('testDeviceKvStoreGetResultSet101', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet101');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries, async function (err, data) {
                console.info('testDeviceKvStoreGetResultSet101 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function (err, result) {
                    console.info('testDeviceKvStoreGetResultSet101 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet, function (err, data) {
                        console.info('testDeviceKvStoreGetResultSet101 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0650
     * @tc.name [JS-API8]DeviceKvStore.GetResultSet()
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 102
     */
    it('testDeviceKvStoreGetResultSet102', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet102');
        try {
            let resultSet;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function (err, result) {
                console.info('testDeviceKvStoreGetResultSet102 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
                await kvStore.closeResultSet(resultSet, function (err, data) {
                    console.info('testDeviceKvStoreGetResultSet102 closeResultSet success');
                    expect(err == undefined).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0660
     * @tc.name [JS-API8]DeviceKvStore.GetResultSet()
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 103
     */
    it('testDeviceKvStoreGetResultSet103', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet103');
        try {
            let resultSet;
            await kvStore.getResultSet(function (err, result) {
                console.info('testDeviceKvStoreGetResultSet103 getResultSet success');
                expect(err != undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0670
     * @tc.name [JS-API8]DeviceKvStore.GetResultSet()
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 104
     */
    it('testDeviceKvStoreGetResultSet104', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet104');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123, function (err, result) {
                console.info('testDeviceKvStoreGetResultSet104 getResultSet success');
                expect(err != undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet104 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0680
     * @tc.name [JS-API8]DeviceKvStore.GetResultSet()
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 105
     */
    it('testDeviceKvStoreGetResultSet105', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet105');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries, async function (err, data) {
                console.info('testDeviceKvStoreGetResultSet105 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getResultSet(localDeviceId, query, async function (err, result) {
                    console.info('testDeviceKvStoreGetResultSet105 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet, function (err, data) {
                        console.info('testDeviceKvStoreGetResultSet105 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        } catch(e) {
            console.info('testDeviceKvStoreGetResultSet105 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0690
     * @tc.name [JS-API8]DeviceKvStore.GetResultSet()
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 106
     */
    it('testDeviceKvStoreGetResultSet106', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet106');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries, async function (err, data) {
                console.info('testDeviceKvStoreGetResultSet106 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getResultSet(query, async function (err, result) {
                    console.info('testDeviceKvStoreGetResultSet106 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet, function (err, data) {
                        console.info('testDeviceKvStoreGetResultSet106 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        } catch(e) {
            console.info('testDeviceKvStoreGetResultSet106 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0060
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet testcase 101
     */
    it('testDeviceKvStoreCloseResultSet101', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet101');
        try {
            console.info('testDeviceKvStoreCloseResultSet101 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet, function (err, data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreCloseResultSet101 closeResultSet success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreCloseResultSet101 closeResultSet fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0070
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet testcase 102
     */
    it('testDeviceKvStoreCloseResultSet102', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet102');
        try {
            let resultSet = null;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function(err, result) {
                console.info('testDeviceKvStoreCloseResultSet102 getResultSet success');
                resultSet = result;
                await kvStore.closeResultSet(resultSet, function (err, data) {
                    if (err == undefined) {
                        console.info('testDeviceKvStoreCloseResultSet102 closeResultSet success');
                        expect(err == undefined).assertTrue();
                    } else {
                        console.info('testDeviceKvStoreCloseResultSet102 closeResultSet fail');
                        expect(null).assertFail();
                    }
                    done();
                });
            });
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0080
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet testcase 103
     */
    it('testDeviceKvStoreCloseResultSet103', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet103');
        try {
            console.info('testDeviceKvStoreCloseResultSet103 success');
            await kvStore.closeResultSet(function (err, data) {
                if (err == undefined) {
                    console.info('testDeviceKvStoreCloseResultSet103 closeResultSet success');
                    expect(null).assertFail();
                } else {
                    console.info('testDeviceKvStoreCloseResultSet103 closeResultSet fail');
                }
                done();
            });
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0090
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet testcase 104
     */
    it('testDeviceKvStoreCloseResultSet104', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet104');
        try {
            kvStore.closeResultSet(1, (err, data) => {
                if(err != null){
                    console.info('testDeviceKvStoreCloseResultSet104 e ' + err);
                }else{
                    console.info('testDeviceKvStoreCloseResultSet104 success(callback)');
                    expect(null).assertFail();
                }
            })
            console.info('testDeviceKvStoreCloseResultSet104 success');
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet104 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0720
     * @tc.name [JS-API8]DeviceKvStore.Get(ResultSize)
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 101
     */
    it('testDeviceKvStoreGetResultSize101', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSize101');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries, async function (err, data) {
                console.info('testDeviceKvStoreGetResultSize101 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getResultSize(query, async function (err, resultSize) {
                    console.info('testDeviceKvStoreGetResultSize101 getResultSet success');
                    expect(resultSize == 10).assertTrue();
                    done();
                });
            });
        } catch(e) {
            console.info('testDeviceKvStoreGetResultSize101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0730
     * @tc.name [JS-API8]DeviceKvStore.Get(ResultSize)
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 102
     */
    it('testDeviceKvStoreGetResultSize102', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSize102');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries, async function (err, data) {
                console.info('testDeviceKvStoreGetResultSize102 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getResultSize(localDeviceId, query, async function (err, resultSize) {
                    console.info('testDeviceKvStoreGetResultSize102 getResultSet success');
                    expect(resultSize == 10).assertTrue();
                    done();
                });
            });
        } catch(e) {
            console.info('testDeviceKvStoreGetResultSize102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0490
     * @tc.name [JS-API8]DeviceKvStore.GetEntries()
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 101
     */
    it('testDeviceKvStoreGetEntries101', 0, async function (done) {
        console.info('testDeviceKvStoreGetEntries101');
        try {
            var arr = new Uint8Array([21,31]);
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BYTE_ARRAY,
                        value : arr
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStoreGetEntries101 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStoreGetEntries101 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.deviceId(localDeviceId);
                query.prefixKey("batch_test");
                await kvStore.getEntries(localDeviceId, query, function (err,entrys) {
                    console.info('testDeviceKvStoreGetEntries101 getEntries success');
                    console.info('testDeviceKvStoreGetEntries101 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStoreGetEntries101 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                });
            });
            console.info('testDeviceKvStoreGetEntries101 success');
        }catch(e) {
            console.info('testDeviceKvStoreGetEntries101 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0500
     * @tc.name [JS-API8]DeviceKvStore.GetEntries()
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 102
     */
    it('testDeviceKvStoreGetEntries102', 0, async function (done) {
        console.info('testDeviceKvStoreGetEntries102');
        try {
            var arr = new Uint8Array([21,31]);
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BYTE_ARRAY,
                        value : arr
                    }
                }
                entries.push(entry);
            }
            console.info('testDeviceKvStoreGetEntries102 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.info('testDeviceKvStoreGetEntries102 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getEntries(query, function (err,entrys) {
                    console.info('testDeviceKvStoreGetEntries102 getEntries success');
                    console.info('testDeviceKvStoreGetEntries102 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStoreGetEntries102 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                });
            });
            console.info('testDeviceKvStoreGetEntries101 success');
            console.info('testDeviceKvStoreGetEntries102 success');
        }catch(e) {
            console.info('testDeviceKvStoreGetEntries102 e ' + e);
            expect(null).assertFail();
        }
        done();
    })
})
}