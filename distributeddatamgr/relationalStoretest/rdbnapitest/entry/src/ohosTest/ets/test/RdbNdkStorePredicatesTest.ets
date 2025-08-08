/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import testNapi from 'libpredicates.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStorePredicatesTest() {
    describe('RdbNdkStorePredicatesTest', async () => {
        beforeAll(async () => {
            try {
                let data = context.filesDir
                hilog.info(0x0000, TAG, 'testTag getFilesDir success. data:     '+ data , 'aa');
                testNapi.RdbFilePath(data);
            } catch (err) {
                hilog.info(0x0000, TAG, 'testTag getFilesDir fail. err: ' + err.code + err.message , 'aa');
            }
        })
        beforeEach(() => {
            hilog.info(0x0000, TAG, 'testTag PredicatesSetUpTestCase' , ' begin');
            let re = testNapi.PredicatesTearDownTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            re = testNapi.PredicatesSetUpTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
        afterEach(() => {
            hilog.info(0x0000, TAG, 'testTag PredicatesTearDownTestCase' , ' begin');
        })
        afterAll(() => {})

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0100
         * @tc.desc: Normal testCase of NDK Predicates for EqualTo、AndOR、beginWrap and endWrap
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_Predicates_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0200
         * @tc.desc: Normal testCase of NDK Predicates for NotEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_Predicates_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0300
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_Predicates_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0400
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_Predicates_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0500
         * @tc.desc: Normal testCase of NDK Predicates for LessThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0600
         * @tc.desc: Normal testCase of NDK Predicates for LessThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0700
         * @tc.desc: Normal testCase of NDK Predicates for IsNull
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0800
         * @tc.desc: Normal testCase of NDK Predicates for isNotNull
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_0900
         * @tc.desc: Normal testCase of NDK Predicates for Between
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_0900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_0900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1000
         * @tc.desc: Normal testCase of NDK Predicates for NotBetween
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1100
         * @tc.desc: Normal testCase of NDK Predicates for OrderBy、Limit、Offset.
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1200
         * @tc.desc: Normal testCase of NDK Predicates for In.
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1300
         * @tc.desc: Normal testCase of NDK Predicates for NotIn
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1400
         * @tc.desc: Normal testCase of NDK Predicates for Like
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1500
         * @tc.desc: Normal testCase of NDK Predicates for GroupBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1600
         * @tc.desc: Normal testCase of NDK Predicates for And
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1700
         * @tc.desc: Normal testCase of NDK Predicates for Clear
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1800
         * @tc.desc: Normal testCase of NDK Predicates for table name is NULL.
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_1900
         * @tc.desc: Normal testCase of NDK Predicates for equalTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_1900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_1900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2000
         * @tc.desc: Normal testCase of NDK Predicates for equalTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2100
         * @tc.desc: Normal testCase of NDK Predicates for equalTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2200
         * @tc.desc: Normal testCase of NDK Predicates for equalTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2300
         * @tc.desc: Normal testCase of NDK Predicates for notEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2400
         * @tc.desc: Normal testCase of NDK Predicates for notEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2500
         * @tc.desc: Normal testCase of NDK Predicates for notEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2600
         * @tc.desc: Normal testCase of NDK Predicates for notEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2700
         * @tc.desc: Normal testCase of NDK Predicates for beginWrap and endWrap
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2800
         * @tc.desc: Normal testCase of NDK Predicates for beginWrap and endWrap
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_2900
         * @tc.desc: Normal testCase of NDK Predicates for beginWrap and endWrap
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_2900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_2900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3000
         * @tc.desc: Normal testCase of NDK Predicates for EqualTo、AndOR、beginWrap and endWrap
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3100
         * @tc.desc: Normal testCase of NDK Predicates for
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3200
         * @tc.desc: Normal testCase of NDK Predicates for And
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3300
         * @tc.desc: Normal testCase of NDK Predicates for IsNull
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3400
         * @tc.desc: Normal testCase of NDK Predicates for isNotNull
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3500
         * @tc.desc: Normal testCase of NDK Predicates for Like
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3600
         * @tc.desc: Normal testCase of NDK Predicates for Like
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3700
         * @tc.desc: Normal testCase of NDK Predicates for Like
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3800
         * @tc.desc: Normal testCase of NDK Predicates for Between
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_3900
         * @tc.desc: Normal testCase of NDK Predicates for Between
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_3900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_3900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4000
         * @tc.desc: Normal testCase of NDK Predicates for Between
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4100
         * @tc.desc: Normal testCase of NDK Predicates for NotBetween
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4200
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4300
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4400
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4500
         * @tc.desc: Normal testCase of NDK Predicates for LessThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4600
         * @tc.desc: Normal testCase of NDK Predicates for LessThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4700
         * @tc.desc: Normal testCase of NDK Predicates for LessThan
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4800
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_4900
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_4900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_4900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5000
         * @tc.desc: Normal testCase of NDK Predicates for GreaterThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5100
         * @tc.desc: Normal testCase of NDK Predicates for LessThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5200
         * @tc.desc: Normal testCase of NDK Predicates for LessThanOrEqualTo
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5300
         * @tc.desc: Normal testCase of NDK Predicates for
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5400
         * @tc.desc: Normal testCase of NDK Predicates for GroupBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5500
         * @tc.desc: Normal testCase of NDK Predicates for GroupBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5600
         * @tc.desc: Normal testCase of NDK Predicates for GroupBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5800
         * @tc.desc: Normal testCase of NDK Predicates for GroupBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_5900
         * @tc.desc: Normal testCase of NDK Predicates for In.
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_5900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_5900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6000
         * @tc.desc: Normal testCase of NDK Predicates for In.
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6100
         * @tc.desc: Normal testCase of NDK Predicates for NotIn
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6200
         * @tc.desc: Normal testCase of NDK Predicates for NotIn
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6300
         * @tc.desc: Normal testCase of NDK Predicates for OrderBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6400
         * @tc.desc: Normal testCase of NDK Predicates for OrderBy
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6500
         * @tc.desc: Normal testCase of NDK Predicates for Limit
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6600
         * @tc.desc: Normal testCase of NDK Predicates for Offset
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesNdkAPITest_6700
         * @tc.desc: Normal testCase of NDK Predicates for Offset
         * @tc.type: FUNC
         * @tc.name predicates normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_Predicates_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_Predicates_6700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_Predicates_6700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
    })
}