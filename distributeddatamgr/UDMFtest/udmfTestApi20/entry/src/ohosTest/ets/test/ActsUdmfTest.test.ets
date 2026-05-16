/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'

const UDMF_E_INVALID_PARAM = 20400001;
const UDMF_E_OK = 0;
const UDMF_ERR = 20400000;

export default function ActsUdmfTest() {
  describe('ActsUdmfTest', () => {
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecordProvider_Destroy_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecordProvider_Destroy_0100
     * @tc.desc   test OH_UdmfRecordProvider_Destroy Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecordProvider_Destroy_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecordProvider_Destroy_0100 start====");
          let result: number = testNapi.testDestroyInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecordProvider_Destroy_0100 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecordProvider_Destroy_0100 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0200
     * @tc.desc   test OH_UdmfRecord_AddFileUri Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0200 start====");
          let result: number = testNapi.testAddFileUriInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0200 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0200 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0300
     * @tc.desc   test OH_UdmfRecord_AddFileUri Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0300 start====");
          let result: number = testNapi.testAddFileUriSuccess();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0300 result====", result);
          expect(result).assertEqual(UDMF_E_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddFileUri_0300 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0400
     * @tc.desc   test OH_UdmfRecord_AddPixelMap Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0400 start====");
          let result: number = testNapi.testAddPixelMapInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0400 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0400 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0500
     * @tc.desc   test OH_UdmfRecord_AddPixelMap Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0500 start====");
          let result: number = testNapi.testAddPixelMapSuccess();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0500 result====", result);
          expect(result).assertEqual(UDMF_E_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_AddPixelMap_0500 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetGeneralEntry_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetGeneralEntry_0600
     * @tc.desc   test OH_UdmfRecord_GetGeneralEntry Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetGeneralEntry_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetGeneralEntry_0600 start====");
          let result: number = testNapi.testGetGeneralEntryInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetGeneralEntry_0600 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetGeneralEntry_0600 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetPlainText_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetPlainText_0700
     * @tc.desc   test OH_UdmfRecord_GetPlainText Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetPlainText_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetPlainText_0700 start====");
          let result: number = testNapi.testGetPlainTextError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetPlainText_0700 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetPlainText_0700 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHyperlink_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHyperlink_0800
     * @tc.desc   test OH_UdmfRecord_GetHyperlink Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHyperlink_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHyperlink_0800 start====");
          let result: number = testNapi.testGetHyperlinkError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHyperlink_0800 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHyperlink_0800 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHtml_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHtml_0900
     * @tc.desc   test OH_UdmfRecord_GetHtml Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHtml_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHtml_0900 start====");
          let result: number = testNapi.testGetHtmlError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHtml_0900 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetHtml_0900 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1000
     * @tc.desc   test OH_UdmfRecord_GetAppItem Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1000 start====");
          let result: number = testNapi.testGetAppItemInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1000 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1000 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1100
     * @tc.desc   test OH_UdmfRecord_GetAppItem Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1100 start====");
          let result: number = testNapi.testGetAppItemError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1100 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_GetAppItem_1100 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_SetProvider_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_SetProvider_1200
     * @tc.desc   test OH_UdmfRecord_SetProvider Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_SetProvider_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_SetProvider_1200 start====");
          let result: number = testNapi.testSetProviderInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_SetProvider_1200 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfRecord_SetProvider_1200 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_GetVisibility_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_GetVisibility_1300
     * @tc.desc   test OH_UdmfOptions_GetVisibility Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_GetVisibility_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_GetVisibility_1300 start====");
          let result: number = testNapi.testGetVisibilitySuccess();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_GetVisibility_1300 result====", result);
          expect(result).assertEqual(UDMF_E_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_GetVisibility_1300 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1400
     * @tc.desc   test OH_UdmfOptions_SetVisibility Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1400 start====");
          let result: number = testNapi.testSetVisibilityInvalidParam();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1400 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1400 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1500
     * @tc.desc   test OH_UdmfOptions_SetVisibility Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1500 start====");
          let result: number = testNapi.testSetVisibilitySuccess();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1500 result====", result);
          expect(result).assertEqual(UDMF_E_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_UdmfOptions_SetVisibility_1500 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedData_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedData_1600
     * @tc.desc   test OH_Udmf_GetUnifiedData Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedData_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedData_1600 start====");
          let result: number = testNapi.testGetUnifiedDataError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedData_1600 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedData_1600 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedDataByOptions_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedDataByOptions_1700
     * @tc.desc   test OH_Udmf_GetUnifiedDataByOptions Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedDataByOptions_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedDataByOptions_1700 start====");
          let result: number = testNapi.testGetUnifiedDataByOptionsError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedDataByOptions_1700 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_GetUnifiedDataByOptions_1700 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_Udmf_SetUnifiedData_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_Udmf_SetUnifiedData_1800
     * @tc.desc   test OH_Udmf_SetUnifiedData Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_Udmf_SetUnifiedData_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_SetUnifiedData_1800 start====");
          let result: number = testNapi.testSetUnifiedDataError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_SetUnifiedData_1800 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_SetUnifiedData_1800 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_Udmf_UpdateUnifiedData_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_Udmf_UpdateUnifiedData_1900
     * @tc.desc   test OH_Udmf_UpdateUnifiedData Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_Udmf_UpdateUnifiedData_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_UpdateUnifiedData_1900 start====");
          let result: number = testNapi.testUpdateUnifiedDataError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_UpdateUnifiedData_1900 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_UpdateUnifiedData_1900 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_OH_Udmf_DeleteUnifiedData_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_OH_Udmf_DeleteUnifiedData_2000
     * @tc.desc   test OH_Udmf_DeleteUnifiedData Test Internal Data Error Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_OH_Udmf_DeleteUnifiedData_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_DeleteUnifiedData_2000 start====");
          let result: number = testNapi.testDeleteUnifiedDataError();
          console.info("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_DeleteUnifiedData_2000 result====", result);
          expect(result).assertEqual(UDMF_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_OH_Udmf_DeleteUnifiedData_2000 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMF_ALL_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMF_ALL_2100
     * @tc.desc   Test the scenario of enumeration value UDMF_ALL of data visibility level.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMF_ALL_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_UDMF_ALL_2100 start====");
          let result = testNapi.testUdmfOptionsGetVisibilityAll();
          console.info("====>SUB_DistributedData_UDMF_SDK_UDMF_ALL_2100 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_UDMF_ALL_2100 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMF_OWN_PROCESS_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMF_OWN_PROCESS_2200
     * @tc.desc   Test the scenario of enumeration value UDMF_OWN_PROCESS of data visibility level.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMF_OWN_PROCESS_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDMF_SDK_UDMF_OWN_PROCESS_2200 start====");
          let result = testNapi.testUdmfOptionsGetVisibilityProcess();
          console.info("====>SUB_DistributedData_UDMF_SDK_UDMF_OWN_PROCESS_2200 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_DistributedData_UDMF_SDK_UDMF_OWN_PROCESS_2200 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDS_SDK_OH_UdsPixelMap_SetPixelMap_2300
     * @tc.number SUB_DistributedData_UDS_SDK_OH_UdsPixelMap_SetPixelMap_2300
     * @tc.desc   test OH_UdsPixelMap_SetPixelMap Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDS_SDK_OH_UdsPixelMap_SetPixelMap_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDS_SDK_OH_UdsPixelMap_SetPixelMap_2300 start====");
          let result: number = testNapi.testSetPixelMapInvalidParam();
          console.info("====>SUB_DistributedData_UDS_SDK_OH_UdsPixelMap_SetPixelMap_2300 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDS_SDK_OH_UdsPixelMap_SetPixelMap_2300 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_Destroy_2400
     * @tc.number SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_Destroy_2400
     * @tc.desc   test OH_UdsArrayBuffer_Destroy Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_Destroy_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_Destroy_2400 start====");
          let result: number = testNapi.testArrBufferDestroyInvalidParam();
          console.info("====>SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_Destroy_2400 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_Destroy_2400 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_GetData_2500
     * @tc.number SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_GetData_2500
     * @tc.desc   test OH_UdsArrayBuffer_GetData Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_GetData_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_GetData_2500 start====");
          let result: number = testNapi.testGetDataInvalidParam();
          console.info("====>SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_GetData_2500 result====", result);
          expect(result).assertEqual(UDMF_E_INVALID_PARAM);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_UDS_SDK_OH_UdsArrayBuffer_GetData_2500 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_2600
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_2600
     * @tc.desc   test OH_UdmfProgressInfo_GetStatus return UDMF_FINISHED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2600 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2600 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_2600 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_2700
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_2700
     * @tc.desc   test UDMF_FINISHED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2700 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2700 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_2700 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_2800
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_2800
     * @tc.desc   test UDMF_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2800 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2800 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_2800 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_2900
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_2900
     * @tc.desc   test UDMF_CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2900 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_2900 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_2900 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_3000
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_3000
     * @tc.desc   test UDMF_INNER_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3000 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3000 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_3000 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_3100
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_3100
     * @tc.desc   test UDMF_INVALID_PARAMETERS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3100 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3100 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_3100 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_3200
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_3200
     * @tc.desc   test UDMF_DATA_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3200 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3200 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_3200 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_3300
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_3300
     * @tc.desc   test UDMF_SYNC_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3300 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3300 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_3300 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_UdmfProgressInfo_GetStatus_3400
     * @tc.number SUB_OH_UdmfProgressInfo_GetStatus_3400
     * @tc.desc   test UDMF_COPY_FILE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_UdmfProgressInfo_GetStatus_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3400 start====");
          let result: number = testNapi.testUdmfProgressInfoGetStatus();
          console.info("====>SUB_OH_UdmfProgressInfo_GetStatus_3400 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_UdmfProgressInfo_GetStatus_3400 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_Udmf_FileConflictOptions_3500
     * @tc.number SUB_OH_Udmf_FileConflictOptions_3500
     * @tc.desc   test UDMF_SKIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Udmf_FileConflictOptions_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Udmf_FileConflictOptions_3500 start====");
          let result: number = testNapi.testUdmfSkip();
          console.info("====>SUB_OH_Udmf_FileConflictOptions_3500 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Udmf_FileConflictOptions_3500 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_OH_Udmf_ProgressIndicator_3600
     * @tc.number SUB_OH_Udmf_ProgressIndicator_3600
     * @tc.desc   test UDMF_SKIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Udmf_ProgressIndicator_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Udmf_ProgressIndicator_3600 start====");
          let result: number = testNapi.testUdmfSkip();
          console.info("====>SUB_OH_Udmf_ProgressIndicator_3600 result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Udmf_ProgressIndicator_3600 catch err: " + err);
        }
      })

  })
}
