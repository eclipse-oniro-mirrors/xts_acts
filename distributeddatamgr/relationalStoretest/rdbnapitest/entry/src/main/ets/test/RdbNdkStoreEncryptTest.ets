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
import testNapi from 'libencrypt.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreEncryptTest() {
  describe('RdbNdkStoreEncryptTest', async function () {
    beforeAll(async function () {
      var context = featureAbility.getContext();
      await context.getFilesDir().then((data) => {
        hilog.info(0x0000, TAG, 'testTag getFilesDir success. data: '+ data , 'aa');
        testNapi.RdbFilePath(data);
      }).catch((err) => {
        hilog.info(0x0000, TAG, 'testTag getFilesDir fail. err: ' + err.code + err.message , 'aa');
      })
      
    })
    beforeEach(function () {})
    afterEach(function () {})
    afterAll(function () {})

    /**
     * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_0100
     * @tc.desc: Exception testCase of NDK ENCRYPT.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_ENCRYPT_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_ENCRYPT_0100' , ' begin');
      let re = testNapi.SUB_DDM_RDB_ENCRYPT_0100();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.number: SUB_DistributedData_RelationalStore_SDK_BackupRestoreNdkAPITest_1100
     * @tc.desc: Exception testCase of NDK SecurityLevel.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_ENCRYPT_0200',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_ENCRYPT_0200' , ' begin');
      let re = testNapi.SUB_DDM_RDB_ENCRYPT_0200();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })


  })
}