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


let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int  = 0x0000;
let tag: string = "rdbStorePredicatesParamErrTest";

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

let rdbStore : relationalStore.RdbStore | undefined;
let DOUBLE_MAX = 9223372036854775807.0;

export default function rdbStorePredicatesParamErrTest() {
  describe('rdbStorePredicatesParamErrTest', (): void => {
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
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, tag, "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL);
      await rdbStore!.executeSql("CREATE INDEX index_name ON AllDataType (characterValue);");
      hilog.info(domain, tag, 'beforeEach success');
    });

    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterEach');
      // rdbStore = null
      await rdbStore!.close();
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG)
      hilog.info(domain, tag, 'afterEach success');
    });

    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterAll');

      hilog.info(domain, tag, "*************Unit Test end*************");
    });


    console.info(tag + "*************Unit Test Begin*************");

    /**
     * @tc.name   testNotEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0010
     * @tc.desc   predicates notEqualTo with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotEqualTo0009 start *************");
        {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          try{
            predicates.notEqualTo("", -0.123);
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotEqualTo0001 err.code:" + err.code + " err.msg:" + err.message);
            expect(err.code !== null).assertTrue(); 
            done();
          }   
        }
     
        console.info(tag + "************* testNotEqualTo0001 end *************");
        
    })

    /**
     * @tc.name   testIsNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0020
     * @tc.desc   predicates isNull normal test with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testIsNull0001 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          predicates.isNull("");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
        } catch (err) {
             expect(err.code).assertEqual(14800000); 
          console.info(tag + "testIsNull0001 err.code:" + err.code + " err.msg:" + err.message);
          done();
        }
        
        console.info(tag + "************* testIsNull0001 end *************");
      })

    /**
     * @tc.name   testContains0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0030
     * @tc.desc   predicates contains with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testContains0001 start *************");
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        try {
          predicates.contains("", "DEF");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
        } catch (err) {
          expect(err.code).assertEqual(14800000); 
          console.info(tag + "testContains0001 err.code:" + err.code + " err.msg:" + err.message);
          done();
        }
        
        console.info(tag + "************* testContains0001 end *************");
    })
    /**
         * @tc.name   testBeginsWith0001
         * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0040
         * @tc.desc   predicates beginsWith normal test with ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it('testBeginsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testBeginsWith0001 start *************");
        try {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.beginsWith("", "#");
        let result = await rdbStore!.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
        done();
        } catch (err) {
         expect(err.code).assertEqual(14800000); 
        console.info(tag + "testBeginsWith0001 err.code:" + err.code + " err.msg:" + err.message);
        done();
        }
   
        console.info(tag + "************* testBeginsWith0001 end *************");
    })

    /**
     * @tc.name   testBeginsWith0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0050
     * @tc.desc   predicates beginsWith ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testBeginsWith0002 start *************");
        try {
        let predicates = new relationalStore.RdbPredicates("AllDataType");
        predicates.beginsWith("characterValue", "");
        let result = await rdbStore!.query(predicates);
        expect(0).assertEqual(result?.rowCount);
        result.close();
        done();
        } catch (err) {
         expect(err.code).assertEqual(14800000); 
        console.info(tag + "testBeginsWith0002 err.code:" + err.code + " err.msg:" + err.message);
        done();
        }
    console.info(tag + "************* testBeginsWith0002 end *************");
    })

    /**
     * @tc.name   testEndsWith0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0060
     * @tc.desc   predicates endsWith normal test with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEndsWith0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testEndsWith0001 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          predicates.endsWith("", "LMN");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
        } catch (err) {
            expect(err.code).assertEqual(14800000); 
          console.info(tag + "testEndsWith0001 err.code:" + err.code + " err.msg:" + err.message);
          done();
        }
        console.info(tag + "************* testEndsWith0001 end *************");
    })

    /**
     * @tc.name   testEndsWith0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0070
     * @tc.desc   predicates endsWith normal test with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEndsWith0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testEndsWith0002 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          predicates.endsWith("stringValue", "");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
        } catch (err) {
         expect(err.code).assertEqual(14800000); 
          console.info(tag + "testEndsWith0002 err.code:" + err.code + " err.msg:" + err.message);
          done();
        }
        console.info(tag + "************* testEndsWith0002 end *************");
    })
    
    /**
     * @tc.name   testLike0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0080
     * @tc.desc   predicates like normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testLike0001 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          predicates.like("", "%#%");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
  
        } catch (err) {
          console.info(tag + "testLike0001 err.code:" + err.code + " err.msg:" + err.message);
           expect(err.code).assertEqual(14800000); 
          done();
          
        }
        console.info(tag + "************* testLike0001 end *************");
    })

    /**
     * @tc.name   testLike0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0090
     * @tc.desc   predicates like normal test with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testLike0002 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          predicates.like("characterValue", "");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
  
        } catch (err) {
          console.info(tag + "testLike0002 err.code:" + err.code + " err.msg:" + err.message);
           expect(err.code).assertEqual(14800000); 
          done();
        }
        console.info(tag + "************* testLike0002 end *************");
 
    })

    /**
     * @tc.name   testGlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0100
     * @tc.desc   end with ? ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testGlob0001 start *************");
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.glob("", "ABC*");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();   
            done(); 
          } catch (err) {
            console.info(tag + "testGlob0001 err.code:" + err.code + " err.msg:" + err.message);
            expect(err.code).assertEqual(14800000); 
            done();
        }
        console.info(tag + "************* testGlob0001 end *************");
    })

    /**
     * @tc.name   testGlob0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0110
     * @tc.desc   end with ? ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGlob0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testGlob0002 start *************");
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.glob("stringValue", "");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();   
            done(); 
          } catch (err) {
            console.info(tag + "testGlob0002 err.code:" + err.code + " err.msg:" + err.message);
           expect(err.code).assertEqual(14800000); 
            done();
        }
        console.info(tag + "************* testGlob0002 end *************");      
    })

    /**
     * @tc.name   testBetween0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0120
     * @tc.desc   predicates between ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testBetween0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
             predicates.between("", "ABB", "ABD");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();   
            done(); 
          } catch (err) {
            console.info(tag + "testBetween0001 err.code:" + err.code + " err.msg:" + err.message);
             expect(err.code).assertEqual(14800000); 
            done();
        }
        console.info(tag + "************* testBetween0001 end *************");
    })

    /**
     * @tc.name   testNotBetween0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0130
     * @tc.desc   predicates notBetween  param with ""
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotBetween0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notBetween("", "ABC", "ABD");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close(); 
            done();   
          } catch (err) {
            console.info(tag + "testNotBetween0001 err.code:" + err.code + " err.msg:" + err.message);
             expect(err.code).assertEqual(14800000); 
            done();
        }
        console.info(tag + "************* testNotBetween0001 end *************");
    })

    /**
     * @tc.name   testGreaterThan0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0140
     * @tc.desc   predicates greaterThan param  with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testGreaterThan0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.greaterThan("", "ABC");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();  
            done();  
    
          } catch (err) {
            console.info(tag + "testGreaterThan0001 err.code:" + err.code + " err.msg:" + err.message);
             expect(err.code).assertEqual(14800000); 
            done();
        }
        console.info(tag + "************* testGreaterThan0001 end *************");
    })

    /**
     * @tc.name   testLessThan0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0150
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testLessThan0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.lessThan("", "ABC");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close(); 
            done();   
          } catch (err) {
            console.info(tag + "testLessThan0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testLessThan0001 end *************");
    })

    /**
     * @tc.name   testGreaterThanOrEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0160
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGreaterThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testGreaterThanOrEqualTo0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.greaterThanOrEqualTo("", "ABC");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();   
            done(); 
          } catch (err) {
            console.info(tag + "testGreaterThanOrEqualTo0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testGreaterThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name   testLessThanOrEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0170
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLessThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testLessThanOrEqualTo0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.lessThanOrEqualTo("", "ABC");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();   
            done(); 
          } catch (err) {
            console.info(tag + "testLessThanOrEqualTo0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testLessThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name   testGroupBy0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0200
     * @tc.desc   predicates groupBy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGroupBy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testGroupBy0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.groupBy([]);
            expect(predicates !== null).assertTrue();   
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close(); 
            done();
          } catch (err) {
            console.info(tag + "testGroupBy0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testGroupBy0001 end *************");
    })

    /**
     * @tc.name   testInValues0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0210
     * @tc.desc   predicates in normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testInValues0001 start *************");   
        try {
            let values: Array<relationalStore.ValueType> = [Number.MIN_VALUE];
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            let pr = predicates.inValues("", values);
            expect(typeof(pr) === "object").assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testInValues0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testInValues0001 end *************");
    })

    /**
     * @tc.name   testNotInValues0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0220
     * @tc.desc   the notInValues with "".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotInValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotInValues0001 start *************");   
        try {
            let values: Array<relationalStore.ValueType> = [Number.MIN_VALUE];
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notInValues("", values);
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotInValues0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testNotInValues0001 end *************");
    })

    /**
     * @tc.name   testNotInValues0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0230
     * @tc.desc   the notInValues with [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotInValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotInValues0002 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notInValues("integerValue", []);
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotInValues0002 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testNotInValues0002 end *************");
    })

    /**
     * @tc.name   testNotContains0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0240
     * @tc.desc   1.Execute notContains with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotContains0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notContains("stringValue", "");
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotContains0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testNotContains0001 end *************");
    })

    /**
     * @tc.name   testNotLike0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0250
     * @tc.desc   1.Execute notLike with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotLike0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notLike("", "ABCDEFGHIJKLMN");
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotLike0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testNotLike0001 end *************");
    })

    /**
     * @tc.name   testNotLike0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0260
     * @tc.desc   1.Execute notLike with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotLike0002 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notLike("stringValue", "");
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotLike0002 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testNotLike0002 end *************");
    })

    /**
     * @tc.name   testNotContains0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0270
     * @tc.desc   1.Execute notContains with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNotContains0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testNotContains0002 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.notContains("", "ABC");
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();
          } catch (err) {
            console.info(tag + "testNotContains0002 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done(); 
        }
        console.info(tag + "************* testNotContains0002 end *************");
    })

     /**
     * @tc.name   testOrder0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0180
     * @tc.desc   predicates order param ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('testOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testOrder0001 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.orderByAsc("");
            expect(predicates !== null).assertTrue();
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();   
            done(); 
          } catch (err) {
            console.info(tag + "testOrder0001 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testOrder0001 end *************");
    })

    /**
     * @tc.name   testOrder0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_0190
     * @tc.desc   predicates order param ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOrder0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testOrder0002 start *************");   
        try {
            let predicates = new relationalStore.RdbPredicates("AllDataType");
            predicates.orderByDesc("");
            expect(predicates !== null).assertTrue();  
            let result = await rdbStore!.query(predicates);
            expect(0).assertEqual(result?.rowCount);
            result.close();
            done();  
          } catch (err) {
            console.info(tag + "testOrder0002 err.code:" + err.code + " err.msg:" + err.message);
            expect().assertFalse();
            done();
        }
        console.info(tag + "************* testOrder0002 end *************");
    })

    /**
     * @tc.name   testIsNotNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesParamErrTest_2000
     * @tc.desc   predicates isNull normal test with ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsNotNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(tag + "************* testIsNotNull0001 start *************");
        try {
          let predicates = new relationalStore.RdbPredicates("AllDataType");
          predicates.isNotNull("");
          let result = await rdbStore!.query(predicates);
          expect(0).assertEqual(result?.rowCount);
          result.close();
          done();
        } catch (err) {
             expect(err.code).assertEqual(14800000); 
          console.info(tag + "testIsNotNull0001 err.code:" + err.code + " err.msg:" + err.message);
          done();
        }
        
        console.info(tag + "************* testIsNull0001 end *************");
      })


    console.log(tag + "*************Unit Test End*************");

  })
}
