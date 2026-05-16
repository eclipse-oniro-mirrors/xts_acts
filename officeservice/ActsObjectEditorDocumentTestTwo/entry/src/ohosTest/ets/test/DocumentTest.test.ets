/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';

const CE_ERR_OK: number = 0;
const CE_ERR_PARAM_INVALID: number = 401;
const CE_ERR_DEVICE_NOT_SUPPORTED: number = 801;
const CE_ERR_NULL_POINTER: number = 35300001;
const CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED: number = 35300002;
const CE_ERR_EXTENSION_ERROR: number = 35300003;
const CE_ERR_SYSTEM_ABNORMAL: number = 35300004;
const CE_ERR_STORAGE_OPERATION_FAILED: number = 35300005;
const CE_ERR_STREAM_OPERATION_FAILED: number = 35300006;
const CE_ERR_FILE_OPERATION_FAILED: number = 35300007;
const CE_ERR_IN_DLP_SANDBOX: number = 35300008;
const CE_ERR_IMAGE_PACKER_OPERATION_FAILED: number = 35300009;
const CE_ERR_CLIENT_CALLBACK_FAILED: number = 35300010;
const CE_ERR_EXTENSION_ABNORMAL_EXIT: number = 35300011;
const CE_ERR_INVALID_LINKING_PATH: number = 35300012;
const CE_ERR_CONNECT_LIMIT_EXCEED: number = 35300013;
const CE_ERR_FILE_NOT_GRANT: number = 35300014;
const CE_ERR_DISK_FULL: number = 35300015;
const CE_ERR_EXTENSION_NOT_SUPPORT: number = 35300016;

export default function documentTest() {
  describe('ActsCapiDocumentTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0100
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with linking failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_LinkingFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_INVALID_LINKING_PATH || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0200
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0300
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0300
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with path empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CreateDocumentByFile_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_PathEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Document_GetNativeFilePath_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Document_GetNativeFilePath_0100
     * @tc.desc   Test OH_ContentEmbed_Document_GetNativeFilePath with path empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Document_GetNativeFilePath_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Document_GetNativeFilePath_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetNativeFilePath_PathEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with name empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_NameEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with same name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_SameName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with name empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_NameEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with name empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_NameEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_CreateStream_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteEntry with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDeleteEntry_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteEntry with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteEntry_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDeleteEntry_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteAllEntry_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteAllEntry_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteAllEntry with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteAllEntry_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_DeleteAllEntry_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDeleteAllEntry_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Stream_Read_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Stream_Read_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Read with return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Stream_Read_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Stream_Read_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamRead_ReturnNull();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_NULL_POINTER || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Stream_Write_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Stream_Write_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Write with return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Stream_Write_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Stream_Write_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamWrite_ReturnNull();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_NULL_POINTER || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Stream_Seek_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Stream_Seek_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Seek with return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Stream_Seek_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Stream_Seek_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamSeek_ReturnNull();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_NULL_POINTER || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Stream_GetPosition_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Stream_GetPosition_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_GetPosition with return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Stream_GetPosition_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Stream_GetPosition_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetPosition_ReturnNull();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_NULL_POINTER || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Stream_GetSize_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Stream_GetSize_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_GetSize with return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Stream_GetSize_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Stream_GetSize_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetSize_ReturnNull();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_NULL_POINTER || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetOEid_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetOEid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetOEid with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetOEid_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_SetOEid_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_SetOEid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_SetOEid with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_SetOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_SetOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamSetOEid_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_Create_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_Create_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElements_Create with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_Create_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_Create_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateStorageElements_Nullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElements_Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDestroyStorageElements_Nullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0200
     * @tc.desc   Test OH_ContentEmbed_StorageElements_Destroy with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_Destroy_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDestroyStorageElements_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetElements with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetElements_Nullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_GetElements with storage nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetElements_StorageNullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0300
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_GetElements with elements nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetElements_ElementsNullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0400
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_GetElements with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_GetElements_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetElements_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetCount with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementsCount_Nullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0200
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetCount with elements nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementsCount_ElementsNullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0300
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0300
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetCount with count nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetCount_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementsCount_CountNullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetElement with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElement_Nullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0200
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetElement with elements nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElement_ElementsNullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0300
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0300
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetElement with element nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElement_ElementNullptr();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0400
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0400
     * @tc.desc   Test OH_ContentEmbed_StorageElements_GetElement with size invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElements_GetElement_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElement_SizeInvalid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetName_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetName_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElement_GetName with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetName_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetName_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementName_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetCTime_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetCTime_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElement_GetCTime with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetCTime_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetCTime_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementCTime_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetMTime_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetMTime_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElement_GetMTime with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetMTime_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElement_GetMTime_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementMTime_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStorage_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStorage_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElement_IsStorage with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementIsStorage_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStream_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStream_0100
     * @tc.desc   Test OH_ContentEmbed_StorageElement_IsStream with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_StorageElement_IsStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestGetElementIsStream_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CopyTo with storage failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCopyTo_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_STORAGE_OPERATION_FAILED || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_CopyTo with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_Storage_CopyTo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCopyTo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })
  })
};
