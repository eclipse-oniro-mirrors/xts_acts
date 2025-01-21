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
import dataShare from '@ohos.data.dataSharePredicates'
import abilityFeatureAbility from '@ohos.ability.featureAbility'

var context = abilityFeatureAbility.getContext();
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

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
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
export default function SingleKvStorePromiseTest(){
describe('SingleKvStorePromiseTest', function () {
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
        console.info('beforeAll config:'+ JSON.stringify(config));
        kvManager = factory.createKVManager(config);
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
            console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        console.info('beforeEach end');
        done();
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.info('afterEach deleteKVStore success');
            }).catch((err) => {
                console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }).catch((err) => {
            console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        kvStore = null;
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.Put(String) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(String) testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, null).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0100 put success');
                expect(null).assertFail();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0100 put error' + `, error code is ${error.code}, message is ${error.message}`);
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStore.Put(String) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(String) testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStore.Put(String) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(String) testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStore.Put(String) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(String) testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 get success data ' + data);
                    expect(str == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTSTRING_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetString testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetString testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 get success');
                    expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreGetString testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetString testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200');
        try {
            await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200 get success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSTRING_PROMISE_0200 get e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStore.Put(Int) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Int) testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTINT_PROMISE_0400 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetInt testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetInt testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 get success');
                    expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.Put(Bool) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Bool) testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetBool testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetBool testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100', 0, async function (done) {
        console.info('SingleKvStoreGetBoolPromiseTest001');
        try {
            var boolValue = false;
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 get success');
                    expect(boolValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.Put(Float) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Put(Float) testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetFloat testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetFloat testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreGetFloat testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetFloat testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreGetFloat testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetFloat testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETFLOAT_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreDeleteString testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteString testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100');
        try {
            var str = 'this is a test string';
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreDeleteString testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteString testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200');
        try {
            var str = '';
            for (var i = 0 ; i < 4096; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreDeleteString testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteString testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300 delete success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETESTRING_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreDeleteInt testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteInt testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreDeleteFloat testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteFloat testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreDeleteBool testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteBool testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.Delete() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Delete() testcase 001
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100', 0, async function (done) {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100');
        try {
            await kvStore.delete("KEY_TEST_STRING_ELEMENTS").then((data) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100 delete fail err ' + err);
                    expect(null).assertFail();
                });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0100 e' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStore.Delete() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Delete() testcase 002
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200', 0, async function (done) {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200');
        try {
            await kvStore.put("name", "Bob").then(async (data) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete("name").then((data) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStore.Delete() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.Delete() testcase 003
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300', 0, async function (done) {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300');
        try {

            await kvStore.put("number", "123").then(async (data) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete("number").then((data) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEPREDICATES_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreOnChange testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOnChange testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100', 0, async function (done) {
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 dataChange'+ JSON.stringify(data));
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreOnChange testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOnChange testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200', 0, async function (done) {
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 dataChange' + JSON.stringify(data));
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreOnChange testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOnChange testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300', 0, async function (done) {
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 dataChange' + JSON.stringify(data));
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONCHANGE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreOnSyncComplete testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOnSyncComplete testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PULL_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode, 10);
            } catch (e) {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
                expect(null).assertFail();
            }
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreOnSyncComplete testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOnSyncComplete testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode, 10);
            } catch (e) {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
                expect(null).assertFail();
            }
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreOnSyncComplete testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOnSyncComplete testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_PULL;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode, 10);
            } catch (e) {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
                expect(null).assertFail();
            }
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreOffChange testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffChange testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100 dataChange' + JSON.stringify(data));
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreOffChange testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffChange testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200');
        let ret = false;
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200 dataChange' + JSON.stringify(data));
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200 dataChange1' + JSON.stringify(data));
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreOffChange testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffChange testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300 dataChange' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300 dataChange1' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
            kvStore.off('dataChange', func1);
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreOffChange testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffChange testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400 dataChange' + JSON.stringify(data));
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange');
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFCHANGE_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreOffSyncComplete testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffSyncComplete testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 syncComplete' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreOffSyncComplete testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffSyncComplete testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 syncComplete' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 syncComplete1' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreOffSyncComplete testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffSyncComplete testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 syncComplete' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 syncComplete1' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
            kvStore.off('syncComplete', func1);
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreOffSyncComplete testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreOffSyncComplete testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 syncComplete' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete');
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreSetSyncRange testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreSetSyncRange testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100  fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreSetSyncRange testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreSetSyncRange testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreSetSyncRange testcase 003
     * @tc.type: FUNC
     * @tc.name issueNumber
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300 fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100');
        try {
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_string_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 getEntries success');
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 ' + JSON.stringify(entries));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_number_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_number_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_number_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 005
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_bool_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 006
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries('batch_test_bool_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCH_PROMISE_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 001
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test_");
                await kvStore.getEntries(query).then((entrys) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 getEntries success');
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 entrys.length: ' + entrys.length);
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 002
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'key_test_int';
                var entry = {
                    key: key + i,
                    value: {
                        type: factory.ValueType.INTEGER,
                        value: '123'
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("key_test_");
                await kvStore.getEntries(query).then((entrys) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 getEntries success');
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 entrys.length: ' + entrys.length);
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    done();
                }).catch((err) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 003
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'key_test_boolean';
                var entry = {
                    key: key + i,
                    value: {
                        type: factory.ValueType.BOOLEAN,
                        value: 'true'
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("key_test_");
                await kvStore.getEntries(query).then((entrys) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 getEntries success');
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 entrys.length: ' + entrys.length);
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 004
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'key_test_float';
                var entry = {
                    key: key + i,
                    value: {
                        type: factory.ValueType.FLOAT,
                        value: '321.12'
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("key_test_");
                await kvStore.getEntries(query).then((entrys) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 getEntries success');
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 entrys.length: ' + entrys.length);
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500
     * @tc.desc Test Js Api SingleKvStore.PutBatch() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.PutBatch() testcase 005
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'key_test_string';
                var entry = {
                    key: key + i,
                    value: {
                        type: factory.ValueType.STRING,
                        value: 'value-string-001'
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("key_test_");
                await kvStore.getEntries(query).then((entrys) => {
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 getEntries success');
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys.length: ' + entrys.length);
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys[1]: ' + JSON.stringify(entrys[1]));
                    expect(entrys.length == 10).assertTrue();
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys[0]: ' + JSON.stringify(entrys[0]));
                    console.log('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 entrys[0]: ' + JSON.stringify(entrys[0].value));
                    expect(entrys[0].value.value == 'value-string-001').assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_PUTBATCHVALUE_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreDeleteBatch testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteBatch testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 deleteBatch success');
                    expect(err == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreDeleteBatch testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteBatch testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreDeleteBatch testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreDeleteBatch testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300');
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
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 deleteBatch success');
                    expect(err == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_DELETEBATCHVALUE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStorestartTransaction testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStorestartTransaction testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100');
        try {
            var count = 0;
            kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_ALL, function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 dataChange ' + JSON.stringify(data));
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.commit().then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await sleep(2000);
            expect(count == 1).assertTrue();
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStorestartTransaction testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStorestartTransaction testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 dataChange ' + JSON.stringify(data));
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.rollback().then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await sleep(2000);
            expect(count == 0).assertTrue();
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStorestartTransaction testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStorestartTransaction testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0200');
        try {
            await kvStore.startTransaction(1).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0300 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0300 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStorestartTransaction testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStorestartTransaction testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0400');
        try {
            await kvStore.startTransaction('test_string').then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0400 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0400 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0500
     * @tc.desc Test Js Api SingleKvStorestartTransaction testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStorestartTransaction testcase 005
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0500', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0500');
        try {
            await kvStore.startTransaction(2.000).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0500 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0500 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_STARTTRANSACTION_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreCommit testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCommit testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0100');
        try {
            await kvStore.commit(1).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0100 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0100 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreCommit testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCommit testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0200');
        try {
            await kvStore.commit('test_string').then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0200 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0200 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreCommit testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCommit testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0300');
        try {
            await kvStore.commit(2.000).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0300 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0300 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_COMMIT_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreRollback testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRollback testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0100');
        try {
            await kvStore.rollback(1).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0100 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0100 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreRollback testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRollback testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0200');
        try {
            await kvStore.rollback('test_string').then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0200 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0200 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreRollback testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRollback testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300');
        try {
            await kvStore.rollback(2.000).then(async (err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ROOLBACK_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreEnableSync testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreEnableSync testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100');
        try {
            await kvStore.enableSync(true).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreEnableSync testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreEnableSync testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200');
        try {
            await kvStore.enableSync(false).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreEnableSync testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreEnableSync testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0300');
        try {
            await kvStore.enableSync().then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0300 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0300 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreEnableSync testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreEnableSync testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0400');
        try {
            await kvStore.enableSync(null).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0400 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0400 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_ENABLESYNC_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreRemoveDeviceData testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRemoveDeviceData testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var deviceid = 'no_exist_device_id';
            await kvStore.removeDeviceData(deviceid).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
            await kvStore.get(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get success data:' + data);
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreRemoveDeviceData testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRemoveDeviceData testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200');
        try {
            await kvStore.removeDeviceData().then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreRemoveDeviceData testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRemoveDeviceData testcase 003
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300');
        try {
            await kvStore.removeDeviceData('').then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })


    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreRemoveDeviceData testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreRemoveDeviceData testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400');
        try {
            await kvStore.removeDeviceData(null).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreSetSyncParam testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreSetSyncParam testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100');
        try {
            var defaultAllowedDelayMs = 500;
            await kvStore.setSyncParam(defaultAllowedDelayMs).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreSetSyncParam testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreSetSyncParam testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0200');
        try {
            await kvStore.setSyncParam().then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0200 put success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreSetSyncParam testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreSetSyncParam testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0300');
        try {
            await kvStore.setSyncParam('').then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0300 put success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreSetSyncParam testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreSetSyncParam testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0400');
        try {
            await kvStore.setSyncParam(null).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0400 put success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0400 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCPARAM_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetSecurityLevel testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetSecurityLevel testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100');
        try {
            await kvStore.getSecurityLevel().then((data) => {
                console.info(`SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100 getSecurityLevel success, result is ${data}, SecurityLevel is ${factory.SecurityLevel.S2}`);
                expect(data == factory.SecurityLevel.S2).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100 getSecurityLevel fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreGetSecurityLevel testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetSecurityLevel testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0200');
        try {
            await kvStore.getSecurityLevel(1).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0200 getSecurityLevel success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0200 getSecurityLevel fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreGetSecurityLevel testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetSecurityLevel testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0300');
        try {
            await kvStore.getSecurityLevel('test_string').then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0300 getSecurityLevel success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0300 getSecurityLevel fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreGetSecurityLevel testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetSecurityLevel testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0400');
        try {
            await kvStore.getSecurityLevel(2.000).then((data) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0400 getSecurityLevel success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0400 getSecurityLevel fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETSECURITYLEVEL_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetResultSet testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSet testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100');
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
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.getResultSet('batch_test_string_key').then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreGetResultSet testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSet testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200');
        try {
            let resultSet;
            await kvStore.getResultSet('batch_test_string_key').then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreGetResultSet testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSet testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0300');
        try {
            let resultSet;
            await kvStore.getResultSet().then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0300 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0300 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreGetResultSet testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSet testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123).then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();

    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500
     * @tc.desc Test Js Api SingleKvStoreGetResultSet testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSet testcase 005
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500');
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
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(query).then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600
     * @tc.desc Test Js Api SingleKvStoreGetResultSet testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSet testcase 006
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600');
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
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(query).then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700
     * @tc.desc Test Js Api SingleKvStore.GetResultSet() testcase 007
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetResultSet() testcase 007
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700', 0, async function (done) {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700');
        try {
            let entries = [];
            let resultSet;
            for (let i = 0; i < 10; i++) {
                let key = 'name_';
                let value = 'Bob_'
                let entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value :value + i
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let query = new factory.Query();
            query.prefixKey("name_");
            await kvStore.getResultSet(query).then((result) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0700 e' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800
     * @tc.desc Test Js Api SingleKvStore.GetResultSet() testcase 008
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStore.GetResultSet() testcase 008
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800', 0, async function (done) {
        console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800');
        try {
            let resultSet;
            let query = new factory.Query();
            await kvStore.getResultSet(query).then((result) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });

        } catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSET_PROMISE_0800 e' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    }) 

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreCloseResultSet testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCloseResultSet testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100');
        try {
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet).then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreCloseResultSet testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCloseResultSet testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200');
        try {
            let resultSet = undefined;
            await kvStore.getResultSet('batch_test_string_key').then((result) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200 getResultSet success');
                resultSet = result;
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreCloseResultSet testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCloseResultSet testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0300', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0300');
        try {
            let resultSet = null;
            await kvStore.closeResultSet().then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0300 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0300 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0400
     * @tc.desc Test Js Api SingleKvStoreCloseResultSet testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreCloseResultSet testcase 004
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0400', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0400');
        try {
            let resultSet = null;
            await kvStore.closeResultSet("").then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0400 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0400 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CLOSERESULTSET_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();

    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreGetResultSize testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreGetResultSize testcase 001
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100', 0, async function (done) {
        console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100');
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
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_SETSYNCRANGE_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSize(query).then((resultSize) => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_GETRESULTSIZE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100
     * @tc.desc Test Js Api SingleKvStoreChangeNotification testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreChangeNotification testcase 001
     */
     it('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100', 0, async function (done) {
        var getInsertEntries = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function(ChangeNotification){
                resolve(ChangeNotification.insertEntries);
            });
            kvStore.put("getInsertEntries", "byPut").then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 put success');
            });
        });
        await getInsertEntries.then(function(insertEntries){
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 getInsertEntries' + JSON.stringify(insertEntries));
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 getInsertEntries key ' + insertEntries[0].key);
            expect(insertEntries[0].key == "getInsertEntries").assertTrue();
        }).catch((error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0100 can NOT getInsertEntries, fail:' + `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200
     * @tc.desc Test Js Api SingleKvStoreChangeNotification testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreChangeNotification testcase 002
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200', 0, async function (done) {
        await kvStore.put('getUpdateEntries', 'byPut').then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 put success');
        });
        var getUpdateEntries = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function(ChangeNotification){
                resolve(ChangeNotification.updateEntries);
            });
            kvStore.put("getUpdateEntries", "byPut").then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 update success');
            });
        });
        await getUpdateEntries.then(function(updateEntries){
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 getUpdateEntries' + JSON.stringify(updateEntries));
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 getUpdateEntries key ' + updateEntries[0].key);
            expect(updateEntries[0].key == "getUpdateEntries").assertTrue();
        }).catch((error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 can NOT getUpdateEntries, fail:' + `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300
     * @tc.desc Test Js Api SingleKvStoreChangeNotification testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api SingleKvStoreChangeNotification testcase 003
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300', 0, async function (done) {
        await kvStore.put('deleteEntries', 'byPut').then(() => {
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 put success');
        });
        var getdeleteEntries = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function(ChangeNotification){
                resolve(ChangeNotification.deleteEntries);
            });
            kvStore.delete("deleteEntries").then(() => {
                console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 delete success');
            });
        });
        await getdeleteEntries.then(function(deleteEntries){
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 deleteEntries' + JSON.stringify(deleteEntries));
            console.info('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0200 getUpdateEntries key ' + deleteEntries[0].key);
            expect(deleteEntries[0].key == "deleteEntries").assertTrue();
        }).catch((error) => {
            console.error('SUB_DDM_DKV_SINGLEKVSTORE_CHANGENOTIFICATION_PROMISE_0300 can NOT getdeleteEntries, fail:' + `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
        });
        done();
    })
})
}