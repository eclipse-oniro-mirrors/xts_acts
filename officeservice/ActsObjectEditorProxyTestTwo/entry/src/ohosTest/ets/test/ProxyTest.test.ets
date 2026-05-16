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
import { Driver,ON } from '@ohos.UiTest';

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

function msSleep(sleepMs: number): Promise<void> {
  return new Promise(resolve => {
    setTimeout(resolve, sleepMs);
  });
}

export default function proxyTest() {
  describe('ActsCapiProxyTwoTest', () => {
    beforeAll(async () => {
      await msSleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('getOEButtonId'));
      hilog.info(0x0000, 'testTag', 'beforeAll begin btn: %{public}s', JSON.stringify(btn));
      if (btn) {
        hilog.info(0x0000, 'testTag', 'beforeAll click btn: %{public}s', JSON.stringify(btn));
        btn.click();
      }
      await msSleep(6000);
      hilog.info(0x0000, 'testTag', 'beforeAll end btn: %{public}s', JSON.stringify(btn));
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100
     * @tc.desc   Test OH_ContentEmbed_GetFormatFromInfo with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatFromInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetIconFromFormat with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetIconFromFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with abnormal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0100',
      Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_Abnormal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_SYSTEM_ABNORMAL || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_SYSTEM_ABNORMAL ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetFileNameExtensionsFromFormat_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetFileNameExtensionsFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetFileNameExtensionsFromFormat with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetFileNameExtensionsFromFormat_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetFileNameExtensionsFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFileNameExtensionsFromFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100
     * @tc.desc   Test OH_ContentEmbed_DocumentRead with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentRead_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_TestStartWorkLimit_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_TestStartWorkLimit_0100
     * @tc.desc   Test OH_ContentEmbed TestStartWorkLimit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_TestStartWorkLimit_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_TestStartWorkLimit_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestStartWorkLimit();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_CONNECT_LIMIT_EXCEED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_TestProxyStartWork_Error_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_TestProxyStartWork_Error_0100
     * @tc.desc   Test OH_ContentEmbed TestProxyStartWork_Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_TestProxyStartWork_Error_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_TestProxyStartWork_Error_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_Error();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_SYSTEM_ABNORMAL || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_DocumentGetStream_Empty_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_DocumentGetStream_Empty_0100
     * @tc.desc   Test OH_ContentEmbed_DocumentGetStream_Empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_DocumentGetStream_Empty_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_DocumentGetStream_Empty_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetStream_Empty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_DocumentDeleteEntry_Empty_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_DocumentDeleteEntry_Empty_0100
     * @tc.desc   Test OH_ContentEmbed_DocumentDeleteEntry_Empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_DocumentDeleteEntry_Empty_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_DocumentDeleteEntry_Empty_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentDeleteEntry_Empty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_DocumentGetOEid_Empty_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_DocumentGetOEid_Empty_0100
     * @tc.desc   Test OH_ContentEmbed_DocumentGetOEid_Empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_DocumentGetOEid_Empty_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_DocumentGetOEid_Empty_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentGetOEid_Empty();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_PARAM_INVALID || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })
  })
}
