/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@ohos.base';
import { ValueType, ValuesBucket} from '@ohos.data.ValuesBucket'

let domain: int = 0x0000;
let tag: string = 'testTag';

const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS test "
  + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "name TEXT NOT NULL  , age INTEGER , salary REAL , blobType BLOB ) ;";

let str: ValueType = "zhangSan";
let num: ValueType = 18 as long;
let bool: ValueType = true;
let vb: ValuesBucket = {
  "name": str,
  "age": num,
  "isStudent": bool
}

export default function dataSharePredicatesTest() {
  describe('dataSharePredicatesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll')
    })

    /**
     * @tc.name   testOrderByAsc0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0010
     * @tc.desc   predicates orderByAsc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrderByAsc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan");
        predicates.orderByAsc("id");
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name   testOrderByDesc0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0020
     * @tc.desc   predicates orderByDesc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrderByDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan");
        predicates.orderByDesc("id");
        hilog.info(domain, tag, "update predicates " + predicates)
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name   testAnd0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0030
     * @tc.desc   predicates and normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan");
        predicates.and();
        predicates.equalTo("age", 18 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name   testIn0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0040
     * @tc.desc   predicates in normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {

      try {
        let numbersArr = new Array<ValueType>(255.0, 11.6, 13.0);
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        // Replace static in with inValues interface.
        predicates.inValues("age", numbersArr);
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name   testLimit0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0050
     * @tc.desc   predicates limit normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLimit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan").limit(10, 3);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testGreaterThan0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0060
     * @tc.desc   predicates greaterThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThan("age", 18 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testGreaterThanOrEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0070
     * @tc.desc   predicates greaterThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGreaterThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo("age", 18 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testLessThanOrEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0080
     * @tc.desc   predicates lessThanOrEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLessThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo("age", 18 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testLessThan0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0090
     * @tc.desc   predicates lessThan normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThan("age", 18 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testNotEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0100
     * @tc.desc   predicates notEqualTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo("age", 18 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testNotBetween0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0110
     * @tc.desc   predicates notBetween normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notBetween("age", 18 as long, 24 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testBetween0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0120
     * @tc.desc   predicates between normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.between("age", 18 as long, 24 as long);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testNotInValues0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0130
     * @tc.desc   predicates notInValues normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotInValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notInValues("age", [2 as long, 4 as long]);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

    /**
     * @tc.name   testBeginWrap0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0140
     * @tc.desc   predicates beginWrap|endWrap|notEqualTo|or|like normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBeginWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo("age", 18 as long)
        .or()
        .beginWrap()
        .equalTo("age", 24 as long)
        .endWrap()
        .like("name","li%");
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e) {
        e = e as BusinessError
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })

  })
}