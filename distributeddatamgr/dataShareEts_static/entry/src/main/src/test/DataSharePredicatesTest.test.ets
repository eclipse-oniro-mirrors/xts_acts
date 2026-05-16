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
import { ValueType, ValuesBucket} from '@ohos.data.ValuesBucket';
import dataShare from '@ohos.data.dataShare';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';

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

let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context: common.UIAbilityContext;
let g_handle: dataShare.DataProxyHandle | undefined = undefined;
let dsProxyHelper: dataShare.DataShareHelper;
let uri = "datashareproxy://com.acts.ohos.data.datasharetest/test";

export default function dataSharePredicatesTest() {
  describe('dataSharePredicatesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll')
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.datashareetstest");
      await Utils.msSleep(5000);
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

    /**
     * @tc.name   testCreateDataProxyHandle0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0150
     * @tc.desc   testCreateDataProxyHandle0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCreateDataProxyHandle0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async () => {
      console.info(tag + "SUB_DataShare001_CreateDataProxyHandle-start");
      try {
        context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
        await Utils.msSleep(1000);
        dsProxyHelper = await dataShare.createDataShareHelper(context, uri, { isProxy: true });
        console.log(tag + "[DataShareClientTest] <<Consumer>> dsProxyHelper " + JSON.stringify(dsProxyHelper));
        expect(dsProxyHelper).assertInstanceOf("Object");
        expect().assertFail();
      } catch (err) {
        console.error(tag + 'testCreateDataProxyHandle0001 error' + err.code + "  " + err.message);
        expect(err.code).assertEqual(202);
      }
    })

    /**
     * @tc.name   testOffDataChange0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0160
     * @tc.desc   testOffDataChange0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOffDataChange0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async () => {
      console.info(tag + "testOffDataChange0001");
      try {
        context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
        await Utils.msSleep(1000);
        dsProxyHelper = await dataShare.createDataShareHelper(context, uri, { isProxy: true });
        dsProxyHelper!.offDataChange("");
        console.info("TestDataShare going off");
        expect().assertFail();
      } catch (err) {
        console.error(tag + 'testOffDataChange0001 error' + err.code + "  " + err.message);
        expect(err.code).assertEqual(202);
      }
    })

    /**
     * @tc.name   testEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0170
     * @tc.desc   testEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("","zhangSan");
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testEqualTo0001 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testNotEqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0180
     * @tc.desc   testNotEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo("", 18 as long);
        // predicates.equalTo(null,"zhangSan");
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testNotEqualTo0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testBeginWrap0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0190
     * @tc.desc   testBeginWrap0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBeginWrap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.beginWrap();
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testBeginWrap0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testEndWrap0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0200
     * @tc.desc   testEndWrap0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.endWrap();
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testEndWrap0001 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testOr0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0210
     * @tc.desc   testOr0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.or();
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testOr0001 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testAnd0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0220
     * @tc.desc   testAnd0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.and();
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testAnd0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testLike0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0230
     * @tc.desc   testLike0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like("","zhangSan");
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testLike0001 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testLike0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0240
     * @tc.desc   testLike0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like("name","");
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testLike0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testBetween0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0250
     * @tc.desc   testBetween0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBetween0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.between("", 2 as long,4 as long);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testBetween0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testNotBetween0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0260
     * @tc.desc   testNotBetween0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotBetween0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notBetween("", 2 as long,4 as long);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testNotBetween0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testGreaterThan0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0270
     * @tc.desc   testGreaterThan0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGreaterThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThan("", 18 as long);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testGreaterThan0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testLessThan0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0280
     * @tc.desc   testLessThan0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThan("", 18 as long);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testLessThan0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testGreaterThanOrEqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0290
     * @tc.desc   testGreaterThanOrEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGreaterThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo("", 18 as long);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testGreaterThanOrEqualTo0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testLessThanOrEqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0300
     * @tc.desc   testLessThanOrEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLessThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo("", 18 as long);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testLessThanOrEqualTo0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testOrderByAsc0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0310
     * @tc.desc   testOrderByAsc0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrderByAsc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.orderByAsc("");
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testOrderByAsc0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testOrderByDesc0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0320
     * @tc.desc   testOrderByDesc0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrderByDesc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.orderByDesc("");
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testOrderByDesc0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testInValues0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0330
     * @tc.desc   testInValues0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.inValues("",[]);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testInValues0001 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testNotInValues0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0340
     * @tc.desc   testNotInValues0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNotInValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notInValues("",[]);
        expect(predicates).assertInstanceOf("Object");
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testNotInValues0002 error " + e.code + "  " + e.message);
      }
    });

    /**
     * @tc.name   testChangeTypeValueTest0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0350
     * @tc.desc   testChangeTypeValueTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testChangeTypeValueTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try{
        let changeType0 = dataShare.ChangeType.INSERT;
        let changeType1 = dataShare.ChangeType.DELETE;
        let changeType2 = dataShare.ChangeType.UPDATE;
        expect(changeType0).assertEqual(0);
        expect(changeType1).assertEqual(1);
        expect(changeType2).assertEqual(2);
      }catch (e) {
        expect().assertFail()
        console.error(tag + "testChangeTypeValueTest0001 error " + e.code + "  " + e.message);
      }
    });

  })
}