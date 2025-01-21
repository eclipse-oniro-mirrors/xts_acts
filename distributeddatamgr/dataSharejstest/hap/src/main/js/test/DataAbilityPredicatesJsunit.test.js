/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import dataRdb from '@ohos.data.rdb';
import dataAbility from '@ohos.data.dataAbility';

const TAG = '[RDB_JSKITS _TEST]'
const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS AllDataType "
    + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "integerValue INTEGER , longValue INTEGER , shortValue INTEGER , booleanValue INTEGER , "
    + "doubleValue REAL , floatValue REAL , stringValue TEXT , blobValue BLOB , clobValue TEXT , "
    + "byteValue INTEGER , dateValue INTEGER , timeValue INTEGER , timestampValue INTEGER , "
    + "calendarValue INTEGER , characterValue TEXT , primIntValue INTEGER , primLongValue INTEGER , "
    + "primShortValue INTEGER , primFloatValue REAL , primDoubleValue REAL , "
    + "primBooleanValue INTEGER , primByteValue INTEGER , primCharValue TEXT, `order` INTEGER);";

const STORE_CONFIG = {
    name: "Predicates.db",
}
var rdbStore = undefined;
var DOUBLE_MAX = 9223372036854775807;

export default function dataAbilityPredicatesTest() {
describe('dataAbilityPredicatesTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
        rdbStore = await dataRdb.getRdbStore(STORE_CONFIG, 1);
        await rdbStore.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL, null);
        await buildAllDataType1();
        await buildAllDataType2();
        await buildAllDataType3();
    })

    beforeEach(function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(function () {
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
        rdbStore = null
        await dataRdb.deleteRdbStore("Predicates.db");
    })

    function resultSize(resultSet) {
        if (!resultSet.goToFirstRow()) {
            return 0;
        }
        let count = 1;
        while (resultSet.goToNextRow()) {
            count++;
        }
        return count;
    }

    async function buildAllDataType1() {
        console.info(TAG + "buildAllDataType1 start");
        {
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket = {
                "integerValue": 2147483647,
                "doubleValue": DOUBLE_MAX,
                "booleanValue": true,
                "floatValue": -0.123,
                "longValue": 9223372036854775807,
                "shortValue": 32767,
                "characterValue": ' ',
                "stringValue": "ABCDEFGHIJKLMN",
                "blobValue": u8,
                "byteValue": 127,
            }
            await rdbStore.insert("AllDataType", valueBucket)
        }
    }

    async function buildAllDataType2() {
        console.info(TAG + "buildAllDataType2 start");
        {
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket = {
                "integerValue": 1,
                "doubleValue": 1.0,
                "booleanValue": false,
                "floatValue": 1.0,
                "longValue": 1,
                "shortValue": 1,
                "characterValue": '中',
                "stringValue": "ABCDEFGHIJKLMN",
                "blobValue": u8,
                "byteValue": 1,
            }
            await rdbStore.insert("AllDataType", valueBucket)
        }
    }

    async function buildAllDataType3() {
        console.info(TAG + "buildAllDataType3 start");
        {
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket = {
                "integerValue": -2147483648,
                "doubleValue": Number.MIN_VALUE,
                "booleanValue": false,
                "floatValue": 0.1234567,
                "longValue": -9223372036854775808,
                "shortValue": -32768,
                "characterValue": '#',
                "stringValue": "ABCDEFGHIJKLMN",
                "blobValue": u8,
                "byteValue": -128,
            }
            await rdbStore.insert("AllDataType", valueBucket)
        }
    }

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3100
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0001', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("booleanValue", true);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testEqualTo0001 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3000
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0002', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("byteValue", -128).or().equalTo("byteValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testEqualTo0002 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3700
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0003', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testEqualTo0003 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3200
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0004', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("doubleValue", DOUBLE_MAX);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testEqualTo0004 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3600
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0005', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("shortValue", -32768.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testEqualTo0005 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3400
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0006', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0006 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(true).assertEqual(result.goToFirstRow());
            expect(2).assertEqual(result.getLong(0));
        }
        done();
        console.info(TAG + "************* testEqualTo0006 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3500
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0007', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0007 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("longValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(true).assertEqual(result.goToFirstRow());
            expect(2).assertEqual(result.getLong(0))
        }
        done();
        console.info(TAG + "************* testEqualTo0007 end   *************");
    })

    /**
     * @tc.name predicates equalTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3300
     * @tc.desc predicates equalTo normal test
     */
    it('testEqualTo0008', 0, async function (done) {
        console.info(TAG + "************* testEqualTo0008 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("floatValue", -0.123);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(true).assertEqual(result.goToFirstRow());
            expect(1).assertEqual(result.getLong(0))
            result = null
        }
        done();
        console.info(TAG + "************* testEqualTo0008 end   *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9900
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0001', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("booleanValue", true);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0001 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9800
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0002', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("byteValue", -128);
            dataAbilityPredicates.notEqualTo("byteValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0002 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0160
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0003', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("stringValue", "ABCDEFGHIJKLMN");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0003 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0110
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0004', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("doubleValue", DOUBLE_MAX);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0004 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0150
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0005', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("shortValue", -32768);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0005 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0130
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0006', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0006 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0006 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0140
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0007', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0007 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("longValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0007 end *************");
    })

    /**
     * @tc.name predicates notEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0120
     * @tc.desc predicates notEqualTo normal test
     */
    it('testNotEqualTo0008', 0, async function (done) {
        console.info(TAG + "************* testNotEqualTo0008 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notEqualTo("floatValue", -0.123);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testNotEqualTo0008 end *************");
    })

    /**
     * @tc.name resultSet isNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6900
     * @tc.desc resultSet isNull normal test
     */
    it('testIsNull0001', 0, async function (done) {
        console.info(TAG + "************* testIsNull001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNull("primLongValue");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNull0001 end *************");
    })

    /**
     * @tc.name predicates isNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6800
     * @tc.desc predicates isNull normal test
     */
    it('testIsNull0002', 0, async function (done) {
        console.info(TAG + "************* testIsNull0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNull("longValue");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNull0002 end *************");
    })

    /**
     * @tc.name predicates isNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7100
     * @tc.desc predicates isNull normal test
     */
    it('testIsNull0003', 0, async function (done) {
        console.info(TAG + "************* testIsNull0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNull("stringValue");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNull0003 end *************");
    })

    /**
     * @tc.name predicates isNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7000
     * @tc.desc predicates isNull normal test
     */
    it('testIsNull0004', 0, async function (done) {
        console.info(TAG + "************* testIsNull0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNull("stringValueX");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNull0004 end *************");
    })

    /**
     * @tc.name predicates isNotNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6500
     * @tc.desc predicates isNotNull normal test
     */
    it('testIsNotNull0001', 0, async function (done) {
        console.info(TAG + "************* testIsNotNull0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNotNull("primLongValue");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNotNull0001 end *************");
    })

    /**
     * @tc.name predicates isNotNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6400
     * @tc.desc predicates isNotNull normal test
     */
    it('testIsNotNull0002', 0, async function (done) {
        console.info(TAG + "************* testIsNotNull0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNotNull("longValue");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNotNull0002 end *************");
    })

    /**
     * @tc.name predicates isNotNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6700
     * @tc.desc predicates isNotNull normal test
     */
    it('testIsNotNull0003', 0, async function (done) {
        console.info(TAG + "************* testIsNotNull0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNotNull("stringValue");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNotNull0003 end *************");
    })

    /**
     * @tc.name predicates isNotNull normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6600
     * @tc.desc predicates isNotNull normal test
     */
    it('testIsNotNull0004', 0, async function (done) {
        console.info(TAG + "************* testIsNotNull0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.isNotNull("stringValueX");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIsNotNull0004 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5400
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0001', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("stringValue", "ABC");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0001 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4800
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0002', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("doubleValue", 0.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0002 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5000
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0003', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0003 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5200
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0004', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("longValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0004 end *************");
    })


    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5500
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0005', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("stringValue", "ZZZ");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0005 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4900
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0006', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0006 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("doubleValue", 999.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0006 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5100
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0007', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0007 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("integerValue", -999);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0007 end *************");
    })

    /**
     * @tc.name predicates greaterThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5300
     * @tc.desc predicates greaterThan normal test
     */
    it('testGreaterThan0008', 0, async function (done) {
        console.info(TAG + "************* testGreaterThan0008 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThan("longValue", -999);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThan0008 end *************");
    })

    /**
     * @tc.name predicates greaterThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4700
     * @tc.desc predicates greaterThanOrEqualTo normal test
     */
    it('testGreaterThanOrEqualTo0001', 0, async function (done) {
        console.info(TAG + "************* testGreaterThanOrEqualTo0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThanOrEqualTo("stringValue", "ABC");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name predicates greaterThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4400
     * @tc.desc predicates greaterThanOrEqualTo normal test
     */
    it('testGreaterThanOrEqualTo0002', 0, async function (done) {
        console.info(TAG + "************* testGreaterThanOrEqualTo0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThanOrEqualTo("doubleValue", 0.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThanOrEqualTo0002 end *************");
    })

    /**
     * @tc.name predicates greaterThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4500
     * @tc.desc predicates greaterThanOrEqualTo normal test
     */
    it('testGreaterThanOrEqualTo0003', 0, async function (done) {
        console.info(TAG + "************* testGreaterThanOrEqualTo0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThanOrEqualTo("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThanOrEqualTo0003 end *************");
    })

    /**
     * @tc.name predicates greaterThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4600
     * @tc.desc predicates greaterThanOrEqualTo normal test
     */
    it('testGreaterThanOrEqualTo0004', 0, async function (done) {
        console.info(TAG + "************* testGreaterThanOrEqualTo0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.greaterThanOrEqualTo("longValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testGreaterThanOrEqualTo0004 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8200
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0001', 0, async function (done) {
        console.info(TAG + "************* testLessThan0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("stringValue", "ABD");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0001 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7600
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0002', 0, async function (done) {
        console.info(TAG + "************* testLessThan0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("doubleValue", 0.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0002 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7800
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0003', 0, async function (done) {
        console.info(TAG + "************* testLessThan0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0003 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8000
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0004', 0, async function (done) {
        console.info(TAG + "************* testLessThan0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("longValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0004 end *************");
    })


    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8300
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0005', 0, async function (done) {
        console.info(TAG + "************* testLessThan0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("stringValue", "ABD");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0005 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7700
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0006', 0, async function (done) {
        console.info(TAG + "************* testLessThan0006 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("doubleValue", 1.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0006 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7900
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0007', 0, async function (done) {
        console.info(TAG + "************* testLessThan0007 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("integerValue", -2147483648);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0007 end *************");
    })

    /**
     * @tc.name predicates lessThan normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8100
     * @tc.desc predicates lessThan normal test
     */
    it('testLessThan0008', 0, async function (done) {
        console.info(TAG + "************* testLessThan0008 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThan("longValue", -9223372036854775808);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThan0008 end *************");
    })


    /**
     * @tc.name predicates lessThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7500
     * @tc.desc predicates lessThanOrEqualTo normal test
     */
    it('testLessThanOrEqualTo0001', 0, async function (done) {
        console.info(TAG + "************* testLessThanOrEqualTo0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThanOrEqualTo("stringValue", "ABD");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name predicates lessThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7200
     * @tc.desc predicates lessThanOrEqualTo normal test
     */
    it('testLessThanOrEqualTo0002', 0, async function (done) {
        console.info(TAG + "************* testLessThanOrEqualTo0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThanOrEqualTo("doubleValue", 0.0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThanOrEqualTo0002 end *************");
    })

    /**
     * @tc.name predicates lessThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7300
     * @tc.desc predicates lessThanOrEqualTo normal test
     */
    it('testLessThanOrEqualTo0003', 0, async function (done) {
        console.info(TAG + "************* testLessThanOrEqualTo0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThanOrEqualTo("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThanOrEqualTo0003 end *************");
    })

    /**
     * @tc.name predicates lessThanOrEqualTo normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_7400
     * @tc.desc predicates lessThanOrEqualTo normal test
     */
    it('testLessThanOrEqualTo0004', 0, async function (done) {
        console.info(TAG + "************* testLessThanOrEqualTo0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.lessThanOrEqualTo("longValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testLessThanOrEqualTo0004 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1800
     * @tc.desc predicates between normal test
     */
    it('testBetween0001', 0, async function (done) {
        console.info(TAG + "************* testBetween0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("stringValue", "ABB", "ABD");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0001 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1200
     * @tc.desc predicates between normal test
     */
    it('testBetween0002', 0, async function (done) {
        console.info(TAG + "************* testBetween0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("doubleValue", 0.0, DOUBLE_MAX);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0002 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1400
     * @tc.desc predicates between normal test
     */
    it('testBetween0003', 0, async function (done) {
        console.info(TAG + "************* testBetween0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("integerValue", 0, 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0003 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1600
     * @tc.desc predicates between normal test
     */
    it('testBetween0004', 0, async function (done) {
        console.info(TAG + "************* testBetween0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("longValue", 0, 2);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0004 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1900
     * @tc.desc predicates between normal test
     */
    it('testBetween0005', 0, async function (done) {
        console.info(TAG + "************* testBetween0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("stringValue", "ABB", "ABB");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0005 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1300
     * @tc.desc predicates between normal test
     */
    it('testBetween0006', 0, async function (done) {
        console.info(TAG + "************* testBetween0006 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("doubleValue", DOUBLE_MAX, DOUBLE_MAX);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0006 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1500
     * @tc.desc predicates between normal test
     */
    it('testBetween0007', 0, async function (done) {
        console.info(TAG + "************* testBetween0007 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("integerValue", 1, 0);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0007 end *************");
    })

    /**
     * @tc.name predicates between normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1700
     * @tc.desc predicates between normal test
     */
    it('testBetween0008', 0, async function (done) {
        console.info(TAG + "************* testBetween0008 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.between("longValue", 2, -1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBetween0008 end *************");
    })

    /**
     * @tc.name testNotBetween0001
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9700
     * @tc.desc test string value with notBetween.
     */
    it('testNotBetween0001', 0, async function (done) {
        console.info(TAG + "************* testNotBetween0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notBetween("stringValue", "ABB", "ABD");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testNotBetween0001 end *************");
    })

    /**
     * @tc.name testNotBetween0002
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9400
     * @tc.desc test double value with notBetween.
     */
    it('testNotBetween0002', 0, async function (done) {
        console.info(TAG + "************* testNotBetween0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notBetween("doubleValue", 0.0, DOUBLE_MAX);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(0).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testNotBetween0002 end *************");
    })

    /**
     * @tc.name testNotBetween0003
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9500
     * @tc.desc test integer value with notBetween.
     */
    it('testNotBetween0003', 0, async function (done) {
        console.info(TAG + "************* testNotBetween0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notBetween("integerValue", 0, 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testNotBetween0003 end *************");
    })

    /**
     * @tc.name testNotBetween0004
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9600
     * @tc.desc test long value with notBetween.
     */
    it('testNotBetween0004', 0, async function (done) {
        console.info(TAG + "************* testNotBetween0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.notBetween("longValue", 0, 2);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testNotBetween0004 end *************");
    })

    /**
     * @tc.name testGlob0001
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4000
     * @tc.desc end with ? by glob.
     */
    it('testGlob0001', 0, async function (done) {
        console.info(TAG + "************* testGlob0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.glob("stringValue", "ABC*");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testGlob0001 end *************");
    })

    /**
     * @tc.name testGlob0002
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3900
     * @tc.desc begin with * by glob.
     */
    it('testGlob0002', 0, async function (done) {
        console.info(TAG + "************* testGlob0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.glob("stringValue", "*LMN");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testGlob0002 end *************");
    })

    /**
     * @tc.name testGlob0003
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4200
     * @tc.desc end with ? by glob.
     */
    it('testGlob0003', 0, async function (done) {
        console.info(TAG + "************* testGlob0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.glob("stringValue", "ABCDEFGHIJKLM?");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testGlob0003 end *************");
    })

    /**
     * @tc.name testGlob0004
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4300
     * @tc.desc begin with ? by glob.
     */
    it('testGlob0004', 0, async function (done) {
        console.info(TAG + "************* testGlob0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.glob("stringValue", "?BCDEFGHIJKLMN");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testGlob0004 end *************");
    })

    /**
     * @tc.name testGlob0005
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_3800
     * @tc.desc begin and end with * by glob.
     */
    it('testGlob0005', 0, async function (done) {
        console.info(TAG + "************* testGlob0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.glob("stringValue", "*FGHI*");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testGlob0005 end *************");
    })

    /**
     * @tc.name testGlob0006
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_4100
     * @tc.desc begin and end with ? by glob.
     */
    it('testGlob0006', 0, async function (done) {
        console.info(TAG + "************* testGlob0006 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.glob("stringValue", "?BCDEFGHIJKLM?");
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            result.close();
            result = null
        }
        done();
        console.info(TAG + "************* testGlob0006 end *************");
    })

    /**
     * @tc.name predicates contains normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2300
     * @tc.desc predicates contains normal test
     */
    it('testContains0001', 0, async function (done) {
        console.info(TAG + "************* testContains0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.contains("stringValue", "DEF");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testContains0001 end *************");
    })

    /**
     * @tc.name predicates contains normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2400
     * @tc.desc predicates contains normal test
     */
    it('testContains0002', 0, async function (done) {
        console.info(TAG + "************* testContains0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.contains("stringValue", "DEFX");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testContains0002 end *************");
    })

    /**
     * @tc.name predicates contains normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2500
     * @tc.desc predicates contains normal test
     */
    it('testContains0003', 0, async function (done) {
        console.info(TAG + "************* testContains0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.contains("characterValue", "中");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testContains0003 end *************");
    })

    /**
     * @tc.name predicates contains normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2200
     * @tc.desc predicates contains normal test
     */
    it('testContains0004', 0, async function (done) {
        console.info(TAG + "************* testContains0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.contains("characterValue", "#");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testContains0004 end *************");
    })

    /**
     * @tc.name predicates beginsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0400
     * @tc.desc predicates beginsWith normal test
     */
    it('testBeginsWith0001', 0, async function (done) {
        console.info(TAG + "************* testBeginsWith0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.beginsWith("stringValue", "ABC");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testBeginsWith0001 end *************");
    })

    /**
     * @tc.name predicates beginsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0500
     * @tc.desc predicates beginsWith normal test
     */
    it('testBeginsWith0002', 0, async function (done) {
        console.info(TAG + "************* testBeginsWith0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.beginsWith("stringValue", "ABCX");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testBeginsWith0002 end *************");
    })

    /**
     * @tc.name predicates beginsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0600
     * @tc.desc predicates beginsWith normal test
     */
    it('testBeginsWith0003', 0, async function (done) {
        console.info(TAG + "************* testBeginsWith0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.beginsWith("characterValue", "中");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testBeginsWith0003 end *************");
    })

    /**
     * @tc.name predicates beginsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0300
     * @tc.desc predicates beginsWith normal test
     */
    it('testBeginsWith0004', 0, async function (done) {
        console.info(TAG + "************* testBeginsWith0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.beginsWith("characterValue", "#");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testBeginsWith0004 end *************");
    })

    /**
     * @tc.name predicates endsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2700
     * @tc.desc predicates endsWith normal test
     */
    it('testEndsWith0001', 0, async function (done) {
        console.info(TAG + "************* testEndsWith0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.endsWith("stringValue", "LMN");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testEndsWith0001 end *************");
    })

    /**
     * @tc.name predicates endsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2800
     * @tc.desc predicates endsWith normal test
     */
    it('testEndsWith0002', 0, async function (done) {
        console.info(TAG + "************* testEndsWith0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.endsWith("stringValue", "LMNX");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testEndsWith0002 end *************");
    })

    /**
     * @tc.name predicates endsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2900
     * @tc.desc predicates endsWith normal test
     */
    it('testEndsWith0003', 0, async function (done) {
        console.info(TAG + "************* testEndsWith0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.endsWith("characterValue", "中");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testEndsWith0003 end *************");
    })

    /**
     * @tc.name predicates endsWith normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2600
     * @tc.desc predicates endsWith normal test
     */
    it('testEndsWith0004', 0, async function (done) {
        console.info(TAG + "************* testEndsWith0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.endsWith("characterValue", "#");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testEndsWith0004 end *************");
    })

    /**
     * @tc.name predicates like normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8500
     * @tc.desc predicates like normal test
     */
    it('testLike0001', 0, async function (done) {
        console.info(TAG + "************* testLike0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "%LMN%");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLike0001 end *************");
    })

    /**
     * @tc.name predicates like normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8600
     * @tc.desc predicates like normal test
     */
    it('testLike0002', 0, async function (done) {
        console.info(TAG + "************* testLike0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "%LMNX%");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLike0002 end *************");
    })

    /**
     * @tc.name predicates like normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8700
     * @tc.desc predicates like normal test
     */
    it('testLike0003', 0, async function (done) {
        console.info(TAG + "************* testLike0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("characterValue", "%中%");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLike0003 end *************");
    })

    /**
     * @tc.name predicates like normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8400
     * @tc.desc predicates like normal test
     */
    it('testLike0004', 0, async function (done) {
        console.info(TAG + "************* testLike0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("characterValue", "%#%");
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLike0004 end *************");
    })

    /**
     * @tc.name predicates beginWrap normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1000
     * @tc.desc predicates beginWrap normal test
     */
    it('testBeginWrap0001', 0, async function (done) {
        console.info(TAG + "************* testBeginWrap0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .beginWrap()
                .equalTo("integerValue", 1)
                .or()
                .equalTo("integerValue", 2147483647)
                .endWrap();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBeginWrap0001 end *************");
    })

    /**
     * @tc.name predicates beginWrap normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0900
     * @tc.desc predicates beginWrap normal test
     */
    it('testBeginWrap0002', 0, async function (done) {
        console.info(TAG + "************* testBeginWrap0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .beginWrap()
                .equalTo("characterValue", ' ')
                .endWrap();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBeginWrap0002 end *************");
    })

    /**
     * @tc.name predicates beginWrap normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0700
     * @tc.desc predicates beginWrap normal test
     */
    it('testBeginWrap0003', 0, async function (done) {
        console.info(TAG + "************* testBeginWrap0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .beginWrap()
                .equalTo("characterValue", '中')
                .endWrap();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBeginWrap0003 end *************");
    })

    /**
     * @tc.name predicates beginWrap normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_1100
     * @tc.desc predicates beginWrap normal test
     */
    it('testBeginWrap0004', 0, async function (done) {
        console.info(TAG + "************* testBeginWrap0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .equalTo("characterValue", '中')
                .endWrap();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(-1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBeginWrap0004 end *************");
    })

    /**
     * @tc.name predicates beginWrap normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0800
     * @tc.desc predicates beginWrap normal test
     */
    it('testBeginWrap0005', 0, async function (done) {
        console.info(TAG + "************* testBeginWrap0005 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .beginWrap()
                .equalTo("characterValue", '中');
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(-1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testBeginWrap0005 end *************");
    })

    /**
     * @tc.name predicates and normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0100
     * @tc.desc predicates and normal test
     */
    it('testAnd0001', 0, async function (done) {
        console.info(TAG + "************* testAnd0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .and()
                .equalTo("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testAnd0001 end *************");
    })

    /**
     * @tc.name predicates or normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0290
     * @tc.desc predicates or normal test
     */
    it('testAnd0002', 0, async function (done) {
        console.info(TAG + "************* testAnd0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
                .beginWrap()
                .equalTo("integerValue", 1)
                .or()
                .equalTo("integerValue", 2147483647)
                .endWrap();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(2).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testAnd0002 end *************");
    })

    /**
     * @tc.name predicates and normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0200
     * @tc.desc predicates and normal test
     */
    it('testAnd0003', 0, async function (done) {
        console.info(TAG + "************* testAnd0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            var dataAbilityPredicatesInit = dataAbilityPredicates
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").or().and().equalTo("integerValue", 1);
            expect(dataAbilityPredicates == dataAbilityPredicatesInit).assertTrue();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            console.info(TAG + "you should not start a request" + " with \"and\" or use or() before this function");
        }
        done();
        console.info(TAG + "************* testAnd0003 end *************");
    })

    /**
     * @tc.name predicates and normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0310
     * @tc.desc predicates and normal test
     */
    it('testAnd0004', 0, async function (done) {
        console.info(TAG + "************* testAnd0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            var dataAbilityPredicatesInit = dataAbilityPredicates
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").or().or().equalTo("integerValue", 1);
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
            expect(dataAbilityPredicates == dataAbilityPredicatesInit).assertTrue();
            console.info(TAG + "you are starting a sql request with predicate or or,"
                + "using function or() immediately after another or(). that is ridiculous.");
        }
        done();
        console.info(TAG + "************* testAnd0004 end *************");
    })

    /**
     * @tc.name predicates order normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0250
     * @tc.desc predicates order normal test
     */
    it('testOrder0001', 0, async function (done) {
        console.info(TAG + "************* testOrder0001 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValue").distinct();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            expect(true).assertEqual(result.goToFirstRow())
            expect(3).assertEqual(result.getLong(0));
            expect(true).assertEqual(result.goToNextRow())
            expect(2).assertEqual(result.getLong(0));
            expect(true).assertEqual(result.goToNextRow())
            expect(1).assertEqual(result.getLong(0));
            result = null
        }
        done();
        console.info(TAG + "************* testOrder0001 end *************");
    })

    /**
     * @tc.name predicates order normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0270
     * @tc.desc predicates order normal test
     */
    it('testOrder0002', 0, async function (done) {
        console.info(TAG + "************* testOrder0002 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValue").distinct();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(3).assertEqual(result.rowCount);
            expect(true).assertEqual(result.goToFirstRow())
            expect(1).assertEqual(result.getLong(0));
            expect(true).assertEqual(result.goToNextRow())
            expect(2).assertEqual(result.getLong(0));
            expect(true).assertEqual(result.goToNextRow())
            expect(3).assertEqual(result.getLong(0));
            result = null
        }
        done();
        console.info(TAG + "************* testOrder0002 end *************");
    })

    /**
     * @tc.name predicates order normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0280
     * @tc.desc predicates order normal test
     */
    it('testOrder0003', 0, async function (done) {
        console.info(TAG + "************* testOrder0003 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValueX").distinct();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(-1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testOrder0003 end *************");
    })

    /**
     * @tc.name predicates order normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0260
     * @tc.desc predicates order normal test
     */
    it('testOrder0004', 0, async function (done) {
        console.info(TAG + "************* testOrder0004 start *************");
        {
            let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
            dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValueX").distinct();
            let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

            let result = await rdbStore.query(predicates);
            expect(-1).assertEqual(result.rowCount);
            result = null
        }
        done();
        console.info(TAG + "************* testOrder0004 end *************");
    })

    /**
     * @tc.name predicates limit normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9200
     * @tc.desc predicates limit normal test
     */
    it('testLimit0001', 0, async function (done) {
        console.info(TAG + "************* testLimit0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(1);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLimit0001 end *************");
    })

    /**
     * @tc.name predicates limit normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9300
     * @tc.desc predicates limit normal test
     */
    it('testLimit0002', 0, async function (done) {
        console.info(TAG + "************* testLimit0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLimit0002 end *************");
    })

    /**
     * @tc.name predicates limit normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9100
     * @tc.desc predicates limit normal test
     */
    it('testLimit0003', 0, async function (done) {
        console.info(TAG + "************* testLimit0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(100);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLimit0003 end *************");
    })

    /**
     * @tc.name predicates limit normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8800
     * @tc.desc predicates limit normal test
     */
    it('testLimit0004', 0, async function (done) {
        console.info(TAG + "************* testLimit0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "中").limitAs(1);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLimit0004 end *************");
    })

    /**
     * @tc.name predicates limit normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_9000
     * @tc.desc predicates limit normal test
     */
    it('testLimit0005', 0, async function (done) {
        console.info(TAG + "************* testLimit0005 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(0);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLimit0005 end *************");
    })

    /**
     * @tc.name predicates limit normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_8900
     * @tc.desc predicates limit normal test
     */
    it('testLimit0006', 0, async function (done) {
        console.info(TAG + "************* testLimit0006 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(-1);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testLimit0006 end *************");
    })

    /**
     * @tc.name predicates offset normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0230
     * @tc.desc predicates offset normal test
     */
    it('testOffset0001', 0, async function (done) {
        console.info(TAG + "************* testOffset0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(1);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testOffset0001 end *************");
    })

    /**
     * @tc.name predicates offset normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0220
     * @tc.desc predicates offset normal test
     */
    it('testOffset0002', 0, async function (done) {
        console.info(TAG + "************* testOffset0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(0);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testOffset0002 end *************");
    })

    /**
     * @tc.name predicates offset normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0240
     * @tc.desc predicates offset normal test
     */
    it('testOffset0003', 0, async function (done) {
        console.info(TAG + "************* testOffset0003 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(5);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testOffset0003 end *************");
    })

    /**
     * @tc.name predicates offset normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0210
     * @tc.desc predicates offset normal test
     */
    it('testOffset0004', 0, async function (done) {
        console.info(TAG + "************* testOffset0004 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(-1);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testOffset0004 end *************");
    })

    /**
     * @tc.name predicates constructor test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2000
     * @tc.desc predicates constructor test
     */
    it('testCreate0001', 0, async function (done) {
        console.info(TAG + "************* testCreate0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        done();
        console.info(TAG + "************* testCreate0001 end *************");
    })

    /**
     * @tc.name predicates constructor test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_2100
     * @tc.desc predicates constructor test
     */
    it('testCreate0002', 0, async function (done) {
        console.info(TAG + "************* testCreate0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        let predicates = dataAbility.createRdbPredicates("test", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        done();
        console.info(TAG + "************* testCreate0002 end *************");
    })


    /**
     * @tc.name predicates groupBy test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5600
     * @tc.desc predicates groupBy test
     */
    it('testGroupBy0001', 0, async function (done) {
        console.info(TAG + "************* testGroupBy0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValue"]);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testGroupBy0001 end *************");
    })

    /**
     * @tc.name predicates groupBy test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5700
     * @tc.desc predicates groupBy test
     */
    it('testGroupBy0002', 0, async function (done) {
        console.info(TAG + "************* testGroupBy0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValueX"]);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testGroupBy0002 end *************");
    })

    /**
     * @tc.name predicates indexedBy test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5800
     * @tc.desc predicates indexedBy test
     */
    it('testIndexedBy0001', 0, async function (done) {
        console.info(TAG + "************* testIndexedBy0001 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").indexedBy(["characterValue"]);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIndexedBy0001 end *************");
    })

    /**
     * @tc.name predicates indexedBy test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_5900
     * @tc.desc predicates indexedBy test
     */
    it('testIndexedBy0002', 0, async function (done) {
        console.info(TAG + "************* testIndexedBy0002 start *************");
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN").indexedBy(["characterValueX"]);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result = null
        done();
        console.info(TAG + "************* testIndexedBy0002 end *************");
    })

    /**
     * @tc.name testNotIn0001
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0180
     * @tc.desc the common and min value test with notin.
     */
    it('testNotIn0001', 0, async function (done) {
        console.info(TAG + "************* testNotIn0001 start *************");
        var values = [1, -2147483648];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.notIn("integerValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        done();
        console.info(TAG + "************* testNotIn0001 end *************");
    })

    /**
     * @tc.name testNotIn0002
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0190
     * @tc.desc the common and max value test with notin.
     */
    it('testNotIn0002', 0, async function (done) {
        console.info(TAG + "************* testNotIn0002 start *************");
        let values = [1, 2147483647];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.notIn("integerValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        done();
        console.info(TAG + "************* testNotIn0002 end *************");
    })

    /**
     * @tc.name testNotIn0003
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_0170
     * @tc.desc the min and max value test with notin.
     */
    it('testNotIn0003', 0, async function (done) {
        console.info(TAG + "************* testNotIn0003 start *************");
        var values = [-2147483648, 2147483647];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.notIn("integerValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);

        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        done();
        console.info(TAG + "************* testNotIn0003 end *************");
    })

    /**
     * @tc.name predicates in normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6300
     * @tc.desc predicates in normal test
     */
    it('testIn0001', 0, async function (done) {
        console.info(TAG + "************* testIn0001 start *************");
        var values = [Number.MIN_VALUE.toString()];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.in("doubleValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        done();
        console.info(TAG + "************* testIn0001 end *************");
    })

    /**
     * @tc.name predicates in normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6000
     * @tc.desc predicates in normal test
     */
    it('testIn0002', 0, async function (done) {
        console.info(TAG + "************* testIn0002 start *************");
        var values = ["1.0"];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.in("doubleValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        done();
        console.info(TAG + "************* testIn0002 end *************");
    })

    /**
     * @tc.name predicates in normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6100
     * @tc.desc predicates in normal test
     */
    it('testIn0003', 0, async function (done) {
        console.info(TAG + "************* testIn0003 start *************");
        var values = [DOUBLE_MAX.toString()];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.in("doubleValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        done();
        console.info(TAG + "************* testIn0003 end *************");
    })

    /**
     * @tc.name predicates in normal test
     * @tc.number SUB_DistributedData_DataAbility_SDK_PredicatesJsAPITest_6200
     * @tc.desc predicates in normal test
     */
    it('testIn0004', 0, async function (done) {
        console.info(TAG + "************* testIn0004 start *************");
        var values = [Number.MIN_VALUE.toString(), "1.0", DOUBLE_MAX.toString()];
        let dataAbilityPredicates = await new dataAbility.DataAbilityPredicates();
        dataAbilityPredicates.in("doubleValue", values);
        let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        done();
        console.info(TAG + "************* testIn0004 end *************");
    })
    console.info(TAG + "*************Unit Test End*************");
})
}
