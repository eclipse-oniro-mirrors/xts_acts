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
import testNapi from 'liblevel.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreLevelTest() {
    describe('RdbNdkStoreLevelTest', async () => {
        beforeAll(async () => {
            try {
                let data = context.filesDir
                hilog.info(0x0000, TAG, 'testTag getFilesDir success. data:     '+ data , 'aa');
                testNapi.RdbFilePath(data);
            } catch (err) {
                hilog.info(0x0000, TAG, 'testTag getFilesDir fail. err: ' + err.code + err.message , 'aa');
            }
        })
        beforeEach(() => {})
        afterEach(() => {})
        afterAll(() => {})

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0200
         * @tc.desc: Normal testCase of NDK SecurityLevel is S1
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_0100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1200
         * @tc.desc: Normal testCase of NDK SecurityLevel is S2
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_0200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1300
         * @tc.desc: Normal testCase of NDK SecurityLevel is S3
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_0300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1400
         * @tc.desc: Normal testCase of NDK SecurityLevel is S4
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_0400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1500
         * @tc.desc: Normal testCase of NDK SecurityLevel is S4
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_EL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_EL_0100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_EL_0100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1600
         * @tc.desc: Normal testCase of NDK
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_EL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_EL_0200' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_EL_0200();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1700
         * @tc.desc: Normal testCase of NDK
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_EL_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_EL_0300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_EL_0300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1800
         * @tc.desc: Normal testCase of NDK
         * @tc.type: FUNC
         * @tc.name predicates level normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_LEVEL_EL_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_EL_0400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_LEVEL_EL_0400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
    })
}