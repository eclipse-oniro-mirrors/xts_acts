/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';


let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int  = 0x0000;
let tag: string = "relationalStorePredicatesTest";

const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS AllDataType "
  + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "integerValue INTEGER , longValue INTEGER , shortValue INTEGER , booleanValue INTEGER , "
  + "doubleValue REAL , floatValue REAL , stringValue TEXT , blobValue BLOB , clobValue TEXT , "
  + "byteValue INTEGER , dateValue INTEGER , timeValue INTEGER , timestampValue INTEGER , "
  + "calendarValue INTEGER , characterValue TEXT , primIntValue INTEGER , primLongValue INTEGER , "
  + "primShortValue INTEGER , primFloatValue REAL , primDoubleValue REAL , "
  + "primBooleanValue INTEGER , primByteValue INTEGER , primCharValue TEXT, `order` INTEGER);";

const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "Predicates.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

let rdbStore : relationalStore.RdbStore;
let DOUBLE_MAX = 9223372036854775807.0;

async function buildAllDataType1(rdbStore:relationalStore.RdbStore) {
  console.info(tag + "buildAllDataType1 start");
  let u8 = new Uint8Array([1, 2, 3])
  const valueBucket:relationalStore.ValuesBucket= {
    "integerValue": 2147483647 as long ,
    "doubleValue": DOUBLE_MAX,
    "booleanValue": true,
    "floatValue": -0.123,
    "longValue": 9223372036854775807 as long,
    "shortValue": 32767 as long,
    "characterValue": ' ',
    "stringValue": "ABCDEFGHIJKLMN",
    "blobValue": u8,
    "byteValue": 127 as long ,
  }
  await rdbStore.insert("AllDataType", valueBucket)
};

async function buildAllDataType2(rdbStore:relationalStore.RdbStore) {
  console.info(tag + "buildAllDataType2 start");
  {
    let u8 = new Uint8Array([1, 2, 3])
    const valueBucket:relationalStore.ValuesBucket = {
      "integerValue": 1 as long,
      "doubleValue": 1.0,
      "booleanValue": false,
      "floatValue": 1.0,
      "longValue": 1 as long,
      "shortValue": 1 as long,
      "characterValue": '中',
      "stringValue": "ABCDEFGHIJKLMN",
      "blobValue": u8,
      "byteValue": 1 as long,
    }
    await rdbStore.insert("AllDataType", valueBucket)
  }
}

async function buildAllDataType3(rdbStore:relationalStore.RdbStore) {
  console.info(tag + "buildAllDataType3 start");
  {
    let u8 = new Uint8Array([1, 2, 3])
    const valueBucket:relationalStore.ValuesBucket = {
      "integerValue": -2147483648 as long,
      "doubleValue": Number.MIN_VALUE,
      "booleanValue": false,
      "floatValue": 0.1234567,
      "longValue": -9223372036854775808 as long,
      "shortValue": -32768 as long,
      "characterValue": '#',
      "stringValue": "ABCDEFGHIJKLMN",
      "blobValue": u8,
      "byteValue": -128 as long,
    }
    await rdbStore.insert("AllDataType", valueBucket)
  }
}

export default function relationalStorePredicatesTest() {
  describe('relationalStorePredicatesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll');
      hilog.info(domain, tag, 'abilityDelegator:' + JSON.stringify(abilityDelegator));
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });


    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      hilog.info(domain, tag, "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL);
      await buildAllDataType1(rdbStore);
      await buildAllDataType2(rdbStore);
      await buildAllDataType3(rdbStore);
      await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValue);");
      hilog.info(domain, tag, 'beforeEach success');
    });

    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterEach');
      // rdbStore = null
      await rdbStore.close();
      await relationalStore.deleteRdbStore(context, STORE_CONFIG)
      hilog.info(domain, tag, 'afterEach success');
    });

    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterAll');

      hilog.info(domain, tag, "*************Unit Test end*************");
    });


    console.info(tag + "*************Unit Test Begin*************");

    /**
     * @tc.name   testEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0010
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info(tag + "************* testEqualTo0001 start *************");
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        {
          predicates.equalTo("booleanValue", true);
          let result = await rdbStore.query(predicates);
          expect(1).assertEqual(result.rowCount);
          result.close();
        }
        done();
        console.info(tag + "************* testEqualTo0001 end   *************");
    })

    /**
     * @tc.name   testEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0020
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("byteValue", -128 as long).or().equalTo("byteValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result?.close();
      }
      done();
      console.info(tag + "************* testEqualTo0002 end   *************");
    })

    /**
     * @tc.name   testEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0030
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result?.close();
      }
      done();
      console.info(tag + "************* testEqualTo0003 end   *************");
    })

    /**
     * @tc.name   testEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0040
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testEqualTo0004 end   *************");
    })

    /**
     * @tc.name   testEqualTo0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0050
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("shortValue", -32768.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testEqualTo0005 end   *************");
    })

    /**
     * @tc.name   testEqualTo0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0060
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0006 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("integerValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0));
        result.close();
      }
      done();
      console.info(tag + "************* testEqualTo0006 end   *************");
    })

    /**
     * @tc.name   testEqualTo0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0070
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0007 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("longValue", 1 as long );
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0))
        result.close();
      }
      done();
      console.info(tag + "************* testEqualTo0007 end   *************");
    })

    /**
     * @tc.name   testEqualTo0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0080
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEqualTo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEqualTo0008 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0))
        result.close();
      }
      done();
      console.info(tag + "************* testEqualTo0008 end   *************");
    })

    /**
     * @tc.name   testNotEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0090
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0001 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0100
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("byteValue", -128 as long);
        predicates.notEqualTo("byteValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0002 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0110
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0003 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0120
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0004 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0130
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("shortValue", -32768 as long);
        let result =  await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0005 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0140
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0006 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("integerValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0006 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0150
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0007 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("longValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0007 end *************");
    })

    /**
     * @tc.name   testNotEqualTo0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0160
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotEqualTo0008 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotEqualTo0008 end *************");
    })

    /**
     * @tc.name   testIsNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0170
     * @tc.desc   predicates isNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNull001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("primLongValue");
      let result =  await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNull0001 end *************");
    })

    /**
     * @tc.name   testIsNull0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0180
     * @tc.desc   predicates isNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNull0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNull0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNull0002 end *************");
    })

    /**
     * @tc.name   testIsNull0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0190
     * @tc.desc   predicates isNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNull0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNull0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNull0003 end *************");
    })

    /**
     * @tc.name   testIsNull0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0200
     * @tc.desc   predicates isNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNull0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNull0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNull0004 end *************");
    })

    /**
     * @tc.name   testIsNotNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0210
     * @tc.desc   predicates isNotNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNotNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNotNull0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNotNull0001 end *************");
    })

    /**
     * @tc.name   testIsNotNull0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0220
     * @tc.desc   predicates isNotNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNotNull0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNotNull0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNotNull0002 end *************");
    })

    /**
     * @tc.name   testIsNotNull0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0230
     * @tc.desc   predicates isNotNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNotNull0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNotNull0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNotNull0003 end *************");
    })

    /**
     * @tc.name   testIsNotNull0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0240
     * @tc.desc   predicates isNotNull normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNotNull0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIsNotNull0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValueX");
      let result =  await rdbStore.query(predicates);
      expect(-1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIsNotNull0004 end *************");
    })

    /**
     * @tc.name   testGreaterThan0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0250
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0001 end *************");
    })

    /**
     * @tc.name   testGreaterThan0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0260
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0002 end *************");
    })

    /**
     * @tc.name   testGreaterThan0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0270
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0003 end *************");
    })

    /**
     * @tc.name   testGreaterThan0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0280
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", 1 as long );
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0004 end *************");
    })

    /**
     * @tc.name   testGreaterThan0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0290
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ZZZ");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0005 end *************");
    })

    /**
     * @tc.name   testGreaterThan0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0300
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0006 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 999.0);
        let result =  await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0006 end *************");
    })

    /**
     * @tc.name   testGreaterThan0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0310
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0007 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", -999 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0007 end *************");
    })

    /**
     * @tc.name   testGreaterThan0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0320
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThan0008 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", -999 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThan0008 end *************");
    })

    /**
     * @tc.name   testGreaterThanOrEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0330
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThanOrEqualTo0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name   testGreaterThanOrEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0340
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThanOrEqualTo0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThanOrEqualTo0002 end *************");
    })

    /**
     * @tc.name   testGreaterThanOrEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0350
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThanOrEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThanOrEqualTo0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("integerValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThanOrEqualTo0003 end *************");
    })

    /**
     * @tc.name   testGreaterThanOrEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0360
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThanOrEqualTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGreaterThanOrEqualTo0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("longValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGreaterThanOrEqualTo0004 end *************");
    })

    /**
     * @tc.name   testLessThan0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0370
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0001 end *************");
    })

    /**
     * @tc.name   testLessThan0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0380
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0002 end *************");
    })

    /**
     * @tc.name   testLessThan0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0390
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0003 end *************");
    })

    /**
     * @tc.name   testLessThan0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0400
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0004 end *************");
    })

    /**
     * @tc.name   testLessThan0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0410
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0005 end *************");
    })

    /**
     * @tc.name   testLessThan0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0420
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0006 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 1.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0006 end *************");
    })

    /**
     * @tc.name   testLessThan0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0430
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0007 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", -2147483648 as long);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0007 end *************");
    })

    /**
     * @tc.name   testLessThan0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0440
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThan0008 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", -9223372036854775808 as long);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThan0008 end *************");
    })

    /**
     * @tc.name   testLessThanOrEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0450
     * @tc.desc   predicates lessThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThanOrEqualTo0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name   testLessThanOrEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0460
     * @tc.desc   predicates lessThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThanOrEqualTo0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThanOrEqualTo0002 end *************");
    })

    /**
     * @tc.name   testLessThanOrEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0470
     * @tc.desc   predicates lessThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThanOrEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThanOrEqualTo0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThanOrEqualTo0003 end *************");
    })

    /**
     * @tc.name   testLessThanOrEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0480
     * @tc.desc   predicates lessThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThanOrEqualTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLessThanOrEqualTo0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testLessThanOrEqualTo0004 end *************");
    })

    /**
     * @tc.name   testBetween0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0490
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0001 end *************");
    })

    /**
     * @tc.name   testBetween0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0500
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", 0.0, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0002 end *************");
    })

    /**
     * @tc.name   testBetween0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0510
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0 as long, 1 as long);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0003 end *************");
    })

    /**
     * @tc.name   testBetween0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0520
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 0 as long, 2 as long);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0004 end *************");
    })

    /**
     * @tc.name   testBetween0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0530
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "ABB");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0005 end *************");
    })

    /**
     * @tc.name   testBetween0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0540
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0006 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", DOUBLE_MAX, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0006 end *************");
    })

    /**
     * @tc.name   testBetween0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0550
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0007 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 1 as long, 0 as long);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0007 end *************");
    })

    /**
     * @tc.name   testBetween0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0560
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBetween0008 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 2 as long, -1 as long);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBetween0008 end *************");
    })

    /**
     * @tc.name   testNotBetween0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0570
     * @tc.desc   test string value with notBetween.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotBetween0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "ABB", "ABD");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotBetween0001 end *************");
    })

    /**
     * @tc.name   testNotBetween0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0580
     * @tc.desc   test double value with notBetween.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotBetween0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotBetween0002 start *************");
      {
        let predicates =  new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("doubleValue", 0.0, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotBetween0002 end *************");
    })

    /**
     * @tc.name   testNotBetween0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0590
     * @tc.desc   test integer value with notBetween.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotBetween0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotBetween0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0 as long, 1 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotBetween0003 end *************");
    })

    /**
     * @tc.name   testNotBetween0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0600
     * @tc.desc   test long value with notBetween.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotBetween0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testNotBetween0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", 0 as long, 2 as long);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testNotBetween0004 end *************");
    })

    /**
     * @tc.name   testGlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0610
     * @tc.desc   end with ? by glob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGlob0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "ABC*");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGlob0001 end *************");
    })

    /**
     * @tc.name   testGlob0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0620
     * @tc.desc   begin with * by glob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGlob0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "*LMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGlob0002 end *************");
    })

    /**
     * @tc.name   testGlob0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0630
     * @tc.desc   end with ? by glob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGlob0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "ABCDEFGHIJKLM?");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGlob0003 end *************");
    })

    /**
     * @tc.name   testGlob0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0640
     * @tc.desc   begin with ? by glob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGlob0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "?BCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGlob0004 end *************");
    })

    /**
     * @tc.name   testGlob0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0650
     * @tc.desc   begin and end with * by glob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGlob0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "*FGHI*");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGlob0005 end *************");
    })

    /**
     * @tc.name   testGlob0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0660
     * @tc.desc   begin and end with ? by glob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testGlob0006 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "?BCDEFGHIJKLM?");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testGlob0006 end *************");
    })

    /**
     * @tc.name   testContains0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0670
     * @tc.desc   predicates contains normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testContains0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("stringValue", "DEF");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testContains0001 end *************");
    })

    /**
     * @tc.name   testContains0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0680
     * @tc.desc   predicates contains normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContains0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testContains0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("stringValue", "DEFX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testContains0002 end *************");
    })

    /**
     * @tc.name   testContains0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0690
     * @tc.desc   predicates contains normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContains0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testContains0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testContains0003 end *************");
    })

    /**
     * @tc.name   testContains0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0700
     * @tc.desc   predicates contains normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContains0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testContains0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testContains0004 end *************");
    })

    /**
     * @tc.name   testBeginsWith0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0710
     * @tc.desc   predicates beginsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginsWith0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("stringValue", "ABC");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testBeginsWith0001 end *************");
    })

    /**
     * @tc.name   testBeginsWith0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0720
     * @tc.desc   predicates beginsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginsWith0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("stringValue", "ABCX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testBeginsWith0002 end *************");
    })

    /**
     * @tc.name   testBeginsWith0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0730
     * @tc.desc   predicates beginsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginsWith0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginsWith0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testBeginsWith0003 end *************");
    })

    /**
     * @tc.name   testBeginsWith0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0740
     * @tc.desc   predicates beginsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginsWith0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginsWith0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testBeginsWith0004 end *************");
    })

    /**
     * @tc.name   testEndsWith0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0750
     * @tc.desc   predicates endsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEndsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEndsWith0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("stringValue", "LMN");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testEndsWith0001 end *************");
    })

    /**
     * @tc.name   testEndsWith0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0760
     * @tc.desc   predicates endsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEndsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEndsWith0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("stringValue", "LMNX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testEndsWith0002 end *************");
    })

    /**
     * @tc.name   testEndsWith0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0770
     * @tc.desc   predicates endsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEndsWith0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEndsWith0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testEndsWith0003 end *************");
    })

    /**
     * @tc.name   testEndsWith0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0780
     * @tc.desc   predicates endsWith normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEndsWith0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testEndsWith0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testEndsWith0004 end *************");
    })

    /**
     * @tc.name   testLike0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0790
     * @tc.desc   predicates like normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLike0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "%LMN%");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLike0001 end *************");
    })

    /**
     * @tc.name   testLike0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0800
     * @tc.desc   predicates like normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLike0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "%LMNX%");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLike0002 end *************");
    })

    /**
     * @tc.name   testLike0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0810
     * @tc.desc   predicates like normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLike0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("characterValue", "%中%");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLike0003 end *************");
    })

    /**
     * @tc.name   testLike0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0820
     * @tc.desc   predicates like normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testLike0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("characterValue", "%#%");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLike0004 end *************");
    })

    /**
     * @tc.name   testBeginWrap0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0830
     * @tc.desc   predicates beginWrap normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginWrap0001 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("integerValue", 1 as long)
          .or()
          .equalTo("integerValue", 2147483647 as long)
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBeginWrap0001 end *************");
    })

    /**
     * @tc.name   testBeginWrap0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0840
     * @tc.desc   predicates beginWrap normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginWrap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginWrap0002 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("characterValue", ' ')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBeginWrap0002 end *************");
    })

    /**
     * @tc.name   testBeginWrap0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0850
     * @tc.desc   predicates beginWrap normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginWrap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginWrap0003 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("characterValue", '中')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBeginWrap0003 end *************");
    })

    /**
     * @tc.name   testBeginWrap0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0860
     * @tc.desc   predicates beginWrap normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginWrap0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginWrap0004 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .equalTo("characterValue", '中')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBeginWrap0004 end *************");
    })

    /**
     * @tc.name   testBeginWrap0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0870
     * @tc.desc   predicates beginWrap normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginWrap0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testBeginWrap0005 start *************");
      {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("characterValue", '中');
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result?.rowCount);
        result.close();
      }
      done();
      console.info(tag + "************* testBeginWrap0005 end *************");
    })

    /**
     * @tc.name   testAnd0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0880
     * @tc.desc   predicates and normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testAnd0001 start *************");

      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
        .and()
        .equalTo("integerValue", 1 as long);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testAnd0001 end *************");
    })

    /**
     * @tc.name   testAnd0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0890
     * @tc.desc   predicates or normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testAnd0002 start *************");

      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
        .beginWrap()
        .equalTo("integerValue", 1 as long)
        .or()
        .equalTo("integerValue", 2147483647 as long)
        .endWrap();
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testAnd0002 end *************");
    })

    /**
     * @tc.name   testAnd0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0900
     * @tc.desc   predicates and normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testAnd0003 start *************");

      let predicates = new relationalStore.RdbPredicates("AllDataType");
      let predicatesInit = predicates
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").or().and().equalTo("integerValue", 1 as long);
      expect(predicates == predicatesInit).assertTrue();
      console.info(tag + "you should not start a request" + " with \"and\" or use or() before this function");
      done();
      console.info(tag + "************* testAnd0003 end *************");
    })

    /**
     * @tc.name   testAnd0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0910
     * @tc.desc   predicates and normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testAnd0004 start *************");

      let predicates = new relationalStore.RdbPredicates("AllDataType");
      let predicatesInit = predicates
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").or().or().equalTo("integerValue", 1 as long);
      expect(predicates == predicatesInit).assertTrue();
      console.info(tag + "you are starting a sql request with predicate or or,"
        + "using function or() immediately after another or(). that is ridiculous.");
      done();
      console.info(tag + "************* testAnd0004 end *************");
    })

    /**
     * @tc.name   testOrder0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0920
     * @tc.desc   predicates order normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testOrder0001 start *************");

      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValue").distinct();
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      expect(true).assertEqual(result.goToFirstRow())
      expect(3).assertEqual(result.getLong(0));
      expect(true).assertEqual(result.goToNextRow())
      expect(2).assertEqual(result.getLong(0));
      expect(true).assertEqual(result.goToNextRow())
      expect(1).assertEqual(result.getLong(0));
      result.close();
      done();
      console.info(tag + "************* testOrder0001 end *************");
    })

    /**
     * @tc.name   testOrder0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0930
     * @tc.desc   predicates order normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOrder0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testOrder0002 start *************");

      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValue").distinct();
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      expect(true).assertEqual(result.goToFirstRow())
      expect(1).assertEqual(result.getLong(0));
      expect(true).assertEqual(result.goToNextRow())
      expect(2).assertEqual(result.getLong(0));
      expect(true).assertEqual(result.goToNextRow())
      expect(3).assertEqual(result.getLong(0));
      result.close();
      done();
      console.info(tag + "************* testOrder0002 end *************");
    })

    /**
     * @tc.name   testOrder0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0940
     * @tc.desc   predicates order normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOrder0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testOrder0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValueX").distinct();
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testOrder0003 end *************");
    })

    /**
     * @tc.name   testOrder0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0950
     * @tc.desc   predicates order normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOrder0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testOrder0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValueX").distinct();
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testOrder0004 end *************");
    })

    /**
     * @tc.name   testLimit0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0960
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLimit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testLimit0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(1);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLimit0001 end *************");
    })

    /**
     * @tc.name   testLimit0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0970
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLimit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testLimit0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLimit0002 end *************");
    })

    /**
     * @tc.name   testLimit0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0980
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLimit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testLimit0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(100);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLimit0003 end *************");
    })

    /**
     * @tc.name   testLimit0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0990
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLimit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testLimit0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "中").limitAs(1);
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLimit0004 end *************");
    })

    /**
     * @tc.name   testLimit0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1000
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLimit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testLimit0005 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(0);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLimit0005 end *************");
    })

    /**
     * @tc.name   testLimit0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1010
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLimit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testLimit0006 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(-1);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testLimit0006 end *************");
    })

    /**
     * @tc.name   testOffset0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1020
     * @tc.desc   predicates offset normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testOffset0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(1);
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testOffset0001 end *************");
    })

    /**
     * @tc.name   testOffset0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1030
     * @tc.desc   predicates offset normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testOffset0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(0);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testOffset0002 end *************");
    })

    /**
     * @tc.name   testOffset0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1040
     * @tc.desc   predicates offset normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testOffset0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(5);
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testOffset0003 end *************");
    })

    /**
     * @tc.name   testOffset0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1050
     * @tc.desc   predicates offset normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testOffset0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(-1);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testOffset0004 end *************");
    })

    /**
     * @tc.name   testIn0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1060
     * @tc.desc   predicates in normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>   {
      console.info(tag + "************* testIn0001 start *************");
      let values: Array<relationalStore.ValueType> = [Number.MIN_VALUE];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.inValues("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIn0001 end *************");
    })

    /**
     * @tc.name   testIn0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1070
     * @tc.desc   predicates in normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testIn0002 start *************");
      let values: Array<relationalStore.ValueType> = [1.0];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.inValues("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIn0002 end *************");
    })

    /**
     * @tc.name   testIn0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1080
     * @tc.desc   predicates in normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testIn0003 start *************");
      let values: Array<relationalStore.ValueType> = [DOUBLE_MAX];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.inValues("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIn0003 end *************");
    })

    /**
     * @tc.name   testIn0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1090
     * @tc.desc   predicates in normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testIn0004 start *************");
      let values: Array<relationalStore.ValueType> = [Number.MIN_VALUE, 1.0, DOUBLE_MAX];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.inValues("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testIn0004 end *************");
    })

    /**
     * @tc.name   testNotIn0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1100
     * @tc.desc   the common and min value test with notin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testNotIn0001 start *************");
      let values: Array<relationalStore.ValueType> = [1 as long, -2147483648 as long];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notInValues("integerValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testNotIn0001 end *************");
    })

    /**
     * @tc.name   testNotIn0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1110
     * @tc.desc   the common and max value test with notin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotIn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testNotIn0002 start *************");
      let values: Array<relationalStore.ValueType> = [1 as long, 2147483647 as long];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notInValues("integerValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testNotIn0002 end *************");
    })

    /**
     * @tc.name   testNotIn0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1120
     * @tc.desc   the min and max value test with notin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotIn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testNotIn0003 start *************");
      let values: Array<relationalStore.ValueType> = [-2147483648 as long, 2147483647 as long];
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notInValues("integerValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testNotIn0003 end *************");
    })

    /**
     * @tc.name   testCreate0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1130
     * @tc.desc   predicates constructor test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testCreate0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testCreate0001 end *************");
    })

    /**
     * @tc.name   testCreate0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1140
     * @tc.desc   predicates constructor test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testCreate0002 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testCreate0002 end *************");
    })

    /**
     * @tc.name   testGroupBy0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1150
     * @tc.desc   predicates groupBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGroupBy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testGroupBy0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValue"]);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testGroupBy0001 end *************");
    })

    /**
     * @tc.name   testGroupBy0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1160
     * @tc.desc   predicates groupBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGroupBy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testGroupBy0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValueX"]);
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result?.rowCount);
      result.close();
      done();
      console.info(tag + "************* testGroupBy0002 end *************");
    })

    /**
     * @tc.name   testIndexedBy0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1170
     * @tc.desc   predicates indexedBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexedBy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testIndexedBy0001 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.like("stringValue", "ABCDEFGHIJKLMN").indexedBy("characterValue");
        let result = await rdbStore.query(predicates);
        expect(result?.rowCount == -1).assertTrue();
        result.close();
      } catch (err:BusinessError) {
        expect(err.code).assertEqual("401");
      }
      done();
      console.info(tag + "************* testIndexedBy0001 end *************");
    })

    /**
     * @tc.name   testIndexedBy0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1180
     * @tc.desc   predicates indexedBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexedBy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testIndexedBy0002 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.like("stringValue", "ABCDEFGHIJKLMN").indexedBy("characterValue");
        let result = await rdbStore.query(predicates);
        expect(result?.rowCount == -1).assertTrue();
        result.close();
      } catch (err:BusinessError) {
        expect(err != undefined).assertFalse();
      }
      done();
      console.info(tag + "************* testIndexedBy0002 end *************");
    })

    /**
     * @tc.name   testIndexedBy0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1190
     * @tc.desc   predicates indexedBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexedBy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> =>  {
      console.info(tag + "************* testIndexedBy0003 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.indexedBy("index_name");
        let result = await rdbStore.query(predicates);
        console.info(tag + "result?.rowCount = " + result?.rowCount);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      } catch (err:BusinessError) {
        console.info(tag + "err = " + err);
        expect(err != undefined).assertFalse();
      }
      done();
      console.info(tag + "************* testIndexedBy0003 end *************");
    })

    /**
     * @tc.name   testIndexedBy0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1200
     * @tc.desc   predicates indexedBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexedBy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:()=>void) : Promise<void> => {
      console.info(tag + "************* testIndexedBy0004 start *************");
      try {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.like("stringValue", "ABCDEFGHIJKLMN").indexedBy("index_name");
        let result = await rdbStore.query(predicates);
        console.info(tag + "result?.rowCount = " + result?.rowCount);
        expect(3).assertEqual(result?.rowCount);
        result.close();
      } catch (err:BusinessError) {
        console.info(tag + "err = " + err);
        expect(err != undefined).assertFalse();
      }
      done();
      console.info(tag + "************* testIndexedBy0004 end *************");
    })

    console.info(tag + "*************Unit Test End*************");

    /**
     * @tc.name   testNotLike0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0001
     * @tc.desc   1.Execute notLike ("stringValue", "ABCDEFGHIJKLMN")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("stringValue", "ABCDEFGHIJKLMN");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotLike0001 end *************");
    })

    /**
     * @tc.name   testNotLike0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0002
     * @tc.desc   1.Execute notLike ("stringValue", "LMNX")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("stringValue", "LMNX");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotLike0002 end *************");
    })

    /**
     * @tc.name   testNotLike0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0003
     * @tc.desc   1.Execute notLike ("characterValue", "中")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotLike0003 end *************");
    })

    /**
     * @tc.name   testNotLike0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0004
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotLike0004 end *************");
    })

    /**
     * @tc.name   testNotLike0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0006
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0006 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long ,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long ,
        "shortValue": -32768 as long ,
        "characterValue": '#',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long ,
      }

      await rdbStore.insert("AllDataType", valueBucket)

      let predicatesInsert = new relationalStore.RdbPredicates("AllDataType");
      predicatesInsert.notLike("characterValue", "#");

      result = await rdbStore.query(predicatesInsert);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");

      await rdbStore.delete(predicatesBefore);
      done();
      console.log(tag + "************* testNotLike0006 end *************");
    })

    /**
     * @tc.name   testNotLike0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0007
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0007 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long ,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long ,
        "shortValue": -32768 as long ,
        "characterValue": '-',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long ,
      }

      await rdbStore.insert("AllDataType", valueBucket)

      let predicatesInsert = new relationalStore.RdbPredicates("AllDataType");
      predicatesInsert.notLike("characterValue", "#");

      result = await rdbStore.query(predicatesInsert);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");

      await rdbStore.delete(predicatesBefore);
      done();
      console.log(tag + "************* testNotLike0007 end *************");
    })

    /**
     * @tc.name   testNotLike0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0008
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0008 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long ,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long ,
        "shortValue": -32768 as long ,
        "characterValue": '#',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long ,
      }
      predicates.equalTo("characterValue", "中");
      await rdbStore.update(valueBucket, predicates);
      let predicatesUpdate = new relationalStore.RdbPredicates("AllDataType");
      predicatesUpdate.notLike("characterValue", "#");
      result = await rdbStore.query(predicatesUpdate);
      expect(1).assertEqual(result?.rowCount);
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long ,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long ,
        "shortValue": 1 as long ,
        "characterValue": '中',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long ,
      }
      result.close();
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");
      await rdbStore.update(valueBucketBefore, predicatesBefore);
      done();
      console.log(tag + "************* testNotLike0008 end *************");
    })

    /**
     * @tc.name   testNotLike0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0009
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0009 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long ,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long ,
        "shortValue": -32768 as long ,
        "characterValue": '-',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128  as long ,
      }
      predicates.equalTo("characterValue", "中");
      await rdbStore.update(valueBucket, predicates);
      let predicatesUpdate = new relationalStore.RdbPredicates("AllDataType");
      predicatesUpdate.notLike("characterValue", "#");
      result = await rdbStore.query(predicatesUpdate);
      expect(2).assertEqual(result?.rowCount);
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long ,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long ,
        "shortValue": 1 as long ,
        "characterValue": '中',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long ,
      }
      result.close();
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");
      await rdbStore.update(valueBucketBefore, predicatesBefore);
      done();
      console.log(tag + "************* testNotLike0009 end *************");
    })

    /**
     * @tc.name   testNotLike0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0010
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0010 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      predicates.equalTo("characterValue", "中");
      await rdbStore.delete(predicates);
      let predicatesDelete = new relationalStore.RdbPredicates("AllDataType");
      predicatesDelete.notLike("characterValue", "#");
      result = await rdbStore.query(predicatesDelete);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long ,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long ,
        "shortValue": 1 as long ,
        "characterValue": '中',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long ,
      }
      await rdbStore.insert("AllDataType", valueBucketBefore);
      done();
      console.log(tag + "************* testNotLike0010 end *************");
    })

    /**
     * @tc.name   testNotLike0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotLike_0011
     * @tc.desc   1.Execute notLike ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotLike0011 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notLike("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      predicates.equalTo("characterValue", "#");
      await rdbStore.delete(predicates);
      let predicatesDelete = new relationalStore.RdbPredicates("AllDataType");
      predicatesDelete.notLike("characterValue", "#");
      result = await rdbStore.query(predicatesDelete);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long ,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long ,
        "shortValue": 1 as long ,
        "characterValue": '#',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long ,
      }
      await rdbStore.insert("AllDataType", valueBucketBefore);
      done();
      console.log(tag + "************* testNotLike0011 end *************");
    })

    /**
     * @tc.name   testNotContains0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0001
     * @tc.desc   1.Execute notContains ("stringValue", "ABC")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0001 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("stringValue", "ABC");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotContains0001 end *************");
    })

    /**
     * @tc.name   testNotContains0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0002
     * @tc.desc   1.Execute notContains ("stringValue", "ABCX")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0002 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("stringValue", "ABCX");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotContains0002 end *************");
    })

    /**
     * @tc.name   testNotContains0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0003
     * @tc.desc   1.Execute notContains ("characterValue", "中")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0003 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotContains0003 end *************");
    })

    /**
     * @tc.name   testNotContains0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0004
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0004 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      done();
      console.log(tag + "************* testNotContains0004 end *************");
    })

    /**
     * @tc.name   testNotContains0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0006
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0006 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result:relationalStore.ResultSet = await rdbStore.query(predicates);
      expect(2).assertEqual(result.rowCount);
      result.close()
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long,
        "shortValue": -32768 as long,
        "characterValue": '#',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long,
      }
      await rdbStore.insert("AllDataType", valueBucket)
      let predicatesInsert = new relationalStore.RdbPredicates("AllDataType");
      predicatesInsert.notContains("characterValue", "#");
      result = await rdbStore.query(predicatesInsert);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");
      await rdbStore.delete(predicatesBefore);
      done();
      console.log(tag + "************* testNotContains0006 end *************");
    })

    /**
     * @tc.name   testNotContains0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0007
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0007 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long,
        "shortValue": -32768 as long,
        "characterValue": '-',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long,
      }
      await rdbStore.insert("AllDataType", valueBucket)
      let predicatesInsert = new relationalStore.RdbPredicates("AllDataType");
      predicatesInsert.notContains("characterValue", "#");
      result = await rdbStore.query(predicatesInsert);
      expect(3).assertEqual(result?.rowCount);
      result.close();
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");
      await rdbStore.delete(predicatesBefore);
      done();
      console.log(tag + "************* testNotContains0007 end *************");
    })

    /**
     * @tc.name   testNotContains0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0008
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0008 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result =await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long,
        "shortValue": -32768 as long,
        "characterValue": '#',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long,
      }
      predicates.equalTo("characterValue", "中")
      await rdbStore.update(valueBucket, predicates)
      let predicatesUpdate = new relationalStore.RdbPredicates("AllDataType");
      predicatesUpdate.notContains("characterValue", "#");
      result = await rdbStore.query(predicatesUpdate);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long,
        "shortValue": 1 as long,
        "characterValue": '中',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long,
      }
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");
      await rdbStore.update(valueBucketBefore, predicatesBefore);
      done();
      console.log(tag + "************* testNotContains0008 end *************");
    })

    /**
     * @tc.name   testNotContains0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0009
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0009 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      let u8 = new Uint8Array([1, 2, 3])
      const valueBucket:relationalStore.ValuesBucket = {
        "integerValue": -2147483648 as long,
        "doubleValue": Number.MIN_VALUE,
        "booleanValue": false,
        "floatValue": 0.1234567,
        "longValue": -9223372036854775808 as long,
        "shortValue": -32768 as long,
        "characterValue": '-',
        "stringValue": "OPQRST",
        "blobValue": u8,
        "byteValue": -128 as long,
      }
      predicates.equalTo("characterValue", "中")
      await rdbStore.update(valueBucket, predicates)
      let predicatesUpdate = new relationalStore.RdbPredicates("AllDataType");
      predicatesUpdate.notContains("characterValue", "#");
      result = await rdbStore.query(predicatesUpdate);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long,
        "shortValue": 1 as long,
        "characterValue": '中',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long,
      }
      let predicatesBefore = new relationalStore.RdbPredicates("AllDataType");
      predicatesBefore.equalTo("stringValue", "OPQRST");
      await rdbStore.update(valueBucketBefore, predicatesBefore);
      done();
      console.log(tag + "************* testNotContains0009 end *************");
    })

    /**
     * @tc.name   testNotContains0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0010
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0010 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      predicates.equalTo("characterValue", "中")
      await rdbStore.delete(predicates)
      predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      result = await rdbStore.query(predicates);
      expect(1).assertEqual(result?.rowCount);
      result.close();
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long,
        "shortValue": 1 as long,
        "characterValue": '中',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long,
      }
      await rdbStore.insert("AllDataType", valueBucketBefore);
      done();
      console.log(tag + "************* testNotContains0010 end *************");
    })

    /**
     * @tc.name   testNotContains0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_NotContains_0011
     * @tc.desc   1.Execute notContains ("characterValue", "#")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      console.log(tag + "************* testNotContains0011 start *************");
      let predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close()
      predicates.equalTo("characterValue", "#")
      await rdbStore.delete(predicates)
      predicates = new relationalStore.RdbPredicates("AllDataType");
      predicates.notContains("characterValue", "#");
      result = await rdbStore.query(predicates);
      expect(2).assertEqual(result?.rowCount);
      result.close();
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucketBefore:relationalStore.ValuesBucket = {
        "integerValue": 1 as long,
        "doubleValue": 1.0,
        "booleanValue": false,
        "floatValue": 1.0,
        "longValue": 1 as long,
        "shortValue": 1 as long,
        "characterValue": '#',
        "stringValue": "ABCDEFGHIJKLMN",
        "blobValue": u8,
        "byteValue": 1 as long,
      }
      await rdbStore.insert("AllDataType", valueBucketBefore);
      done();
      console.log(tag + "************* testNotContains0011 end *************");
    })

    console.log(tag + "*************Unit Test End*************");

  })
}
