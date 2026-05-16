/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { ValuesBucket } from '@kit.ArkData';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const RDB_DB_NoneTokenizerNAME = "RdbNoneTokenizer.db";
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RelationalStore_Ets_TEST >>>>>> ]"
const CREATE_TABLE_TEST = "CREATE VIRTUAL TABLE IF NOT EXISTS test USING fts4(name, content);";

const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: RDB_DB_NoneTokenizerNAME,
  securityLevel: data_Rdb.SecurityLevel.S1,
  tokenizer: data_Rdb.Tokenizer.NONE_TOKENIZER
}
let rdbStore: data_Rdb.RdbStore;
export default function RdbPredicatesErrTest() {
  describe('RdbPredicatesErrTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      try {
        rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        console.info(TAG + 'beforeAll 111 rdbStore' + rdbStore);
        await rdbStore.executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.info(TAG + 'beforeAll err=' + err.code + err.message);
      }
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      let res = await rdbStore.executeSql("DELETE FROM test");

    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await data_Rdb.deleteRdbStore(context, RDB_DB_NoneTokenizerNAME);
    });
    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   SUB_RDB_NONE_TOKENIZER0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0010
     * @tc.desc   SUB_RDB_NONE_TOKENIZER0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NONE_TOKENIZER0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      try {
        rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG)
        expect(rdbStore).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NONE_TOKENIZER0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_InDevices0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0020
     * @tc.desc   SUB_RDB_InDevices0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_InDevices0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("EMPLOYEE");
        predicates.inDevices(null);
        expect(rdbStore).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_InDevices0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_InDevices0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0030
     * @tc.desc   SUB_RDB_InDevices0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_InDevices0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.inDevices(undefined);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_InDevices0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_InAllDevices0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0040
     * @tc.desc   SUB_RDB_InAllDevices0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_InAllDevices0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.inAllDevices();
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_InDevices0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_EqualTo0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0050
     * @tc.desc   SUB_RDB_EqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("", 1);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_EqualTo0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_EqualTo0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0060
     * @tc.desc   SUB_RDB_EqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo(null, 1);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_EqualTo0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_EqualTo0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0070
     * @tc.desc   SUB_RDB_EqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo(undefined, 1);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_EqualTo0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotEqualTo0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0080
     * @tc.desc   SUB_RDB_NotEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("", 1);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotEqualTo0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotEqualTo0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0090
     * @tc.desc   SUB_RDB_NotEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo(null, 1);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotEqualTo0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotEqualTo0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0100
     * @tc.desc   SUB_RDB_NotEqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo(undefined, 1);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotEqualTo0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_BeginWrap0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0110
     * @tc.desc   SUB_RDB_BeginWrap0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_BeginWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.beginWrap();
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_BeginWrap0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_EndWrap0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0130
     * @tc.desc   SUB_RDB_EndWrap0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EndWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.endWrap();
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_EndWrap0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Or0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0140
     * @tc.desc   SUB_RDB_Or0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Or0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.or();
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Or0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_And0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0150
     * @tc.desc   SUB_RDB_And0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_And0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.and();
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_And0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Contains0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0160
     * @tc.desc   SUB_RDB_Contains0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Contains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.contains("", "DEF");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Contains0001 fail err.code is " + error.code + "err.message is " + error.message);
        // expect().assertFail();
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Contains0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0170
     * @tc.desc   SUB_RDB_Contains0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Contains0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.contains(null, "DEF");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Contains0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Contains0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0180
     * @tc.desc   SUB_RDB_Contains0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Contains0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.contains(undefined, "DEF");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Contains0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_BeginsWith0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0190
     * @tc.desc   SUB_RDB_BeginsWith0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_BeginsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.beginsWith("", "Li");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_BeginsWith0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_BeginsWith0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0200
     * @tc.desc   SUB_RDB_BeginsWith0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_BeginsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.beginsWith(null, "Li");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_BeginsWith0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_BeginsWith0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0210
     * @tc.desc   SUB_RDB_BeginsWith0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_BeginsWith0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.beginsWith(undefined, "Li");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_BeginsWith0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_EndsWith0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0220
     * @tc.desc   SUB_RDB_EndsWith0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EndsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.endsWith("", "Li");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_EndsWith0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_EndsWith0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0230
     * @tc.desc   SUB_RDB_EndsWith0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EndsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.endsWith(null, "Li");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_EndsWith0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_EndsWith0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0240
     * @tc.desc   SUB_RDB_EndsWith0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_EndsWith0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.endsWith(undefined, "Li");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_EndsWith0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_IsNull0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0250
     * @tc.desc   SUB_RDB_IsNull0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_IsNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.isNull("NAME");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_IsNull0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_IsNotNull0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0260
     * @tc.desc   SUB_RDB_IsNotNull0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_IsNotNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.isNotNull("NAME");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_IsNotNull0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Like0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0270
     * @tc.desc   SUB_RDB_Like0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Like0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.like("stringValue", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_IsNotNull0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Like0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0280
     * @tc.desc   SUB_RDB_Like0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Like0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.like("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Like0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Like0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0290
     * @tc.desc   SUB_RDB_Like0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Like0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.like("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Like0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Glob0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0300
     * @tc.desc   SUB_RDB_Glob0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Glob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.glob("", "ABC*");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Glob0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Glob0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0310
     * @tc.desc   SUB_RDB_Glob0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Glob0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.glob(null, "ABC*");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Glob0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Glob0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0320
     * @tc.desc   SUB_RDB_Glob0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Glob0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.glob(undefined, "ABC*");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Glob0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Glob0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0330
     * @tc.desc   SUB_RDB_Glob0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Glob0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Glob0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Glob0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0340
     * @tc.desc   SUB_RDB_Glob0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Glob0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.glob("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Glob0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Glob0006
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0350
     * @tc.desc   SUB_RDB_Glob0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Glob0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.glob("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Glob0006 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0360
     * @tc.desc   SUB_RDB_Between0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("", "ABB", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0370
     * @tc.desc   SUB_RDB_Between0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between(null, "ABB", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0380
     * @tc.desc   SUB_RDB_Between0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between(undefined, "ABB", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0390
     * @tc.desc   SUB_RDB_Between0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("stringValue", "", "ABD");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0400
     * @tc.desc   SUB_RDB_Between0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("stringValue", null, "ABD");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0006
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0410
     * @tc.desc   SUB_RDB_Between0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("stringValue", undefined, "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0006 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0007
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0420
     * @tc.desc   SUB_RDB_Between0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0007 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0008
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0430
     * @tc.desc   SUB_RDB_Between0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0008 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_Between0009
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0440
     * @tc.desc   SUB_RDB_Between0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Between0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Between0009 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0450
     * @tc.desc   SUB_RDB_NotBetween0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("", "ABB", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0460
     * @tc.desc   SUB_RDB_NotBetween0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween(null, "ABB", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0470
     * @tc.desc   SUB_RDB_NotBetween0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween(undefined, "ABB", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0480
     * @tc.desc   SUB_RDB_NotBetween0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "", "ABD");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0490
     * @tc.desc   SUB_RDB_NotBetween0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", null, "ABD");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0006
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0500
     * @tc.desc   SUB_RDB_NotBetween0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", undefined, "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0006 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0007
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0510
     * @tc.desc   SUB_RDB_NotBetween0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "ABB", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0007 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0008
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0520
     * @tc.desc   SUB_RDB_NotBetween0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "ABB", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0008 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotBetween0009
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0530
     * @tc.desc   SUB_RDB_NotBetween0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotBetween0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "ABB", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotBetween0009 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GreaterThan0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0540
     * @tc.desc   SUB_RDB_GreaterThan0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("", "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_GreaterThan0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GreaterThan0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0550
     * @tc.desc   SUB_RDB_GreaterThan0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GreaterThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan(null, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_GreaterThan0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GreaterThan0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0560
     * @tc.desc   SUB_RDB_GreaterThan0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GreaterThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan(undefined, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_GreaterThan0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GreaterThan0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0570
     * @tc.desc   SUB_RDB_GreaterThan0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GreaterThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_GreaterThan0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_GreaterThan0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0580
     * @tc.desc   SUB_RDB_GreaterThan0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GreaterThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_GreaterThan0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThan0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0590
     * @tc.desc   SUB_RDB_LessThan0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThan0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThan0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0600
     * @tc.desc   SUB_RDB_LessThan0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan(null, "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThan0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThan0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0610
     * @tc.desc   SUB_RDB_LessThan0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan(undefined, "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThan0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThan0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0620
     * @tc.desc   SUB_RDB_LessThan0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThan0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThan0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0630
     * @tc.desc   SUB_RDB_LessThan0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThan0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_greaterThanOrEqualTo0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0640
     * @tc.desc   SUB_RDB_greaterThanOrEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_greaterThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("", "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_greaterThanOrEqualTo0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_greaterThanOrEqualTo0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0650
     * @tc.desc   SUB_RDB_greaterThanOrEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_greaterThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo(null, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_greaterThanOrEqualTo0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_greaterThanOrEqualTo0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0660
     * @tc.desc   SUB_RDB_greaterThanOrEqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_greaterThanOrEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo(undefined, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_greaterThanOrEqualTo0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_greaterThanOrEqualTo0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0670
     * @tc.desc   SUB_RDB_greaterThanOrEqualTo0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_greaterThanOrEqualTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_greaterThanOrEqualTo0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_greaterThanOrEqualTo0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0680
     * @tc.desc   SUB_RDB_greaterThanOrEqualTo0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_greaterThanOrEqualTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_greaterThanOrEqualTo0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThanOrEqualTo0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0690
     * @tc.desc   SUB_RDB_LessThanOrEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("", "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThanOrEqualTo0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThanOrEqualTo0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0700
     * @tc.desc   SUB_RDB_LessThanOrEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo(null, "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThanOrEqualTo0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThanOrEqualTo0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0710
     * @tc.desc   SUB_RDB_LessThanOrEqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThanOrEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo(undefined, "ABD");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThanOrEqualTo0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThanOrEqualTo0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0720
     * @tc.desc   SUB_RDB_LessThanOrEqualTo0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThanOrEqualTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThanOrEqualTo0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_LessThanOrEqualTo0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0730
     * @tc.desc   SUB_RDB_LessThanOrEqualTo0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LessThanOrEqualTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LessThanOrEqualTo0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OrderByAsc0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0740
     * @tc.desc   SUB_RDB_OrderByAsc0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OrderByAsc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.orderByAsc("");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OrderByAsc0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OrderByAsc0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0750
     * @tc.desc   SUB_RDB_OrderByAsc0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OrderByAsc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.orderByAsc(null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OrderByAsc0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OrderByAsc0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0760
     * @tc.desc   SUB_RDB_OrderByAsc0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OrderByAsc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.orderByAsc(undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OrderByAsc0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OrderByDesc0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0770
     * @tc.desc   SUB_RDB_OrderByDesc0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OrderByDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.orderByDesc("");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OrderByDesc0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OrderByDesc0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0780
     * @tc.desc   SUB_RDB_OrderByDesc0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OrderByDesc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.orderByDesc(null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OrderByDesc0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OrderByDesc0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0790
     * @tc.desc   SUB_RDB_OrderByDesc0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OrderByDesc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.orderByDesc(undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OrderByDesc0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Distinct0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0800
     * @tc.desc   SUB_RDB_Distinct0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Distinct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.distinct();
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_Distinct0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_LimitAs0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0810
     * @tc.desc   SUB_RDB_LimitAs0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LimitAs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.limitAs(null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LimitAs0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_LimitAs0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0820
     * @tc.desc   SUB_RDB_LimitAs0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_LimitAs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.limitAs(undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_LimitAs0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OffsetAs0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0830
     * @tc.desc   SUB_RDB_OffsetAs0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OffsetAs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.offsetAs(null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OffsetAs0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_OffsetAs0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0840
     * @tc.desc   SUB_RDB_OffsetAs0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_OffsetAs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.offsetAs(undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_OffsetAs0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GroupBy0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0850
     * @tc.desc   SUB_RDB_GroupBy0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GroupBy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.groupBy(null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_GroupBy0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GroupBy0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0860
     * @tc.desc   SUB_RDB_GroupBy0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GroupBy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.groupBy(undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_GroupBy0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_GroupBy0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0870
     * @tc.desc   SUB_RDB_GroupBy0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_GroupBy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.groupBy([]);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_GroupBy0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_IndexedBy0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0880
     * @tc.desc   SUB_RDB_IndexedBy0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_IndexedBy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.indexedBy("");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_IndexedBy0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_IndexedBy0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0890
     * @tc.desc   SUB_RDB_IndexedBy0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_IndexedBy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.indexedBy(null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_IndexedBy0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_IndexedBy0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0900
     * @tc.desc   SUB_RDB_IndexedBy0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_IndexedBy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.indexedBy(undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_IndexedBy0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_In0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0910
     * @tc.desc   SUB_RDB_In0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_In0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        let values = ["1.0"];
        predicates.in("", values);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_In0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_In0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0920
     * @tc.desc   SUB_RDB_In0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_In0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        let values = ["1.0"];
        predicates.in(null, values);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_In0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_In0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0930
     * @tc.desc   SUB_RDB_In0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_In0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        let values = ["1.0"];
        predicates.in(undefined, values);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_In0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_In0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0940
     * @tc.desc   SUB_RDB_In0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_In0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.in("doubleValue", null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_In0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_In0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0950
     * @tc.desc   SUB_RDB_In0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_In0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.in("doubleValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_In0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_In0006
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0960
     * @tc.desc   SUB_RDB_In0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_In0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.in("doubleValue", []);
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_In0006 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotIn0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0970
     * @tc.desc   SUB_RDB_NotIn0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        let values = ["1.0"];
        predicates.notIn("", values);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotIn0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotIn0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0980
     * @tc.desc   SUB_RDB_NotIn0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotIn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        let values = ["1.0"];
        predicates.notIn(null, values);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotIn0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotIn0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_0990
     * @tc.desc   SUB_RDB_NotIn0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotIn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        let values = ["1.0"];
        predicates.notIn(undefined, values);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotIn0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotIn0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1000
     * @tc.desc   SUB_RDB_NotIn0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotIn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notIn("doubleValue", null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotIn0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotIn0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1010
     * @tc.desc   SUB_RDB_NotIn0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotIn0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notIn("doubleValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotIn0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotContains0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1020
     * @tc.desc   SUB_RDB_NotContains0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotContains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notContains("", "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotContains0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotContains0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1030
     * @tc.desc   SUB_RDB_NotContains0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotContains0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notContains(null, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotContains0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotContains0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1040
     * @tc.desc   SUB_RDB_NotContains0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotContains0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notContains(undefined, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotContains0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotContains0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1050
     * @tc.desc   SUB_RDB_NotContains0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotContains0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notContains("stringValue", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotContains0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotContains0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1060
     * @tc.desc   SUB_RDB_NotContains0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotContains0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notContains("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotContains0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotContains0006
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1070
     * @tc.desc   SUB_RDB_NotContains0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotContains0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notContains("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotContains0006 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotLike0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1080
     * @tc.desc   SUB_RDB_NotLike0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notLike("", "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotLike0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotLike0002
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1090
     * @tc.desc   SUB_RDB_NotLike0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notLike(null, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotLike0002 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotLike0003
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1100
     * @tc.desc   SUB_RDB_NotLike0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notLike(undefined, "ABC");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotLike0003 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotLike0004
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1110
     * @tc.desc   SUB_RDB_NotLike0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notLike("stringValue", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotLike0004 fail err.code is " + error.code + "err.message is " + error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_RDB_NotLike0005
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1120
     * @tc.desc   SUB_RDB_NotLike0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotLike0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notLike("stringValue", null);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotLike0005 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_NotLike0006
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1130
     * @tc.desc   SUB_RDB_NotLike0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_NotLike0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notLike("stringValue", undefined);
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_NotLike0006 fail err.code is " + error.code + "err.message is " + error.message);
        expect("401").assertEqual(error.code);
      }
    })

    /**
     * @tc.name   SUB_RDB_Having0001
     * @tc.number SUB_DistributedData_Rdb_SDK_RdbPredicatesErrtest_1140
     * @tc.desc   SUB_RDB_Having0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_RDB_Having0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.having("NAME = zhangsan");
        expect(predicates).assertInstanceOf("Object");
        expect().assertFail();
      } catch (error) {
        console.info(TAG + "SUB_RDB_Having0001 fail err.code is " + error.code + "err.message is " + error.message);
        expect("14800001").assertEqual(error.code);
      }
    })

  })
}