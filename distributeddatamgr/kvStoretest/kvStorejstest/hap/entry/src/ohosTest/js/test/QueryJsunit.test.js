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
import ddm from '@ohos.data.distributedData';

export default function queryTest(){
describe('queryTest', function() {

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0960
     * @tc.name [JS-API8]Query.Reset().
     * @tc.desc Test Js Api Query.Reset() testcase 001
     */
    it('testReset001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("test", 3);
            console.info("query is " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            expect("").assertEqual(query.getSqlLike());
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("simply calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0970
     * @tc.name [JS-API8]Query.Reset().
     * @tc.desc Test Js Api Query.Reset() testcase 002
     */
    it('testReset002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("number", 5);
            query.equalTo("string", 'v');
            query.equalTo("boolean", false);
            console.info("query is " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            query.reset();
            query.reset();
            expect("").assertEqual(query.getSqlLike());
            console.info("sql after  reset: " + query.getSqlLike());
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0980
     * @tc.name [JS-API8]Query.Reset().
     * @tc.desc Test Js Api Query.Reset() testcase 003
     */
    it('testReset003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key", "value");
            expect(query.getSqlLike() !== "").assertTrue();
            let sql = query.getSqlLike();
            query.reset().equalTo("key", "value");
            console.info("query is " + query.getSqlLike());
            expect(sql === query.getSqlLike()).assertTrue();
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0990
     * @tc.name [JS-API8]Query.Reset().
     * @tc.desc Test Js Api Query.Reset() testcase 004
     */
    it('testReset004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key", "value");
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset(3);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0170
     * @tc.name [JS-API8]Query.EqaulTo().
     * @tc.desc Test Js Api Query.EqaulTo() testcase 001
     */
    it('testEqaulTo001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 5);
            query.equalTo("key2", 5.0);
            query.equalTo("key3", false);
            query.equalTo("key3", "string");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0180
     * @tc.name [JS-API8]Query.EqualTo().
     * @tc.desc Test Js Api Query.EqualTo() testcase 002
     */
    it('testEqualTo002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 1).equalTo("key2", 2).equalTo("key3", 3);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0190
     * @tc.name [JS-API8]Query.EqualTo().
     * @tc.desc Test Js Api Query.EqualTo() testcase 003
     */
    it('testEqualTo003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key2", NaN);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0200
     * @tc.name [JS-API8]Query.EqualTo().
     * @tc.desc Test Js Api Query.EqualTo() testcase 004
     */
    it('testEqualTo004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", "value", "too more");
            console.info("should throw exception on invalid arguments");
            console.info("query is " + query.getSqlLike());
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0680
     * @tc.name [JS-API8]Query.NotEqualTo().
     * @tc.desc Test Js Api Query.NotEqualTo() testcase 001
     */
    it('testNotEqualTo001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key1", 5);
            query.notEqualTo("key2", 5.0);
            query.notEqualTo("key3", false);
            query.notEqualTo("key4", "string");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0690
     * @tc.name [JS-API8]Query.NotEqualTo().
     * @tc.desc Test Js Api Query.NotEqualTo() testcase 002
     */
    it('testNotEqualTo002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 5);
            query.reset();
            query.notEqualTo("key0", 5).equalTo("key1", 5).notEqualTo("key2", "str").notEqualTo("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0700
     * @tc.name [JS-API8]Query.NotEqualTo().
     * @tc.desc Test Js Api Query.NotEqualTo() testcase 003
     */
    it('testNotEqualTo003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key2", NaN);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0710
     * @tc.name [JS-API8]Query.NotEqualTo().
     * @tc.desc Test Js Api Query.NotEqualTo() testcase 004
     */
    it('testNotEqualTo004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key1", "value", "too more", 4);
            console.info("should throw exception on invalid arguments");
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0250
     * @tc.name [JS-API8]Query.GreaterThan().
     * @tc.desc Test Js Api Query.GreaterThan() testcase 001
     */
    it('testGreaterThan001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key1", 5);
            query.greaterThan("key2", 5.0);
            query.greaterThan("key3", true);
            query.greaterThan("key4", "string");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0300
     * @tc.name [JS-API8]Query.GreatThan().
     * @tc.desc Test Js Api Query.GreatThan() testcase 002
     */
    it('testGreatThan002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key", 5);
            query.reset();
            query.greaterThan("key0", 5).greaterThan("key1", "v5").greaterThan("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0310
     * @tc.name [JS-API8]Query.GreatThan().
     * @tc.desc Test Js Api Query.GreatThan() testcase 003
     */
    it('testGreatThan003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key2", NaN);
            console.info("should throw exception on invalid arguments");
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0320
     * @tc.name [JS-API8]Query.GreatThan().
     * @tc.desc Test Js Api Query.GreatThan() testcase 004
     */
    it('testGreatThan004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key1", "value", "too more", 4);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0510
     * @tc.name [JS-API8]Query.LessThan().
     * @tc.desc Test Js Api Query.LessThan() testcase 001
     */
    it('testLessThan001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key1", 5);
            query.lessThan("key2", 5.0);
            query.lessThan("key3", true);
            query.lessThan("key4", "string");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0520
     * @tc.name [JS-API8]Query.LessThan().
     * @tc.desc Test Js Api Query.LessThan() testcase 002
     */
    it('testLessThan002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key", 5);
            query.reset();
            query.lessThan("key0", 5).lessThan("key1", "v5").lessThan("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertTrue();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0530
     * @tc.name [JS-API8]Query.LessThan().
     * @tc.desc Test Js Api Query.LessThan() testcase 003
     */
    it('testLessThan003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key2", NaN);
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0540
     * @tc.name [JS-API8]Query.LessThan().
     * @tc.desc Test Js Api Query.LessThan() testcase 004
     */
    it('testLessThan004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key1", "value", "too more", 4);
            console.info("query is " + query.getSqlLike());
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0260
     * @tc.name [JS-API8]Query.GreaterThanOrEqualTo().
     * @tc.desc Test Js Api Query.GreaterThanOrEqualTo() testcase 001
     */
    it('testGreaterThanOrEqualTo001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key1", 5);
            query.greaterThanOrEqualTo("key2", 5.0);
            query.greaterThanOrEqualTo("key3", true);
            query.greaterThanOrEqualTo("key4", "string");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0270
     * @tc.name [JS-API8]Query.GreaterThanOrEqualTo().
     * @tc.desc Test Js Api Query.GreaterThanOrEqualTo() testcase 002
     */
    it('testGreaterThanOrEqualTo002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key", 5);
            query.reset();
            query.greaterThanOrEqualTo("key0", 5)
                .greaterThanOrEqualTo("key1", "v5")
                .greaterThanOrEqualTo("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0280
     * @tc.name [JS-API8]Query.GreaterThanOrEqualTo().
     * @tc.desc Test Js Api Query.GreaterThanOrEqualTo() testcase 003
     */
    it('testGreaterThanOrEqualTo003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key2", NaN);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0290
     * @tc.name [JS-API8]Query.GreaterThanOrEqualTo().
     * @tc.desc Test Js Api Query.GreaterThanOrEqualTo() testcase 004
     */
    it('testGreaterThanOrEqualTo004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key1", "value", "too more", 4);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0550
     * @tc.name [JS-API8]Query.LessThanOrEqualTo().
     * @tc.desc Test Js Api Query.LessThanOrEqualTo() testcase 001
     */
    it('testLessThanOrEqualTo001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key1", 5);
            query.lessThanOrEqualTo("key2", 5.0);
            query.lessThanOrEqualTo("key3", true);
            query.lessThanOrEqualTo("key4", "string");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0560
     * @tc.name [JS-API8]Query.LessThanOrEqualTo().
     * @tc.desc Test Js Api Query.LessThanOrEqualTo() testcase 002
     */
    it('testLessThanOrEqualTo002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key", 5);
            query.reset();
            query.lessThanOrEqualTo("key0", 5).lessThanOrEqualTo("key1", "v5").lessThanOrEqualTo("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0570
     * @tc.name [JS-API8]Query.LessThanOrEqualTo().
     * @tc.desc Test Js Api Query.LessThanOrEqualTo() testcase 003
     */
    it('testLessThanOrEqualTo003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key2", NaN);
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0580
     * @tc.name [JS-API8]Query.LessThanOrEqualTo().
     * @tc.desc Test Js Api Query.LessThanOrEqualTo() testcase 004
     */
    it('testLessThanOrEqualTo004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key1", "value", "too more", 4);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0470
     * @tc.name [JS-API8]Query.IsNull().
     * @tc.desc Test Js Api Query.IsNull() testcase 001
     */
    it('testIsNull001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNull("key");
            query.isNull("key2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0480
     * @tc.name [JS-API8]Query.IsNull().
     * @tc.desc Test Js Api Query.IsNull() testcase 002
     */
    it('testIsNull002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNull("key").notEqualTo("key1", 4).isNull("key2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0490
     * @tc.name [JS-API8]Query.IsNull().
     * @tc.desc Test Js Api Query.IsNull() testcase 003
     */
    it('testIsNull003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNull("key", 0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0500
     * @tc.name [JS-API8]Query.IsNull().
     * @tc.desc Test Js Api Query.IsNull() testcase 004
     */
    it('testIsNull004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNull(0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /*
    * =======================================================================================
    *           Int8Array             |  INTEGER
    *           Uint8Array            |  INTEGER
    *           Uint8ClampedArray     |  INTEGER
    *           Int16Array            |  INTEGER
    *           Uint16Array           |  INTEGER
    *           Int32Array            |  INTEGER
    *           Uint32Array           |  LONG
    *           Float32Array          |  DOUBLE
    *           Float64Array          |  DOUBLE
    *           BigInt64Array         |  ERROR: cannot convert to bigint
    *           BigUint64Array        |  ERROR: cannot convert to bigint
    * =======================================================================================
	*           Array                 |  DOUBLE    * not-typedArray treated as array of double.
    */

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0330
     * @tc.name [JS-API8]Query.InNumber().
     * @tc.desc Test Js Api Query.InNumber() testcase 001
     */
    it('testInNumber001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            console.info("testInNumber001 start ");
            var i8 = new Int8Array([-21,31]);
            query.reset().inNumber("key", i8);
            console.info("inNumber(Int8Array([-21,31])  => " + query.getSqlLike());
            var u8 = new Uint8Array([-21,31]);
            query.reset().inNumber("key", u8);
            console.info("inNumber(Uint8Array([-21,31])  => " + query.getSqlLike());
            var c8 = new Uint8ClampedArray([-21,31]);
            query.reset().inNumber("key", c8);
            console.info("inNumber(Uint8Array([-21,31])  => " + query.getSqlLike());
            var i16 = new Int16Array([-21,31]);
            query.reset().inNumber("key", i16);
            console.info("inNumber(Int16Array([-21,31])  => " + query.getSqlLike());
            var u16 = new Uint16Array([-21,31]);
            query.reset().inNumber("key", u16);
            console.info("inNumber(Uint16Array([-21,31])  => " + query.getSqlLike());
            var i32 = new Int32Array([-21, 31]);
            query.reset().inNumber("key", i32);
            console.info("inNumber(Int32Array([-21,31])  => " + query.getSqlLike());
            var u32 = new Uint32Array([-21, 31]);
            query.reset().inNumber("key", u32);
            console.info("inNumber(UInt32Array([-21,31])  => " + query.getSqlLike());
            var f32 = new Float32Array([-21, 31]);
            query.reset().inNumber("key", f32);
            console.info("inNumber(Float32Array([-21,31])  => " + query.getSqlLike());
            var f32e = new Float32Array([21, 31, "a"]); // "a" will be ignored as not a float.
            query.reset().inNumber("key", f32e);
            console.info("inNumber(Float32Array([-21,31, 'a'])  => " + query.getSqlLike());
            var f64 = new Float64Array([-21, 31]);
            query.reset().inNumber("key", f64);
            console.info("inNumber(Float64Array([-21,31])  => " + query.getSqlLike());
            query.reset();
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0340
     * @tc.name [JS-API8]Query.InNumber().
     * @tc.desc Test Js Api Query.InNumber() testcase 002
     */
    it('testInNumber002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key", [1, 2.3, 987654]).
                inNumber("key2", [0x10abcdef]).
                inNumber("key2", [0xf0123456]).
                inNumber("key2", [0b10101]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0350
     * @tc.name [JS-API8]Query.InNumber().
     * @tc.desc Test Js Api Query.InNumber() testcase 003
     */
    it('testInNumber003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key", 0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0360
     * @tc.name [JS-API8]Query.InNumber().
     * @tc.desc Test Js Api Query.InNumber() testcase 004
     */
    it('testInNumber004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber([0, 1]);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0370
     * @tc.name [JS-API8]Query.InNumber().
     * @tc.desc Test Js Api Query.InNumber() testcase 005
     */
    it('testInNumber005', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            var u64 = new BigUint64Array([21, 31]);
            query.inNumber("key", u64);
            var b64 = new BigInt64Array([21, 31]);
            query.inNumber("key", b64);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0380
     * @tc.name [JS-API8]Query.InNumber().
     * @tc.desc Test Js Api Query.InNumber() testcase 006
     */
    it('testInNumber006', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            console.info("typeof([1, 2, 97])" + typeof([1, 2, 97]))
            console.info("typeof([1, 2, 97][0])" + typeof([1, 2, 97][0]))
            query.inNumber("key", [1, 2, 97]);
            console.info("inNumber([1, 2, 97])  => " + query.getSqlLike());
            query.reset();
            query.inNumber("key1", [-1, 3, 987654.123, 0xabc123456]);
            console.info("inNumber([1, 2, 0xa1234567890123456])  => " + query.getSqlLike());
            query.reset();
            query.inNumber("key2", [-1, 3, -987654.123, 0xabc123456]);
            console.info("inNumber([1, 2, 0xa1234567890123456])  => " + query.getSqlLike());
            query.reset();
            query.inNumber("key3", [-1, 4, -987654.123, Number.MAX_VALUE]);
            console.info("inNumber([1, 2, Number.MAX_VALUE])  => " + query.getSqlLike());
            query.reset();
            query.inNumber("key4", [1, -2.3, Number.MIN_VALUE, Number.MAX_VALUE]);
            console.info("inNumber([1, -2.3, Number.MAX_VALUE])  => " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
            query.reset();
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0390
     * @tc.name [JS-API8]Query.InString().
     * @tc.desc Test Js Api Query.InString() testcase 001
     */
    it('testInString001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", ["a2z" , 'z2a']);
            query.inString("key2", ["AAA" ]);
            console.info("query is " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0400
     * @tc.name [JS-API8]Query.InString().
     * @tc.desc Test Js Api Query.InString() testcase 002
     */
    it('testInString002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", ["a2z" , 'z2a'])
                .inString("key2", ["AAA" ])
                .inString("key2", ["AAA", "AAABBB","CCCAAA" ]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0410
     * @tc.name [JS-API8]Query.InString().
     * @tc.desc Test Js Api Query.InString() testcase 003
     */
    it('testInString003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", 0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0420
     * @tc.name [JS-API8]Query.InString().
     * @tc.desc Test Js Api Query.InString() testcase 004
     */
    it('testInString004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", [0, 1]);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0720
     * @tc.name [JS-API8]Query.NotInNumber().
     * @tc.desc Test Js Api Query.NotInNumber() testcase 001
     */
    it('testNotInNumber001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", [1, 2]);
            query.notInNumber("key", [1000]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0730
     * @tc.name [JS-API8]Query.NotInNumber().
     * @tc.desc Test Js Api Query.NotInNumber() testcase 002
     */
    it('testNotInNumber002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", [1, 2, 3]).notInNumber("key", [1, 7, 8]).notEqualTo("kkk", 5);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0740
     * @tc.name [JS-API8]Query.NotInNumber().
     * @tc.desc Test Js Api Query.NotInNumber() testcase 003
     */
    it('testNotInNumber003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", [1], 2);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0750
     * @tc.name [JS-API8]Query.NotInNumber().
     * @tc.desc Test Js Api Query.NotInNumber() testcase 004
     */
    it('testNotInNumber004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", ["string"]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0760
     * @tc.name [JS-API8]Query.NotInString().
     * @tc.desc Test Js Api Query.NotInString() testcase 001
     */
    it('testNotInString001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", ["v1", "v2"]);
            query.notInString("key", ["v1", "NaN"]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0770
     * @tc.name [JS-API8]Query.NotInString().
     * @tc.desc Test Js Api Query.NotInString() testcase 002
     */
    it('testNotInString002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", ["v1", "v2", "v3"]).notEqualTo("kkk", "v3");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0780
     * @tc.name [JS-API8]Query.NotInString().
     * @tc.desc Test Js Api Query.NotInString() testcase 003
     */
    it('testNotInString003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", ["", "abccd"], 2);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0790
     * @tc.name [JS-API8]Query.NotInString().
     * @tc.desc Test Js Api Query.NotInString() testcase 004
     */
    it('testNotInString004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", [1, 2]);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0590
     * @tc.name [JS-API8]Query.Like().
     * @tc.desc Test Js Api Query.Like() testcase 001
     */
    it('testLike001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", "v1");
            query.like("key2", "v2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0600
     * @tc.name [JS-API8]Query.Like().
     * @tc.desc Test Js Api Query.Like() testcase 002
     */
    it('testLike002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", "v1").like("key", "v3").like("key", "v2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0610
     * @tc.name [JS-API8]Query.Like().
     * @tc.desc Test Js Api Query.Like() testcase 003
     */
    it('testLike003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", 0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0620
     * @tc.name [JS-API8]Query.Like().
     * @tc.desc Test Js Api Query.Like() testcase 004
     */
    it('testLike004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", "str1", "str2");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1040
     * @tc.name [JS-API8]Query.Unlike().
     * @tc.desc Test Js Api Query.Unlike() testcase 001
     */
    it('testUnlike001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1050
     * @tc.name [JS-API8]Query.Unlike().
     * @tc.desc Test Js Api Query.Unlike() testcase 002
     */
    it('testUnlike002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", "v1").unlike("key", "v3").unlike("key", "v2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1060
     * @tc.name [JS-API8]Query.Unlike().
     * @tc.desc Test Js Api Query.Unlike() testcase 003
     */
    it('testUnlike003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", 0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1070
     * @tc.name [JS-API8]Query.Unlike().
     * @tc.desc Test Js Api Query.Unlike() testcase 004
     */
    it('testUnlike004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", "str1", "str2");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0010
     * @tc.name [JS-API8]Query.And().
     * @tc.desc Test Js Api Query.And() testcase 001
     */
    it('testAnd001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.and();
            query.notEqualTo("key", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0020
     * @tc.name [JS-API8]Query.And().
     * @tc.desc Test Js Api Query.And() testcase 002
     */
    it('testAnd002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 0).and().equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0030
     * @tc.name [JS-API8]Query.And().
     * @tc.desc Test Js Api Query.And() testcase 003
     */
    it('testAnd003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).and().notEqualTo("key", 1).and();
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0040
     * @tc.name [JS-API8]Query.And().
     * @tc.desc Test Js Api Query.And() testcase 004
     */
    it('testAnd004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).and(1).notInNumber("key", [1, 3]);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0800
     * @tc.name [JS-API8]Query.Or().
     * @tc.desc Test Js Api Query.Or() testcase 001
     */
    it('testOr001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.or();
            query.notEqualTo("key", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0810
     * @tc.name [JS-API8]Query.Or().
     * @tc.desc Test Js Api Query.Or() testcase 002
     */
    it('testOr002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 0).or().equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0820
     * @tc.name [JS-API8]Query.Or().
     * @tc.desc Test Js Api Query.Or() testcase 003
     */
    it('testOr003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).or();
            console.info("or ... sql:" + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("throw exception is ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0830
     * @tc.name [JS-API8]Query.Or().
     * @tc.desc Test Js Api Query.Or() testcase 004
     */
    it('testOr004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).or(1).notInNumber("key", [1, 3]);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0840
     * @tc.name [JS-API8]Query.OrderByAsc().
     * @tc.desc Test Js Api Query.OrderByAsc() testcase 001
     */
    it('testOrderByAsc001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.orderByAsc("sortbykey");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0850
     * @tc.name [JS-API8]Query.OrderByAsc().
     * @tc.desc Test Js Api Query.OrderByAsc() testcase 002
     */
    it('testOrderByAsc002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "V0").orderByAsc("sortbykey1").orderByAsc("sortbykey2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0860
     * @tc.name [JS-API8]Query.OrderByAsc().
     * @tc.desc Test Js Api Query.OrderByAsc() testcase 003
     */
    it('testOrderByAsc003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).orderByAsc(1);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0870
     * @tc.name [JS-API8]Query.OrderByAsc().
     * @tc.desc Test Js Api Query.OrderByAsc() testcase 004
     */
    it('testOrderByAsc004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.orderByAsc();
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0880
     * @tc.name [JS-API8]Query.OrderByDesc().
     * @tc.desc Test Js Api Query.OrderByDesc() testcase 001
     */
    it('testOrderByDesc001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.orderByDesc("sortbykey");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0890
     * @tc.name [JS-API8]Query.OrderByDesc().
     * @tc.desc Test Js Api Query.OrderByDesc() testcase 002
     */
    it('testOrderByDesc002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "V0").orderByDesc("sortbykey1").orderByDesc("sortbykey2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0900
     * @tc.name [JS-API8]Query.OrderByDesc().
     * @tc.desc Test Js Api Query.OrderByDesc() testcase 003
     */
    it('testOrderByDesc003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).orderByDesc(1);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0910
     * @tc.name [JS-API8]Query.OrderByDesc().
     * @tc.desc Test Js Api Query.OrderByDesc() testcase 004
     */
    it('testOrderByDesc004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.orderByDesc();
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0630
     * @tc.name [JS-API8]Query.Limit().
     * @tc.desc Test Js Api Query.Limit() testcase 001
     */
    it('testLimit001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "vx");
            query.limit(10, 2);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0640
     * @tc.name [JS-API8]Query.Limit().
     * @tc.desc Test Js Api Query.Limit() testcase 002
     */
    it('testLimit002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "vx").limit(10, 2)
                .equalTo("key2", 2).limit(10, 2);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0650
     * @tc.name [JS-API8]Query.Limit().
     * @tc.desc Test Js Api Query.Limit() testcase 003
     */
    it('testLimit003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).limit(10, 2, "any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0660
     * @tc.name [JS-API8]Query.Limit().
     * @tc.desc Test Js Api Query.Limit() testcase 004
     */
    it('testLimit004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).limit(10);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0670
     * @tc.name [JS-API8]Query.Limit().
     * @tc.desc Test Js Api Query.Limit() testcase 005
     */
    it('testLimit005', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).limit("any", 10);
            console.info("should throw exception on invalid arguments");
            console.info("query is " + query.getSqlLike());
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0430
     * @tc.name [JS-API8]Query.IsNotNull().
     * @tc.desc Test Js Api Query.IsNotNull() testcase 001
     */
    it('testIsNotNull001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull("key");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0440
     * @tc.name [JS-API8]Query.IsNotNull().
     * @tc.desc Test Js Api Query.IsNotNull() testcase 002
     */
    it('testIsNotNull002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull("key1").and().notEqualTo("key1", 123);
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0450
     * @tc.name [JS-API8]Query.IsNotNull().
     * @tc.desc Test Js Api Query.IsNotNull() testcase 003
     */
    it('testIsNotNull003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull("key2", "any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0460
     * @tc.name [JS-API8]Query.IsNotNull().
     * @tc.desc Test Js Api Query.IsNotNull() testcase 004
     */
    it('testIsNotNull004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull(1);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0050
     * @tc.name [JS-API8]Query.BeginGroup().
     * @tc.desc Test Js Api Query.BeginGroup() testcase 001
     */
    it('testBeginGroup001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup();
            query.isNotNull("$.name");
            query.endGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0060
     * @tc.name [JS-API8]Query.BeginGroup().
     * @tc.desc Test Js Api Query.BeginGroup() testcase 002
     */
    it('testBeginGroup002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup();
            query.beginGroup();
            query.notEqualTo("$.name", 0);
            query.endGroup();
            query.beginGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0070
     * @tc.name [JS-API8]Query.BeginGroup().
     * @tc.desc Test Js Api Query.BeginGroup() testcase 003
     */
    it('testBeginGroup003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup(1);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0080
     * @tc.name [JS-API8]Query.BeginGroup().
     * @tc.desc Test Js Api Query.BeginGroup() testcase 004
     */
    it('testBeginGroup004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup("any", 1);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0130
     * @tc.name [JS-API8]Query.EndGroup().
     * @tc.desc Test Js Api Query.EndGroup() testcase 001
     */
    it('testEndGroup001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup();
            query.isNotNull("$.name");
            query.endGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0140
     * @tc.name [JS-API8]Query.EndGroup().
     * @tc.desc Test Js Api Query.EndGroup() testcase 002
     */
    it('testEndGroup002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.endGroup();
            query.beginGroup();
            query.isNotNull("$.name");
            query.endGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0150
     * @tc.name [JS-API8]Query.EndGroup().
     * @tc.desc Test Js Api Query.EndGroup() testcase 003
     */
    it('testEndGroup003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.endGroup(0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0160
     * @tc.name [JS-API8]Query.EndGroup().
     * @tc.desc Test Js Api Query.EndGroup() testcase 004
     */
    it('testEndGroup004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.endGroup("any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0920
     * @tc.name [JS-API8]Query.PrefixKey().
     * @tc.desc Test Js Api Query.PrefixKey() testcase 001
     */
    it('testPrefixKey001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey("$.name");
            query.prefixKey("0");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0930
     * @tc.name [JS-API8]Query.PrefixKey().
     * @tc.desc Test Js Api Query.PrefixKey() testcase 002
     */
    it('testPrefixKey002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey("kx1").or().prefixKey("kx2").or().prefixKey("kx3");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0940
     * @tc.name [JS-API8]Query.PrefixKey().
     * @tc.desc Test Js Api Query.PrefixKey() testcase 003
     */
    it('testPrefixKey003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey("k", "any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0950
     * @tc.name [JS-API8]Query.PrefixKey().
     * @tc.desc Test Js Api Query.PrefixKey() testcase 004
     */
    it('testPrefixKey004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey(123);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1000
     * @tc.name [JS-API8]Query.SetSuggestIndex().
     * @tc.desc Test Js Api Query.SetSuggestIndex() testcase 001
     */
    it('testSetSuggestIndex001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex("$.name");
            query.setSuggestIndex("0");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1010
     * @tc.name [JS-API8]Query.SetSuggestIndex().
     * @tc.desc Test Js Api Query.SetSuggestIndex() testcase 002
     */
    it('testSetSuggestIndex002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex("kxx").or().equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1020
     * @tc.name [JS-API8]Query.SetSuggestIndex().
     * @tc.desc Test Js Api Query.SetSuggestIndex() testcase 003
     */
    it('testSetSuggestIndex003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex("k", "any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_1030
     * @tc.name [JS-API8]Query.SetSuggestIndex().
     * @tc.desc Test Js Api Query.SetSuggestIndex() testcase 004
     */
    it('testSetSuggestIndex004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex(123);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0090
     * @tc.name [JS-API8]Query.DeviceId().
     * @tc.desc Test Js Api Query.DeviceId() testcase 001
     */
    it('testDeviceId001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId("$.name");
            query.deviceId("0");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0100
     * @tc.name [JS-API8]Query.DeviceId().
     * @tc.desc Test Js Api Query.DeviceId() testcase 002
     */
    it('testDeviceId002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId("kxx").equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0110
     * @tc.name [JS-API8]Query.DeviceId().
     * @tc.desc Test Js Api Query.DeviceId() testcase 003
     */
    it('testDeviceId003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId("k", "any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0120
     * @tc.name [JS-API8]Query.DeviceId().
     * @tc.desc Test Js Api Query.DeviceId() testcase 004
     */
    it('testDeviceId004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId(123);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0210
     * @tc.name [JS-API8]Query.GetSqlLike().
     * @tc.desc Test Js Api Query.GetSqlLike() testcase 001
     */
    it('testGetSqlLike001', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            let sql1 = query.getSqlLike();
            console.info("testGetSqlLike001 sql=" + sql1);
            let sql2 = query.getSqlLike();
            expect(sql1).assertEqual(sql2);
            console.info("query is " + query.getSqlLike());
        } catch (e) {
            console.info("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0220
     * @tc.name [JS-API8]Query.GetSqlLike().
     * @tc.desc Test Js Api Query.GetSqlLike() testcase 002
     */
    it('testGetSqlLike002', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            let sql1 = query.getSqlLike();
            console.info("testGetSqlLike002 sql=" + sql1);
            query.inString("key1", ["AAA", "BBB"])
                .or()
                .notEqualTo("key2", 0);
            let sql2 = query.getSqlLike();
            console.info("testGetSqlLike002 sql=" + sql2);
            console.info("query is " + query.getSqlLike());
            expect(sql1 !== sql2).assertTrue();
        } catch (e) {
            console.info("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0230
     * @tc.name [JS-API8]Query.GetSqlLike().
     * @tc.desc Test Js Api Query.GetSqlLike() testcase 003
     */
    it('testGetSqlLike003', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key");
            query.getSqlLike(0);
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryJsApiTest_0240
     * @tc.name [JS-API8]Query.GetSqlLike().
     * @tc.desc Test Js Api Query.GetSqlLike() testcase 004
     */
    it('testGetSqlLike004', 0, async function(done) {
        var query = null;
        try {
            query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key");
            query.getSqlLike("any");
            console.info("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.info("throw exception is ok : " + e);
        }
        query = null;
        done();
    })
})
}