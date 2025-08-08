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
import testNapi from 'libbackup.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreBackupTest() {
    describe('RdbNdkStoreBackupTest', async () => {
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
            let re = testNapi.RdbstoreTearDownTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            re = testNapi.RdbstoreSetUpTestCase();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
        })
        afterEach(() => {
            hilog.info(0x0000, TAG, 'testTag RdbstoreTearDownTestCase' , ' begin');
        })
        afterAll(() => {
        })


        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0700
         * @tc.desc: Normal testCase of NDK store for Backup、Restore.
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0100' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0100();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0400
         * @tc.desc: Exception testCase of NDK store for Backup、Restore.
         * @tc.desc: backup file name already exists
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0300' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0300();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1500
         * @tc.desc: Exception testCase of NDK store for Backup、Restore.
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0400' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0400();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0300
         * @tc.desc: Exception testCase of NDK store for Backup、Restore.
         * @tc.desc: backup file name is empty
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0500' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0500();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0500
         * @tc.desc: Normal testCase of NDK store for Backup、Restore.
         * @tc.desc: backup file name is a space
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0600' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0600();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0600
         * @tc.desc: Normal testCase of NDK store for Backup、Restore.
         * @tc.desc: Backup file name is a null
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0700' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0700();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0800
         * @tc.desc: Normal testCase of NDK store for Backup、Restore.
         * @tc.desc: Restore file name is a null
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0800' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0800();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1000
         * @tc.desc: Exception testCase of NDK store for Backup、Restore.
         * @tc.desc: Restore file name is empty
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0900' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0900();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })

        /**
         * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0900
         * @tc.desc: Exception testCase of NDK store for Backup、Restore.
         * @tc.desc: Restore file name is invalid
         * @tc.type: FUNC
         * @tc.name predicates Backup normal test
         * @tc.size   : MediumTest
         * @tc.level  : Level 2
         */
        it('SUB_DDM_RDB_BackupRestoreTest_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_BackupRestoreTest_0110' , ' begin');
            let re = testNapi.SUB_DDM_RDB_BackupRestoreTest_0110();
            hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
            expect(re == 0).assertTrue();
            done();
        })
    })
}