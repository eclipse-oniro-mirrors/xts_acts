/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import testNapi from 'libUdsNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';

const TAG = "[ UdsNdkTest ] ------ ";

export default function UdsNdkTest() {
  describe('UdsNdkTest', async () => {
    beforeAll(async () => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    // PlainText =======================================================
    /**
     * @tc.name   OH_UdsPlainText_Create_0100
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0100
     * @tc.desc   OH_UdsPlainText_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_Create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_Create_0100');
      let data = testNapi.OH_UdsPlainText_Create_0100();
      console.info(TAG + 'OH_UdsPlainText_Create_0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsPlainText_Destroy_0100
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0200
     * @tc.desc   OH_UdsPlainText_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_Destroy_0100');
      let data = testNapi.OH_UdsPlainText_Destroy_0100();
      console.info(TAG + 'OH_UdsPlainText_Destroy_0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsPlainText_GetType_0100
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0300
     * @tc.desc   OH_UdsPlainText_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_GetType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_GetType_0100');
      let data = testNapi.OH_UdsPlainText_GetType_0100();
      console.info(TAG + 'OH_UdsPlainText_GetType_0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsPlainText_SetContent_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0400
     * @tc.desc   OH_UdsPlainText_SetContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_SetContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_SetContent_001');
      let data = testNapi.OH_UdsPlainText_SetContent_001();
      console.info(TAG + 'OH_UdsPlainText_SetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsPlainText_GetContent_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0500
     * @tc.desc   OH_UdsPlainText_GetContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_GetContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_GetContent_001');
      let data = testNapi.OH_UdsPlainText_GetContent_001();
      console.info(TAG + 'OH_UdsPlainText_GetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsPlainText_SetAbstract_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0600
     * @tc.desc   OH_UdsPlainText_SetAbstract
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_SetAbstract_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_SetAbstract_001');
      let data = testNapi.OH_UdsPlainText_SetAbstract_001();
      console.info(TAG + 'OH_UdsPlainText_SetAbstract_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsPlainText_GetAbstract_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0700
     * @tc.desc   OH_UdsPlainText_GetAbstract
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_GetAbstract_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_GetAbstract_001');
      let data = testNapi.OH_UdsPlainText_GetAbstract_001();
      console.info(TAG + 'OH_UdsPlainText_GetAbstract_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    // 2. Hyperlink ========================================================
    /**
     * @tc.name   OH_UdsHyperlink_Create_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0800
     * @tc.desc   OH_UdsHyperlink_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_Create_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_Create_001');
      let data = testNapi.OH_UdsHyperlink_Create_001();
      console.info(TAG + 'OH_UdsHyperlink_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHyperlink_Destroy_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0900
     * @tc.desc   OH_UdsHyperlink_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_Destroy_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_Destroy_001');
      let data = testNapi.OH_UdsHyperlink_Destroy_001();
      console.info(TAG + 'OH_UdsHyperlink_Destroy_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHyperlink_GetType_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1000
     * @tc.desc   OH_UdsHyperlink_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_GetType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_GetType_001');
      let data = testNapi.OH_UdsHyperlink_GetType_001();
      console.info(TAG + 'OH_UdsHyperlink_GetType_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHyperlink_SetUrl_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1100
     * @tc.desc   OH_UdsHyperlink_SetUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_SetUrl_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_SetUrl_001');
      let data = testNapi.OH_UdsHyperlink_SetUrl_001();
      console.info(TAG + 'OH_UdsHyperlink_SetUrl_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHyperlink_GetUrl_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1200
     * @tc.desc   OH_UdsHyperlink_GetUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_GetUrl_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_GetUrl_001');
      let data = testNapi.OH_UdsHyperlink_GetUrl_001();
      console.info(TAG + 'OH_UdsHyperlink_GetUrl_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHyperlink_SetDescription_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1300
     * @tc.desc   OH_UdsHyperlink_SetDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_SetDescription_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_SetDescription_001');
      let data = testNapi.OH_UdsHyperlink_SetDescription_001();
      console.info(TAG + 'OH_UdsHyperlink_SetDescription_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHyperlink_GetDescription_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.desc   OH_UdsHyperlink_GetDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_GetDescription_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_GetDescription_001');
      let data = testNapi.OH_UdsHyperlink_GetDescription_001();
      console.info(TAG + 'OH_UdsHyperlink_GetDescription_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    // 3.html ========================================================
    /**
     * @tc.name   OH_UdsHtml_Create_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1500
     * @tc.desc   OH_UdsHtml_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_Create_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_Create_001');
      let data = testNapi.OH_UdsHtml_Create_001();
      console.info(TAG + 'OH_UdsHtml_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHtml_Destroy_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1600
     * @tc.desc   OH_UdsHtml_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_Destroy_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_Destroy_001');
      let data = testNapi.OH_UdsHtml_Destroy_001();
      console.info(TAG + 'OH_UdsHtml_Destroy_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHtml_GetType_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1700
     * @tc.desc   OH_UdsHtml_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_GetType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_GetType_001');
      let data = testNapi.OH_UdsHtml_GetType_001();
      console.info(TAG + 'OH_UdsHtml_GetType_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHtml_SetContent_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1800
     * @tc.desc   OH_UdsHtml_SetContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_SetContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_SetContent_001');
      let data = testNapi.OH_UdsHtml_SetContent_001();
      console.info(TAG + 'OH_UdsHtml_SetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHtml_GetContent_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1900
     * @tc.desc   OH_UdsHtml_GetContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_GetContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_GetContent_001');
      let data = testNapi.OH_UdsHtml_GetContent_001();
      console.info(TAG + 'OH_UdsHtml_GetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHtml_SetPlainContent_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2000
     * @tc.desc   OH_UdsHtml_SetPlainContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_SetPlainContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_SetPlainContent_001');
      let data = testNapi.OH_UdsHtml_SetPlainContent_001();
      console.info(TAG + 'OH_UdsHtml_SetPlainContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsHtml_GetPlainContent_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2100
     * @tc.desc   OH_UdsHtml_GetPlainContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_GetPlainContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_GetPlainContent_001');
      let data = testNapi.OH_UdsHtml_GetPlainContent_001();
      console.info(TAG + 'OH_UdsHtml_GetPlainContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    // 4. AppItem ========================================================
    /**
     * @tc.name   OH_UdsAppItem_Create_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2200
     * @tc.desc   OH_UdsAppItem_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_Create_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_Create_001');
      let data = testNapi.OH_UdsAppItem_Create_001();
      console.info(TAG + 'OH_UdsAppItem_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_Destroy_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2300
     * @tc.desc   OH_UdsAppItem_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_Destroy_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_Destroy_001');
      let data = testNapi.OH_UdsAppItem_Destroy_001();
      console.info(TAG + 'OH_UdsAppItem_Destroy_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetType_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2400
     * @tc.desc   OH_UdsAppItem_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetType_001');
      let data = testNapi.OH_UdsAppItem_GetType_001();
      console.info(TAG + 'OH_UdsAppItem_GetType_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetId_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2500
     * @tc.desc   OH_UdsAppItem_SetId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetId_001');
      let data = testNapi.OH_UdsAppItem_SetId_001();
      console.info(TAG + 'OH_UdsAppItem_SetId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetId_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2600
     * @tc.desc   OH_UdsAppItem_GetId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetId_001');
      let data = testNapi.OH_UdsAppItem_GetId_001();
      console.info(TAG + 'OH_UdsAppItem_GetId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetName_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2700
     * @tc.desc   OH_UdsAppItem_SetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetName_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetName_001');
      let data = testNapi.OH_UdsAppItem_SetName_001();
      console.info(TAG + 'OH_UdsAppItem_SetName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetName_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2800
     * @tc.desc   OH_UdsAppItem_GetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetName_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetName_001');
      let data = testNapi.OH_UdsAppItem_GetName_001();
      console.info(TAG + 'OH_UdsAppItem_GetName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetIconId_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2900
     * @tc.desc   OH_UdsAppItem_SetIconId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetIconId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetIconId_001');
      let data = testNapi.OH_UdsAppItem_SetIconId_001();
      console.info(TAG + 'OH_UdsAppItem_SetIconId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetIconId_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3000
     * @tc.desc   OH_UdsAppItem_GetIconId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetIconId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetIconId_001');
      let data = testNapi.OH_UdsAppItem_GetIconId_001();
      console.info(TAG + 'OH_UdsAppItem_GetIconId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetLabelId_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3100
     * @tc.desc   OH_UdsAppItem_SetLabelId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetLabelId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetLabelId_001');
      let data = testNapi.OH_UdsAppItem_SetLabelId_001();
      console.info(TAG + 'OH_UdsAppItem_SetLabelId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetLabelId_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3200
     * @tc.desc   OH_UdsAppItem_GetLabelId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetLabelId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetLabelId_001');
      let data = testNapi.OH_UdsAppItem_GetLabelId_001();
      console.info(TAG + 'OH_UdsAppItem_GetLabelId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetBundleName_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3300
     * @tc.desc   OH_UdsAppItem_SetBundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetBundleName_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetBundleName_001');
      let data = testNapi.OH_UdsAppItem_SetBundleName_001();
      console.info(TAG + 'OH_UdsAppItem_SetBundleName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetBundleName_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3400
     * @tc.desc   OH_UdsAppItem_GetBundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetBundleName_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetBundleName_001');
      let data = testNapi.OH_UdsAppItem_GetBundleName_001();
      console.info(TAG + 'OH_UdsAppItem_GetBundleName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetAbilityName_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3500
     * @tc.desc   OH_UdsAppItem_SetAbilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetAbilityName_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetAbilityName_001');
      let data = testNapi.OH_UdsAppItem_SetAbilityName_001();
      console.info(TAG + 'OH_UdsAppItem_SetAbilityName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_GetAbilityName_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3600
     * @tc.desc   OH_UdsAppItem_GetAbilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_GetAbilityName_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_GetAbilityName_001');
      let data = testNapi.OH_UdsAppItem_GetAbilityName_001();
      console.info(TAG + 'OH_UdsAppItem_GetAbilityName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    
    //=====OH_UdsDetails=======================================
    /**
     * @tc.name   OH_UdsDetails_HasKey_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3700
     * @tc.desc   OH_UdsDetails_HasKey_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsDetails_HasKey_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsDetails_HasKey_001');
      let data = testNapi.OH_UdsDetails_HasKey_001();
      console.info(TAG + 'OH_UdsDetails_HasKey_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsDetails_Remove_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsDetails_Remove_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsDetails_Remove_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsDetails_Remove_001');
      let data = testNapi.OH_UdsDetails_Remove_001();
      console.info(TAG + 'OH_UdsDetails_Remove_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsDetails_Clear_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsDetails_Clear_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsDetails_Clear_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsDetails_Clear_001');
      let data = testNapi.OH_UdsDetails_Clear_001();
      console.info(TAG + 'OH_UdsDetails_Clear_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsDetails_SetValue_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsDetails_SetValue_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsDetails_SetValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsDetails_SetValue_001');
      let data = testNapi.OH_UdsDetails_SetValue_001();
      console.info(TAG + 'OH_UdsDetails_SetValue_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsDetails_GetValue_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsDetails_GetValue_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsDetails_GetValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsDetails_GetValue_001');
      let data = testNapi.OH_UdsDetails_GetValue_001();
      console.info(TAG + 'OH_UdsDetails_GetValue_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsDetails_GetAllKeys_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsDetails_GetAllKeys_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsDetails_GetAllKeys_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsDetails_GetAllKeys_001');
      let data = testNapi.OH_UdsDetails_GetAllKeys_001();
      console.info(TAG + 'OH_UdsDetails_GetAllKeys_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    
    /**
     * @tc.name   OH_UdsPlainText_SetDetails_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsPlainText_SetDetails_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPlainText_SetDetails_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPlainText_SetDetails_001');
      let data = testNapi.OH_UdsPlainText_SetDetails_001();
      console.info(TAG + 'OH_UdsPlainText_SetDetails_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });


    /**
     * @tc.name   OH_UdsHyperlink_SetDetails_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsHyperlink_SetDetails_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHyperlink_SetDetails_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHyperlink_SetDetails_001');
      let data = testNapi.OH_UdsHyperlink_SetDetails_001();
      console.info(TAG + 'OH_UdsHyperlink_SetDetails_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsHtml_SetDetails_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsHtml_SetDetails_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsHtml_SetDetails_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsHtml_SetDetails_001');
      let data = testNapi.OH_UdsHtml_SetDetails_001();
      console.info(TAG + 'OH_UdsHtml_SetDetails_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.name   OH_UdsAppItem_SetDetails_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsAppItem_SetDetails_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsAppItem_SetDetails_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsAppItem_SetDetails_001');
      let data = testNapi.OH_UdsAppItem_SetDetails_001();
      console.info(TAG + 'OH_UdsAppItem_SetDetails_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsFileUri_SetDetails_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsFileUri_SetDetails_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsFileUri_SetDetails_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsFileUri_SetDetails_001');
      let data = testNapi.OH_UdsFileUri_SetDetails_001();
      console.info(TAG + 'OH_UdsFileUri_SetDetails_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   OH_UdsPixelMap_SetDetails_001
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3800
     * @tc.desc   OH_UdsPixelMap_SetDetails_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UdsPixelMap_SetDetails_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdsPixelMap_SetDetails_001');
      let data = testNapi.OH_UdsPixelMap_SetDetails_001();
      console.info(TAG + 'OH_UdsPixelMap_SetDetails_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

  })
}