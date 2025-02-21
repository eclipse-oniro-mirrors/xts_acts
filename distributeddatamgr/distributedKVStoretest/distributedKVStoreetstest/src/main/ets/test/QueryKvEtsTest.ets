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
import ddm from '@ohos.data.distributedKVStore';
export default function queryTest(){
  describe('queryTest', function() {

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8300
     * @tc.desc: Test Js Api Query.reset() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.reset() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_RESET_PROMISE_0100', 0, async function(done) {
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
        console.error("simply calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8400
     * @tc.desc: Test Js Api Query.reset() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.reset() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_RESET_PROMISE_0200', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })


    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8500
     * @tc.desc: Test Js Api Query.reset() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.reset() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_RESET_PROMISE_0300', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8600
     * @tc.desc: Test Js Api Query.reset() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.reset() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_RESET_PROMISE_0400', 0, async function(done) {
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
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1600
     * @tc.desc: Test Js Api Query.equalTo() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.equalTo() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_EQUALTO_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1700
     * @tc.desc: Test Js Api Query.equalTo() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.equalTo() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_EQUALTO_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.equalTo("key1", 1).equalTo("key2", 2).equalTo("key3", 3);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1800
     * @tc.desc: Test Js Api Query.equalTo() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.equalTo() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_EQUALTO_PROMISE_0300', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5800
     * @tc.desc: Test Js Api Query.notEqualTo() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.notEqualTo() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_NOTEQUALTO_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5900
     * @tc.desc: Test Js Api Query.notEqualTo() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.notEqualTo() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_NOTEQUALTO_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6000
     * @tc.desc: Test Js Api Query.notEqualTo() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.notEqualTo() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_NOTEQUALTO_PROMISE_0300', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6100
     * @tc.desc: Test Js Api Query.notEqualTo() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.notEqualTo() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_NOTEQUALTO_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key1", "value", "too more", 4);
        console.info("should throw exception on invalid arguments");
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2300
     * @tc.desc: Test Js Api Query.greaterThan() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.greaterThan() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_GREATERTHAN_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2400
     * @tc.desc: Test Js Api Query.GreatThan() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.greaterThan() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_GREATERTHAN_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2500
     * @tc.desc: Test Js Api Query.GreatThan() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GreatThan() testcase 00
     */
    it('SUB_DDM_DKV_QUERY_GREATERTHAN_PROMISE_0300', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4500
     * @tc.desc: Test Js Api Query.LessThan() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.LessThan() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_LESSTHAN_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4600
     * @tc.desc: Test Js Api Query.LessThan() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.LessThan() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_LESSTHAN_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertTrue();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4700
     * @tc.desc: Test Js Api Query.LessThan() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.LessThan() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_LESSTHAN_PROMISE_0300', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2600
     * @tc.desc: Test Js Api Query.GreaterThanOrEqualTo() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GreaterThanOrEqualTo() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_GREATETHANOREQUALTO_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2700
     * @tc.desc: Test Js Api Query.GreaterThanOrEqualTo() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GreaterThanOrEqualTo() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_GREATETHANOREQUALTO_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2800
     * @tc.desc: Test Js Api Query.GreaterThanOrEqualTo() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GreaterThanOrEqualTo() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_GREATETHANOREQUALTO_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.greaterThanOrEqualTo("key2", NaN);
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(`failed, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4800
     * @tc.desc: Test Js Api Query.LessThanOrEqualTo() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.LessThanOrEqualTo() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_LESSTHANOREQUALTO_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4900
     * @tc.desc: Test Js Api Query.LessThanOrEqualTo() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.LessThanOrEqualTo() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_LESSTHANOREQUALTO_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5000
     * @tc.desc: Test Js Api Query.LessThanOrEqualTo() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.LessThanOrEqualTo() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_LESSTHANOREQUALTO_PROMISE_0300', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4200
     * @tc.desc: Test Js Api Query.IsNull() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.IsNull() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_ISNULL_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNull("key");
        query.isNull("key2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4300
     * @tc.desc: Test Js Api Query.IsNull() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.IsNull() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_ISNULL_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNull("key").notEqualTo("key1", 4).isNull("key2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4400
     * @tc.desc: Test Js Api Query.IsNull() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.IsNull() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_ISNULL_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNull(0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2900
     * @tc.desc: Test Js Api Query.InNumber() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InNumber() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_ISNUMBER_PROMISE_0100', 0, async function(done) {
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
        let f32e = new Float32Array([21, 31, 97]);
        query.reset().inNumber("key", f32e);
        console.info("inNumber(Float32Array([-21,31, 97])  => " + query.getSqlLike());
        let f64 = new Float64Array([-21, 31]);
        query.reset().inNumber("key", f64);
        console.info("inNumber(Float64Array([-21,31])  => " + query.getSqlLike());
        query.reset();
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3000
     * @tc.desc: Test Js Api Query.InNumber() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InNumber() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_ISNUMBER_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3100
     * @tc.desc: Test Js Api Query.InNumber() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InNumber() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_ISNUMBER_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inNumber("key", 0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3200
     * @tc.desc: Test Js Api Query.InNumber() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InNumber() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_ISNUMBER_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inNumber([0, 1]);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })


    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3300
     * @tc.desc: Test Js Api Query.InNumber() testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InNumber() testcase 006
     */
    it('SUB_DDM_DKV_QUERY_ISNUMBER_PROMISE_0600', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3400
     * @tc.desc: Test Js Api Query.InString() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InString() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_ISSTRING_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inString("key", ["a2z" , 'z2a']);
        query.inString("key2", ["AAA" ]);
        console.info("query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3500
     * @tc.desc: Test Js Api Query.InString() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InString() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_ISSTRING_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3600
     * @tc.desc: Test Js Api Query.InString() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InString() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_ISSTRING_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inString("key", 0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3700
     * @tc.desc: Test Js Api Query.InString() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.InString() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_ISSTRING_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inString("key", [0, 1]);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6200
     * @tc.desc: Test Js Api Query.NotInNumber() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.NotInNumber() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_NOTINNUMBER_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInNumber("key", [1, 2]);
        query.notInNumber("key", [1000]);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6300
     * @tc.desc: Test Js Api Query.NotInNumber() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.NotInNumber() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_NOTINNUMBER_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInNumber("key", [1, 2, 3]).notInNumber("key", [1, 7, 8]).notEqualTo("kkk", 5);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6400
     * @tc.desc: Test Js Api Query.NotInNumber() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.NotInNumber() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_NOTINNUMBER_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInNumber("key", ["string"]);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6500
     * @tc.desc: Test Js Api Query.NotInString() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.NotInString() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_NOTINSTRING_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInString("key", ["v1", "v2"]);
        query.notInString("key", ["v1", "NaN"]);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6600
     * @tc.desc: Test Js Api Query.NotInString() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.NotInString() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_NOTINSTRING_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInString("key", ["v1", "v2", "v3"]).notEqualTo("kkk", "v3");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6700
     * @tc.desc: Test Js Api Query.NotInString() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.NotInString() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_NOTINSTRING_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notInString("key", [1, 2]);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5100
     * @tc.desc: Test Js Api Query.Like() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Like() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_LIKE_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.like("key", "v1");
        query.like("key2", "v2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5200
     * @tc.desc: Test Js Api Query.Like() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Like() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_LIKE_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.like("key", "v1").like("key", "v3").like("key", "v2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5300
     * @tc.desc: Test Js Api Query.Like() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Like() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_LIKE_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.like("key", 0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_9000
     * @tc.desc: Test Js Api Query.Unlike() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Unlike() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_UNLIKE_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.unlike("key", "v1");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_9100
     * @tc.desc: Test Js Api Query.Unlike() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Unlike() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_UNLIKE_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.unlike("key", "v1").unlike("key", "v3").unlike("key", "v2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_9200
     * @tc.desc: Test Js Api Query.Unlike() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Unlike() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_UNLIKE_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.unlike("key", 0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0100
     * @tc.desc: Test Js Api Query.And() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.And() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_AND_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0200
     * @tc.desc: Test Js Api Query.And() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.And() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_AND_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.equalTo("key1", 0).and().equalTo("key2", "v1");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0300
     * @tc.desc: Test Js Api Query.And() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.And() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_AND_PROMISE_0300', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0400
     * @tc.desc: Test Js Api Query.And() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.And() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_AND_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", 0).and(1).notInNumber("key", [1, 3]);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6800
     * @tc.desc: Test Js Api Query.Or() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Or() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_OR_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_6900
     * @tc.desc: Test Js Api Query.Or() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Or() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_OR_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.equalTo("key1", 0).or().equalTo("key2", "v1");
        expect(query.getSqlLike() !== "").assertTrue();
        query.reset();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7000
     * @tc.desc: Test Js Api Query.Or() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Or() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_OR_PROMISE_0300', 0, async function(done) {
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
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7100
     * @tc.desc: Test Js Api Query.Or() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Or() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_OR_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", 0).or(1).notInNumber("key", [1, 3]);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7200
     * @tc.desc: Test Js Api Query.OrderByAsc() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByAsc() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYASC_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", 0);
        query.orderByAsc("sortbykey");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7300
     * @tc.desc: Test Js Api Query.OrderByAsc() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByAsc() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYASC_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", "V0").orderByAsc("sortbykey1").orderByAsc("sortbykey2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7400
     * @tc.desc: Test Js Api Query.OrderByAsc() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByAsc() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYASC_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", false).orderByAsc(1);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7500
     * @tc.desc: Test Js Api Query.OrderByAsc() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByAsc() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYASC_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.orderByAsc();
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7600
     * @tc.desc: Test Js Api Query.OrderByDesc() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByDesc() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYDESC_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", 0);
        query.orderByDesc("sortbykey");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7700
     * @tc.desc: Test Js Api Query.OrderByDesc() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByDesc() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYDESC_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", "V0").orderByDesc("sortbykey1").orderByDesc("sortbykey2");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7800
     * @tc.desc: Test Js Api Query.OrderByDesc() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByDesc() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYDESC_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", false).orderByDesc(1);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_7900
     * @tc.desc: Test Js Api Query.OrderByDesc() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.OrderByDesc() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_ORDERBYDESC_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.orderByDesc();
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5400
     * @tc.desc: Test Js Api Query.Limit() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Limit() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_LIMIT_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", "vx");
        query.limit(10, 2);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5500
     * @tc.desc: Test Js Api Query.Limit() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Limit() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_LIMIT_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", "vx").limit(10, 2)
          .equalTo("key2", 2).limit(10, 2);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5600
     * @tc.desc: Test Js Api Query.Limit() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Limit() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_LIMIT_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", false).limit(10);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_5700
     * @tc.desc: Test Js Api Query.Limit() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.Limit() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_LIMIT_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.notEqualTo("key", false).limit("any", 10);
        console.info("should throw exception on invalid arguments");
        console.info("query is " + query.getSqlLike());
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_3900
     * @tc.desc: Test Js Api Query.IsNotNull() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.IsNotNull() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_NOTNULL_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNotNull("key");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4000
     * @tc.desc: Test Js Api Query.IsNotNull() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.IsNotNull() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_NOTNULL_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNotNull("key1").and().notEqualTo("key1", 123);
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_4100
     * @tc.desc: Test Js Api Query.IsNotNull() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.IsNotNull() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_NOTNULL_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.isNotNull(1);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0500
     * @tc.desc: Test Js Api Query.BeginGroup() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.BeginGroup() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_BEGINGROUP_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0600
     * @tc.desc: Test Js Api Query.BeginGroup() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.BeginGroup() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_BEGINGROUP_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0700
     * @tc.desc: Test Js Api Query.BeginGroup() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.BeginGroup() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_BEGINGROUP_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.beginGroup(1);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0800
     * @tc.desc: Test Js Api Query.BeginGroup() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.BeginGroup() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_BEGINGROUP_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.beginGroup("any", 1);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1200
     * @tc.desc: Test Js Api Query.EndGroup() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.EndGroup() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_ENDGROUP_PROMISE_0100', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1300
     * @tc.desc: Test Js Api Query.EndGroup() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.EndGroup() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_ENDGROUP_PROMISE_0200', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1400
     * @tc.desc: Test Js Api Query.EndGroup() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.EndGroup() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_ENDGROUP_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.endGroup(0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1500
     * @tc.desc: Test Js Api Query.EndGroup() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.EndGroup() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_ENDGROUP_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.endGroup("any");
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8000
     * @tc.desc: Test Js Api Query.PrefixKey() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.PrefixKey() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_PREFIXKEY_PROMISE_0100', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8100
     * @tc.desc: Test Js Api Query.PrefixKey() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.PrefixKey() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_PREFIXKEY_PROMISE_0200', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8200
     * @tc.desc: Test Js Api Query.PrefixKey() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.PrefixKey() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_PREFIXKEY_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.prefixKey(123);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8700
     * @tc.desc: Test Js Api Query.SetSuggestIndex() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.SetSuggestIndex() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_SETSUGGESTINDEX_PROMISE_0100', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8800
     * @tc.desc: Test Js Api Query.SetSuggestIndex() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.SetSuggestIndex() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_SETSUGGESTINDEX_PROMISE_0200', 0, async function(done) {
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
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_8900
     * @tc.desc: Test Js Api Query.SetSuggestIndex() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.SetSuggestIndex() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_SETSUGGESTINDEX_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.setSuggestIndex(123);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_0900
     * @tc.desc: Test Js Api Query.DeviceId() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.DeviceId() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_DEVICEID_PROMISE_0100', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.deviceId("$.name");
        query.deviceId("0");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1000
     * @tc.desc: Test Js Api Query.DeviceId() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.DeviceId() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_DEVICEID_PROMISE_0200', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.deviceId("kxx").equalTo("key2", "v1");
        expect(query.getSqlLike() !== "").assertTrue();
        console.info("query is " + query.getSqlLike());
      } catch (e) {
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1100
     * @tc.desc: Test Js Api Query.DeviceId() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.DeviceId() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_DEVICEID_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.deviceId(123);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_1900
     * @tc.desc: Test Js Api Query.GetSqlLike() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GetSqlLike() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_GETSQLLIKE_PROMISE_0100', 0, async function(done) {
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
        console.error("dumplicated calls should be ok : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2000
     * @tc.desc: Test Js Api Query.GetSqlLike() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GetSqlLike() testcase 002
     */
    it('SUB_DDM_DKV_QUERY_GETSQLLIKE_PROMISE_0200', 0, async function(done) {
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
        console.error("should be ok on Method Chaining : " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2100
     * @tc.desc: Test Js Api Query.GetSqlLike() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GetSqlLike() testcase 003
     */
    it('SUB_DDM_DKV_QUERY_GETSQLLIKE_PROMISE_0300', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inNumber("key");
        query.getSqlLike(0);
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_2200
     * @tc.desc: Test Js Api Query.GetSqlLike() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api Query.GetSqlLike() testcase 004
     */
    it('SUB_DDM_DKV_QUERY_GETSQLLIKE_PROMISE_0400', 0, async function(done) {
      let query = null;
      try {
        query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.inNumber("key");
        query.getSqlLike("any");
        console.info("should throw exception on invalid arguments");
        expect(null).assertFail();
      } catch (e) {
        console.error("throw exception is ok : " + `, error code is ${e.code}, message is ${e.message}`);
      }
      query = null;
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVQueryEtsApiTest_9300
     * @tc.name Schema.constructor()
     * @tc.desc Test Js Api Schema.constructor() testcase 001
     */
    it('SUB_DDM_DKV_QUERY_SCHEMA_0100', 0, async function(done) {
      try {
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.default = 'first name';

        let second = new ddm.FieldNode('second');
        second.type = ddm.ValueType.STRING;
        second.nullable = false;
        second.default = 'second name';

        let english = new ddm.FieldNode('english');
        english.type = ddm.ValueType.STRING;
        english.appendChild(first);
        english.appendChild(second);

        let schema = new ddm.Schema();
        schema.root.appendChild(english);
        schema.indexes = ['$.english.first', '$.english.second'];
      } catch (e) {
        console.info("schema fail on exception: " + e);
        expect(null).assertFail();
      }
      done();
    })
  })
}