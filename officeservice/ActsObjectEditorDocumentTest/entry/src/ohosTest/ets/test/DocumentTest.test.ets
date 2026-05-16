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
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByOEid_0100
     * @tc.number SUB_Object_Editor_TestCreateDocumentByOEid_0100
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByOEid with null oeid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByOEid_NullOEid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByOEid_0200
     * @tc.number SUB_Object_Editor_TestCreateDocumentByOEid_0200
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByOEid with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByOEid_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByOEid_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByOEid_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByOEid_0300
     * @tc.number SUB_Object_Editor_TestCreateDocumentByOEid_0300
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByOEid with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByOEid_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByOEid_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByOEid_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByFile_0100
     * @tc.number SUB_Object_Editor_TestCreateDocumentByFile_0100
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with null filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByFile_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByFile_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_NullFilePath();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByFile_0200
     * @tc.number SUB_Object_Editor_TestCreateDocumentByFile_0200
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with zero path length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByFile_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByFile_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_ZeroPathLength();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByFile_0300
     * @tc.number SUB_Object_Editor_TestCreateDocumentByFile_0300
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByFile_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByFile_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateDocumentByFile_0400
     * @tc.number SUB_Object_Editor_TestCreateDocumentByFile_0400
     * @tc.desc   Test OH_ContentEmbed_CreateDocumentByFile with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateDocumentByFile_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateDocumentByFile_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestCreateDocumentByFile_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestLoadDocumentFromFile_0100
     * @tc.number SUB_Object_Editor_TestLoadDocumentFromFile_0100
     * @tc.desc   Test OH_ContentEmbed_LoadDocumentFromFile with null filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestLoadDocumentFromFile_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestLoadDocumentFromFile_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestLoadDocumentFromFile_NullFilePath();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestLoadDocumentFromFile_0200
     * @tc.number SUB_Object_Editor_TestLoadDocumentFromFile_0200
     * @tc.desc   Test OH_ContentEmbed_LoadDocumentFromFile with zero path length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestLoadDocumentFromFile_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestLoadDocumentFromFile_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestLoadDocumentFromFile_ZeroPathLength();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestLoadDocumentFromFile_0300
     * @tc.number SUB_Object_Editor_TestLoadDocumentFromFile_0300
     * @tc.desc   Test OH_ContentEmbed_LoadDocumentFromFile with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestLoadDocumentFromFile_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestLoadDocumentFromFile_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestLoadDocumentFromFile_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestLoadDocumentFromFile_0400
     * @tc.number SUB_Object_Editor_TestLoadDocumentFromFile_0400
     * @tc.desc   Test OH_ContentEmbed_LoadDocumentFromFile with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestLoadDocumentFromFile_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestLoadDocumentFromFile_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestLoadDocumentFromFile_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_NULL_POINTER;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentRead_0100
     * @tc.number SUB_Object_Editor_TestDocumentRead_0100
     * @tc.desc   Test OH_ContentEmbed_Document_Read with null buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentRead_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentRead_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentRead_NullBuffer();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentRead_0200
     * @tc.number SUB_Object_Editor_TestDocumentRead_0200
     * @tc.desc   Test OH_ContentEmbed_Document_Read with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentRead_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentRead_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentRead_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentRead_0300
     * @tc.number SUB_Object_Editor_TestDocumentRead_0300
     * @tc.desc   Test OH_ContentEmbed_Document_Read with null readSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentRead_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentRead_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentRead_NullReadSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentRead_0400
     * @tc.number SUB_Object_Editor_TestDocumentRead_0400
     * @tc.desc   Test OH_ContentEmbed_Document_Read with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentRead_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentRead_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentRead_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_STORAGE_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetOEid_0100
     * @tc.number SUB_Object_Editor_TestDocumentGetOEid_0100
     * @tc.desc   Test OH_ContentEmbed_Document_GetOEid with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetOEid_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetOEid_0200
     * @tc.number SUB_Object_Editor_TestDocumentGetOEid_0200
     * @tc.desc   Test OH_ContentEmbed_Document_GetOEid with null oeidOut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetOEid_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetOEid_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetOEid_NullOEidOut();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetOEid_0300
     * @tc.number SUB_Object_Editor_TestDocumentGetOEid_0300
     * @tc.desc   Test OH_ContentEmbed_Document_GetOEid with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetOEid_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetOEid_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetOEid_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentIsLinking_0100
     * @tc.number SUB_Object_Editor_TestDocumentIsLinking_0100
     * @tc.desc   Test OH_ContentEmbed_Document_IsLinking with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentIsLinking_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentIsLinking_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentIsLinking_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentIsLinking_0200
     * @tc.number SUB_Object_Editor_TestDocumentIsLinking_0200
     * @tc.desc   Test OH_ContentEmbed_Document_IsLinking with null isLinking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentIsLinking_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentIsLinking_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentIsLinking_NullIsLinking();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentIsLinking_0300
     * @tc.number SUB_Object_Editor_TestDocumentIsLinking_0300
     * @tc.desc   Test OH_ContentEmbed_Document_IsLinking with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentIsLinking_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentIsLinking_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentIsLinking_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetNativeFilePath_0100
     * @tc.number SUB_Object_Editor_TestDocumentGetNativeFilePath_0100
     * @tc.desc   Test OH_ContentEmbed_Document_GetNativeFilePath with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetNativeFilePath_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetNativeFilePath_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetNativeFilePath_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetNativeFilePath_0200
     * @tc.number SUB_Object_Editor_TestDocumentGetNativeFilePath_0200
     * @tc.desc   Test OH_ContentEmbed_Document_GetNativeFilePath with null buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetNativeFilePath_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetNativeFilePath_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetNativeFilePath_NullBuffer();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetNativeFilePath_0300
     * @tc.number SUB_Object_Editor_TestDocumentGetNativeFilePath_0300
     * @tc.desc   Test OH_ContentEmbed_Document_GetNativeFilePath with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetNativeFilePath_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetNativeFilePath_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetNativeFilePath_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetRootStorage_0100
     * @tc.number SUB_Object_Editor_TestDocumentGetRootStorage_0100
     * @tc.desc   Test OH_ContentEmbed_Document_GetRootStorage with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetRootStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetRootStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetRootStorage_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetRootStorage_0200
     * @tc.number SUB_Object_Editor_TestDocumentGetRootStorage_0200
     * @tc.desc   Test OH_ContentEmbed_Document_GetRootStorage with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetRootStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetRootStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetRootStorage_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentGetRootStorage_0300
     * @tc.number SUB_Object_Editor_TestDocumentGetRootStorage_0300
     * @tc.desc   Test OH_ContentEmbed_Document_GetRootStorage with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentGetRootStorage_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentGetRootStorage_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetRootStorage_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentFlush_0100
     * @tc.number SUB_Object_Editor_TestDocumentFlush_0100
     * @tc.desc   Test OH_ContentEmbed_Document_Flush with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentFlush_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentFlush_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentFlush_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDocumentFlush_0200
     * @tc.number SUB_Object_Editor_TestDocumentFlush_0200
     * @tc.desc   Test OH_ContentEmbed_Document_Flush with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDocumentFlush_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDocumentFlush_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentFlush_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_FILE_OPERATION_FAILED ||
        result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStorage_0100
     * @tc.number SUB_Object_Editor_TestStorageCreateStorage_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with null parent storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_NullParentStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStorage_0200
     * @tc.number SUB_Object_Editor_TestStorageCreateStorage_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStorage_0300
     * @tc.number SUB_Object_Editor_TestStorageCreateStorage_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with null out storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStorage_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStorage_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_NullOutStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStorage_0400
     * @tc.number SUB_Object_Editor_TestStorageCreateStorage_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStorage with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStorage_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStorage_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStorage_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStorage_0100
     * @tc.number SUB_Object_Editor_TestStorageGetStorage_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with null parent storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_NullParentStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStorage_0200
     * @tc.number SUB_Object_Editor_TestStorageGetStorage_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStorage_0300
     * @tc.number SUB_Object_Editor_TestStorageGetStorage_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with null out storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStorage_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStorage_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_NullOutStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStorage_0400
     * @tc.number SUB_Object_Editor_TestStorageGetStorage_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStorage with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStorage_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStorage_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStorage_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStream_0100
     * @tc.number SUB_Object_Editor_TestStorageCreateStream_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStream_0200
     * @tc.number SUB_Object_Editor_TestStorageCreateStream_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStream_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStream_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStream_0300
     * @tc.number SUB_Object_Editor_TestStorageCreateStream_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with null out stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStream_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStream_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_NullOutStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCreateStream_0400
     * @tc.number SUB_Object_Editor_TestStorageCreateStream_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_CreateStream with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCreateStream_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCreateStream_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCreateStream_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStream_0100
     * @tc.number SUB_Object_Editor_TestStorageGetStream_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStream with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStream_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStream_0200
     * @tc.number SUB_Object_Editor_TestStorageGetStream_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStream with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStream_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStream_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStream_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStream_0300
     * @tc.number SUB_Object_Editor_TestStorageGetStream_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStream with null out stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStream_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStream_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStream_NullOutStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetStream_0400
     * @tc.number SUB_Object_Editor_TestStorageGetStream_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_GetStream with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetStream_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetStream_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetStream_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageDeleteEntry_0100
     * @tc.number SUB_Object_Editor_TestStorageDeleteEntry_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteEntry with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageDeleteEntry_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageDeleteEntry_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageDeleteEntry_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageDeleteEntry_0200
     * @tc.number SUB_Object_Editor_TestStorageDeleteEntry_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteEntry with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageDeleteEntry_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageDeleteEntry_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageDeleteEntry_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageDeleteEntry_0300
     * @tc.number SUB_Object_Editor_TestStorageDeleteEntry_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteEntry with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageDeleteEntry_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageDeleteEntry_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageDeleteEntry_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_STORAGE_OPERATION_FAILED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDeleteStorage_0100
     * @tc.number SUB_Object_Editor_TestDeleteStorage_0100
     * @tc.desc   Test OH_ContentEmbed_DeleteStorage with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDeleteStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDeleteStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDeleteStorage_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDeleteStorage_0200
     * @tc.number SUB_Object_Editor_TestDeleteStorage_0200
     * @tc.desc   Test OH_ContentEmbed_DeleteStorage with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDeleteStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDeleteStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDeleteStorage_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamRead_0100
     * @tc.number SUB_Object_Editor_TestStreamRead_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Read with null stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamRead_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamRead_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamRead_NullStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamRead_0200
     * @tc.number SUB_Object_Editor_TestStreamRead_0200
     * @tc.desc   Test OH_ContentEmbed_Stream_Read with null buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamRead_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamRead_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamRead_NullBuffer();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamRead_0300
     * @tc.number SUB_Object_Editor_TestStreamRead_0300
     * @tc.desc   Test OH_ContentEmbed_Stream_Read with null readSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamRead_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamRead_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamRead_NullReadSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamRead_0400
     * @tc.number SUB_Object_Editor_TestStreamRead_0400
     * @tc.desc   Test OH_ContentEmbed_Stream_Read with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamRead_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamRead_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamRead_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamWrite_0100
     * @tc.number SUB_Object_Editor_TestStreamWrite_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Write with null stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamWrite_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamWrite_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamWrite_NullStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamWrite_0200
     * @tc.number SUB_Object_Editor_TestStreamWrite_0200
     * @tc.desc   Test OH_ContentEmbed_Stream_Write with null buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamWrite_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamWrite_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamWrite_NullBuffer();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamWrite_0300
     * @tc.number SUB_Object_Editor_TestStreamWrite_0300
     * @tc.desc   Test OH_ContentEmbed_Stream_Write with null writeSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamWrite_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamWrite_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamWrite_NullWriteSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamWrite_0400
     * @tc.number SUB_Object_Editor_TestStreamWrite_0400
     * @tc.desc   Test OH_ContentEmbed_Stream_Write with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamWrite_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamWrite_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamWrite_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamSeek_0100
     * @tc.number SUB_Object_Editor_TestStreamSeek_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_Seek with null stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamSeek_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamSeek_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamSeek_NullStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamSeek_0200
     * @tc.number SUB_Object_Editor_TestStreamSeek_0200
     * @tc.desc   Test OH_ContentEmbed_Stream_Seek with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamSeek_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamSeek_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamSeek_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamGetPosition_0100
     * @tc.number SUB_Object_Editor_TestStreamGetPosition_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_GetPosition with null stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamGetPosition_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamGetPosition_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetPosition_NullStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamGetPosition_0200
     * @tc.number SUB_Object_Editor_TestStreamGetPosition_0200
     * @tc.desc   Test OH_ContentEmbed_Stream_GetPosition with null position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamGetPosition_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamGetPosition_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetPosition_NullPosition();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamGetPosition_0300
     * @tc.number SUB_Object_Editor_TestStreamGetPosition_0300
     * @tc.desc   Test OH_ContentEmbed_Stream_GetPosition with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamGetPosition_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamGetPosition_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetPosition_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamGetSize_0100
     * @tc.number SUB_Object_Editor_TestStreamGetSize_0100
     * @tc.desc   Test OH_ContentEmbed_Stream_GetSize with null stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamGetSize_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamGetSize_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetSize_NullStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamGetSize_0200
     * @tc.number SUB_Object_Editor_TestStreamGetSize_0200
     * @tc.desc   Test OH_ContentEmbed_Stream_GetSize with null size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamGetSize_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamGetSize_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetSize_NullSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStreamGetSize_0300
     * @tc.number SUB_Object_Editor_TestStreamGetSize_0300
     * @tc.desc   Test OH_ContentEmbed_Stream_GetSize with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStreamGetSize_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStreamGetSize_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStreamGetSize_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyStream_0100
     * @tc.number SUB_Object_Editor_TestDestroyStream_0100
     * @tc.desc   Test OH_ContentEmbed_DestroyStream with null stream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDestroyStream_NullStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyStream_0200
     * @tc.number SUB_Object_Editor_TestDestroyStream_0200
     * @tc.desc   Test OH_ContentEmbed_DestroyStream with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyStream_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyStream_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDestroyStream_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyDocument_0100
     * @tc.number SUB_Object_Editor_TestDestroyDocument_0100
     * @tc.desc   Test OH_ContentEmbed_DestroyDocument with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDestroyDocument_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyDocument_0200
     * @tc.number SUB_Object_Editor_TestDestroyDocument_0200
     * @tc.desc   Test OH_ContentEmbed_DestroyDocument with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyDocument_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyDocument_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDestroyDocument_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageDeleteAllEntry_0100
     * @tc.number SUB_Object_Editor_TestStorageDeleteAllEntry_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteAllEntry with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageDeleteAllEntry_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageDeleteAllEntry_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageDeleteAllEntry_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageDeleteAllEntry_0200
     * @tc.number SUB_Object_Editor_TestStorageDeleteAllEntry_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_DeleteAllEntry with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageDeleteAllEntry_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageDeleteAllEntry_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageDeleteAllEntry_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetOEid_0100
     * @tc.number SUB_Object_Editor_TestStorageGetOEid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetOEid with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetOEid_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetOEid_0200
     * @tc.number SUB_Object_Editor_TestStorageGetOEid_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_GetOEid with null oeidOut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetOEid_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetOEid_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetOEid_NullOEidOut();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetOEid_0300
     * @tc.number SUB_Object_Editor_TestStorageGetOEid_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_GetOEid with zero buffer size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetOEid_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetOEid_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetOEid_ZeroBufferSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetOEid_0400
     * @tc.number SUB_Object_Editor_TestStorageGetOEid_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_GetOEid with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetOEid_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetOEid_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetOEid_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageSetOEid_0100
     * @tc.number SUB_Object_Editor_TestStorageSetOEid_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_SetOEid with null storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageSetOEid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageSetOEid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageSetOEid_NullStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageSetOEid_0200
     * @tc.number SUB_Object_Editor_TestStorageSetOEid_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_SetOEid with null oeid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageSetOEid_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageSetOEid_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageSetOEid_NullOEid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageSetOEid_0300
     * @tc.number SUB_Object_Editor_TestStorageSetOEid_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_SetOEid with zero buffer size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageSetOEid_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageSetOEid_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageSetOEid_ZeroBufferSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageSetOEid_0400
     * @tc.number SUB_Object_Editor_TestStorageSetOEid_0400
     * @tc.desc   Test OH_ContentEmbed_Storage_SetOEid with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageSetOEid_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageSetOEid_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageSetOEid_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsCreateElements_0100
     * @tc.number SUB_Object_Editor_TestStorageElementsCreateElements_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_CreateElements function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsCreateElements_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsCreateElements_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElements_CreateElements();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageGetElements_0100
     * @tc.number SUB_Object_Editor_TestStorageGetElements_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_GetElements with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageGetElements_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageGetElements_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageGetElements_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsGetCount_0100
     * @tc.number SUB_Object_Editor_TestStorageElementsGetCount_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_GetCount with null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsGetCount_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsGetCount_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementsGetCount_NullElements();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsGetCount_0200
     * @tc.number SUB_Object_Editor_TestStorageElementsGetCount_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_GetCount with null count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsGetCount_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsGetCount_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementsGetCount_NullCount();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsGetCount_0300
     * @tc.number SUB_Object_Editor_TestStorageElementsGetCount_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_GetCount with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsGetCount_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsGetCount_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementsGetCount_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCopyTo_0100
     * @tc.number SUB_Object_Editor_TestStorageCopyTo_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_CopyTo with null src storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCopyTo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCopyTo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCopyTo_NullSrcStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageCopyTo_0200
     * @tc.number SUB_Object_Editor_TestStorageCopyTo_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_CopyTo with null dst storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageCopyTo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageCopyTo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageCopyTo_NullDstStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsGetElement_0100
     * @tc.number SUB_Object_Editor_TestStorageElementsGetElement_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_GetElement with null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsGetElement_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsGetElement_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementsGetElement_NullElements();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsGetElement_0200
     * @tc.number SUB_Object_Editor_TestStorageElementsGetElement_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_GetElement with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsGetElement_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsGetElement_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementsGetElement_NullElement();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementsGetElement_0300
     * @tc.number SUB_Object_Editor_TestStorageElementsGetElement_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_Elements_GetElement with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementsGetElement_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementsGetElement_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementsGetElement_ValidParam();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetName_0100
     * @tc.number SUB_Object_Editor_TestStorageElementGetName_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetName with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetName_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetName_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetName_NullElement();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetName_0200
     * @tc.number SUB_Object_Editor_TestStorageElementGetName_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetName with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetName_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetName_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetName_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetName_0300
     * @tc.number SUB_Object_Editor_TestStorageElementGetName_0300
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetName with null length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetName_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetName_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetName_NullLength();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetCTime_0100
     * @tc.number SUB_Object_Editor_TestStorageElementGetCTime_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetCTime with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetCTime_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetCTime_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetCTime_NullElement();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetCTime_0200
     * @tc.number SUB_Object_Editor_TestStorageElementGetCTime_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetCTime with null time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetCTime_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetCTime_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetCTime_NullTime();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetMTime_0100
     * @tc.number SUB_Object_Editor_TestStorageElementGetMTime_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetMTime with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetMTime_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetMTime_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetMTime_NullElement();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementGetMTime_0200
     * @tc.number SUB_Object_Editor_TestStorageElementGetMTime_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_GetMTime with null time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementGetMTime_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementGetMTime_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementGetMTime_NullTime();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementIsStorage_0100
     * @tc.number SUB_Object_Editor_TestStorageElementIsStorage_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_IsStorage with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementIsStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementIsStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementIsStorage_NullElement();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementIsStorage_0200
     * @tc.number SUB_Object_Editor_TestStorageElementIsStorage_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_IsStorage with null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementIsStorage_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementIsStorage_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementIsStorage_NullResult();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementIsStream_0100
     * @tc.number SUB_Object_Editor_TestStorageElementIsStream_0100
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_IsStream with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementIsStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementIsStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementIsStream_NullElement();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStorageElementIsStream_0200
     * @tc.number SUB_Object_Editor_TestStorageElementIsStream_0200
     * @tc.desc   Test OH_ContentEmbed_Storage_Element_IsStream with null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStorageElementIsStream_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStorageElementIsStream_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStorageElementIsStream_NullResult();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })
  })
};