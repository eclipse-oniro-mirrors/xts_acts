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
const CE_PERMISSION_DENIED : number = 201;
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

export default function proxyTest() {
  describe('ActsCapiProxyTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_TestCreateContentEmbedInfo_0100
     * @tc.desc   Test OH_ContentEmbed_CreateContentEmbedInfo with null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateContentEmbedInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateContentEmbedInfo_NullInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateContentEmbedInfo_0200
     * @tc.number SUB_Object_Editor_TestCreateContentEmbedInfo_0200
     * @tc.desc   Test OH_ContentEmbed_CreateContentEmbedInfo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateContentEmbedInfo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateContentEmbedInfo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateContentEmbedInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_TestDestroyContentEmbedInfo_0100
     * @tc.desc   Test OH_ContentEmbed_DestroyContentEmbedInfo with null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyContentEmbedInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDestroyContentEmbedInfo_NullInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyContentEmbedInfo_0200
     * @tc.number SUB_Object_Editor_TestDestroyContentEmbedInfo_0200
     * @tc.desc   Test OH_ContentEmbed_DestroyContentEmbedInfo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyContentEmbedInfo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyContentEmbedInfo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDestroyContentEmbedInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_TestGetContentEmbedInfo_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with null locale and null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_NullLocaleNullInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedInfo_0200
     * @tc.number SUB_Object_Editor_TestGetContentEmbedInfo_0200
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedInfo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedInfo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_NullInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedInfo_0300
     * @tc.number SUB_Object_Editor_TestGetContentEmbedInfo_0300
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with empty locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedInfo_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedInfo_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_EmptyLocal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedInfo_0400
     * @tc.number SUB_Object_Editor_TestGetContentEmbedInfo_0400
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with invalid locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedInfo_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedInfo_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_LocaleInvalid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedInfo_0500
     * @tc.number SUB_Object_Editor_TestGetContentEmbedInfo_0500
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedInfo_0500', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedInfo_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatCountFromInfo_0100
     * @tc.number SUB_Object_Editor_TestGetFormatCountFromInfo_0100
     * @tc.desc   Test OH_ContentEmbed_GetFormatCountFromInfo with null info and null count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatCountFromInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatCountFromInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatCountFromInfo_NullInfoNullCount();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatCountFromInfo_0200
     * @tc.number SUB_Object_Editor_TestGetFormatCountFromInfo_0200
     * @tc.desc   Test OH_ContentEmbed_GetFormatCountFromInfo with null count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatCountFromInfo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatCountFromInfo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatCountFromInfo_NullCount();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatCountFromInfo_0300
     * @tc.number SUB_Object_Editor_TestGetFormatCountFromInfo_0300
     * @tc.desc   Test OH_ContentEmbed_GetFormatCountFromInfo with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatCountFromInfo_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatCountFromInfo_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatCountFromInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatFromInfo_0100
     * @tc.number SUB_Object_Editor_TestGetFormatFromInfo_0100
     * @tc.desc   Test OH_ContentEmbed_GetFormatFromInfo with null info and null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatFromInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatFromInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatFromInfo_NullInfoNullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatFromInfo_0200
     * @tc.number SUB_Object_Editor_TestGetFormatFromInfo_0200
     * @tc.desc   Test OH_ContentEmbed_GetFormatFromInfo with null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatFromInfo_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatFromInfo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatFromInfo_NullInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatFromInfo_0300
     * @tc.number SUB_Object_Editor_TestGetFormatFromInfo_0300
     * @tc.desc   Test OH_ContentEmbed_GetFormatFromInfo with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatFromInfo_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatFromInfo_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatFromInfo_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatFromInfo_0400
     * @tc.number SUB_Object_Editor_TestGetFormatFromInfo_0400
     * @tc.desc   Test OH_ContentEmbed_GetFormatFromInfo with index out of range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatFromInfo_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatFromInfo_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatFromInfo_IndexOutOfRange();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFormatCountFromInfo_0400
     * @tc.number SUB_Object_Editor_TestGetFormatCountFromInfo_0400
     * @tc.desc   Test OH_ContentEmbed_GetFormatCountFromInfo with null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFormatCountFromInfo_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFormatCountFromInfo_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatCountFromInfo_NullInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateContentEmbedFormat_0100
     * @tc.number SUB_Object_Editor_TestCreateContentEmbedFormat_0100
     * @tc.desc   Test OH_ContentEmbed_CreateContentEmbedFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateContentEmbedFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateContentEmbedFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateContentEmbedFormat_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateContentEmbedFormat_0200
     * @tc.number SUB_Object_Editor_TestCreateContentEmbedFormat_0200
     * @tc.desc   Test OH_ContentEmbed_CreateContentEmbedFormat with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateContentEmbedFormat_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateContentEmbedFormat_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateContentEmbedFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyContentEmbedFormat_0100
     * @tc.number SUB_Object_Editor_TestDestroyContentEmbedFormat_0100
     * @tc.desc   Test OH_ContentEmbed_DestroyContentEmbedFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyContentEmbedFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyContentEmbedFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDestroyContentEmbedFormat_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyContentEmbedFormat_0200
     * @tc.number SUB_Object_Editor_TestDestroyContentEmbedFormat_0200
     * @tc.desc   Test OH_ContentEmbed_DestroyContentEmbedFormat with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyContentEmbedFormat_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyContentEmbedFormat_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDestroyContentEmbedFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0100
     * @tc.number SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with null OEid, null locale and null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEidNullLocaleNullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0200
     * @tc.number SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0200
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with null OEid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0300
     * @tc.number SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0300
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0400
     * @tc.number SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0400
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with null locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0500
     * @tc.number SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0500
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with empty OEid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0500', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0600
     * @tc.number SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0600
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with empty locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0600', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetContentEmbedFormatByOEidAndLocale_0600';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetOEidFromFormat_0100
     * @tc.number SUB_Object_Editor_TestGetOEidFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetOEidFromFormat with null format and null OEid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetOEidFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetOEidFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetOEidFromFormat_NullFormatNullOEid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetOEidFromFormat_0200
     * @tc.number SUB_Object_Editor_TestGetOEidFromFormat_0200
     * @tc.desc   Test OH_ContentEmbed_GetOEidFromFormat with null OEid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetOEidFromFormat_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetOEidFromFormat_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetOEidFromFormat_NullOEid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetOEidFromFormat_0300
     * @tc.number SUB_Object_Editor_TestGetOEidFromFormat_0300
     * @tc.desc   Test OH_ContentEmbed_GetOEidFromFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetOEidFromFormat_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetOEidFromFormat_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetOEidFromFormat_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetOEidFromFormat_0400
     * @tc.number SUB_Object_Editor_TestGetOEidFromFormat_0400
     * @tc.desc   Test OH_ContentEmbed_GetOEidFromFormat with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetOEidFromFormat_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetOEidFromFormat_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetOEidFromFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0100
     * @tc.number SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetNameAndDescriptionFromFormat with null format, null name and null description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetNameAndDescriptionFromFormat_NullFormatNullNameNullDescription();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0200
     * @tc.number SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0200
     * @tc.desc   Test OH_ContentEmbed_GetNameAndDescriptionFromFormat with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetNameAndDescriptionFromFormat_NullName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0300
     * @tc.number SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0300
     * @tc.desc   Test OH_ContentEmbed_GetNameAndDescriptionFromFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetNameAndDescriptionFromFormat_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0400
     * @tc.number SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0400
     * @tc.desc   Test OH_ContentEmbed_GetNameAndDescriptionFromFormat with null description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetNameAndDescriptionFromFormat_NullDescription();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0500
     * @tc.number SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0500
     * @tc.desc   Test OH_ContentEmbed_GetNameAndDescriptionFromFormat with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0500', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetNameAndDescriptionFromFormat_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetNameAndDescriptionFromFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetIconFromFormat_0100
     * @tc.number SUB_Object_Editor_TestGetIconFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetIconFromFormat with null format and null icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetIconFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetIconFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetIconFromFormat_NullFormatNullIcon();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetIconFromFormat_0200
     * @tc.number SUB_Object_Editor_TestGetIconFromFormat_0200
     * @tc.desc   Test OH_ContentEmbed_GetIconFromFormat with null icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetIconFromFormat_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetIconFromFormat_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetIconFromFormat_NullIcon();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetIconFromFormat_0300
     * @tc.number SUB_Object_Editor_TestGetIconFromFormat_0300
     * @tc.desc   Test OH_ContentEmbed_GetIconFromFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetIconFromFormat_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetIconFromFormat_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetIconFromFormat_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetIconFromFormat_0400
     * @tc.number SUB_Object_Editor_TestGetIconFromFormat_0400
     * @tc.desc   Test OH_ContentEmbed_GetIconFromFormat with empty format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetIconFromFormat_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetIconFromFormat_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetIconFromFormat_EmptyFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0100
     * @tc.number SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetFileNameExtensionsFromFormat with null parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFileNameExtensionsFromFormat_NullFormatNullCount();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0200
     * @tc.number SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0200
     * @tc.desc   Test OH_ContentEmbed_GetFileNameExtensionsFromFormat with null format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFileNameExtensionsFromFormat_NullFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0300
     * @tc.number SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0300
     * @tc.desc   Test OH_ContentEmbed_GetFileNameExtensionsFromFormat with null count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFileNameExtensionsFromFormat_NullCount();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0400
     * @tc.number SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0400
     * @tc.desc   Test OH_ContentEmbed_GetFileNameExtensionsFromFormat with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetFileNameExtensionsFromFormat_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFileNameExtensionsFromFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateExtensionProxy_0100
     * @tc.number SUB_Object_Editor_TestCreateExtensionProxy_0100
     * @tc.desc   Test OH_ContentEmbed_CreateExtensionProxy with null document, null proxy and null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateExtensionProxy_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateExtensionProxy_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateExtensionProxy_NullDocumentNullProxyNullContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateExtensionProxy_0200
     * @tc.number SUB_Object_Editor_TestCreateExtensionProxy_0200
     * @tc.desc   Test OH_ContentEmbed_CreateExtensionProxy with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateExtensionProxy_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateExtensionProxy_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateExtensionProxy_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateExtensionProxy_0300
     * @tc.number SUB_Object_Editor_TestCreateExtensionProxy_0300
     * @tc.desc   Test OH_ContentEmbed_CreateExtensionProxy with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateExtensionProxy_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateExtensionProxy_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateExtensionProxy_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateExtensionProxy_0400
     * @tc.number SUB_Object_Editor_TestCreateExtensionProxy_0400
     * @tc.desc   Test OH_ContentEmbed_CreateExtensionProxy with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateExtensionProxy_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateExtensionProxy_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateExtensionProxy_NullContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestCreateExtensionProxy_0500
     * @tc.number SUB_Object_Editor_TestCreateExtensionProxy_0500
     * @tc.desc   Test OH_ContentEmbed_CreateExtensionProxy with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestCreateExtensionProxy_0500', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestCreateExtensionProxy_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyCreateExtensionProxy_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyExtensionProxy_0100
     * @tc.number SUB_Object_Editor_TestDestroyExtensionProxy_0100
     * @tc.desc   Test OH_ContentEmbed_DestroyExtensionProxy with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyExtensionProxy_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyExtensionProxy_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDestroyExtensionProxy_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDestroyExtensionProxy_0200
     * @tc.number SUB_Object_Editor_TestDestroyExtensionProxy_0200
     * @tc.desc   Test OH_ContentEmbed_DestroyExtensionProxy with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDestroyExtensionProxy_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDestroyExtensionProxy_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDestroyExtensionProxy_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnUpdateFunc_0100
     * @tc.number SUB_Object_Editor_TestRegisterOnUpdateFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnUpdateFunc with null proxy and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnUpdateFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnUpdateFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnUpdateFunc_NullProxyNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnUpdateFunc_0200
     * @tc.number SUB_Object_Editor_TestRegisterOnUpdateFunc_0200
     * @tc.desc   Test OH_ContentEmbed_RegisterOnUpdateFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnUpdateFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnUpdateFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnUpdateFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnUpdateFunc_0300
     * @tc.number SUB_Object_Editor_TestRegisterOnUpdateFunc_0300
     * @tc.desc   Test OH_ContentEmbed_RegisterOnUpdateFunc with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnUpdateFunc_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnUpdateFunc_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnUpdateFunc_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnUpdateFunc_0400
     * @tc.number SUB_Object_Editor_TestRegisterOnUpdateFunc_0400
     * @tc.desc   Test OH_ContentEmbed_RegisterOnUpdateFunc with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnUpdateFunc_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnUpdateFunc_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnUpdateFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnErrorFunc_0100
     * @tc.number SUB_Object_Editor_TestRegisterOnErrorFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnErrorFunc with null proxy and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnErrorFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnErrorFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnErrorFunc_NullProxyNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnErrorFunc_0200
     * @tc.number SUB_Object_Editor_TestRegisterOnErrorFunc_0200
     * @tc.desc   Test OH_ContentEmbed_RegisterOnErrorFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnErrorFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnErrorFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnErrorFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnErrorFunc_0300
     * @tc.number SUB_Object_Editor_TestRegisterOnErrorFunc_0300
     * @tc.desc   Test OH_ContentEmbed_RegisterOnErrorFunc with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnErrorFunc_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnErrorFunc_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnErrorFunc_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnErrorFunc_0400
     * @tc.number SUB_Object_Editor_TestRegisterOnErrorFunc_0400
     * @tc.desc   Test OH_ContentEmbed_RegisterOnErrorFunc with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnErrorFunc_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnErrorFunc_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnErrorFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0100
     * @tc.number SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnEditingFinishedFunc with null proxy and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnEditingFinishedFunc_NullProxyNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0200
     * @tc.number SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0200
     * @tc.desc   Test OH_ContentEmbed_RegisterOnEditingFinishedFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnEditingFinishedFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0300
     * @tc.number SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0300
     * @tc.desc   Test OH_ContentEmbed_RegisterOnEditingFinishedFunc with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnEditingFinishedFunc_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0400
     * @tc.number SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0400
     * @tc.desc   Test OH_ContentEmbed_RegisterOnEditingFinishedFunc with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnEditingFinishedFunc_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnEditingFinishedFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0100
     * @tc.number SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnExtensionStoppedFunc with null proxy and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnExtensionStoppedFunc_NullProxyNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0200
     * @tc.number SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0200
     * @tc.desc   Test OH_ContentEmbed_RegisterOnExtensionStoppedFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnExtensionStoppedFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0300
     * @tc.number SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0300
     * @tc.desc   Test OH_ContentEmbed_RegisterOnExtensionStoppedFunc with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnExtensionStoppedFunc_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0400
     * @tc.number SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0400
     * @tc.desc   Test OH_ContentEmbed_RegisterOnExtensionStoppedFunc with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestRegisterOnExtensionStoppedFunc_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyRegisterOnExtensionStoppedFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStartWork_0100
     * @tc.number SUB_Object_Editor_TestStartWork_0100
     * @tc.desc   Test OH_ContentEmbed_StartWork with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStartWork_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStartWork_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStartWork_0200
     * @tc.number SUB_Object_Editor_TestStartWork_0200
     * @tc.desc   Test OH_ContentEmbed_StartWork with unregistered proxy callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStartWork_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStartWork_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_ProxyCallbackUnregister();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStartWork_0300
     * @tc.number SUB_Object_Editor_TestStartWork_0300
     * @tc.desc   Test OH_ContentEmbed_StartWork with connection failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStartWork_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStartWork_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_ConnectFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_PERMISSION_DENIED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStopWork_0100
     * @tc.number SUB_Object_Editor_TestStopWork_0100
     * @tc.desc   Test OH_ContentEmbed_StopWork with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStopWork_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStopWork_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStopWork_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestStopWork_0200
     * @tc.number SUB_Object_Editor_TestStopWork_0200
     * @tc.desc   Test OH_ContentEmbed_StopWork with disconnect failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestStopWork_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestStopWork_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStopWork_DisConnectFailed();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_SYSTEM_ABNORMAL;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetSnapshot_0100
     * @tc.number SUB_Object_Editor_TestGetSnapshot_0100
     * @tc.desc   Test OH_ContentEmbed_GetSnapshot with null proxy and null snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetSnapshot_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetSnapshot_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_NullProxyNullSnapshot();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetSnapshot_0200
     * @tc.number SUB_Object_Editor_TestGetSnapshot_0200
     * @tc.desc   Test OH_ContentEmbed_GetSnapshot with null snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetSnapshot_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetSnapshot_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_NullSnapshot();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetSnapshot_0300
     * @tc.number SUB_Object_Editor_TestGetSnapshot_0300
     * @tc.desc   Test OH_ContentEmbed_GetSnapshot with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetSnapshot_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetSnapshot_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestDoEdit_0100
     * @tc.number SUB_Object_Editor_TestDoEdit_0100
     * @tc.desc   Test OH_ContentEmbed_DoEdit with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestDoEdit_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestDoEdit_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetEditStatus_0100
     * @tc.number SUB_Object_Editor_TestGetEditStatus_0100
     * @tc.desc   Test OH_ContentEmbed_GetEditStatus with null proxy, null isEditing and null isModified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetEditStatus_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetEditStatus_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_NullProxyNullIsEditingNullIsModified();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetEditStatus_0200
     * @tc.number SUB_Object_Editor_TestGetEditStatus_0200
     * @tc.desc   Test OH_ContentEmbed_GetEditStatus with null isEditing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetEditStatus_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetEditStatus_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_NullIsEditing();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetEditStatus_0300
     * @tc.number SUB_Object_Editor_TestGetEditStatus_0300
     * @tc.desc   Test OH_ContentEmbed_GetEditStatus with null isModified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetEditStatus_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetEditStatus_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_NullIsModified();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetEditStatus_0400
     * @tc.number SUB_Object_Editor_TestGetEditStatus_0400
     * @tc.desc   Test OH_ContentEmbed_GetEditStatus with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetEditStatus_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetEditStatus_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetCapability_0100
     * @tc.number SUB_Object_Editor_TestGetCapability_0100
     * @tc.desc   Test OH_ContentEmbed_GetCapability with null proxy and null bitmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetCapability_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetCapability_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_NullProxyNullBitmask();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetCapability_0200
     * @tc.number SUB_Object_Editor_TestGetCapability_0200
     * @tc.desc   Test OH_ContentEmbed_GetCapability with null bitmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetCapability_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetCapability_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_NullBitmask();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetCapability_0300
     * @tc.number SUB_Object_Editor_TestGetCapability_0300
     * @tc.desc   Test OH_ContentEmbed_GetCapability with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetCapability_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetCapability_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetDocument_0100
     * @tc.number SUB_Object_Editor_TestGetDocument_0100
     * @tc.desc   Test OH_ContentEmbed_GetDocument with null proxy and null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetDocument_NullProxyNullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetDocument_0200
     * @tc.number SUB_Object_Editor_TestGetDocument_0200
     * @tc.desc   Test OH_ContentEmbed_GetDocument with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetDocument_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetDocument_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetDocument_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetDocument_0300
     * @tc.number SUB_Object_Editor_TestGetDocument_0300
     * @tc.desc   Test OH_ContentEmbed_GetDocument with null proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetDocument_0300', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetDocument_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetDocument_NullProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestGetDocument_0400
     * @tc.number SUB_Object_Editor_TestGetDocument_0400
     * @tc.desc   Test OH_ContentEmbed_GetDocument with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestGetDocument_0400', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestGetDocument_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetDocument_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })
  })
}
