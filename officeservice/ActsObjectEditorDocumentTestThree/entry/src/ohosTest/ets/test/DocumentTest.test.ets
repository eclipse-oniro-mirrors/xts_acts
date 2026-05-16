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

export default function documentThreeTest() {
  describe('ActsObjectEditorDocumentThreeTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_TestLoadDocumentFromFile_Normal_0100
     * @tc.number SUB_Object_Editor_TestLoadDocumentFromFile_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_LoadDocumentFromFile with normal file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestLoadDocumentFromFile_Normal_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestLoadDocumentFromFile_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestLoadDocumentFromFile_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetNativeFilePath_0100
     * @tc.number SUB_Object_Editor_TestDocumentGetNativeFilePath_0100
     * @tc.desc   Test OH_ContentEmbed_GetNativeFilePath with empty OEID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetNativeFilePath_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetNativeFilePath_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetNativeFilePath_OEIDIsEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageSetOEid_0100
     * @tc.number SUB_Object_Editor_TestStorageSetOEid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_SetOEid with empty OEID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageSetOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageSetOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageSetOEid_OEIDIsEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetOEidFromFormat_0100
     * @tc.number SUB_Object_Editor_TestProxyGetOEidFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetOEidFromFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetOEidFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestProxyGetOEidFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetOEidFromFormat_OEIDIsEmpty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByOEid_0100
     * @tc.number SUB_Object_Editor_TestCreateDocumentByOEid_0100
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByOEid with invalid OEID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByOEid_OEIDIsValid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStorage_NameIsValid_0100
     * @tc.number SUB_Object_Editor_TestStorageCreateStorage_NameIsValid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with invalid name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStorage_NameIsValid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStorage_NameIsValid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_NameIsValid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStorage_NameExceedMaxLen_0100
     * @tc.number SUB_Object_Editor_TestStorageCreateStorage_NameExceedMaxLen_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with name exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStorage_NameExceedMaxLen_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStorage_NameExceedMaxLen_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_NameExceedMaxLen();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStorage_NameIsValid_0100
     * @tc.number SUB_Object_Editor_TestStorageGetStorage_NameIsValid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with invalid name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStorage_NameIsValid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStorage_NameIsValid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_NameIsValid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStorage_NameExceedMaxLen_0100
     * @tc.number SUB_Object_Editor_TestStorageGetStorage_NameExceedMaxLen_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with name exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStorage_NameExceedMaxLen_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStorage_NameExceedMaxLen_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_NameExceedMaxLen();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStream_StreamFailed_0100
     * @tc.number SUB_Object_Editor_TestStorageCreateStream_StreamFailed_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with stream operation failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStream_StreamFailed_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStream_StreamFailed_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_StreamFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_STREAM_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStream_StorageFailed_0100
     * @tc.number SUB_Object_Editor_TestStorageGetStream_StorageFailed_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStream with storage operation failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStream_StorageFailed_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStream_StorageFailed_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStream_StorageFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_STORAGE_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStream_StreamFailed_0100
     * @tc.number SUB_Object_Editor_TestStorageGetStream_StreamFailed_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStream with stream operation failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStream_StreamFailed_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStream_StreamFailed_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStream_StreamFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_STREAM_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByFile_EmptyPath_0100
     * @tc.number SUB_Object_Editor_TestCreateDocumentByFile_EmptyPath_0100
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with empty path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByFile_EmptyPath_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByFile_EmptyPath_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_EmptyPath();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageDeleteEntry_FileFailed_0100
     * @tc.number SUB_Object_Editor_TestStorageDeleteEntry_FileFailed_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteEntry with file operation failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageDeleteEntry_FileFailed_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageDeleteEntry_FileFailed_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageDeleteEntry_FileFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_FILE_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamSeek_ExceedSize_0100
     * @tc.number SUB_Object_Editor_TestStreamSeek_ExceedSize_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Seek with exceed size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamSeek_ExceedSize_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamSeek_ExceedSize_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamSeek_ExceedSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_STREAM_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })
  })
};