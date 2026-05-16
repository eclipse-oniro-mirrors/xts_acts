/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

export default function extensionTest() {
  describe('ActsCapiExtensionTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnCreateFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnCreateFunc_NullExtensionNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnCreateFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnCreateFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDestroyFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDestroyFunc_NullExtensionNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDestroyFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDestroyFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectAttachFunc_NullExtensionNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectAttachFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionUnRegisterOnObjectAttachFunc_NullExtension();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectDetachFunc_NullExtensionNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectDetachFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionUnRegisterOnObjectDetachFunc_NullExtension();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnWriteToDataStreamFunc_NullObjectNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnWriteToDataStreamFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetSnapshotFunc_NullObjectNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetSnapshotFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDoEditFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDoEditFunc_NullObjectNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDoEditFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDoEditFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetEditStatusFunc_NullObjectNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetEditStatusFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc with null extension and null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetCapabilityFunc_NullObjectNullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0200
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetCapabilityFunc_NullCallback();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContentEmbedContext_0100
     * @tc.number SUB_Object_Editor_ExtensionGetContentEmbedContext_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedContext with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContentEmbedContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContentEmbedContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedContext_NullExtension();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContentEmbedContext_0200
     * @tc.number SUB_Object_Editor_ExtensionGetContentEmbedContext_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedContext with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContentEmbedContext_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContentEmbedContext_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedContext_NullContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContext_0100
     * @tc.number SUB_Object_Editor_ExtensionGetContext_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContext with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContext_NullExtension();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContext_0200
     * @tc.number SUB_Object_Editor_ExtensionGetContext_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContext with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContext_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContext_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContext_NullContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetExtensionInstance_0100
     * @tc.number SUB_Object_Editor_ExtensionGetExtensionInstance_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetExtensionInstance with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetExtensionInstance_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetExtensionInstance_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetExtensionInstance_NullExtension();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetExtensionInstance_0200
     * @tc.number SUB_Object_Editor_ExtensionGetExtensionInstance_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_GetExtensionInstance with null instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetExtensionInstance_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetExtensionInstance_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetExtensionInstance_NullInstance();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100
     * @tc.number SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedDocument with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedDocument_NullObject();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContentEmbedDocument_0200
     * @tc.number SUB_Object_Editor_ExtensionGetContentEmbedDocument_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedDocument with null document
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContentEmbedDocument_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContentEmbedDocument_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedDocument_NullDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnUpdate with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnUpdate_NullObject();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnError_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnError_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnError with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnError_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnError_NullObject();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnEditingFinished with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnEditingFinished_NullObject();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnExtensionStopped with null extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnExtensionStopped_NullExtension();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionSetSnapshot_0100
     * @tc.number SUB_Object_Editor_ExtensionSetSnapshot_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_SetSnapshot with null extension and null pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionSetSnapshot_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionSetSnapshot_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionSetSnapshot_NullObject();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionSetSnapshot_0200
     * @tc.number SUB_Object_Editor_ExtensionSetSnapshot_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_SetSnapshot with null pixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionSetSnapshot_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionSetSnapshot_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionSetSnapshot_NullPixelMap();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0100
     * @tc.number SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextStartSelfUIAbility with null context and null want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbility_NullContextNullWant();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0200
     * @tc.number SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextStartSelfUIAbility with null want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionContextStartSelfUIAbility_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbility_NullWant();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0100
     * @tc.number SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextStartSelfUIAbilityWithStartOptions with null context, null want and null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbilityWithStartOptions_NullContextNullWantNullOptions();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0200
     * @tc.number SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0200
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextStartSelfUIAbilityWithStartOptions with null want and null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionContextStartSelfUIAbilityWithStartOptions_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbilityWithStartOptions_NullWantNullOptions();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionContextTerminateAbility_0100
     * @tc.number SUB_Object_Editor_ExtensionContextTerminateAbility_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextTerminateAbility with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionContextTerminateAbility_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionContextTerminateAbility_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextTerminateAbility_NullContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_DEVICE_NOT_SUPPORTED || result === CE_ERR_PARAM_INVALID;
      expect(expectResult).assertTrue();
    })

  })
}
