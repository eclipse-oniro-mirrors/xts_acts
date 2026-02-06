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
import testNapi from 'libUdmfNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { BusinessError } from '@kit.BasicServicesKit';
const TAG = "[ UdmfNdkTest ] ------ ";

export default function UdmfNdkTest() {
  describe('UdmfNdkTest', async () => {
    beforeAll(async () => {
    });
    beforeEach(async () => {
    });
    afterEach(async () => {
    });
    afterAll(async () => {
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0100
     * @tc.name OH_Udmf_CreatePropertiesFromUnifiedData001
     * @tc.desc OH_Udmf_CreatePropertiesFromUnifiedData
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_CreatePropertiesFromUnifiedData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info(TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001');
      let data = testNapi.OH_Udmf_CreatePropertiesFromUnifiedData001();
      console.info(TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0200
     * @tc.name OH_Udmf_SetPropertiesTag001
     * @tc.desc OH_Udmf_SetPropertiesTag
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesTag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesTag001');
      let data = testNapi.OH_Udmf_SetPropertiesTag001();
      console.info(TAG + 'OH_Udmf_SetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**======================================*/
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0300
     * @tc.name OH_Udmf_CreateUnifiedData001
     * @tc.desc OH_Udmf_CreateUnifiedData001
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_CreateUnifiedData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info(TAG + 'OH_Udmf_CreateUnifiedData001');
      let data = testNapi.OH_Udmf_CreateUnifiedData001();
      console.info(TAG + 'OH_Udmf_CreateUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0400
     * @tc.name OH_Udmf_AddRecordToUnifiedData001
     * @tc.desc OH_Udmf_AddRecordToUnifiedData001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddRecordToUnifiedData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddRecordToUnifiedData001');
      let data = testNapi.OH_Udmf_AddRecordToUnifiedData001();
      console.info(TAG + 'OH_Udmf_AddRecordToUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0500
     * @tc.name OH_Udmf_HasUnifiedDataType001
     * @tc.desc OH_Udmf_HasUnifiedDataType001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_HasUnifiedDataType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_HasUnifiedDataType001');
      let data = testNapi.OH_Udmf_HasUnifiedDataType001();
      console.info(TAG + 'OH_Udmf_HasUnifiedDataType001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0600
     * @tc.name OH_Udmf_GetUnifiedDataTypes001
     * @tc.desc OH_Udmf_GetUnifiedDataTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataTypes001');
      let data = testNapi.OH_Udmf_GetUnifiedDataTypes001();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0700
     * @tc.name OH_Udmf_GetUnifiedRecordTypes001
     * @tc.desc OH_Udmf_GetUnifiedRecordTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedRecordTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedRecordTypes001');
      let data = testNapi.OH_Udmf_GetUnifiedRecordTypes001();
      console.info(TAG + 'OH_Udmf_GetUnifiedRecordTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0800
     * @tc.name OH_Udmf_GetRecords001
     * @tc.desc OH_Udmf_GetRecords001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetRecords001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetRecords001');
      let data = testNapi.OH_Udmf_GetRecords001();
      console.info(TAG + 'OH_Udmf_GetRecords001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0900
     * @tc.name OH_Udmf_SetAndGetUnifiedData001
     * @tc.desc OH_Udmf_SetAndGetUnifiedData001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetAndGetUnifiedData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData001');
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData001();
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1000
     * @tc.name OH_Udmf_SetAndGetUnifiedData002
     * @tc.desc OH_Udmf_SetAndGetUnifiedData002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetAndGetUnifiedData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData002');
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData002();
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1100
     * @tc.name OH_Udmf_GetRecords002
     * @tc.desc OH_Udmf_GetRecords002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetRecords002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetRecords002');
      let data = testNapi.OH_Udmf_GetRecords002();
      console.info(TAG + 'OH_Udmf_GetRecords002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1200
     * @tc.name OH_Udmf_AddAndGetGeneralEntry001
     * @tc.desc OH_Udmf_AddAndGetGeneralEntry001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddAndGetGeneralEntry001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry001');
      let data = testNapi.OH_Udmf_AddAndGetGeneralEntry001();
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    // 2. BuildAndGet NAPI_ASSERT==================================
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1300
     * @tc.name OH_Udmf_BuildAndGetPlainTextFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetPlainTextFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_BuildAndGetPlainTextFromRecord001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_BuildAndGetPlainTextFromRecord001');
      let data = testNapi.OH_Udmf_BuildAndGetPlainTextFromRecord001();
      console.info(TAG + 'OH_Udmf_BuildAndGetPlainTextFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1400
     * @tc.name OH_Udmf_BuildAndGetHyperlinkFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetHyperlinkFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_BuildAndGetHyperlinkFromRecord001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_BuildAndGetHyperlinkFromRecord001');
      let data = testNapi.OH_Udmf_BuildAndGetHyperlinkFromRecord001();
      console.info(TAG + 'OH_Udmf_BuildAndGetHyperlinkFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1500
     * @tc.name OH_Udmf_BuildAndGetHtmlFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetHtmlFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_BuildAndGetHtmlFromRecord001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_BuildAndGetHtmlFromRecord001');
      let data = testNapi.OH_Udmf_BuildAndGetHtmlFromRecord001();
      console.info(TAG + 'OH_Udmf_BuildAndGetHtmlFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1600
     * @tc.name OH_Udmf_BuildAndGetAppItemFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetAppItemFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_BuildAndGetAppItemFromRecord001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_BuildAndGetAppItemFromRecord001');
      let data = testNapi.OH_Udmf_BuildAndGetAppItemFromRecord001();
      console.info(TAG + 'OH_Udmf_BuildAndGetAppItemFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    });
    // 3. OH_UdmfProperty  napi_create_int32 =====================
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1700
     * @tc.name OH_Udmf_CreatePropertiesFromUnifiedData001
     * @tc.desc OH_Udmf_CreatePropertiesFromUnifiedData
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_CreatePropertiesFromUnifiedData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001');
      let data = testNapi.OH_Udmf_CreatePropertiesFromUnifiedData001();
      console.info(TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1800
     * @tc.name OH_Udmf_SetPropertiesTag001
     * @tc.desc OH_Udmf_SetPropertiesTag001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesTag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesTag001');
      let data = testNapi.OH_Udmf_SetPropertiesTag001();
      console.info(TAG + 'OH_Udmf_SetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1900
     * @tc.name OH_Udmf_GetPropertiesTag001
     * @tc.desc OH_Udmf_GetPropertiesTag001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesTag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesTag001');
      let data = testNapi.OH_Udmf_GetPropertiesTag001();
      console.info(TAG + 'OH_Udmf_GetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2000
     * @tc.name OH_Udmf_SetPropertiesShareOption001
     * @tc.desc OH_Udmf_SetPropertiesShareOption001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesShareOption001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesShareOption001');
      let data = testNapi.OH_Udmf_SetPropertiesShareOption001();
      console.info(TAG + 'OH_Udmf_SetPropertiesShareOption001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2100
     * @tc.name OH_Udmf_GetPropertiesShareOption001
     * @tc.desc OH_Udmf_GetPropertiesShareOption001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesShareOption001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesShareOption001');
      let data = testNapi.OH_Udmf_GetPropertiesShareOption001();
      console.info(TAG + 'OH_Udmf_GetPropertiesShareOption001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2200
     * @tc.name OH_Udmf_SetPropertiesShareOption002
     * @tc.desc OH_Udmf_SetPropertiesShareOption002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesShareOption002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesShareOption002');
      let data = testNapi.OH_Udmf_SetPropertiesShareOption002();
      console.info(TAG + 'OH_Udmf_SetPropertiesShareOption002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2300
     * @tc.name OH_Udmf_GetPropertiesShareOption002
     * @tc.desc OH_Udmf_GetPropertiesShareOption002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesShareOption002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesShareOption002');
      let data = testNapi.OH_Udmf_GetPropertiesShareOption002();
      console.info(TAG + 'OH_Udmf_GetPropertiesShareOption002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2400
     * @tc.name OH_Udmf_SetPropertiesShareOption003
     * @tc.desc OH_Udmf_SetPropertiesShareOption003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesShareOption003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesShareOption003');
      let data = testNapi.OH_Udmf_SetPropertiesShareOption003();
      console.info(TAG + 'OH_Udmf_SetPropertiesShareOption003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2500
     * @tc.name OH_Udmf_SetPropertiesExtrasIntParam001
     * @tc.desc OH_Udmf_SetPropertiesExtrasIntParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesExtrasIntParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesExtrasIntParam001');
      let data = testNapi.OH_Udmf_SetPropertiesExtrasIntParam001();
      console.info(TAG + 'OH_Udmf_SetPropertiesExtrasIntParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2600
     * @tc.name OH_Udmf_GetPropertiesExtrasIntParam001
     * @tc.desc OH_Udmf_GetPropertiesExtrasIntParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesExtrasIntParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesExtrasIntParam001');
      let data = testNapi.OH_Udmf_GetPropertiesExtrasIntParam001();
      console.info(TAG + 'OH_Udmf_GetPropertiesExtrasIntParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2700
     * @tc.name OH_Udmf_SetPropertiesExtrasStringParam001
     * @tc.desc OH_Udmf_SetPropertiesExtrasStringParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesExtrasStringParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesExtrasStringParam001');
      let data = testNapi.OH_Udmf_SetPropertiesExtrasStringParam001();
      console.info(TAG + 'OH_Udmf_SetPropertiesExtrasStringParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2800
     * @tc.name OH_Udmf_GetPropertiesExtrasStringParam001
     * @tc.desc OH_Udmf_GetPropertiesExtrasStringParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesExtrasStringParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesExtrasStringParam001');
      let data = testNapi.OH_Udmf_GetPropertiesExtrasStringParam001();
      console.info(TAG + 'OH_Udmf_GetPropertiesExtrasStringParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2900
     * @tc.name OH_Udmf_SetAndGetUnifiedData006
     * @tc.desc OH_Udmf_SetAndGetUnifiedData006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetAndGetUnifiedData006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData006');
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData006();
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3000
     * @tc.name OH_Udmf_SetAndGetUnifiedData005
     * @tc.desc OH_Udmf_SetAndGetUnifiedData005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetAndGetUnifiedData005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData005');
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData005();
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3100
     * @tc.name OH_Udmf_SetAndGetUnifiedData004
     * @tc.desc OH_Udmf_SetAndGetUnifiedData004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetAndGetUnifiedData004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData004');
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData004();
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3200
     * @tc.name OH_Udmf_SetAndGetUnifiedData003
     * @tc.desc OH_Udmf_SetAndGetUnifiedData003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetAndGetUnifiedData003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData003');
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData003();
      console.info(TAG + 'OH_Udmf_SetAndGetUnifiedData003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3300
     * @tc.name OH_UdmfOptions_Create_001
     * @tc.desc OH_UdmfOptions_Create_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_Create_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_Create_001');
      let data = testNapi.OH_UdmfOptions_Create_001();
      console.info(TAG + 'OH_UdmfOptions_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3310
     * @tc.name OH_UdmfOptions_Create_002
     * @tc.desc OH_UdmfOptions_Create_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_Create_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_Create_002');
      let data = testNapi.OH_UdmfOptions_Create_002();
      console.info(TAG + 'OH_UdmfOptions_Create_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3320
     * @tc.name OH_UdmfOptions_Create_003
     * @tc.desc OH_UdmfOptions_Create_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_Create_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_Create_003');
      let data = testNapi.OH_UdmfOptions_Create_003();
      console.info(TAG + 'OH_UdmfOptions_Create_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3330
     * @tc.name OH_UdmfOptions_Destroy001
     * @tc.desc OH_UdmfOptions_Destroy001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_Destroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_Destroy001');
      let data = testNapi.OH_UdmfOptions_Destroy001();
      console.info(TAG + 'OH_UdmfOptions_Destroy001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4500
     * @tc.name OH_UdmfOptions_GetKey_001
     * @tc.desc OH_UdmfOptions_GetKey_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetKey_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetKey_001');
      let data = testNapi.OH_UdmfOptions_GetKey_001();
      console.info(TAG + 'OH_UdmfOptions_GetKey_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3510
     * @tc.name OH_UdmfOptions_GetKey_002
     * @tc.desc OH_UdmfOptions_GetKey_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetKey_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetKey_002');
      let data = testNapi.OH_UdmfOptions_GetKey_002();
      console.info(TAG + 'OH_UdmfOptions_GetKey_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3620
     * @tc.name OH_UdmfOptions_GetKey_003
     * @tc.desc OH_UdmfOptions_GetKey_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetKey_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetKey_003');
      let data = testNapi.OH_UdmfOptions_GetKey_003();
      console.info(TAG + 'OH_UdmfOptions_GetKey_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3400
     * @tc.name OH_UdmfOptions_SetKey_001
     * @tc.desc OH_UdmfOptions_SetKey_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetKey_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetKey_001');
      let data = testNapi.OH_UdmfOptions_SetKey_001();
      console.info(TAG + 'OH_UdmfOptions_SetKey_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3500
     * @tc.name OH_UdmfOptions_SetKey_002
     * @tc.desc OH_UdmfOptions_SetKey_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetKey_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetKey_002');
      let data = testNapi.OH_UdmfOptions_SetKey_002();
      console.info(TAG + 'OH_UdmfOptions_SetKey_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3600
     * @tc.name OH_UdmfOptions_SetKey_003
     * @tc.desc OH_UdmfOptions_SetKey_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetKey_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetKey_003');
      let data = testNapi.OH_UdmfOptions_SetKey_003();
      console.info(TAG + 'OH_UdmfOptions_SetKey_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3610
     * @tc.name OH_UdmfOptions_SetKey_004
     * @tc.desc OH_UdmfOptions_SetKey_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetKey_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetKey_004');
      let data = testNapi.OH_UdmfOptions_SetKey_004();
      console.info(TAG + 'OH_UdmfOptions_SetKey_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3620
     * @tc.name OH_UdmfOptions_SetKey_005
     * @tc.desc OH_UdmfOptions_SetKey_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetKey_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetKey_005');
      let data = testNapi.OH_UdmfOptions_SetKey_005();
      console.info(TAG + 'OH_UdmfOptions_SetKey_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4600
     * @tc.name OH_UdmfOptions_GetIntention_001
     * @tc.desc OH_UdmfOptions_GetIntention_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetIntention_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetIntention_001');
      let data = testNapi.OH_UdmfOptions_GetIntention_001();
      console.info(TAG + 'OH_UdmfOptions_GetIntention_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4610
     * @tc.name OH_UdmfOptions_GetIntention_002
     * @tc.desc OH_UdmfOptions_GetIntention_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetIntention_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetIntention_002');
      let data = testNapi.OH_UdmfOptions_GetIntention_002();
      console.info(TAG + 'OH_UdmfOptions_GetIntention_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3700
     * @tc.name OH_UdmfOptions_SetIntention_001
     * @tc.desc OH_UdmfOptions_SetIntention_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_001');
      let data = testNapi.OH_UdmfOptions_SetIntention_001();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3800
     * @tc.name OH_UdmfOptions_SetIntention_002
     * @tc.desc OH_UdmfOptions_SetIntention_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_002');
      let data = testNapi.OH_UdmfOptions_SetIntention_002();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3900
     * @tc.name OH_UdmfOptions_SetIntention_003
     * @tc.desc OH_UdmfOptions_SetIntention_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_003');
      let data = testNapi.OH_UdmfOptions_SetIntention_003();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4000
     * @tc.name OH_UdmfOptions_SetIntention_004
     * @tc.desc OH_UdmfOptions_SetIntention_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_004');
      let data = testNapi.OH_UdmfOptions_SetIntention_004();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4100
     * @tc.name OH_UdmfOptions_SetIntention_005
     * @tc.desc OH_UdmfOptions_SetIntention_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_005');
      let data = testNapi.OH_UdmfOptions_SetIntention_005();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4200
     * @tc.name OH_UdmfOptions_SetIntention_006
     * @tc.desc OH_UdmfOptions_SetIntention_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_006');
      let data = testNapi.OH_UdmfOptions_SetIntention_006();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4300
     * @tc.name OH_UdmfOptions_SetIntention_007
     * @tc.desc OH_UdmfOptions_SetIntention_007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_007');
      let data = testNapi.OH_UdmfOptions_SetIntention_007();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_007 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4400
     * @tc.name OH_UdmfOptions_SetIntention_008
     * @tc.desc OH_UdmfOptions_SetIntention_008
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_008');
      let data = testNapi.OH_UdmfOptions_SetIntention_008();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_008 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4410
     * @tc.name OH_UdmfOptions_SetIntention_009
     * @tc.desc OH_UdmfOptions_SetIntention_009
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_009');
      let data = testNapi.OH_UdmfOptions_SetIntention_009();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_009 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4420
     * @tc.name OH_UdmfOptions_SetIntention_010
     * @tc.desc OH_UdmfOptions_SetIntention_010
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_010');
      let data = testNapi.OH_UdmfOptions_SetIntention_010();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_010 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4430
     * @tc.name OH_UdmfOptions_SetIntention_011
     * @tc.desc OH_UdmfOptions_SetIntention_011
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetIntention_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetIntention_011');
      let data = testNapi.OH_UdmfOptions_SetIntention_011();
      console.info(TAG + 'OH_UdmfOptions_SetIntention_011 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4700
     * @tc.name OH_UdmfOptions_Reset_001
     * @tc.desc OH_UdmfOptions_Reset_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_Reset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_Reset_001');
      let data = testNapi.OH_UdmfOptions_Reset_001();
      console.info(TAG + 'OH_UdmfOptions_Reset_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4710
     * @tc.name OH_UdmfOptions_Reset_002
     * @tc.desc OH_UdmfOptions_Reset_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_Reset_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_Reset_002');
      let data = testNapi.OH_UdmfOptions_Reset_002();
      console.info(TAG + 'OH_UdmfOptions_Reset_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5400
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_001
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_001');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_001();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5500
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_002
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_002');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_002();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5600
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_003
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_003');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_003();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5700
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_004
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_004');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_004();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5800
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_005
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_005');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_005();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5810
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_006
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_006');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_006();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5820
     * @tc.name OH_Udmf_GetUnifiedDataByOptions_007
     * @tc.desc OH_Udmf_GetUnifiedDataByOptions_007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_007');
      let data = testNapi.OH_Udmf_GetUnifiedDataByOptions_007();
      console.info(TAG + 'OH_Udmf_GetUnifiedDataByOptions_007 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4800
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_001
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_001');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_001();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4900
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_002
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedDataByOptions_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_002');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_002();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5000
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_003
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_003');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_003();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5100
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_004
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_004');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_004();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5200
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_005
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_005');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_005();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5300
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_006
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_006');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_006();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5310
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_008
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_008
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_008');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_008();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_008 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5320
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_009
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_009
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_009');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_009();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_009 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5340
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_010
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_010
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_010');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_010();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_010 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5350
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_011
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_011
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_011');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_011();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_011 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5360
     * @tc.name OH_Udmf_SetUnifiedDataByOptions_012
     * @tc.desc OH_Udmf_SetUnifiedDataByOptions_012
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedDataByOptions_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_012');
      let data = testNapi.OH_Udmf_SetUnifiedDataByOptions_012();
      console.info(TAG + 'OH_Udmf_SetUnifiedDataByOptions_012 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5900
     * @tc.name OH_Udmf_UpdateUnifiedData_001
     * @tc.desc OH_Udmf_UpdateUnifiedData_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_001');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_001();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
        /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6000
     * @tc.name OH_Udmf_UpdateUnifiedData_002
     * @tc.desc OH_Udmf_UpdateUnifiedData_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_002');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_002();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6100
     * @tc.name OH_Udmf_UpdateUnifiedData_003
     * @tc.desc OH_Udmf_UpdateUnifiedData_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_003');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_003();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6110
     * @tc.name OH_Udmf_UpdateUnifiedData_004
     * @tc.desc OH_Udmf_UpdateUnifiedData_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_004');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_004();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6120
     * @tc.name OH_Udmf_UpdateUnifiedData_005
     * @tc.desc OH_Udmf_UpdateUnifiedData_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_005');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_005();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6130
     * @tc.name OH_Udmf_UpdateUnifiedData_006
     * @tc.desc OH_Udmf_UpdateUnifiedData_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_006');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_006();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6140
     * @tc.name OH_Udmf_UpdateUnifiedData_007
     * @tc.desc OH_Udmf_UpdateUnifiedData_007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_007');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_007();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_007 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6150
     * @tc.name OH_Udmf_UpdateUnifiedData_008
     * @tc.desc OH_Udmf_UpdateUnifiedData_008
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_UpdateUnifiedData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_008');
      let data = testNapi.OH_Udmf_UpdateUnifiedData_008();
      console.info(TAG + 'OH_Udmf_UpdateUnifiedData_008 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6200
     * @tc.name OH_Udmf_DeleteUnifiedData_001
     * @tc.desc OH_Udmf_DeleteUnifiedData_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_001');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_001();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6300
     * @tc.name OH_Udmf_DeleteUnifiedData_002
     * @tc.desc OH_Udmf_DeleteUnifiedData_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_002');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_002();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6400
     * @tc.name OH_Udmf_DeleteUnifiedData_003
     * @tc.desc OH_Udmf_DeleteUnifiedData_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_003');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_003();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6500
     * @tc.name OH_Udmf_DeleteUnifiedData_004
     * @tc.desc OH_Udmf_DeleteUnifiedData_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_004');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_004();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6600
     * @tc.name OH_Udmf_DeleteUnifiedData_005
     * @tc.desc OH_Udmf_DeleteUnifiedData_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_005');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_005();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6700
     * @tc.name OH_Udmf_DeleteUnifiedData_006
     * @tc.desc OH_Udmf_DeleteUnifiedData_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_006');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_006();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6900
     * @tc.name OH_Udmf_DeleteUnifiedData_008
     * @tc.desc OH_Udmf_DeleteUnifiedData_008
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DeleteUnifiedData_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_008');
      let data = testNapi.OH_Udmf_DeleteUnifiedData_008();
      console.info(TAG + 'OH_Udmf_DeleteUnifiedData_008 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7000
     * @tc.name OH_Udmf_DestroyDataArray_001
     * @tc.desc OH_Udmf_DestroyDataArray_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DestroyDataArray_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DestroyDataArray_001');
      let data = testNapi.OH_Udmf_DestroyDataArray_001();
      console.info(TAG + 'OH_Udmf_DestroyDataArray_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7100
     * @tc.name OH_Udmf_DestroyDataArray_002
     * @tc.desc OH_Udmf_DestroyDataArray_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DestroyDataArray_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DestroyDataArray_002');
      let data = testNapi.OH_Udmf_DestroyDataArray_002();
      console.info(TAG + 'OH_Udmf_DestroyDataArray_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7200
     * @tc.name OH_Udmf_DestroyDataArray_003
     * @tc.desc OH_Udmf_DestroyDataArray_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DestroyDataArray_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DestroyDataArray_003');
      let data = testNapi.OH_Udmf_DestroyDataArray_003();
      console.info(TAG + 'OH_Udmf_DestroyDataArray_003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7300
     * @tc.name OH_Udmf_DestroyDataArray_004
     * @tc.desc OH_Udmf_DestroyDataArray_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DestroyDataArray_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DestroyDataArray_004');
      let data = testNapi.OH_Udmf_DestroyDataArray_004();
      console.info(TAG + 'OH_Udmf_DestroyDataArray_004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7400
     * @tc.name OH_Udmf_DestroyDataArray_005
     * @tc.desc OH_Udmf_DestroyDataArray_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_DestroyDataArray_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_DestroyDataArray_005');
      let data = testNapi.OH_Udmf_DestroyDataArray_005();
      console.info(TAG + 'OH_Udmf_DestroyDataArray_005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7500
     * @tc.name OH_UdmfData_CreateAndSetUnifiedDataByOptions_001
     * @tc.desc OH_UdmfData_CreateAndSetUnifiedDataByOptions_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_CreateAndSetUnifiedDataByOptions_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + 'OH_UdmfData_CreateAndSetUnifiedDataByOptions_001');
      let data = testNapi.OH_UdmfData_CreateAndSetUnifiedDataByOptions_001();
      console.info(TAG + 'OH_UdmfData_CreateAndSetUnifiedDataByOptions_001 data= ' + JSON.stringify(data));
      let options:unifiedDataChannel.Options = {
        key: data
      };
      try {
        await unifiedDataChannel.queryData(options, async(errInfo, ret) => {
          let dataSize = ret.length;
          expect(dataSize).assertEqual(1);
          await unifiedDataChannel.deleteData(options);
          done();
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_7600
     * @tc.name OH_UdmfData_CreateAndGetUnifiedDataByOptions_001
     * @tc.desc OH_UdmfData_CreateAndGetUnifiedDataByOptions_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_CreateAndGetUnifiedDataByOptions_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
      let Options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        await unifiedDataChannel.insertData(Options, unifiedData).then((data)=>{
          console.info(TAG + `OH_UdmfData_CreateAndGetUnifiedDataByOptions_001 data = ${data}, options = ${Options}`);
          let res = testNapi.OH_UdmfData_CreateAndGetUnifiedDataByOptions_001(data,"DATA_HUB");
          console.info(TAG + 'OH_UdmfData_CreateAndGetUnifiedDataByOptions_001 res= ' + JSON.stringify(res));
          expect(res).assertEqual(1);
          done();
        }).catch((err:BusinessError) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
        
      } catch (error) {
        console.error(TAG, `Failed to insertData0100 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0100
     * @tc.name OH_UdmfDataLoadParams_Create001
     * @tc.desc OH_UdmfDataLoadParams_Create001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadParams_Create001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadParams_Create001');
      let data = testNapi.OH_UdmfDataLoadParams_Create001();
      console.info(TAG + 'OH_UdmfDataLoadParams_Create001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0200
     * @tc.name OH_UdmfDataLoadParams_Create002
     * @tc.desc OH_UdmfDataLoadParams_Create002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadParams_Create002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadParams_Create002');
      let data = testNapi.OH_UdmfDataLoadParams_Create002();
      console.info(TAG + 'OH_UdmfDataLoadParams_Create002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0300
     * @tc.name OH_UdmfDataLoadInfo_Create001
     * @tc.desc OH_UdmfDataLoadInfo_Create001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_Create001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_Create001');
      let data = testNapi.OH_UdmfDataLoadInfo_Create001();
      console.info(TAG + 'OH_UdmfDataLoadInfo_Create001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0400
     * @tc.name OH_UdmfDataLoadParams_Create002
     * @tc.desc OH_UdmfDataLoadParams_Create002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadParams_Create002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadParams_Create002');
      let data = testNapi.OH_UdmfDataLoadParams_Create002();
      console.info(TAG + 'OH_UdmfDataLoadParams_Create002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0500
     * @tc.name OH_UdmfDataLoadInfo_Create001
     * @tc.desc OH_UdmfDataLoadInfo_Create001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_Create001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_Create001');
      let data = testNapi.OH_UdmfDataLoadInfo_Create001();
      console.info(TAG + 'OH_UdmfDataLoadInfo_Create001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0600
     * @tc.name OH_UdmfDataLoadInfo_SetTypeAndGetTypes001
     * @tc.desc OH_UdmfDataLoadInfo_SetTypeAndGetTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetTypeAndGetTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetTypeAndGetTypes001');
      let data = testNapi.OH_UdmfDataLoadInfo_SetTypeAndGetTypes001();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetTypeAndGetTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0700
     * @tc.name OH_UdmfDataLoadParams_Create001
     * @tc.desc OH_UdmfDataLoadParams_Create001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetTypeAndGetTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetTypeAndGetTypes002');
      let data = testNapi.OH_UdmfDataLoadInfo_SetTypeAndGetTypes002();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetTypeAndGetTypes002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0800
     * @tc.name OH_UdmfDataLoadInfo_SetTypeAndGetTypes003
     * @tc.desc OH_UdmfDataLoadInfo_SetTypeAndGetTypes003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetTypeAndGetTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetTypeAndGetTypes003');
      let data = testNapi.OH_UdmfDataLoadInfo_SetTypeAndGetTypes003();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetTypeAndGetTypes003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_0900
     * @tc.name OH_UdmfDataLoadInfo_GetTypes001
     * @tc.desc OH_UdmfDataLoadInfo_GetTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_GetTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_GetTypes001');
      let data = testNapi.OH_UdmfDataLoadInfo_GetTypes001();
      console.info(TAG + 'OH_UdmfDataLoadInfo_GetTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1000
     * @tc.name OH_UdmfDataLoadInfo_GetTypes002
     * @tc.desc OH_UdmfDataLoadInfo_GetTypes002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_GetTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_GetTypes002');
      let data = testNapi.OH_UdmfDataLoadInfo_GetTypes002();
      console.info(TAG + 'OH_UdmfDataLoadInfo_GetTypes002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1100
     * @tc.name OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001
     * @tc.desc OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001');
      let data = testNapi.OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1200
     * @tc.name OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002
     * @tc.desc OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002');
      let data = testNapi.OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1300
     * @tc.name OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003
     * @tc.desc OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003');
      let data = testNapi.OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1400
     * @tc.name OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004
     * @tc.desc OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004');
      let data = testNapi.OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004();
      console.info(TAG + 'OH_UdmfDataLoadInfo_SetRecordCountAndGetRecordCount004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1500
     * @tc.name OH_UdmfDataLoadInfo_GetRecordCount001
     * @tc.desc OH_UdmfDataLoadInfo_GetRecordCount001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadInfo_GetRecordCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadInfo_GetRecordCount001');
      let data = testNapi.OH_UdmfDataLoadInfo_GetRecordCount001();
      console.info(TAG + 'OH_UdmfDataLoadInfo_GetRecordCount001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1600
     * @tc.name OH_UdmfDataLoadParams_SetDataLoadInfo001
     * @tc.desc OH_UdmfDataLoadParams_SetDataLoadInfo001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadParams_SetDataLoadInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadParams_SetDataLoadInfo001');
      let data = testNapi.OH_UdmfDataLoadParams_SetDataLoadInfo001();
      console.info(TAG + 'OH_UdmfDataLoadParams_SetDataLoadInfo001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithDelayNDKTest_1700
     * @tc.name OH_UdmfDataLoadParams_SetLoadHandler001
     * @tc.desc OH_UdmfDataLoadParams_SetLoadHandler001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfDataLoadParams_SetLoadHandler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfDataLoadParams_SetLoadHandler001');
      let data = testNapi.OH_UdmfDataLoadParams_SetLoadHandler001();
      console.info(TAG + 'OH_UdmfDataLoadParams_SetLoadHandler001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
  })
}