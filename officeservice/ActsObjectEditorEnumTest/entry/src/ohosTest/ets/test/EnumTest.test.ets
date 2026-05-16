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

export default function enumTest() {
  describe('ActsCapiEnumTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_TestMAX_OEID_LENGTH_0100
     * @tc.number SUB_Object_Editor_TestMAX_OEID_LENGTH_0100
     * @tc.desc   Test MAX_OEID_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestMAX_OEID_LENGTH_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestMAX_OEID_LENGTH_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestMAX_OEID_LENGTH();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 1 * 40;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestMAX_PATH_LENGTH_0100
     * @tc.number SUB_Object_Editor_TestMAX_PATH_LENGTH_0100
     * @tc.desc   Test MAX_PATH_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestMAX_PATH_LENGTH_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestMAX_PATH_LENGTH_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestMAX_PATH_LENGTH();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 4 * 1024;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestMAX_NAME_LENGTH_0100
     * @tc.number SUB_Object_Editor_TestMAX_NAME_LENGTH_0100
     * @tc.desc   Test MAX_NAME_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestMAX_NAME_LENGTH_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestMAX_NAME_LENGTH_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestMAX_NAME_LENGTH();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 1 * 1024;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestMAX_DESCRIPTION_LENGTH_0100
     * @tc.number SUB_Object_Editor_TestMAX_DESCRIPTION_LENGTH_0100
     * @tc.desc   Test MAX_DESCRIPTION_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestMAX_DESCRIPTION_LENGTH_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestMAX_DESCRIPTION_LENGTH_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestMAX_DESCRIPTION_LENGTH();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 1 * 1024;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_OK_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_OK_0100
     * @tc.desc   Test CE_ERR_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_OK_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_OK_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_OK();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 0;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_PERMISSION_DENIED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_PERMISSION_DENIED_0100
     * @tc.desc   Test CE_PERMISSION_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_PERMISSION_DENIED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_PERMISSION_DENIED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_PERMISSION_DENIED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 201;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID_0100
     * @tc.desc   Test CE_ERR_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_PARAM_INVALID();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 401;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED_0100
     * @tc.desc   Test CE_ERR_DEVICE_NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_DEVICE_NOT_SUPPORTED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 801;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_NULL_POINTER_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_NULL_POINTER_0100
     * @tc.desc   Test CE_ERR_NULL_POINTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_NULL_POINTER_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_NULL_POINTER_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_NULL_POINTER();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300001;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED_0100
     * @tc.desc   Test CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300002;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR_0100
     * @tc.desc   Test CE_ERR_EXTENSION_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_EXTENSION_ERROR();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300003;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL_0100
     * @tc.desc   Test CE_ERR_SYSTEM_ABNORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_SYSTEM_ABNORMAL();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300004;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED_0100
     * @tc.desc   Test CE_ERR_STORAGE_OPERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_STORAGE_OPERATION_FAILED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300005;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED_0100
     * @tc.desc   Test CE_ERR_STREAM_OPERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_STREAM_OPERATION_FAILED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300006;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED_0100
     * @tc.desc   Test CE_ERR_FILE_OPERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_FILE_OPERATION_FAILED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300007;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX_0100
     * @tc.desc   Test CE_ERR_IN_DLP_SANDBOX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_IN_DLP_SANDBOX();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300008;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED_0100
     * @tc.desc   Test CE_ERR_IMAGE_PACKER_OPERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_IMAGE_PACKER_OPERATION_FAILED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300009;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED_0100
     * @tc.desc   Test CE_ERR_CLIENT_CALLBACK_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_CLIENT_CALLBACK_FAILED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300010;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT_0100
     * @tc.desc   Test CE_ERR_EXTENSION_ABNORMAL_EXIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_EXTENSION_ABNORMAL_EXIT();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300011;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH_0100
     * @tc.desc   Test CE_ERR_INVALID_LINKING_PATH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_INVALID_LINKING_PATH();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300012;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED_0100
     * @tc.desc   Test CE_ERR_CONNECT_LIMIT_EXCEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_CONNECT_LIMIT_EXCEED();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300013;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT_0100
     * @tc.desc   Test CE_ERR_FILE_NOT_GRANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_FILE_NOT_GRANT();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300014;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DISK_FULL_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DISK_FULL_0100
     * @tc.desc   Test CE_ERR_DISK_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DISK_FULL_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_DISK_FULL_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_DISK_FULL();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300015;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT_0100
     * @tc.desc   Test CE_ERR_EXTENSION_NOT_SUPPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedErrorCode_CE_ERR_EXTENSION_NOT_SUPPORT();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 35300016;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT_0100
     * @tc.desc   Test CE_CAPABILITY_SUPPORT_SNAPSHOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_SNAPSHOT();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 1 << 0;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT_0100
     * @tc.number SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT_0100
     * @tc.desc   Test CE_CAPABILITY_SUPPORT_DO_EDIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestContentEmbedCapabilityCode_CE_CAPABILITY_SUPPORT_DO_EDIT();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === 1 << 1;
      expect(expectResult).assertTrue();
    })
  })
};