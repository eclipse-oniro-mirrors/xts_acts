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

const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 123;
const VALUE_TEST_FLOAT_ELEMENT = 321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-001';
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
    for (var i = 0; i < len; i++) {
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
export default function deviceKvStorePromiseTest(){
describe('deviceKvStorePromiseTest', function () {
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
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.info('beforeEach getKVStore success');
        }).catch((err) => {
            console.info('beforeEach getKVStore err ' + err);
        });
        console.info('beforeEach end');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1250
     * @tc.name [JS-API8]DeviceKvStore.Put(String)
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 001
     */
    it('testDeviceKvStorePutString001', 0, async function (done) {
        console.info('testDeviceKvStorePutString001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, null).then((data) => {
                console.info('testDeviceKvStorePutString001 put success');
                expect(null).assertFail();
            }).catch((error) => {
                console.info('testDeviceKvStorePutString001 put error' + error);
            });
        } catch (e) {
            console.info('testDeviceKvStorePutString001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1260
     * @tc.name [JS-API8]DeviceKvStore.Put(String)
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 002
     */
    it('testDeviceKvStorePutString002', 0, async function (done) {
        console.info('testDeviceKvStorePutString002');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
                console.info('testDeviceKvStorePutString002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStorePutString002 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutString002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1270
     * @tc.name [JS-API8]DeviceKvStore.Put(String)
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 003
     */
    it('testDeviceKvStorePutString003', 0, async function (done) {
        console.info('testDeviceKvStorePutString003');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
                console.info('testDeviceKvStorePutString003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStorePutString003 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutString003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1280
     * @tc.name [JS-API8]DeviceKvStore.Put(String)
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 004
     */
    it('testDeviceKvStorePutString004', 0, async function (done) {
        console.info('testDeviceKvStorePutString004');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('testDeviceKvStorePutString004 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testDeviceKvStorePutString004 get success data ' + data);
                    expect(str == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutString004 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.info('testDeviceKvStorePutString004 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutString004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0740
     * @tc.name [JS-API8]DeviceKvStore.Get(String)
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 001
     */
    it('testDeviceKvStoreGetString001', 0, async function (done) {
        console.info('testDeviceKvStoreGetString001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async (data) => {
                console.info('testDeviceKvStoreGetString001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreGetString001 get success');
                    expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetString001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.info('testDeviceKvStoreGetString001 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetString001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0750
     * @tc.name [JS-API8]DeviceKvStore.Get(String)
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 002
     */
    it('testDeviceKvStoreGetString002', 0, async function (done) {
        console.info('testDeviceKvStoreGetString002');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreGetString002 get success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetString002 get fail ' + err);
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetString002 get e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1170
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 001
     */
    it('testDeviceKvStorePutInt001', 0, async function (done) {
        console.info('testDeviceKvStorePutInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
                console.info('testDeviceKvStorePutInt001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1180
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 002
     */
    it('testDeviceKvStorePutInt002', 0, async function (done) {
        console.info('testDeviceKvStorePutInt002');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('testDeviceKvStorePutInt002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStorePutInt002 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutInt002 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutInt002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutInt002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1190
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 003
     */
    it('testDeviceKvStorePutInt003', 0, async function (done) {
        console.info('testDeviceKvStorePutInt003');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('testDeviceKvStorePutInt003 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStorePutInt003 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutInt003 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutInt003 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutInt003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1200
     * @tc.name [JS-API8]DeviceKvStore.Put(Int)
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 004
     */
    it('testDeviceKvStorePutInt004', 0, async function (done) {
        console.info('testDeviceKvStorePutInt004');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('testDeviceKvStorePutInt004 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStorePutInt004 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutInt004 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutInt004 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutInt004 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0550
     * @tc.name [JS-API8]DeviceKvStore.Get(Int)
     * @tc.desc Test Js Api DeviceKvStore.Get(Int) testcase 001
     */
    it('testDeviceKvStoreGetInt001', 0, async function (done) {
        console.info('testDeviceKvStoreGetInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('testDeviceKvStoreGetInt001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreGetInt001 get success');
                    expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetInt001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1100
     * @tc.name [JS-API8]DeviceKvStore.Put(Bool)
     * @tc.desc Test Js Api DeviceKvStore.Put(Bool) testcase 001
     */
    it('testDeviceKvStorePutBool001', 0, async function (done) {
        console.info('testDeviceKvStorePutBool001');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
                console.info('testDeviceKvStorePutBool001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0440
     * @tc.name [JS-API8]DeviceKvStore.Get(Bool)
     * @tc.desc Test Js Api DeviceKvStore.Get(Bool) testcase 001
     */
    it('testDeviceKvStoreGetBool001', 0, async function (done) {
        console.info('testDeviceKvStoreGetBool001');
        try {
            var boolValue = false;
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then(async (data) => {
                console.info('testDeviceKvStoreGetBool001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreGetBool001 get success');
                    expect(boolValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetBool001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1120
     * @tc.name [JS-API8]DeviceKvStore.Put(Float)
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 001
     */
    it('testDeviceKvStorePutFloat001', 0, async function (done) {
        console.info('testDeviceKvStorePutFloat001');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testDeviceKvStorePutFloat001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutFloat001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStorePutFloat001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0510
     * @tc.name [JS-API8]DeviceKvStore.Get(Float)
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 001
     */
    it('testDeviceKvStoreGetFloat001', 0, async function (done) {
        console.info('testDeviceKvStoreGetFloat001');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('testDeviceKvStoreGetFloat001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreGetFloat001 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetFloat001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetFloat001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetFloat001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0520
     * @tc.name [JS-API8]DeviceKvStore.Get(Float)
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 002
     */
    it('testDeviceKvStoreGetFloat002', 0, async function (done) {
        console.info('testDeviceKvStoreGetFloat002');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('testDeviceKvStoreGetFloat002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreGetFloat002 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetFloat002 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetFloat002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetFloat002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0530
     * @tc.name [JS-API8]DeviceKvStore.Get(Float)
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 003
     */
    it('testDeviceKvStoreGetFloat003', 0, async function (done) {
        console.info('testDeviceKvStoreGetFloat003');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('testDeviceKvStoreGetFloat003 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreGetFloat003 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetFloat003 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetFloat003 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreGetFloat003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0310
     * @tc.name [JS-API8]DeviceKvStore.DeleteString()
     * @tc.desc Test Js Api DeviceKvStore.DeleteString() testcase 001
     */
    it('testDeviceKvStoreDeleteString001', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteString001');
        try {
            var str = 'this is a test string';
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('testDeviceKvStoreDeleteString001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreDeleteString001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteString001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteString001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreDeleteString001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0320
     * @tc.name [JS-API8]DeviceKvStore.DeleteString()
     * @tc.desc Test Js Api DeviceKvStore.DeleteString() testcase 002
     */
    it('testDeviceKvStoreDeleteString002', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteString002');
        try {
            var str = '';
            for (var i = 0 ; i < 4096; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('testDeviceKvStoreDeleteString002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreDeleteString002 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteString002 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteString002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreDeleteString002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0330
     * @tc.name [JS-API8]DeviceKvStore.DeleteString()
     * @tc.desc Test Js Api DeviceKvStore.DeleteString() testcase 003
     */
    it('testDeviceKvStoreDeleteString003', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteString003');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreDeleteString003 delete success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteString003 delete fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreDeleteString003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0280
     * @tc.name [JS-API8]DeviceKvStore.DeleteInt()
     * @tc.desc Test Js Api DeviceKvStore.DeleteInt() testcase 001
     */
    it('testDeviceKvStoreDeleteInt001', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('testDeviceKvStoreDeleteInt001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreDeleteInt001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteInt001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreDeleteInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0250
     * @tc.name [JS-API8]DeviceKvStore.DeleteFloat()
     * @tc.desc Test Js Api DeviceKvStore.DeleteFloat() testcase 001
     */
    it('testDeviceKvStoreDeleteFloat001', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteFloat001');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then(async (data) => {
                console.info('testDeviceKvStoreDeleteFloat001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreDeleteFloat001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteFloat001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteFloat001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreDeleteFloat001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0220
     * @tc.name [JS-API8]DeviceKvStore.DeleteBool()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBool() testcase 001
     */
    it('testDeviceKvStoreDeleteBool001', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBool001');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then(async (data) => {
                console.info('testDeviceKvStoreDeleteBool001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('testDeviceKvStoreDeleteBool001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteBool001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testDeviceKvStoreDeleteBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0860
     * @tc.name [JS-API8]DeviceKvStore.OnChange()
     * @tc.desc Test Js Api DeviceKvStore.OnChange() testcase 001
     */
    it('testDeviceKvStoreOnChange001', 0, async function (done) {
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.info('testDeviceKvStoreOnChange001 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnChange001 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnChange001 put fail ' + error);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreOnChange001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0870
     * @tc.name [JS-API8]DeviceKvStore.OnChange()
     * @tc.desc Test Js Api DeviceKvStore.OnChange() testcase 002
     */
    it('testDeviceKvStoreOnChange002', 0, async function (done) {
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.info('testDeviceKvStoreOnChange002 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnChange002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnChange002 put fail ' + error);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreOnChange002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0880
     * @tc.name [JS-API8]DeviceKvStore.OnChange()
     * @tc.desc Test Js Api DeviceKvStore.OnChange() testcase 003
     */
    it('testDeviceKvStoreOnChange003', 0, async function (done) {
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.info('testDeviceKvStoreOnChange003 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnChange003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnChange003 put fail ' + error);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreOnChange003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0920
     * @tc.name [JS-API8]DeviceKvStore.OnSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete() testcase 001
     */
    it('testDeviceKvStoreOnSyncComplete001', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testDeviceKvStoreOnSyncComplete001 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnSyncComplete001 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnSyncComplete001 put failed:' + e);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PULL_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch (e) {
                console.info('testDeviceKvStoreOnSyncComplete001 sync no peer device :e:' + e);
            }
        } catch(e) {
            console.info('testDeviceKvStoreOnSyncComplete001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0930
     * @tc.name [JS-API8]DeviceKvStore.OnSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete() testcase 002
     */
    it('testDeviceKvStoreOnSyncComplete002', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testDeviceKvStoreOnSyncComplete002 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnSyncComplete002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnSyncComplete002 put failed:' + e);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(error) {
                console.info('testDeviceKvStoreOnSyncComplete002 no peer device :e:' + error);
            }
        } catch(e) {
            console.info('testDeviceKvStoreOnSyncComplete002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0940
     * @tc.name [JS-API8]DeviceKvStore.OnSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete() testcase 003
     */
    it('testDeviceKvStoreOnSyncComplete003', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testDeviceKvStoreOnSyncComplete003 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreOnSyncComplete003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testDeviceKvStoreOnSyncComplete003 put failed:' + e);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_PULL;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(error) {
                console.info('testDeviceKvStoreOnSyncComplete003 no peer device :e:' + error);
            }
        } catch(e) {
            console.info('testDeviceKvStoreOnSyncComplete003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0780
     * @tc.name [JS-API8]DeviceKvStore.OffChange()
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 001
     */
    it('testDeviceKvStoreOffChange001', 0, async function (done) {
        console.info('testDeviceKvStoreOffChange001');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffChange001 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.info('testDeviceKvStoreOffChange001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0790
     * @tc.name [JS-API8]DeviceKvStore.OffChange()
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 002
     */
    it('testDeviceKvStoreOffChange002', 0, async function (done) {
        console.info('testDeviceKvStoreOffChange002');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffChange002 0' + data)
            };
            var func1 = function (data) {
                console.info('testDeviceKvStoreOffChange002 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.info('testDeviceKvStoreOffChange002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0800
     * @tc.name [JS-API8]DeviceKvStore.OffChange()
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 003
     */
    it('testDeviceKvStoreOffChange003', 0, async function (done) {
        console.info('testDeviceKvStoreOffChange003');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffChange003 0' + data)
            };
            var func1 = function (data) {
                console.info('testDeviceKvStoreOffChange003 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
            kvStore.off('dataChange', func1);
        }catch(e) {
            console.info('testDeviceKvStoreOffChange003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0810
     * @tc.name [JS-API8]DeviceKvStore.OffChange()
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 004
     */
    it('testDeviceKvStoreOffChange004', 0, async function (done) {
        console.info('testDeviceKvStoreOffChange004');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffChange004 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange');
        }catch(e) {
            console.info('testDeviceKvStoreOffChange004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0820
     * @tc.name [JS-API8]DeviceKvStore.OffSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 001
     */
    it('testDeviceKvStoreOffSyncComplete001', 0, async function (done) {
        console.info('testDeviceKvStoreOffSyncComplete001');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffSyncComplete001 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.info('testDeviceKvStoreOffSyncComplete001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0830
     * @tc.name [JS-API8]DeviceKvStore.OffSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 002
     */
    it('testDeviceKvStoreOffSyncComplete002', 0, async function (done) {
        console.info('testDeviceKvStoreOffSyncComplete002');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffSyncComplete002 0' + data)
            };
            var func1 = function (data) {
                console.info('testDeviceKvStoreOffSyncComplete002 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.info('testDeviceKvStoreOffSyncComplete002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0840
     * @tc.name [JS-API8]DeviceKvStore.OffSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 003
     */
    it('testDeviceKvStoreOffSyncComplete003', 0, async function (done) {
        console.info('testDeviceKvStoreOffSyncComplete003');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffSyncComplete003 0' + data)
            };
            var func1 = function (data) {
                console.info('testDeviceKvStoreOffSyncComplete003 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
            kvStore.off('syncComplete', func1);
        }catch(e) {
            console.info('testDeviceKvStoreOffSyncComplete003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0850
     * @tc.name [JS-API8]DeviceKvStore.OffSyncComplete()
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 004
     */
    it('testDeviceKvStoreOffSyncComplete004', 0, async function (done) {
        console.info('testDeviceKvStoreOffSyncComplete004');
        try {
            var func = function (data) {
                console.info('testDeviceKvStoreOffSyncComplete004 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete');
        }catch(e) {
            console.info('testDeviceKvStoreOffSyncComplete004 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1450
     * @tc.name [JS-API8]DeviceKvStore.SetSyncRange()
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange() testcase 001
     */
    it('testDeviceKvStoreSetSyncRange001', 0, async function (done) {
        console.info('testDeviceKvStoreSetSyncRange001');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('testDeviceKvStoreSetSyncRange001 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteString003 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreSetSyncRange001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1460
     * @tc.name [JS-API8]DeviceKvStore.SetSyncRange()
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange() testcase 002
     */
    it('testDeviceKvStoreSetSyncRange002', 0, async function (done) {
        console.info('testDeviceKvStoreSetSyncRange002');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('testDeviceKvStoreSetSyncRange002 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreSetSyncRange002 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreSetSyncRange002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1470
     * @tc.name [JS-API8]DeviceKvStore.SetSyncRange()
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange() testcase 003
     */
    it('testDeviceKvStoreSetSyncRange003', 0, async function (done) {
        console.info('testDeviceKvStoreSetSyncRange003');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('testDeviceKvStoreSetSyncRange003 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreSetSyncRange003 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreSetSyncRange003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0980
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 001
     */
    it('testDeviceKvStorePutBatch001', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch001');
        try {
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('testDeviceKvStorePutBatch001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_string_key').then((entrys) => {
                    console.info('testDeviceKvStorePutBatch001 getEntries success');
                    console.info('testDeviceKvStorePutBatch001 entrys.length: ' + entrys.length);
                    console.info('testDeviceKvStorePutBatch001 entrys[0]: ' + JSON.stringify(entrys[0]));
                    console.info('testDeviceKvStorePutBatch001 entrys[0].value: ' + JSON.stringify(entrys[0].value));
                    console.info('testDeviceKvStorePutBatch001 entrys[0].value.value: ' + entrys[0].value.value);
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutBatch001 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0990
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 002
     */
    it('testDeviceKvStorePutBatch002', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch002');
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
            console.info('testDeviceKvStorePutBatch002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorePutBatch002 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.info('testDeviceKvStorePutBatch002 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutBatch002 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch002 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1000
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 003
     */
    it('testDeviceKvStorePutBatch003', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch003');
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
            console.info('testDeviceKvStorePutBatch003 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorePutBatch003 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.info('testDeviceKvStorePutBatch003 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutBatch003 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch003 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1010
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 004
     */
    it('testDeviceKvStorePutBatch004', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch004');
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
            console.info('testDeviceKvStorePutBatch004 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorePutBatch004 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.info('testDeviceKvStorePutBatch004 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutBatch004 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch004 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1020
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 005
     */
    it('testDeviceKvStorePutBatch005', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch005');
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
            console.info('testDeviceKvStorePutBatch005 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorePutBatch005 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys) => {
                    console.info('testDeviceKvStorePutBatch005 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutBatch005 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch005 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1030
     * @tc.name [JS-API8]DeviceKvStore.Put(Batch)
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 006
     */
    it('testDeviceKvStorePutBatch006', 0, async function (done) {
        console.info('testDeviceKvStorePutBatch006');
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
            console.info('testDeviceKvStorePutBatch006 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorePutBatch006 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys) => {
                    console.info('testDeviceKvStorePutBatch006 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStorePutBatch006 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch006 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStorePutBatch005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0160
     * @tc.name [JS-API8]DeviceKvStore.DeleteBatch()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch() testcase 001
     */
    it('testDeviceKvStoreDeleteBatch001', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBatch001');
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
            console.info('testDeviceKvStoreDeleteBatch001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreDeleteBatch001 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('testDeviceKvStoreDeleteBatch001 deleteBatch success');
                    expect(err == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteBatch001 deleteBatch fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBatch001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0170
     * @tc.name [JS-API8]DeviceKvStore.DeleteBatch()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch() testcase 002
     */
    it('testDeviceKvStoreDeleteBatch002', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBatch002');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('testDeviceKvStoreDeleteBatch002 deleteBatch success');
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteBatch002 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBatch002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0180
     * @tc.name [JS-API8]DeviceKvStore.DeleteBatch()
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch() testcase 003
     */
    it('testDeviceKvStoreDeleteBatch003', 0, async function (done) {
        console.info('testDeviceKvStoreDeleteBatch003');
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
            console.info('testDeviceKvStoreDeleteBatch003 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreDeleteBatch003 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('testDeviceKvStoreDeleteBatch003 deleteBatch success');
                }).catch((err) => {
                    console.info('testDeviceKvStoreDeleteBatch003 deleteBatch fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreDeleteBatch003 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreDeleteBatch003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1510
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 001
     */
    it('testDeviceKvStorestartTransaction001', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction001');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('testDeviceKvStorestartTransaction001' + JSON.stringify(data))
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('testDeviceKvStorestartTransaction001 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction001 startTransaction fail ' + err);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('testDeviceKvStorestartTransaction001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorestartTransaction001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('testDeviceKvStorestartTransaction001 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction001 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.commit().then(async (err) => {
                console.info('testDeviceKvStorestartTransaction001 commit success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction001 commit fail ' + err);
                expect(null).assertFail();
            });
            await sleep(2000);
            expect(count == 1).assertTrue();
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1520
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 002
     */
    it('testDeviceKvStorestartTransaction002', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction002');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('testDeviceKvStorestartTransaction002' + JSON.stringify(data))
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('testDeviceKvStorestartTransaction002 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction002 startTransaction fail ' + err);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('testDeviceKvStorestartTransaction002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStorestartTransaction002 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction002 putBatch fail ' + err);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('testDeviceKvStorestartTransaction002 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction002 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.rollback().then(async (err) => {
                console.info('testDeviceKvStorestartTransaction002 rollback success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction002 rollback fail ' + err);
                expect(null).assertFail();
            });
            await sleep(2000);
            expect(count == 0).assertTrue();
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1530
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 003
     */
    it('testDeviceKvStorestartTransaction003', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction002');
        try {
            await kvStore.startTransaction(1).then(async (err) => {
                console.info('testDeviceKvStorestartTransaction003 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction003 startTransaction fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction003 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1540
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 004
     */
    it('testDeviceKvStorestartTransaction004', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction004');
        try {
            await kvStore.startTransaction('test_string').then(async (err) => {
                console.info('testDeviceKvStorestartTransaction004 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction004 startTransaction fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction004 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1550
     * @tc.name [JS-API8]DeviceKvStore.startTransaction()
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 005
     */
    it('testDeviceKvStorestartTransaction005', 0, async function (done) {
        console.info('testDeviceKvStorestartTransaction005');
        try {
            await kvStore.startTransaction(2.000).then(async (err) => {
                console.info('testDeviceKvStorestartTransaction005 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStorestartTransaction005 startTransaction fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStorestartTransaction005 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0100
     * @tc.name [JS-API8]DeviceKvStore.Commit()
     * @tc.desc Test Js Api DeviceKvStore.Commit() testcase 001
     */
    it('testDeviceKvStoreCommit001', 0, async function (done) {
        console.info('testDeviceKvStoreCommit001');
        try {
            await kvStore.commit(1).then(async (err) => {
                console.info('testDeviceKvStoreCommit001 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreCommit001 commit fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreCommit001 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0110
     * @tc.name [JS-API8]DeviceKvStore.Commit()
     * @tc.desc Test Js Api DeviceKvStore.Commit() testcase 002
     */
    it('testDeviceKvStoreCommit002', 0, async function (done) {
        console.info('testDeviceKvStoreCommit002');
        try {
            await kvStore.commit('test_string').then(async (err) => {
                console.info('testDeviceKvStoreCommit002 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreCommit002 commit fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreCommit002 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0120
     * @tc.name [JS-API8]DeviceKvStore.Commit()
     * @tc.desc Test Js Api DeviceKvStore.Commit() testcase 003
     */
    it('testDeviceKvStoreCommit003', 0, async function (done) {
        console.info('testDeviceKvStoreCommit003');
        try {
            await kvStore.commit(2.000).then(async (err) => {
                console.info('testDeviceKvStoreCommit003 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreCommit003 commit fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreCommit003 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1390
     * @tc.name [JS-API8]DeviceKvStore.Rollback()
     * @tc.desc Test Js Api DeviceKvStore.Rollback() testcase 001
     */
    it('testDeviceKvStoreRollback001', 0, async function (done) {
        console.info('testDeviceKvStoreRollback001');
        try {
            await kvStore.rollback(1).then(async (err) => {
                console.info('testDeviceKvStoreRollback001 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRollback001 rollback fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreRollback001 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1400
     * @tc.name [JS-API8]DeviceKvStore.Rollback()
     * @tc.desc Test Js Api DeviceKvStore.Rollback() testcase 002
     */
    it('testDeviceKvStoreRollback002', 0, async function (done) {
        console.info('testDeviceKvStoreRollback002');
        try {
            await kvStore.rollback('test_string').then(async (err) => {
                console.info('testDeviceKvStoreRollback002 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRollback002 rollback fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreRollback002 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1410
     * @tc.name [JS-API8]DeviceKvStore.Rollback()
     * @tc.desc Test Js Api DeviceKvStore.Rollback() testcase 003
     */
    it('testDeviceKvStoreRollback003', 0, async function (done) {
        console.info('testDeviceKvStoreRollback003');
        try {
            await kvStore.rollback(2.000).then(async (err) => {
                console.info('testDeviceKvStoreRollback003 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRollback003 rollback fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreRollback003 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0360
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 001
     */
    it('testDeviceKvStoreEnableSync001', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync001');
        try {
            await kvStore.enableSync(true).then((err) => {
                console.info('testDeviceKvStoreEnableSync001 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreEnableSync001 enableSync fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0370
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 002
     */
    it('testDeviceKvStoreEnableSync002', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync002');
        try {
            await kvStore.enableSync(false).then((err) => {
                console.info('testDeviceKvStoreEnableSync002 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreEnableSync002 enableSync fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0380
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 003
     */
    it('testDeviceKvStoreEnableSync003', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync003');
        try {
            await kvStore.enableSync().then((err) => {
                console.info('testDeviceKvStoreEnableSync003 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreEnableSync003 enableSync fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync003 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0390
     * @tc.name [JS-API8]DeviceKvStore.EnableSync()
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 004
     */
    it('testDeviceKvStoreEnableSync004', 0, async function (done) {
        console.info('testDeviceKvStoreEnableSync004');
        try {
            await kvStore.enableSync(null).then((err) => {
                console.info('testDeviceKvStoreEnableSync004 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreEnableSync004 enableSync fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreEnableSync004 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1310
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 001
     */
    it('testDeviceKvStoreRemoveDeviceData001', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData001 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData001 put fail ' + err);
                expect(null).assertFail();
            });
            var deviceid = 'no_exist_device_id';
            await kvStore.removeDeviceData(deviceid).then((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData001 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData001 removeDeviceData fail ' + err);
            });
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('testDeviceKvStoreRemoveDeviceData001 get success data:' + data);
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData001 get fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1320
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 002
     */
    it('testDeviceKvStoreRemoveDeviceData002', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData002');
        try {
            await kvStore.removeDeviceData().then((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData002 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData002 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData002 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1330
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 003
     */
     it('testDeviceKvStoreRemoveDeviceData003', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData003');
        try {
            await kvStore.removeDeviceData('').then((data) => {
                console.info('testDeviceKvStoreRemoveDeviceData003 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData003 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData003 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_1340
     * @tc.name [JS-API8]DeviceKvStore.RemoveDeviceData()
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 004
     */
    it('testDeviceKvStoreRemoveDeviceData004', 0, async function (done) {
        console.info('testDeviceKvStoreRemoveDeviceData004');
        try {
            await kvStore.removeDeviceData(null).then((data) => {
                console.info('testDeviceKvStoreRemoveDeviceData004 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreRemoveDeviceData004 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreRemoveDeviceData004 e ' + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0580
     * @tc.name [JS-API8]DeviceKvStore.getResultSet()
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 001
     */
    it('testDeviceKvStoreGetResultSet001', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet001');
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
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetResultSet001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.info('testDeviceKvStoreGetResultSet001 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet001 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testDeviceKvStoreGetResultSet001 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet001 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0590
     * @tc.name [JS-API8]DeviceKvStore.getResultSet()
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 002
     */
    it('testDeviceKvStoreGetResultSet002', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet002');
        try {
            let resultSet;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.info('testDeviceKvStoreGetResultSet002 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testDeviceKvStoreGetResultSet002 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0600
     * @tc.name [JS-API8]DeviceKvStore.getResultSet()
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 003
     */
    it('testDeviceKvStoreGetResultSet003', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet003');
        try {
            let resultSet;
            await kvStore.getResultSet().then((result) => {
                console.info('testDeviceKvStoreGetResultSet003 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet003 getResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0610
     * @tc.name [JS-API8]DeviceKvStore.getResultSet()
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 004
     */
    it('testDeviceKvStoreGetResultSet004', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet004');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123).then((result) => {
                console.info('testDeviceKvStoreGetResultSet004 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet004 getResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0620
     * @tc.name [JS-API8]DeviceKvStore.getResultSet()
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 005
     */
    it('testDeviceKvStoreGetResultSet005', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet005');
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
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetResultSet005 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(localDeviceId, query).then((result) => {
                console.info('testDeviceKvStoreGetResultSet005 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet005 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            query.deviceId(localDeviceId);
            console.info("testDeviceKvStoreGetResultSet005 " + query.getSqlLike());
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testDeviceKvStoreGetResultSet005 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet005 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0630
     * @tc.name [JS-API8]DeviceKvStore.getResultSet()
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 006
     */
    it('testDeviceKvStoreGetResultSet006', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSet006');
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
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetResultSet006 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.deviceId(localDeviceId);
            query.prefixKey("batch_test");
            console.info("testDeviceKvStoreGetResultSet006 " + query.getSqlLike());
            await kvStore.getResultSet(query).then((result) => {
                console.info('testDeviceKvStoreGetResultSet006 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet006 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testDeviceKvStoreGetResultSet006 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSet006 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSet006 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0020
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 001
     */
    it('testDeviceKvStoreCloseResultSet001', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet001');
        try {
            console.info('testDeviceKvStoreCloseResultSet001 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet).then(() => {
                console.info('testDeviceKvStoreCloseResultSet001 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreCloseResultSet001 closeResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0030
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 002
     */
    it('testDeviceKvStoreCloseResultSet002', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet002');
        try {
            console.info('testDeviceKvStoreCloseResultSet002 success');
            let resultSet = null;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.info('testDeviceKvStoreCloseResultSet002 getResultSet success');
                resultSet = result;
            }).catch((err) => {
                console.info('testDeviceKvStoreCloseResultSet002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testDeviceKvStoreCloseResultSet002 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreCloseResultSet002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0040
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 003
     */
    it('testDeviceKvStoreCloseResultSet003', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet003');
        try {
            console.info('testDeviceKvStoreCloseResultSet003 success');
            let resultSet = null;
            await kvStore.closeResultSet().then(() => {
                console.info('testDeviceKvStoreCloseResultSet003 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testDeviceKvStoreCloseResultSet003 closeResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0050
     * @tc.name [JS-API8]DeviceKvStore.CloseResultSet()
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 004
     */
    it('testDeviceKvStoreCloseResultSet004', 0, async function (done) {
        console.info('testDeviceKvStoreCloseResultSet004');
        let errorInfo = undefined;
        try {
            await kvStore.closeResultSet(1).then(() => {
                console.info('testDeviceKvStoreCloseResultSet004 success');
                expect(null).assertFail();
            }).catch(err => {
                console.info('testDeviceKvStoreCloseResultSet004 err ' + err);
                errorInfo = err
            })
            console.info('testDeviceKvStoreCloseResultSet004 success');
        }catch(e) {
            console.info('testDeviceKvStoreCloseResultSet004 e ' + e);
            errorInfo = e
        }
        expect(errorInfo != undefined).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0700
     * @tc.name [JS-API8]DeviceKvStore.Get(ResultSize)
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 001
     */
    it('testDeviceKvStoreGetResultSize001', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSize001');
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
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetResultSize001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            query.deviceId(localDeviceId);
            await kvStore.getResultSize(query).then((resultSize) => {
                console.info('testDeviceKvStoreGetResultSize001 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSize001 getResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSize001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0710
     * @tc.name [JS-API8]DeviceKvStore.Get(ResultSize)
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 002
     */
    it('testDeviceKvStoreGetResultSize002', 0, async function (done) {
        console.info('testDeviceKvStoreGetResultSize001');
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
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetResultSize001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSize(localDeviceId, query).then((resultSize) => {
                console.info('testDeviceKvStoreGetResultSize001 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.info('testDeviceKvStoreGetResultSize001 getResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testDeviceKvStoreGetResultSize001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0470
     * @tc.name [JS-API8]DeviceKvStore.GetEntries()
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 001
     */
    it('testDeviceKvStoreGetEntries001', 0, async function (done) {
        console.info('testDeviceKvStoreGetEntries001');
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
            console.info('testDeviceKvStoreGetEntries001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetEntries001 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.deviceId(localDeviceId);
                query.prefixKey("batch_test");
                await kvStore.getEntries(localDeviceId, query).then((entrys) => {
                    console.info('testDeviceKvStoreGetEntries001 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetEntries001 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetEntries001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            console.info('testDeviceKvStoreGetEntries001 success');
        }catch(e) {
            console.info('testDeviceKvStoreGetEntries001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceStoreJsApiTest_0480
     * @tc.name [JS-API8]DeviceKvStore.GetEntries()
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 002
     */
    it('testDeviceKvStoreGetEntries002', 0, async function (done) {
        console.info('testDeviceKvStoreGetEntries002');
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
            console.info('testDeviceKvStoreGetEntries002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testDeviceKvStoreGetEntries002 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getEntries(query).then((entrys) => {
                    console.info('testDeviceKvStoreGetEntries002 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.info('testDeviceKvStoreGetEntries002 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testDeviceKvStoreGetEntries002 putBatch fail ' + err);
                expect(null).assertFail();
            });
            console.info('testDeviceKvStoreGetEntries002 success');
        }catch(e) {
            console.info('testDeviceKvStoreGetEntries002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })
})
}