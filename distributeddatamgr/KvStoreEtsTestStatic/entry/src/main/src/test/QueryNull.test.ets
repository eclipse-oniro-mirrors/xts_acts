/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore';

import { BusinessError } from '@ohos.base';

const TAG = "[testtag >>>>>> ]"

export default function QueryNull(){
  describe('QueryNull', (): void => {
    beforeAll(async (done: () => void) => {
      console.info(TAG + 'beforeAll ');
      done();
    });

    beforeEach(async (done: () => void) => {
      console.info(TAG + 'beforeEach');
      done();
    });
    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach');
      done();
    });

    afterAll(async (done: () => void) => {
      console.info(TAG + 'afterAll');
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = ""
     * value = ""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = ""
     * value = ""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0204
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = ""
     * value = ""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0204 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("key", true);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0204
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0204 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("key", true);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0103
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0203
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0204
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/false    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0204 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("key", false);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0103
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0203
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = ""/
     * value = ""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNull_0103
     * @tc.name SUB_DDM_SKV_QueryNull_isNull_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNull(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_isNull_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNull_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNull("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inNumber_0103
     * @tc.name SUB_DDM_SKV_QueryNull_inNumber_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inNumber(field: string, valueList: number[]): Query;
     * field = ""/
     * value =
     */
    it('SUB_DDM_SKV_QueryNull_inNumber_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inNumber_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inNumber("", [1,2]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInNumber_0103
     * @tc.name SUB_DDM_SKV_QueryNull_notInNumber_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInNumber(field: string, valueList: number[]): Query;
     * field = ""/
     * value =
     */
    it('SUB_DDM_SKV_QueryNull_notInNumber_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInNumber_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInNumber("", [1,2]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inString_0103
     * @tc.name SUB_DDM_SKV_QueryNull_inString_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inString(field: string, valueList: string[]): Query;
     * field = ""/
     * value =
     */
    it('SUB_DDM_SKV_QueryNull_inString_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inString_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inString("", ["v1", "v2"]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInString_0103
     * @tc.name SUB_DDM_SKV_QueryNull_notInString_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInString(field: string, valueList: string[]): Query;
     * field = ""/
     * value =
     */
    it('SUB_DDM_SKV_QueryNull_notInString_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInString_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInString("", ["v1", "v2"]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0103
     * @tc.name SUB_DDM_SKV_QueryNull_like_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = ""/
     * value = ""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })



    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0203
     * @tc.name SUB_DDM_SKV_QueryNull_like_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = ""/
     * value = ""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })



    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0103
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = ""/
     * value = ""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0203
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = ""/
     * value = ""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByAsc_0103
     * @tc.name SUB_DDM_SKV_QueryNull_orderByAsc_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByAsc(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByAsc_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByAsc_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByAsc("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByDesc_0103
     * @tc.name SUB_DDM_SKV_QueryNull_orderByDesc_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByDesc(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByDesc_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByDesc_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByDesc("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNotNull_0103
     * @tc.name SUB_DDM_SKV_QueryNull_isNotNull_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNotNull(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_isNotNull_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNotNull_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNotNull("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_prefixKey_0103
     * @tc.name SUB_DDM_SKV_QueryNull_prefixKey_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc prefixKey(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_prefixKey_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_prefixKey_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.prefixKey("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_setSuggestIndex_0103
     * @tc.name SUB_DDM_SKV_QueryNull_setSuggestIndex_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSuggestIndex(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_setSuggestIndex_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_setSuggestIndex_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.setSuggestIndex("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_deviceId_0103
     * @tc.name SUB_DDM_SKV_QueryNull_deviceId_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deviceId(field: string): Query;
     * field = ""/
     */
    it('SUB_DDM_SKV_QueryNull_deviceId_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_deviceId_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.deviceId("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_wall_0100
     * @tc.name SUB_DDM_SKV_QueryNull_wall_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  w all
     */
    it('SUB_DDM_SKV_QueryNull_wall_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_wall_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        let qRes: factory.Query | null = new factory.Query();

        qRes = query.reset();
        expect(qRes!=undefined).assertTrue();

        qRes = query.equalTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.notEqualTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.greaterThan('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.lessThan('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.greaterThanOrEqualTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.lessThanOrEqualTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.isNull("value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.inNumber("field", [0, 1]);
        expect(qRes!=undefined).assertTrue();

        qRes = query.inString("field", ['test1', 'test2']);
        expect(qRes!=undefined).assertTrue();

        qRes = query.notInNumber("field", [0, 1]);
        expect(qRes!=undefined).assertTrue();

        qRes = query.notInString("field", ['test1', 'test2']);
        expect(qRes!=undefined).assertTrue();

        qRes = query.like("field", "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.unlike("field", "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.orderByAsc("field");
        expect(qRes!=undefined).assertTrue();

        qRes = query.orderByDesc("field");
        expect(qRes!=undefined).assertTrue();

        qRes = query.limit(10, 1);
        expect(qRes!=undefined).assertTrue();

        qRes = query.isNotNull("field");
        expect(qRes!=undefined).assertTrue();

        qRes = query.prefixKey("0");
        expect(qRes!=undefined).assertTrue();

        qRes = query.setSuggestIndex("0");
        expect(qRes!=undefined).assertTrue();

        qRes = query.deviceId("deviceId")
        expect(qRes!=undefined).assertTrue();

        qRes = query.and()
        expect(qRes!=undefined).assertTrue();

        qRes = query.or()
        expect(qRes!=undefined).assertTrue();

        qRes = query.beginGroup()
        expect(qRes!=undefined).assertTrue();

        qRes = query.endGroup()
        expect(qRes!=undefined).assertTrue();

        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    console.info(TAG + '-------------------describe SingleKvStoreReturnValue  end-------------------');
  })
}