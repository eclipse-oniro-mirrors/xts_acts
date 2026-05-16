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
import ddm from '@ohos.data.distributedKVStore';

export default function queryStageTest(){
  describe('queryStageTest', function() {

    /**
     * @tc.name   testEtsReset001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0960
     * @tc.desc   Test Js Api Query.Reset() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsReset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsReset002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0970
     * @tc.desc   Test Js Api Query.Reset() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsReset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsReset003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0980
     * @tc.desc   Test Js Api Query.Reset() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsReset003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsReset004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0990
     * @tc.desc   Test Js Api Query.Reset() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsReset004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEqaulTo001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0170
     * @tc.desc   Test Js Api Query.EqaulTo() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEqaulTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEqualTo002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0180
     * @tc.desc   Test Js Api Query.EqualTo() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEqualTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEqualTo003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0190
     * @tc.desc   Test Js Api Query.EqualTo() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEqualTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEqualTo004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0200
     * @tc.desc   Test Js Api Query.EqualTo() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEqualTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.equalTo("key1", "value", "too more");
        console.info("should throw exception on invalid arguments");
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsNotEqualTo001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0680
     * @tc.desc   Test Js Api Query.NotEqualTo() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotEqualTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotEqualTo002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0690
     * @tc.desc   Test Js Api Query.NotEqualTo() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotEqualTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotEqualTo003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0700
     * @tc.desc   Test Js Api Query.NotEqualTo() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotEqualTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotEqualTo004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0710
     * @tc.desc   Test Js Api Query.NotEqualTo() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotEqualTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreaterThan001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0250
     * @tc.desc   Test Js Api Query.GreaterThan() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreaterThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreatThan002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0300
     * @tc.desc   Test Js Api Query.GreatThan() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreatThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreatThan003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0310
     * @tc.desc   Test Js Api Query.GreatThan() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreatThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreatThan004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0320
     * @tc.desc   Test Js Api Query.GreatThan() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreatThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.greaterThan("key1", "value", "too more", 4);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsLessThan001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0510
     * @tc.desc   Test Js Api Query.LessThan() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLessThan002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0520
     * @tc.desc   Test Js Api Query.LessThan() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLessThan003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0530
     * @tc.desc   Test Js Api Query.LessThan() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLessThan004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0540
     * @tc.desc   Test Js Api Query.LessThan() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.lessThan("key1", "value", "too more", 4);
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsGreaterThanOrEqualTo001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0260
     * @tc.desc   Test Js Api Query.GreaterThanOrEqualTo() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreaterThanOrEqualTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreaterThanOrEqualTo002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0270
     * @tc.desc   Test Js Api Query.GreaterThanOrEqualTo() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreaterThanOrEqualTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreaterThanOrEqualTo003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0280
     * @tc.desc   Test Js Api Query.GreaterThanOrEqualTo() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreaterThanOrEqualTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGreaterThanOrEqualTo004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0290
     * @tc.desc   Test Js Api Query.GreaterThanOrEqualTo() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGreaterThanOrEqualTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.greaterThanOrEqualTo("key1", "value", "too more", 4);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsLessThanOrEqualTo001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0550
     * @tc.desc   Test Js Api Query.LessThanOrEqualTo() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThanOrEqualTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLessThanOrEqualTo002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0560
     * @tc.desc   Test Js Api Query.LessThanOrEqualTo() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThanOrEqualTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLessThanOrEqualTo003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0570
     * @tc.desc   Test Js Api Query.LessThanOrEqualTo() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThanOrEqualTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLessThanOrEqualTo004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0580
     * @tc.desc   Test Js Api Query.LessThanOrEqualTo() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLessThanOrEqualTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.lessThanOrEqualTo("key1", "value", "too more", 4);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsIsNull001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0470
     * @tc.desc   Test Js Api Query.IsNull() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsIsNull002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0480
     * @tc.desc   Test Js Api Query.IsNull() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsIsNull003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0490
     * @tc.desc   Test Js Api Query.IsNull() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNull003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNull("key", 0);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsIsNull004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0500
     * @tc.desc   Test Js Api Query.IsNull() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNull004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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

    /**
     * @tc.name   testEtsInNumber001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0330
     * @tc.desc   Test Js Api Query.InNumber() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        console.info("testInNumber001 start ");
        let i8 = new Int8Array([-21,31]);
        query.reset().inNumber("key", i8);
        console.info("inNumber(Int8Array([-21,31])  => " + query.getSqlLike());
        let u8 = new Uint8Array([-21,31]);
        query.reset().inNumber("key", u8);
        console.info("inNumber(Uint8Array([-21,31])  => " + query.getSqlLike());
        let c8 = new Uint8ClampedArray([-21,31]);
        query.reset().inNumber("key", c8);
        console.info("inNumber(Uint8Array([-21,31])  => " + query.getSqlLike());
        let i16 = new Int16Array([-21,31]);
        query.reset().inNumber("key", i16);
        console.info("inNumber(Int16Array([-21,31])  => " + query.getSqlLike());
        let u16 = new Uint16Array([-21,31]);
        query.reset().inNumber("key", u16);
        console.info("inNumber(Uint16Array([-21,31])  => " + query.getSqlLike());
        let i32 = new Int32Array([-21, 31]);
        query.reset().inNumber("key", i32);
        console.info("inNumber(Int32Array([-21,31])  => " + query.getSqlLike());
        let u32 = new Uint32Array([-21, 31]);
        query.reset().inNumber("key", u32);
        console.info("inNumber(UInt32Array([-21,31])  => " + query.getSqlLike());
        let f32 = new Float32Array([-21, 31]);
        query.reset().inNumber("key", f32);
        console.info("inNumber(Float32Array([-21,31])  => " + query.getSqlLike());
        let f32e = new Float32Array([21, 31, null]); // "a" will be ignored as not a float.
        query.reset().inNumber("key", f32e);
        console.info("inNumber(Float32Array([-21,31, 'a'])  => " + query.getSqlLike());
        let f64 = new Float64Array([-21, 31]);
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
     * @tc.name   testEtsInNumber002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0340
     * @tc.desc   Test Js Api Query.InNumber() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInNumber002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInNumber003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0350
     * @tc.desc   Test Js Api Query.InNumber() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInNumber003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInNumber004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0360
     * @tc.desc   Test Js Api Query.InNumber() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInNumber004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInNumber006
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0380
     * @tc.desc   Test Js Api Query.InNumber() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInNumber006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInString001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0390
     * @tc.desc   Test Js Api Query.InString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInString002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0400
     * @tc.desc   Test Js Api Query.InString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInString003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0410
     * @tc.desc   Test Js Api Query.InString() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsInString004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0420
     * @tc.desc   Test Js Api Query.InString() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsInString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotInNumber001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0720
     * @tc.desc   Test Js Api Query.NotInNumber() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotInNumber002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0730
     * @tc.desc   Test Js Api Query.NotInNumber() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInNumber002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotInNumber003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0740
     * @tc.desc   Test Js Api Query.NotInNumber() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInNumber003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInNumber("key", [1], 2);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsNotInNumber004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0750
     * @tc.desc   Test Js Api Query.NotInNumber() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInNumber004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotInString001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0760
     * @tc.desc   Test Js Api Query.NotInString() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotInString002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0770
     * @tc.desc   Test Js Api Query.NotInString() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsNotInString003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0780
     * @tc.desc   Test Js Api Query.NotInString() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInString("key", ["", "abccd"], 2);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsNotInString004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0790
     * @tc.desc   Test Js Api Query.NotInString() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsNotInString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLike001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0590
     * @tc.desc   Test Js Api Query.Like() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLike001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLike002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0600
     * @tc.desc   Test Js Api Query.Like() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLike002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLike003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0610
     * @tc.desc   Test Js Api Query.Like() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLike003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLike004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0620
     * @tc.desc   Test Js Api Query.Like() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLike004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.like("key", "str1", "str2");
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsUnlike001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1040
     * @tc.desc   Test Js Api Query.Unlike() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsUnlike001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsUnlike002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1050
     * @tc.desc   Test Js Api Query.Unlike() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsUnlike002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsUnlike003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1060
     * @tc.desc   Test Js Api Query.Unlike() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsUnlike003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsUnlike004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1070
     * @tc.desc   Test Js Api Query.Unlike() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsUnlike004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.unlike("key", "str1", "str2");
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsAnd001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0010
     * @tc.desc   Test Js Api Query.And() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsAnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsAnd002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0020
     * @tc.desc   Test Js Api Query.And() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsAnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsAnd003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0030
     * @tc.desc   Test Js Api Query.And() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsAnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsAnd004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0040
     * @tc.desc   Test Js Api Query.And() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsAnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOr001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0800
     * @tc.desc   Test Js Api Query.Or() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOr002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0810
     * @tc.desc   Test Js Api Query.Or() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOr003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0820
     * @tc.desc   Test Js Api Query.Or() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOr004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0830
     * @tc.desc   Test Js Api Query.Or() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByAsc001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0840
     * @tc.desc   Test Js Api Query.OrderByAsc() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByAsc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByAsc002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0850
     * @tc.desc   Test Js Api Query.OrderByAsc() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByAsc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByAsc003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0860
     * @tc.desc   Test Js Api Query.OrderByAsc() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByAsc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByAsc004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0870
     * @tc.desc   Test Js Api Query.OrderByAsc() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByAsc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByDesc001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0880
     * @tc.desc   Test Js Api Query.OrderByDesc() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByDesc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByDesc002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0890
     * @tc.desc   Test Js Api Query.OrderByDesc() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByDesc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByDesc003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0900
     * @tc.desc   Test Js Api Query.OrderByDesc() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByDesc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsOrderByDesc004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0910
     * @tc.desc   Test Js Api Query.OrderByDesc() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsOrderByDesc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLimit001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0630
     * @tc.desc   Test Js Api Query.Limit() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLimit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLimit002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0640
     * @tc.desc   Test Js Api Query.Limit() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLimit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLimit003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0650
     * @tc.desc   Test Js Api Query.Limit() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLimit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", false).limit(10, 2, "any");
        console.info("should throw exception on invalid arguments");
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsLimit004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0660
     * @tc.desc   Test Js Api Query.Limit() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLimit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsLimit005
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0670
     * @tc.desc   Test Js Api Query.Limit() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsLimit005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsIsNotNull001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0430
     * @tc.desc   Test Js Api Query.IsNotNull() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNotNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsIsNotNull002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0440
     * @tc.desc   Test Js Api Query.IsNotNull() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNotNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsIsNotNull003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0450
     * @tc.desc   Test Js Api Query.IsNotNull() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNotNull003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNotNull("key2", "any");
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsIsNotNull004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0460
     * @tc.desc   Test Js Api Query.IsNotNull() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsIsNotNull004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsBeginGroup001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0050
     * @tc.desc   Test Js Api Query.BeginGroup() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsBeginGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsBeginGroup002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0060
     * @tc.desc   Test Js Api Query.BeginGroup() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsBeginGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsBeginGroup003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0070
     * @tc.desc   Test Js Api Query.BeginGroup() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsBeginGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsBeginGroup004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0080
     * @tc.desc   Test Js Api Query.BeginGroup() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsBeginGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEndGroup001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0130
     * @tc.desc   Test Js Api Query.EndGroup() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEndGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEndGroup002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0140
     * @tc.desc   Test Js Api Query.EndGroup() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEndGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEndGroup003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0150
     * @tc.desc   Test Js Api Query.EndGroup() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEndGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsEndGroup004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0160
     * @tc.desc   Test Js Api Query.EndGroup() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsEndGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsPrefixKey001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0920
     * @tc.desc   Test Js Api Query.PrefixKey() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsPrefixKey001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsPrefixKey002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0930
     * @tc.desc   Test Js Api Query.PrefixKey() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsPrefixKey002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsPrefixKey003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0940
     * @tc.desc   Test Js Api Query.PrefixKey() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsPrefixKey003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.prefixKey("k", "any");
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsPrefixKey004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0950
     * @tc.desc   Test Js Api Query.PrefixKey() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsPrefixKey004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsSetSuggestIndex001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1000
     * @tc.desc   Test Js Api Query.SetSuggestIndex() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSetSuggestIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsSetSuggestIndex002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1010
     * @tc.desc   Test Js Api Query.SetSuggestIndex() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSetSuggestIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsSetSuggestIndex003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1020
     * @tc.desc   Test Js Api Query.SetSuggestIndex() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSetSuggestIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.setSuggestIndex("k", "any");
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsSetSuggestIndex004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_1030
     * @tc.desc   Test Js Api Query.SetSuggestIndex() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSetSuggestIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsDeviceId001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0090
     * @tc.desc   Test Js Api Query.DeviceId() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsDeviceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsDeviceId002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0100
     * @tc.desc   Test Js Api Query.DeviceId() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsDeviceId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsDeviceId003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0110
     * @tc.desc   Test Js Api Query.DeviceId() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsDeviceId003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.deviceId("k", "any");
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.info("throw exception is ok : " + e);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.name   testEtsDeviceId004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0120
     * @tc.desc   Test Js Api Query.DeviceId() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsDeviceId004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGetSqlLike001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0210
     * @tc.desc   Test Js Api Query.GetSqlLike() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGetSqlLike001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGetSqlLike002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0220
     * @tc.desc   Test Js Api Query.GetSqlLike() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGetSqlLike002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGetSqlLike003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0230
     * @tc.desc   Test Js Api Query.GetSqlLike() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGetSqlLike003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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
     * @tc.name   testEtsGetSqlLike004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreQueryEtsApiTest_0240
     * @tc.desc   Test Js Api Query.GetSqlLike() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsGetSqlLike004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      let query = null;
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