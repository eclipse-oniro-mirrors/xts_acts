/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import testNapi from 'libcursor.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreCursorTest() {
    describe('RdbNdkStoreCursorTest', async () => {
        beforeAll(async () => {
            try {
                let data = context.filesDir
                hilog.info(0x0000, TAG, 'testTag getFilesDir success. data:     '+ data , 'aa');
                testNapi.RdbFilePath(data);
            } catch (err) {
                hilog.info(0x0000, TAG, 'testTag getFilesDir fail. err: ' + err.code + err.message , 'aa');
            }

        })
        beforeEach(async () => {
            hilog.info(0x0000, TAG, 'testTag CursorSetUpTestCase' , ' begin');
            let re = testNapi.CursorTearDownTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            re = testNapi.CursorSetUpTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
        afterEach(async () => {
            hilog.info(0x0000, TAG, 'testTag CursorTearDownTestCase' , ' begin');

        })
        afterAll(async () => {})

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0100
         * @tc.desc: Normal testCase of NDK cursor for GetColumnType.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0200
         * @tc.desc: Normal testCase of NDK cursor for GetColumnIndex.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0300
         * @tc.desc: Normal testCase of NDK cursor for GetColumnName.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0400
         * @tc.desc: Normal testCase of NDK cursor for Getxxx.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0500
         * @tc.desc: Normal testCase of NDK cursor for GetColumnIndex.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0600
         * @tc.desc: Normal testCase of NDK cursor for GetColumnIndex.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0700
         * @tc.desc: Normal testCase of NDK cursor for GetColumnType.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0800
         * @tc.desc: Normal testCase of NDK cursor for GetColumnName.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_0900
         * @tc.desc: Normal testCase of NDK cursor for getSize.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_0900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1000
         * @tc.desc: Normal testCase of NDK cursor for getText.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1100
         * @tc.desc: Normal testCase of NDK cursor for getInt64.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1200
         * @tc.desc: Normal testCase of NDK cursor for getReal.
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1300
         * @tc.desc: getBlob
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1400
         * @tc.desc: isNull
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1500
         * @tc.desc: getRowCount
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1600
         * @tc.desc: getRowCount
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1700
         * @tc.desc: getRowCount
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1800
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_1900
         * @tc.desc: getRowCount
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_1900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2000
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2000' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2000();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2100
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2200
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2300
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2400
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2500
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
        
        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_ResultSetNdkAPITest_2600
         * @tc.desc:
         * @tc.type: FUNC
         * @tc.name predicates cursor normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_CURSOR_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_2600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_CURSOR_2600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
    })
}