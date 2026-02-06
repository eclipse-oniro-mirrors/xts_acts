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
import hilog from '@ohos.hilog';
import testNapi from 'librdbtest.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreTest() {
    describe('RdbNdkStoreTest', async () => {
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
            hilog.info(0x0000, TAG, 'testTag RdbstoreSetUpTestCase' , ' begin');
            let re = testNapi.RdbstoreSetUpTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
        afterEach(() => {
            let re = testNapi.RdbstoreTearDownTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
        })
        afterAll(() => {})

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0100
         * @tc.desc: Normal testCase of NDK store for Insert、Update、Query.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0200
         * @tc.desc: Normal testCase of NDK store for Insert with wrong table name or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0300
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0400
         * @tc.desc: Normal testCase of NDK store for Update with valueBucket is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0500
         * @tc.desc: Normal testCase of NDK store for Update with wrong predicates.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0600
         * @tc.desc: Normal testCase of NDK store for Query with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0700
         * @tc.desc: Normal testCase of NDK store for Query with wrong columnNames.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0800
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_0900
         * @tc.desc: Normal testCase of NDK store for Delete、ExecuteQuery.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_0900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_0900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1000
         * @tc.desc: Normal testCase of NDK store for querysql is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1100
         * @tc.desc: Normal testCase of NDK store for Delete with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1200
         * @tc.desc: Normal testCase of NDK store for Delete with wrong predicates.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1300
         * @tc.desc: Normal testCase of NDK store for Delete multiple.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1400
         * @tc.desc: Normal testCase of NDK store for Transaction、Commit.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 0
         */
        it('SUB_DDM_RDB_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1500
         * @tc.desc: Normal testCase of NDK store for Transaction、RollBack.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1600
         * @tc.desc: Normal testCase of NDK store for Transaction、Commit.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1700
         * @tc.desc: Normal testCase of NDK store for Transaction、Commit.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1800
         * @tc.desc: Normal testCase of NDK store for GetVersion、SetVersion.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_1900
         * @tc.desc: Normal testCase of NDK store for Query with wrong columnNames.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_1900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_1900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2000
         * @tc.desc: Normal testCase of NDK store for Update with wrong columnNames.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2100
         * @tc.desc: Normal testCase of NDK store for Delete with wrong columnNames.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2200
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2300
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2400
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2500
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2600
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2700
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2800
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_2900
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_2900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_2900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3000
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3100
         * @tc.desc: Normal testCase of NDK store for Query with wrong length.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3200
         * @tc.desc: Normal testCase of NDK store for dataBaseDir wrong
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3300
         * @tc.desc: Normal testCase of NDK store for dataBaseDir wrong.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3400
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3500
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3600
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3700
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3800
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_3900
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_3900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_3900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4000
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4100
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4200
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4300
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4400
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4500
         * @tc.desc: Normal testCase of NDK store
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4600
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4700
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4800
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_4900
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_4900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_4900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_5000
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_5000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_5000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_CrudNdkAPITest_5100
         * @tc.desc: Normal testCase of NDK store for Update with wrong table or table is NULL.
         * @tc.type: FUNC
         * @tc.name rdb normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_5100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_5100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })
    })
}