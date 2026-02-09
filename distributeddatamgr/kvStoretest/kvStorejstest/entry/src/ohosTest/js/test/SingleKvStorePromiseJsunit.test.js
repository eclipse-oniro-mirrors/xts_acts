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

export default function singleKvStorePromiseTest(){
describe('singleKvStorePromiseTest', function () {
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
        console.info('beforeAll config:'+ JSON.stringify(config));
        await factory.createKVManager(config).then((manager) => {
            kvManager = manager;
            console.info('beforeAll createKVManager success');
            done();
        }).catch((err) => {
            console.info('beforeAll createKVManager err ' + err);
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
        console.info('beforeEach' + JSON.stringify(options));
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.info('beforeEach getKVStore success');
            done();
        }).catch((err) => {
            console.info('beforeEach getKVStore err ' + err);
            done();
        });

    })

    afterEach(async function (done) {
        console.info('afterEach');
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

    })

    /**
     * @tc.name   testSingleKvStorePutString001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0670
     * @tc.desc   Test Js Api SingleKvStore.Put(String)  testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutString001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, null).then((data) => {
                console.info('testSingleKvStorePutString001 put success');
                expect(null).assertFail();
            }).catch((error) => {
                console.info('testSingleKvStorePutString001 put error' + error);
            });
        } catch (e) {
            console.info('testSingleKvStorePutString001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutString002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0680
     * @tc.desc   Test Js Api SingleKvStore.Put(String)  testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutString002');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
                console.info('testSingleKvStorePutString002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testSingleKvStorePutString002 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutString002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutString003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0690
     * @tc.desc   Test Js Api SingleKvStore.Put(String)  testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutString003');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
                console.info('testSingleKvStorePutString003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testSingleKvStorePutString003 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutString003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutString004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0700
     * @tc.desc   Test Js Api SingleKvStore.Put(String)  testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutString004');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('testSingleKvStorePutString004 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testSingleKvStorePutString004 get success data ' + data);
                    expect(str == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutString004 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.info('testSingleKvStorePutString004 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutString004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetString001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0390
     * @tc.desc   Test Js Api SingleKvStoreGetString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetString001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async (data) => {
                console.info('testSingleKvStoreGetString001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreGetString001 get success');
                    expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetString001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.info('testSingleKvStoreGetString001 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStoreGetString001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetString002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0400
     * @tc.desc   Test Js Api SingleKvStoreGetString testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetString002');
        try {
            await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('testSingleKvStoreGetString002 get success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreGetString002 get fail ' + err);
            });
        } catch (e) {
            console.info('testSingleKvStoreGetString002 get e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutInt001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0630
     * @tc.desc   Test Js Api SingleKvStore.Put(Int)  testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
                console.info('testSingleKvStorePutInt001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutInt002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0640
     * @tc.desc   Test Js Api SingleKvStore.Put(Int)  testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutInt002');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('testSingleKvStorePutInt002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testSingleKvStorePutInt002 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutInt002 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutInt002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutInt002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutInt003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0650
     * @tc.desc   Test Js Api SingleKvStore.Put(Int)  testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutInt003');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('testSingleKvStorePutInt003 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testSingleKvStorePutInt003 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutInt003 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutInt003 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutInt003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutInt004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0660
     * @tc.desc   Test Js Api SingleKvStore.Put(Int)  testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutInt004');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('testSingleKvStorePutInt004 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testSingleKvStorePutInt004 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutInt004 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutInt004 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutInt004 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetInt001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0270
     * @tc.desc   Test Js Api SingleKvStoreGetInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('testSingleKvStoreGetInt001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreGetInt001 get success');
                    expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetInt001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStoreGetInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBool001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0610
     * @tc.desc   Test Js Api SingleKvStore.Put(Bool)  testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBool001');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
                console.info('testSingleKvStorePutBool001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStorePutBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetBool001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0210
     * @tc.desc   Test Js Api SingleKvStoreGetBool testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetBool001');
        try {
            var boolValue = false;
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then(async (data) => {
                console.info('testSingleKvStoreGetBool001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreGetBool001 get success');
                    expect(boolValue == data).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetBool001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testSingleKvStoreGetBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutFloat001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0620
     * @tc.desc   Test Js Api SingleKvStore.Put(Float)  testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutFloat001');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testSingleKvStorePutFloat001 put success');
                expect(data == undefined).assertTrue();
                done();
            }).catch((err) => {
                console.info('testSingleKvStorePutFloat001 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStorePutFloat001 put e ' + e);
            expect(null).assertFail();
            done();
        }

    })

    /**
     * @tc.name   testSingleKvStoreGetFloat001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0240
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetFloat001');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('testSingleKvStoreGetFloat001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreGetFloat001 get success');
                    expect(floatValue == data).assertTrue();
            done();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetFloat001 get fail ' + err);
                    expect(null).assertFail();
            done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetFloat001 put fail ' + err);
                expect(null).assertFail();
          done();
            });
        } catch (e) {
            console.info('testSingleKvStoreGetFloat001 put e ' + e);
            expect(null).assertFail();
            done();
        }
        
    })

    /**
     * @tc.name   testSingleKvStoreGetFloat002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0250
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetFloat002');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('testSingleKvStoreGetFloat002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreGetFloat002 get success');
                    expect(floatValue == data).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetFloat002 get fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetFloat002 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreGetFloat002 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreGetFloat003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0260
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetFloat003');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('testSingleKvStoreGetFloat003 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreGetFloat003 get success');
                    expect(floatValue == data).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetFloat003 get fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetFloat003 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreGetFloat003 put e ' + e);
            expect(null).assertFail();
            done();
        }
        
    })

    /**
     * @tc.name   testSingleKvStoreDeleteString001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0140
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteString001');
        try {
            var str = 'this is a test string';
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('testSingleKvStoreDeleteString001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreDeleteString001 delete success');
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteString001 delete fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteString001 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreDeleteString001 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreDeleteString002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0150
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteString002');
        try {
            var str = '';
            for (var i = 0 ; i < 4096; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('testSingleKvStoreDeleteString002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreDeleteString002 delete success');
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteString002 delete fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteString002 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreDeleteString002 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreDeleteString003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0160
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteString003');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('testSingleKvStoreDeleteString003 delete success');
                expect(data == undefined).assertTrue();
                done();
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteString003 delete fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreDeleteString003 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreDeleteInt001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0130
     * @tc.desc   Test Js Api SingleKvStoreDeleteInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('testSingleKvStoreDeleteInt001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreDeleteInt001 delete success');
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteInt001 delete fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteInt001 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreDeleteInt001 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreDeleteFloat001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0120
     * @tc.desc   Test Js Api SingleKvStoreDeleteFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteFloat001');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then(async (data) => {
                console.info('testSingleKvStoreDeleteFloat001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreDeleteFloat001 delete success');
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteFloat001 delete fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteFloat001 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreDeleteFloat001 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreDeleteBool001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0110
     * @tc.desc   Test Js Api SingleKvStoreDeleteBool testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteBool001');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then(async (data) => {
                console.info('testSingleKvStoreDeleteBool001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('testSingleKvStoreDeleteBool001 delete success');
                    expect(data == undefined).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteBool001 delete fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteBool001 put fail ' + err);
                expect(null).assertFail();
                done();
            });
        } catch (e) {
            console.info('testSingleKvStoreDeleteBool001 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreOnChange001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0490
     * @tc.desc   Test Js Api SingleKvStoreOnChange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOnChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.info('testSingleKvStoreOnChange001 ' + JSON.stringify(data));
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testSingleKvStoreOnChange001 put success');
                expect(data == undefined).assertTrue();
                done();
            }).catch((error) => {
                console.info('testSingleKvStoreOnChange001 put fail ' + error);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreOnChange001 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreOnChange002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0500
     * @tc.desc   Test Js Api SingleKvStoreOnChange testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOnChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.info('testSingleKvStoreOnChange002 on ' + JSON.stringify(data));
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testSingleKvStoreOnChange002 put success');
                expect(data == undefined).assertTrue();
                done();
            }).catch((error) => {
                console.info('testSingleKvStoreOnChange002 put fail ' + error);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreOnChange002 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreOnChange003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0510
     * @tc.desc   Test Js Api SingleKvStoreOnChange testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOnChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.info('testSingleKvStoreOnChange003 ' + JSON.stringify(data));
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('testSingleKvStoreOnChange003 put success');
                expect(data == undefined).assertTrue();
                done();
            }).catch((error) => {
                console.info('testSingleKvStoreOnChange003 put fail ' + error);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreOnChange003 put e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreOnSyncComplete001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0520
     * @tc.desc   Test Js Api SingleKvStoreOnSyncComplete testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOnSyncComplete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testSingleKvStoreOnSyncComplete001 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testSingleKvStoreOnSyncComplete001 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testSingleKvStoreOnSyncComplete001 put fail ' + error);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PULL_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode, 10);
            } catch (e) {
                console.info('testSingleKvStoreOnSyncComplete001 sync no peer device :e:' + e);
            }
        }catch(e) {
            console.info('testSingleKvStoreOnSyncComplete001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOnSyncComplete002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0530
     * @tc.desc   Test Js Api SingleKvStoreOnSyncComplete testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOnSyncComplete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testSingleKvStoreOnSyncComplete002 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testSingleKvStoreOnSyncComplete002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testSingleKvStoreOnSyncComplete002 put fail ' + error);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode, 10);
            } catch (e) {
                console.info('testSingleKvStoreOnSyncComplete002 sync no peer device :e:' + e);
            }
        }catch(e) {
            console.info('testSingleKvStoreOnSyncComplete002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOnSyncComplete003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0540
     * @tc.desc   Test Js Api SingleKvStoreOnSyncComplete testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOnSyncComplete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('testSingleKvStoreOnSyncComplete003 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('testSingleKvStoreOnSyncComplete003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.info('testSingleKvStoreOnSyncComplete003 put fail ' + error);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_PULL;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode, 10);
            } catch (e) {
                console.info('testSingleKvStoreOnSyncComplete003 sync no peer device :e:' + e);
            }
        }catch(e) {
            console.info('testSingleKvStoreOnSyncComplete003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffChange001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0410
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffChange001');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffChange001 ' + JSON.stringify(data));
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.info('testSingleKvStoreOffChange001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffChange002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0420
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffChange002');
        let ret = false;
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffChange002 ' + JSON.stringify(data));
            };
            var func1 = function (data) {
                console.info('testSingleKvStoreOffChange002 ' + JSON.stringify(data));
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.info('testSingleKvStoreOffChange002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffChange003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0430
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffChange003');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffChange003 0' + data)
            };
            var func1 = function (data) {
                console.info('testSingleKvStoreOffChange003 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
            kvStore.off('dataChange', func1);
        }catch(e) {
            console.info('testSingleKvStoreOffChange003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffChange004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0440
     * @tc.desc   Test Js Api SingleKvStoreOffChange testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffChange004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffChange004');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffChange004 ' + JSON.stringify(data));
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange');
        }catch(e) {
            console.info('testSingleKvStoreOffChange004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffSyncComplete001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0450
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffSyncComplete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffSyncComplete001');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffSyncComplete001 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.info('testSingleKvStoreOffSyncComplete001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffSyncComplete002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0460
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffSyncComplete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffSyncComplete002');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffSyncComplete002 0' + data)
            };
            var func1 = function (data) {
                console.info('testSingleKvStoreOffSyncComplete002 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.info('testSingleKvStoreOffSyncComplete002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffSyncComplete003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0470
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffSyncComplete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffSyncComplete003');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffSyncComplete003 0' + data)
            };
            var func1 = function (data) {
                console.info('testSingleKvStoreOffSyncComplete003 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
            kvStore.off('syncComplete', func1);
        }catch(e) {
            console.info('testSingleKvStoreOffSyncComplete003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreOffSyncComplete004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0480
     * @tc.desc   Test Js Api SingleKvStoreOffSyncComplete testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreOffSyncComplete004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreOffSyncComplete004');
        try {
            var func = function (data) {
                console.info('testSingleKvStoreOffSyncComplete004 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete');
        }catch(e) {
            console.info('testSingleKvStoreOffSyncComplete004 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncRange001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0820
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncRange001');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('testSingleKvStoreSetSyncRange001 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteString003 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncRange001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncRange002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0830
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncRange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncRange002');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('testSingleKvStoreSetSyncRange002 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreSetSyncRange002 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncRange002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncRange003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0840
     * @tc.desc   Test Js Api SingleKvStoreSetSyncRange testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncRange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncRange003');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('testSingleKvStoreSetSyncRange003 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreSetSyncRange003 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncRange003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBatch001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0550
     * @tc.desc   Test Js Api SingleKvStore.PutBatch()  testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBatch001');
        try {
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('testSingleKvStorePutBatch001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorePutBatch001 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_string_key').then((entrys) => {
                    console.info('testSingleKvStorePutBatch001 getEntries success');
                    console.info('testSingleKvStorePutBatch001 ' + JSON.stringify(entries));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutBatch001 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStorePutBatch001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBatch002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0560
     * @tc.desc   Test Js Api SingleKvStore.PutBatch()  testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBatch002');
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
            console.info('testSingleKvStorePutBatch002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorePutBatch002 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_number_key').then((entrys) => {
                    console.info('testSingleKvStorePutBatch002 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutBatch002 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch002 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStorePutBatch002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBatch003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0570
     * @tc.desc   Test Js Api SingleKvStore.PutBatch()  testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBatch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBatch003');
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
            console.info('testSingleKvStorePutBatch003 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorePutBatch003 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_number_key').then((entrys) => {
                    console.info('testSingleKvStorePutBatch003 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutBatch003 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch003 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStorePutBatch003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBatch004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0580
     * @tc.desc   Test Js Api SingleKvStore.PutBatch()  testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBatch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBatch004');
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
            console.info('testSingleKvStorePutBatch004 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorePutBatch004 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_number_key').then((entrys) => {
                    console.info('testSingleKvStorePutBatch004 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutBatch004 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch004 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStorePutBatch004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBatch005
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0590
     * @tc.desc   Test Js Api SingleKvStore.PutBatch()  testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBatch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBatch005');
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
            console.info('testSingleKvStorePutBatch005 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorePutBatch005 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_bool_key').then((entrys) => {
                    console.info('testSingleKvStorePutBatch005 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutBatch005 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch005 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStorePutBatch005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorePutBatch006
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0600
     * @tc.desc   Test Js Api SingleKvStore.PutBatch()  testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorePutBatch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorePutBatch006');
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
            console.info('testSingleKvStorePutBatch006 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorePutBatch006 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_bool_key').then((entrys) => {
                    console.info('testSingleKvStorePutBatch006 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStorePutBatch006 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch006 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStorePutBatch005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreDeleteBatch001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0080
     * @tc.desc   Test Js Api SingleKvStoreDeleteBatch testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteBatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteBatch001');
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
            console.info('testSingleKvStoreDeleteBatch001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStoreDeleteBatch001 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('testSingleKvStoreDeleteBatch001 deleteBatch success');
                    expect(err == undefined).assertTrue();
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteBatch001 deleteBatch fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreDeleteBatch001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreDeleteBatch002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0090
     * @tc.desc   Test Js Api SingleKvStoreDeleteBatch testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteBatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteBatch002');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('testSingleKvStoreDeleteBatch002 deleteBatch success');
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteBatch002 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreDeleteBatch002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreDeleteBatch003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0100
     * @tc.desc   Test Js Api SingleKvStoreDeleteBatch testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreDeleteBatch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreDeleteBatch003');
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
            console.info('testSingleKvStoreDeleteBatch003 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStoreDeleteBatch003 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('testSingleKvStoreDeleteBatch003 deleteBatch success');
                }).catch((err) => {
                    console.info('testSingleKvStoreDeleteBatch003 deleteBatch fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreDeleteBatch003 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreDeleteBatch003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorestartTransaction001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0850
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorestartTransaction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorestartTransaction001');
        try {
            var count = 0;
            kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_ALL, function (data) {
                console.info('testSingleKvStorestartTransaction001 ' + JSON.stringify(data));
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('testSingleKvStorestartTransaction001 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction001 startTransaction fail ' + err);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('testSingleKvStorestartTransaction001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorestartTransaction001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('testSingleKvStorestartTransaction001 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction001 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.commit().then(async (err) => {
                console.info('testSingleKvStorestartTransaction001 commit success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction001 commit fail ' + err);
                expect(null).assertFail();
            });
            await sleep(500);
            expect(count == 1).assertTrue();
        }catch(e) {
            console.info('testSingleKvStorestartTransaction001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorestartTransaction002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0860
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorestartTransaction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorestartTransaction002');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('testSingleKvStorestartTransaction002 ' + JSON.stringify(data));
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('testSingleKvStorestartTransaction002 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction002 startTransaction fail ' + err);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('testSingleKvStorestartTransaction002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStorestartTransaction002 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction002 putBatch fail ' + err);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('testSingleKvStorestartTransaction002 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction002 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.rollback().then(async (err) => {
                console.info('testSingleKvStorestartTransaction002 rollback success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction002 rollback fail ' + err);
                expect(null).assertFail();
            });
            await sleep(500);
            expect(count == 0).assertTrue();
        }catch(e) {
            console.info('testSingleKvStorestartTransaction002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorestartTransaction003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0870
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorestartTransaction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorestartTransaction002');
        try {
            await kvStore.startTransaction(1).then(async (err) => {
                console.info('testSingleKvStorestartTransaction003 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction003 startTransaction fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStorestartTransaction003 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorestartTransaction004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0880
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorestartTransaction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorestartTransaction004');
        try {
            await kvStore.startTransaction('test_string').then(async (err) => {
                console.info('testSingleKvStorestartTransaction004 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction004 startTransaction fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStorestartTransaction004 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStorestartTransaction005
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0890
     * @tc.desc   Test Js Api SingleKvStorestartTransaction testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStorestartTransaction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStorestartTransaction005');
        try {
            await kvStore.startTransaction(2.000).then(async (err) => {
                console.info('testSingleKvStorestartTransaction005 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStorestartTransaction005 startTransaction fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStorestartTransaction005 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCommit001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0050
     * @tc.desc   Test Js Api SingleKvStoreCommit testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCommit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCommit001');
        try {
            await kvStore.commit(1).then(async (err) => {
                console.info('testSingleKvStoreCommit001 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreCommit001 commit fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreCommit001 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCommit002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0060
     * @tc.desc   Test Js Api SingleKvStoreCommit testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCommit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCommit002');
        try {
            await kvStore.commit('test_string').then(async (err) => {
                console.info('testSingleKvStoreCommit002 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreCommit002 commit fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreCommit002 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCommit003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0070
     * @tc.desc   Test Js Api SingleKvStoreCommit testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCommit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCommit003');
        try {
            await kvStore.commit(2.000).then(async (err) => {
                console.info('testSingleKvStoreCommit003 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreCommit003 commit fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreCommit003 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreRollback001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0750
     * @tc.desc   Test Js Api SingleKvStoreRollback testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreRollback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRollback001');
        try {
            await kvStore.rollback(1).then(async (err) => {
                console.info('testSingleKvStoreRollback001 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRollback001 rollback fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreRollback001 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreRollback002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0760
     * @tc.desc   Test Js Api SingleKvStoreRollback testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreRollback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRollback002');
        try {
            await kvStore.rollback('test_string').then(async (err) => {
                console.info('testSingleKvStoreRollback002 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRollback002 rollback fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreRollback002 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreRollback003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0770
     * @tc.desc   Test Js Api SingleKvStoreRollback testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreRollback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRollback003');
        try {
            await kvStore.rollback(2.000).then(async (err) => {
                console.info('testSingleKvStoreRollback003 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRollback003 rollback fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreRollback003 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreEnableSync001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0170
     * @tc.desc   Test Js Api SingleKvStoreEnableSync testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreEnableSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreEnableSync001');
        try {
            await kvStore.enableSync(true).then((err) => {
                console.info('testSingleKvStoreEnableSync001 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreEnableSync001 enableSync fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreEnableSync001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreEnableSync002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0180
     * @tc.desc   Test Js Api SingleKvStoreEnableSync testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreEnableSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreEnableSync002');
        try {
            await kvStore.enableSync(false).then((err) => {
                console.info('testSingleKvStoreEnableSync002 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreEnableSync002 enableSync fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreEnableSync002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreEnableSync003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0190
     * @tc.desc   Test Js Api SingleKvStoreEnableSync testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreEnableSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreEnableSync003');
        try {
            await kvStore.enableSync().then((err) => {
                console.info('testSingleKvStoreEnableSync003 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreEnableSync003 enableSync fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreEnableSync003 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreEnableSync004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0200
     * @tc.desc   Test Js Api SingleKvStoreEnableSync testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreEnableSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreEnableSync004');
        try {
            await kvStore.enableSync(null).then((err) => {
                console.info('testSingleKvStoreEnableSync004 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreEnableSync004 enableSync fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreEnableSync004 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreRemoveDeviceData001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0711
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreRemoveDeviceData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRemoveDeviceData001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err) => {
                console.info('testSingleKvStoreRemoveDeviceData001 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreRemoveDeviceData001 put fail ' + err);
                expect(null).assertFail();
            });
            var deviceid = 'no_exist_device_id';
            await kvStore.removeDeviceData(deviceid).then((err) => {
                console.info('testSingleKvStoreRemoveDeviceData001 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRemoveDeviceData001 removeDeviceData fail ' + err);
            });
            await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('testSingleKvStoreRemoveDeviceData001 get success data:' + data);
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreRemoveDeviceData001 get fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreRemoveDeviceData001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreRemoveDeviceData002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0721
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreRemoveDeviceData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRemoveDeviceData002');
        try {
            await kvStore.removeDeviceData().then((err) => {
                console.info('testSingleKvStoreRemoveDeviceData002 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRemoveDeviceData002 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreRemoveDeviceData002 e ' + e);
        }
        done();
    })

     /**
      * @tc.name   testSingleKvStoreRemoveDeviceData003
      * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0731
      * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testSingleKvStoreRemoveDeviceData003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRemoveDeviceData003');
        try {
            await kvStore.removeDeviceData('').then((data) => {
                console.info('testSingleKvStoreRemoveDeviceData003 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRemoveDeviceData003 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreRemoveDeviceData003 e ' + e);
        }
        done();
    })


    /**
     * @tc.name   testSingleKvStoreRemoveDeviceData004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0741
     * @tc.desc   Test Js Api SingleKvStoreRemoveDeviceData testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreRemoveDeviceData004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreRemoveDeviceData004');
        try {
            await kvStore.removeDeviceData(null).then((err) => {
                console.info('testSingleKvStoreRemoveDeviceData004 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreRemoveDeviceData004 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreRemoveDeviceData004 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncParam001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0781
     * @tc.desc   Test Js Api SingleKvStoreSetSyncParam testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncParam001');
        try {
            var defaultAllowedDelayMs = 500;
            await kvStore.setSyncParam(defaultAllowedDelayMs).then((err) => {
                console.info('testSingleKvStoreSetSyncParam001 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreSetSyncParam001 put fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncParam001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncParam002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0791
     * @tc.desc   Test Js Api SingleKvStoreSetSyncParam testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncParam002');
        try {
            await kvStore.setSyncParam().then((err) => {
                console.info('testSingleKvStoreSetSyncParam002 put success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreSetSyncParam002 put fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncParam002 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncParam003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0801
     * @tc.desc   Test Js Api SingleKvStoreSetSyncParam testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncParam003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncParam003');
        try {
            await kvStore.setSyncParam('').then((err) => {
                console.info('testSingleKvStoreSetSyncParam003 put success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreSetSyncParam003 put fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncParam003 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreSetSyncParam004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0811
     * @tc.desc   Test Js Api SingleKvStoreSetSyncParam testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreSetSyncParam004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreSetSyncParam004');
        try {
            await kvStore.setSyncParam(null).then((err) => {
                console.info('testSingleKvStoreSetSyncParam004 put success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreSetSyncParam004 put fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreSetSyncParam004 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetSecurityLevel001
     * @tc.number SUB_DISTRIBUTEDDATAMGR_SINGLEKVSTORE_GETSECURITYLEVEL_0100
     * @tc.desc   Test Js Api SingleKvStoreGetSecurityLevel testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testSingleKvStoreGetSecurityLevel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
    //     console.info('testSingleKvStoreGetSecurityLevel001');
    //     try {
    //         await kvStore.getSecurityLevel().then((data) => {
    //             console.info('testSingleKvStoreGetSecurityLevel001 getSecurityLevel success');
    //             expect(data == factory.SecurityLevel.S2).assertTrue();
    //         }).catch((err) => {
    //             console.info('testSingleKvStoreGetSecurityLevel001 getSecurityLevel fail ' + err);
    //             expect(null).assertFail();
    //         });
    //     }catch(e) {
    //         console.info('testSingleKvStoreGetSecurityLevel001 e ' + e);
    //         expect(null).assertFail();
    //     }
    //     done();
    // })

    /**
     * @tc.name   testSingleKvStoreGetSecurityLevel002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0360
     * @tc.desc   Test Js Api SingleKvStoreGetSecurityLevel testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetSecurityLevel002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetSecurityLevel002');
        try {
            await kvStore.getSecurityLevel(1).then((data) => {
                console.info('testSingleKvStoreGetSecurityLevel002 getSecurityLevel success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreGetSecurityLevel002 getSecurityLevel fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreGetSecurityLevel002 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetSecurityLevel003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0370
     * @tc.desc   Test Js Api SingleKvStoreGetSecurityLevel testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetSecurityLevel003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetSecurityLevel003');
        try {
            await kvStore.getSecurityLevel('test_string').then((data) => {
                console.info('testSingleKvStoreGetSecurityLevel003 getSecurityLevel success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreGetSecurityLevel003 getSecurityLevel fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreGetSecurityLevel003 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetSecurityLevel004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0380
     * @tc.desc   Test Js Api SingleKvStoreGetSecurityLevel testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetSecurityLevel004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetSecurityLevel004');
        try {
            await kvStore.getSecurityLevel(2.000).then((data) => {
                console.info('testSingleKvStoreGetSecurityLevel004 getSecurityLevel success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreGetSecurityLevel004 getSecurityLevel fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreGetSecurityLevel004 e ' + e);
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSet001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0280
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSet001');
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
                console.info('testSingleKvStoreGetResultSet001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.getResultSet('batch_test_string_key').then((result) => {
                console.info('testSingleKvStoreGetResultSet001 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet001 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testSingleKvStoreGetResultSet001 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet001 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSet001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSet002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0290
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSet002');
        try {
            let resultSet;
            await kvStore.getResultSet('batch_test_string_key').then((result) => {
                console.info('testSingleKvStoreGetResultSet002 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testSingleKvStoreGetResultSet002 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSet002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSet003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0300
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSet003');
        try {
            let resultSet;
            await kvStore.getResultSet().then((result) => {
                console.info('testSingleKvStoreGetResultSet003 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet003 getResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSet003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSet004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0310
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSet004');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123).then((result) => {
                console.info('testSingleKvStoreGetResultSet004 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet004 getResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSet004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSet005
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0320
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSet005');
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
                console.info('testSingleKvStoreGetResultSet005 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(query).then((result) => {
                console.info('testSingleKvStoreGetResultSet005 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet005 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testSingleKvStoreGetResultSet005 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet005 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSet005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSet006
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0330
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSet006');
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
                console.info('testSingleKvStoreGetResultSet006 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(query).then((result) => {
                console.info('testSingleKvStoreGetResultSet006 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet006 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testSingleKvStoreGetResultSet006 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSet006 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSet006 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCloseResultSet001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0010
     * @tc.desc   Test Js Api SingleKvStoreCloseResultSet testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCloseResultSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCloseResultSet001');
        try {
            console.info('testSingleKvStoreCloseResultSet001 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet).then(() => {
                console.info('testSingleKvStoreCloseResultSet001 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreCloseResultSet001 closeResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreCloseResultSet001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCloseResultSet002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0020
     * @tc.desc   Test Js Api SingleKvStoreCloseResultSet testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCloseResultSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCloseResultSet002');
        try {
            console.info('testSingleKvStoreCloseResultSet002 success');
            let resultSet = null;
            await kvStore.getResultSet('batch_test_string_key').then((result) => {
                console.info('testSingleKvStoreCloseResultSet002 getResultSet success');
                resultSet = result;
            }).catch((err) => {
                console.info('testSingleKvStoreCloseResultSet002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('testSingleKvStoreCloseResultSet002 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStoreCloseResultSet002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.info('testSingleKvStoreCloseResultSet002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCloseResultSet003
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0030
     * @tc.desc   Test Js Api SingleKvStoreCloseResultSet testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCloseResultSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCloseResultSet003');
        try {
            console.info('testSingleKvStoreCloseResultSet003 success');
            let resultSet = null;
            await kvStore.closeResultSet().then(() => {
                console.info('testSingleKvStoreCloseResultSet003 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.info('testSingleKvStoreCloseResultSet003 closeResultSet fail ' + err);
            });
        }catch(e) {
            console.info('testSingleKvStoreCloseResultSet003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.name   testSingleKvStoreCloseResultSet004
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0040
     * @tc.desc   Test Js Api SingleKvStoreCloseResultSet testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreCloseResultSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreCloseResultSet004');
        await kvStore.closeResultSet("").then((data) => {
            console.info("testSingleKvStoreCloseResultSet004 close resultSet success")
            expect(null).assertFail();
        }).catch((err) => {
            console.info(`testSingleKvStoreCloseResultSet004 close resultSet error, error is ${err}`)
        })
        done();
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSize001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0340
     * @tc.desc   Test Js Api SingleKvStoreGetResultSize testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSize001');
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
                console.info('testSingleKvStoreGetResultSize001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSize(query).then((resultSize) => {
                console.info('testSingleKvStoreGetResultSize001 getResultSet success');
                expect(resultSize == 10).assertTrue();
                done();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSize001 getResultSet fail ' + err);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSize001 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.name   testSingleKvStoreGetResultSize002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0350
     * @tc.desc   Test Js Api SingleKvStoreGetResultSize testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetResultSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetResultSize001');
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
                console.info('testSingleKvStoreGetResultSize001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.info('testSingleKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSize(query).then((resultSize) => {
                console.info('testSingleKvStoreGetResultSize001 getResultSet success');
                expect(resultSize == 10).assertTrue();
                done();
            }).catch((err) => {
                console.info('testSingleKvStoreGetResultSize001 getResultSet fail ' + err);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetResultSize001 e ' + e);
            expect(null).assertFail();
            done();
        }
        
    })

    /**
     * @tc.name   testSingleKvStoreGetEntries001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0220
     * @tc.desc   Test Js Api SingleKvStoreGetEntries testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetEntries001');
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
            console.info('testSingleKvStoreGetEntries001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStoreGetEntries001 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getEntries(query).then((entrys) => {
                    console.info('testSingleKvStoreGetEntries001 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetEntries001 getEntries fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetEntries001 putBatch fail ' + err);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetEntries001 e ' + e);
            expect(null).assertFail();
            done();
        }
        
    })

    /**
     * @tc.name   testSingleKvStoreGetEntries002
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0230
     * @tc.desc   Test Js Api SingleKvStoreGetEntries testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreGetEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('testSingleKvStoreGetEntries002');
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
            console.info('testSingleKvStoreGetEntries002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('testSingleKvStoreGetEntries002 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getEntries(query).then((entrys) => {
                    console.info('testSingleKvStoreGetEntries002 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('testSingleKvStoreGetEntries002 getEntries fail ' + err);
                    expect(null).assertFail();
                    done();
                });
            }).catch((err) => {
                console.info('testSingleKvStoreGetEntries002 putBatch fail ' + err);
                expect(null).assertFail();
                done();
            });
        }catch(e) {
            console.info('testSingleKvStoreGetEntries002 e ' + e);
            expect(null).assertFail();
            done();
        }
        
    })

     /**
      * @tc.name   testSingleKvStoreChangeNotification101
      * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0900
      * @tc.desc   Test Js Api SingleKvStoreChangeNotification testcase 001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testSingleKvStoreChangeNotification101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        var getInsertEntries = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function(ChangeNotification){
                resolve(ChangeNotification.insertEntries);
            });
            kvStore.put("getInsertEntries", "byPut").then(() => {
                console.info('testSingleKvStoreChangeNotification101 put success');
            });
        });
        await getInsertEntries.then(function(insertEntries){
            console.info('testSingleKvStoreChangeNotification101 getInsertEntries' + JSON.stringify(insertEntries));
            expect(insertEntries).assertNotNull();
            done();
        }).catch((error) => {
            console.info('testSingleKvStoreChangeNotification101 can NOT getInsertEntries, fail:' + error);
            done();
        });
        
    })
	
    /**
     * @tc.name   testSingleKvStoreChangeNotification102
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0910
     * @tc.desc   Test Js Api SingleKvStoreChangeNotification testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreChangeNotification102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        await kvStore.put('getUpdateEntries', 'byPut').then(() => {
                console.info('testSingleKvStoreChangeNotification102 put success');
        });
        var getUpdateEntries = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function(ChangeNotification){
                resolve(ChangeNotification.updateEntries);
            });
            kvStore.put("getUpdateEntries", "byPut").then(() => {
                console.info('testSingleKvStoreChangeNotification102 update success');
            });
        });
        await getUpdateEntries.then(function(updateEntries){
            console.info('testSingleKvStoreChangeNotification102 getUpdateEntries' + JSON.stringify(updateEntries));
            expect(updateEntries).assertNotNull();
            done();
        }).catch((error) => {
            console.info('testSingleKvStoreChangeNotification102 can NOT getUpdateEntries, fail:' + error);
            done();
        });
        
    })
	
    /**
     * @tc.name   testSingleKvStoreChangeNotification103
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStoreJsApiTest_0920
     * @tc.desc   Test Js Api SingleKvStoreChangeNotification testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleKvStoreChangeNotification103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        await kvStore.put('deleteEntries', 'byPut').then(() => {
            console.info('testSingleKvStoreChangeNotification103 put success');
        });
        var getdeleteEntries = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function(ChangeNotification){
                resolve(ChangeNotification.deleteEntries);
            });
            kvStore.delete("deleteEntries").then(() => {
                console.info('testSingleKvStoreChangeNotification103 delete success');
            });
        });
        await getdeleteEntries.then(function(deleteEntries){
            console.info('testSingleKvStoreChangeNotification103 deleteEntries' + JSON.stringify(getdeleteEntries));
            expect(deleteEntries != null).assertNotNull();
            done();
        }).catch((error) => {
            console.info('testSingleKvStoreChangeNotification103 can NOT getdeleteEntries, fail:' + error);
            done();
        });
        
    })
})
}