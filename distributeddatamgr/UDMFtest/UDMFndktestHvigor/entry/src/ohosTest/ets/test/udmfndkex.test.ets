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
import testNapi from 'libUdmfNdkex.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';

const TAG = "[ UdmfNdkexTest ] ------ ";

export default function UdmfNdkexTest() {
  describe('UdmfNdkexTest', async () => {
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0100
     * @tc.name OH_Udmf_AddRecord001
     * @tc.desc OH_Udmf_AddRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddRecord001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddRecord001');
      let data = testNapi.OH_Udmf_AddRecord001();
      console.info(TAG + 'OH_Udmf_AddRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0200
     * @tc.name OH_Udmf_AddRecord002
     * @tc.desc OH_Udmf_AddRecord002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddRecord002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddRecord002');
      let data = testNapi.OH_Udmf_AddRecord002();
      console.info(TAG + 'OH_Udmf_AddRecord002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0300
     * @tc.name OH_Udmf_AddRecord003
     * @tc.desc OH_Udmf_AddRecord003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddRecord003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddRecord003');
      let data = testNapi.OH_Udmf_AddRecord003();
      console.info(TAG + 'OH_Udmf_AddRecord003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0400
     * @tc.name OH_UdsPlainText_SetContent_003
     * @tc.desc OH_UdsPlainText_SetContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_HasType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_HasType001');
      let data = testNapi.OH_UdmfData_HasType001();
      console.info(TAG + 'OH_UdmfData_HasType001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0500
     * @tc.name OH_UdmfData_HasType002
     * @tc.desc OH_UdmfData_HasType002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_HasType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_HasType002');
      let data = testNapi.OH_UdmfData_HasType002();
      console.info(TAG + 'OH_UdmfData_HasType002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0600
     * @tc.name OH_UdmfData_HasType003
     * @tc.desc OH_UdmfData_HasType003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_HasType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_HasType003');
      let data = testNapi.OH_UdmfData_HasType003();
      console.info(TAG + 'OH_UdmfData_HasType003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0700
     * @tc.name OH_UdmfData_HasType004
     * @tc.desc OH_UdmfData_HasType004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_HasType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_HasType004');
      let data = testNapi.OH_UdmfData_HasType004();
      console.info(TAG + 'OH_UdmfData_HasType004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0800
     * @tc.name OH_UdmfData_HasType005
     * @tc.desc OH_UdmfData_HasType005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_HasType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_HasType005');
      let data = testNapi.OH_UdmfData_HasType005();
      console.info(TAG + 'OH_UdmfData_HasType005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0900
     * @tc.name OH_UdmfData_GetTypes001
     * @tc.desc OH_UdmfData_GetTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_GetTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_GetTypes001');
      let data = testNapi.OH_UdmfData_GetTypes001();
      console.info(TAG + 'OH_UdmfData_GetTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1000
     * @tc.name OH_UdmfData_GetTypes002
     * @tc.desc OH_UdmfData_GetTypes002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_GetTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_GetTypes002');
      let data = testNapi.OH_UdmfData_GetTypes002();
      console.info(TAG + 'OH_UdmfData_GetTypes002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1100
     * @tc.name OH_UdmfData_GetTypes003
     * @tc.desc OH_UdmfData_GetTypes003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_GetTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_GetTypes003');
      let data = testNapi.OH_UdmfData_GetTypes003();
      console.info(TAG + 'OH_UdmfData_GetTypes003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1200
     * @tc.name OH_UdmfRecord_GetTypes001
     * @tc.desc OH_UdmfRecord_GetTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetTypes001');
      let data = testNapi.OH_UdmfRecord_GetTypes001();
      console.info(TAG + 'OH_UdmfRecord_GetTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1300
     * @tc.name OH_UdmfRecord_GetTypes002
     * @tc.desc OH_UdmfRecord_GetTypes002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetTypes002');
      let data = testNapi.OH_UdmfRecord_GetTypes002();
      console.info(TAG + 'OH_UdmfRecord_GetTypes002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1400
     * @tc.name OH_UdmfRecord_GetTypes003
     * @tc.desc OH_UdmfRecord_GetTypes003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetTypes003');
      let data = testNapi.OH_UdmfRecord_GetTypes003();
      console.info(TAG + 'OH_UdmfRecord_GetTypes003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1500
     * @tc.name OH_Udmf_SetUnifiedData001
     * @tc.desc OH_Udmf_SetUnifiedData001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetUnifiedData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetUnifiedData001');
      let data = testNapi.OH_Udmf_SetUnifiedData001();
      console.info(TAG + 'OH_Udmf_SetUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1600
     * @tc.name OH_UdmfData_GetRecords001
     * @tc.desc OH_UdmfData_GetRecords001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_GetRecords001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_GetRecords001');
      let data = testNapi.OH_UdmfData_GetRecords001();
      console.info(TAG + 'OH_UdmfData_GetRecords001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1700
     * @tc.name OH_UdmfData_GetRecords002
     * @tc.desc OH_UdmfData_GetRecords002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfData_GetRecords002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfData_GetRecords002');
      let data = testNapi.OH_UdmfData_GetRecords002();
      console.info(TAG + 'OH_UdmfData_GetRecords002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1800
     * @tc.name OH_Udmf_GetUnifiedData002
     * @tc.desc OH_Udmf_GetUnifiedData002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedData002');
      let data = testNapi.OH_Udmf_GetUnifiedData002();
      console.info(TAG + 'OH_Udmf_GetUnifiedData002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1900
     * @tc.name OH_Udmf_GetUnifiedData003
     * @tc.desc OH_Udmf_GetUnifiedData003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetUnifiedData003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetUnifiedData003');
      let data = testNapi.OH_Udmf_GetUnifiedData003();
      console.info(TAG + 'OH_Udmf_GetUnifiedData003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2000
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
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2100
     * @tc.name OH_Udmf_AddAndGetGeneralEntry002
     * @tc.desc OH_Udmf_AddAndGetGeneralEntry002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddAndGetGeneralEntry002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry002');
      let data = testNapi.OH_Udmf_AddAndGetGeneralEntry002();
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2200
     * @tc.name OH_Udmf_AddAndGetGeneralEntry003
     * @tc.desc OH_Udmf_AddAndGetGeneralEntry003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddAndGetGeneralEntry003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry003');
      let data = testNapi.OH_Udmf_AddAndGetGeneralEntry003();
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2300
     * @tc.name OH_Udmf_AddAndGetGeneralEntry004
     * @tc.desc OH_Udmf_AddAndGetGeneralEntry004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_AddAndGetGeneralEntry004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry004');
      let data = testNapi.OH_Udmf_AddAndGetGeneralEntry004();
      console.info(TAG + 'OH_Udmf_AddAndGetGeneralEntry004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2400
     * @tc.name OH_UdmfRecord_AddPlainText001
     * @tc.desc OH_UdmfRecord_AddPlainText001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddPlainText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddPlainText001');
      let data = testNapi.OH_UdmfRecord_AddPlainText001();
      console.info(TAG + 'OH_UdmfRecord_AddPlainText001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2500
     * @tc.name OH_UdmfRecord_AddPlainText002
     * @tc.desc OH_UdmfRecord_AddPlainText002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddPlainText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddPlainText002');
      let data = testNapi.OH_UdmfRecord_AddPlainText002();
      console.info(TAG + 'OH_UdmfRecord_AddPlainText002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2600
     * @tc.name OH_UdmfRecord_AddPlainText003
     * @tc.desc OH_UdmfRecord_AddPlainText003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddPlainText003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddPlainText003');
      let data = testNapi.OH_UdmfRecord_AddPlainText003();
      console.info(TAG + 'OH_UdmfRecord_AddPlainText003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2700
     * @tc.name OH_UdmfRecord_AddPlainText004
     * @tc.desc OH_UdmfRecord_AddPlainText004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddPlainText004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddPlainText004');
      let data = testNapi.OH_UdmfRecord_AddPlainText004();
      console.info(TAG + 'OH_UdmfRecord_AddPlainText004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2800
     * @tc.name OH_UdmfRecord_AddPlainText005
     * @tc.desc OH_UdmfRecord_AddPlainText005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddPlainText005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddPlainText005');
      let data = testNapi.OH_UdmfRecord_AddPlainText005();
      console.info(TAG + 'OH_UdmfRecord_AddPlainText005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2900
     * @tc.name OH_UdmfRecord_GetPlainText002
     * @tc.desc OH_UdmfRecord_GetPlainText002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetPlainText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetPlainText002');
      let data = testNapi.OH_UdmfRecord_GetPlainText002();
      console.info(TAG + 'OH_UdmfRecord_GetPlainText002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3000
     * @tc.name OH_UdmfRecord_GetPlainText003
     * @tc.desc OH_UdmfRecord_GetPlainText003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetPlainText003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetPlainText003');
      let data = testNapi.OH_UdmfRecord_GetPlainText003();
      console.info(TAG + 'OH_UdmfRecord_GetPlainText003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3100
     * @tc.name OH_UdmfRecord_AddHyperlink001
     * @tc.desc OH_UdmfRecord_AddHyperlink001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHyperlink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink001');
      let data = testNapi.OH_UdmfRecord_AddHyperlink001();
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3200
     * @tc.name OH_UdmfRecord_AddHyperlink002
     * @tc.desc OH_UdmfRecord_AddHyperlink002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHyperlink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink002');
      let data = testNapi.OH_UdmfRecord_AddHyperlink002();
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3300
     * @tc.name OH_UdmfRecord_AddHyperlink003
     * @tc.desc OH_UdmfRecord_AddHyperlink003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHyperlink003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink003');
      let data = testNapi.OH_UdmfRecord_AddHyperlink003();
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3400
     * @tc.name OH_UdmfRecord_AddHyperlink004
     * @tc.desc OH_UdmfRecord_AddHyperlink004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHyperlink004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink004');
      let data = testNapi.OH_UdmfRecord_AddHyperlink004();
      console.info(TAG + 'OH_UdmfRecord_AddHyperlink004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3500
     * @tc.name OH_UdmfRecord_GetHyperlink001
     * @tc.desc OH_UdmfRecord_GetHyperlink001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHyperlink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink001');
      let data = testNapi.OH_UdmfRecord_GetHyperlink001();
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3600
     * @tc.name OH_UdmfRecord_GetHyperlink002
     * @tc.desc OH_UdmfRecord_GetHyperlink002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHyperlink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink002');
      let data = testNapi.OH_UdmfRecord_GetHyperlink002();
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3700
     * @tc.name OH_UdmfRecord_GetHyperlink003
     * @tc.desc OH_UdmfRecord_GetHyperlink003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHyperlink003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink003');
      let data = testNapi.OH_UdmfRecord_GetHyperlink003();
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3800
     * @tc.name OH_UdmfRecord_GetHyperlink004
     * @tc.desc OH_UdmfRecord_GetHyperlink004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHyperlink004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink004');
      let data = testNapi.OH_UdmfRecord_GetHyperlink004();
      console.info(TAG + 'OH_UdmfRecord_GetHyperlink004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_3900
     * @tc.name OH_UdmfRecord_AddHtml001
     * @tc.desc OH_UdmfRecord_AddHtml001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHtml001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHtml001');
      let data = testNapi.OH_UdmfRecord_AddHtml001();
      console.info(TAG + 'OH_UdmfRecord_AddHtml001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4000
     * @tc.name OH_UdmfRecord_AddHtml002
     * @tc.desc OH_UdmfRecord_AddHtml002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHtml002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHtml002');
      let data = testNapi.OH_UdmfRecord_AddHtml002();
      console.info(TAG + 'OH_UdmfRecord_AddHtml002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4100
     * @tc.name OH_UdmfRecord_AddHtml003
     * @tc.desc OH_UdmfRecord_AddHtml003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHtml003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHtml003');
      let data = testNapi.OH_UdmfRecord_AddHtml003();
      console.info(TAG + 'OH_UdmfRecord_AddHtml003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4200
     * @tc.name OH_UdmfRecord_AddHtml004
     * @tc.desc OH_UdmfRecord_AddHtml004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddHtml004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddHtml004');
      let data = testNapi.OH_UdmfRecord_AddHtml004();
      console.info(TAG + 'OH_UdmfRecord_AddHtml004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4300
     * @tc.name OH_UdmfRecord_GetHtml001
     * @tc.desc OH_UdmfRecord_GetHtml001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHtml001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHtml001');
      let data = testNapi.OH_UdmfRecord_GetHtml001();
      console.info(TAG + 'OH_UdmfRecord_GetHtml001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4400
     * @tc.name OH_UdmfRecord_GetHtml002
     * @tc.desc OH_UdmfRecord_GetHtml002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHtml002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHtml002');
      let data = testNapi.OH_UdmfRecord_GetHtml002();
      console.info(TAG + 'OH_UdmfRecord_GetHtml002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4500
     * @tc.name OH_UdmfRecord_GetHtml003
     * @tc.desc OH_UdmfRecord_GetHtml003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetHtml003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetHtml003');
      let data = testNapi.OH_UdmfRecord_GetHtml003();
      console.info(TAG + 'OH_UdmfRecord_GetHtml003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4600
     * @tc.name OH_UdmfRecord_AddAppItem001
     * @tc.desc OH_UdmfRecord_AddAppItem001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddAppItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddAppItem001');
      let data = testNapi.OH_UdmfRecord_AddAppItem001();
      console.info(TAG + 'OH_UdmfRecord_AddAppItem001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4700
     * @tc.name OH_UdmfRecord_AddAppItem002
     * @tc.desc OH_UdmfRecord_AddAppItem002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddAppItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddAppItem002');
      let data = testNapi.OH_UdmfRecord_AddAppItem002();
      console.info(TAG + 'OH_UdsHtml_GetPlainContent_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4800
     * @tc.name OH_UdmfRecord_AddAppItem003
     * @tc.desc OH_UdmfRecord_AddAppItem003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddAppItem003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddAppItem003');
      let data = testNapi.OH_UdmfRecord_AddAppItem003();
      console.info(TAG + 'OH_UdmfRecord_AddAppItem003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_4900
     * @tc.name OH_UdmfRecord_AddAppItem004
     * @tc.desc OH_UdmfRecord_AddAppItem004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_AddAppItem004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_AddAppItem004');
      let data = testNapi.OH_UdmfRecord_AddAppItem004();
      console.info(TAG + 'OH_UdmfRecord_AddAppItem004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5000
     * @tc.name OH_UdmfProperty_Create001
     * @tc.desc OH_UdmfProperty_Create001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfProperty_Create001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfProperty_Create001');
      let data = testNapi.OH_UdmfProperty_Create001();
      console.info(TAG + 'OH_UdmfProperty_Create001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5100
     * @tc.name OH_Udmf_SetPropertiesTag001
     * @tc.desc OH_Udmf_SetPropertiesTag001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesTag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesTag001');
      let data = testNapi.OH_Udmf_SetPropertiesTag001();
      console.info(TAG + 'OH_UdsAppIOH_Udmf_SetPropertiesTag001tem_SetId_002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5200
     * @tc.name OH_Udmf_SetPropertiesTag002
     * @tc.desc OH_Udmf_SetPropertiesTag002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesTag002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesTag002');
      let data = testNapi.OH_Udmf_SetPropertiesTag002();
      console.info(TAG + 'OH_Udmf_SetPropertiesTag002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5300
     * @tc.name OH_Udmf_SetPropertiesTag003
     * @tc.desc OH_Udmf_SetPropertiesTag003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesTag003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesTag003');
      let data = testNapi.OH_Udmf_SetPropertiesTag003();
      console.info(TAG + 'OH_Udmf_SetPropertiesTag003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5400
     * @tc.name OH_Udmf_SetPropertiesTag004
     * @tc.desc OH_Udmf_SetPropertiesTag004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_SetPropertiesTag004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_SetPropertiesTag004');
      let data = testNapi.OH_Udmf_SetPropertiesTag004();
      console.info(TAG + 'OH_Udmf_SetPropertiesTag004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5500
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5600
     * @tc.name OH_UdsAppItem_GetId_002
     * @tc.desc OH_UdsAppItem_GetId_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesTag002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesTag002');
      let data = testNapi.OH_Udmf_GetPropertiesTag002();
      console.info(TAG + 'OH_Udmf_GetPropertiesTag002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5700
     * @tc.name OH_UdmfProperty_GetTimestamp001
     * @tc.desc OH_UdmfProperty_GetTimestamp001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfProperty_GetTimestamp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfProperty_GetTimestamp001');
      let data = testNapi.OH_UdmfProperty_GetTimestamp001();
      console.info(TAG + 'OH_UdmfProperty_GetTimestamp001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5800
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_5900
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6000
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6100
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6200
     * @tc.name OH_Udmf_GetPropertiesExtrasIntParam002
     * @tc.desc OH_Udmf_GetPropertiesExtrasIntParam002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_GetPropertiesExtrasIntParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_Udmf_GetPropertiesExtrasIntParam002');
      let data = testNapi.OH_Udmf_GetPropertiesExtrasIntParam002();
      console.info(TAG + 'OH_Udmf_GetPropertiesExtrasIntParam002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6300
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6400
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
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_6500
     * @tc.name OH_UdmfRecord_GetPlainText001
     * @tc.desc OH_UdmfRecord_GetPlainText001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfRecord_GetPlainText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfRecord_GetPlainText001');
      let data = testNapi.OH_UdmfRecord_GetPlainText001();
      console.info(TAG + 'OH_UdmfRecord_GetPlainText001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0100
     * @tc.name OH_UdmfOptions_GetVisibility001
     * @tc.desc OH_UdmfOptions_GetVisibility001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetVisibility001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetVisibility001');
      let data = testNapi.OH_UdmfOptions_GetVisibility001();
      console.info(TAG + 'OH_UdmfOptions_GetVisibility001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0200
     * @tc.name OH_UdmfOptions_GetVisibility002
     * @tc.desc OH_UdmfOptions_GetVisibility002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_GetVisibility002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_GetVisibility002');
      let data = testNapi.OH_UdmfOptions_GetVisibility002();
      console.info(TAG + 'OH_UdmfOptions_GetVisibility002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0300
     * @tc.name OH_UdmfOptions_SetVisibility001
     * @tc.desc OH_UdmfOptions_SetVisibility001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility001');
      let data = testNapi.OH_UdmfOptions_SetVisibility001();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0400
     * @tc.name OH_UdmfOptions_SetVisibility002
     * @tc.desc OH_UdmfOptions_SetVisibility002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility002');
      let data = testNapi.OH_UdmfOptions_SetVisibility002();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0500
     * @tc.name OH_UdmfOptions_SetVisibility003
     * @tc.desc OH_UdmfOptions_SetVisibility003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility003');
      let data = testNapi.OH_UdmfOptions_SetVisibility003();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0600
     * @tc.name OH_UdmfOptions_SetVisibility004
     * @tc.desc OH_UdmfOptions_SetVisibility004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility004');
      let data = testNapi.OH_UdmfOptions_SetVisibility004();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility004 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0700
     * @tc.name OH_UdmfOptions_SetVisibility005
     * @tc.desc OH_UdmfOptions_SetVisibility005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility005');
      let data = testNapi.OH_UdmfOptions_SetVisibility005();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility005 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0800
     * @tc.name OH_UdmfOptions_SetVisibility006
     * @tc.desc OH_UdmfOptions_SetVisibility006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility006');
      let data = testNapi.OH_UdmfOptions_SetVisibility006();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility006 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_0900
     * @tc.name OH_UdmfOptions_SetVisibility007
     * @tc.desc OH_UdmfOptions_SetVisibility007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility007');
      let data = testNapi.OH_UdmfOptions_SetVisibility007();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility007 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1000
     * @tc.name OH_UdmfOptions_SetVisibility008
     * @tc.desc OH_UdmfOptions_SetVisibility008
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility008');
      let data = testNapi.OH_UdmfOptions_SetVisibility008();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility008 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1100
     * @tc.name OH_UdmfOptions_SetVisibility009
     * @tc.desc OH_UdmfOptions_SetVisibility009
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility009');
      let data = testNapi.OH_UdmfOptions_SetVisibility009();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility009 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1200
     * @tc.name OH_UdmfOptions_SetVisibility010
     * @tc.desc OH_UdmfOptions_SetVisibility010
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility010');
      let data = testNapi.OH_UdmfOptions_SetVisibility010();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility010 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1300
     * @tc.name OH_UdmfOptions_SetVisibility011
     * @tc.desc OH_UdmfOptions_SetVisibility011
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility011');
      let data = testNapi.OH_UdmfOptions_SetVisibility011();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility011 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
     /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1400
     * @tc.name OH_UdmfOptions_SetVisibility012
     * @tc.desc OH_UdmfOptions_SetVisibility012
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility012');
      let data = testNapi.OH_UdmfOptions_SetVisibility012();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility012 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1500
     * @tc.name OH_UdmfOptions_SetVisibility013
     * @tc.desc OH_UdmfOptions_SetVisibility013
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility013');
      let data = testNapi.OH_UdmfOptions_SetVisibility013();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility013 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1600
     * @tc.name OH_UdmfOptions_SetVisibility014
     * @tc.desc OH_UdmfOptions_SetVisibility014
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility014');
      let data = testNapi.OH_UdmfOptions_SetVisibility014();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility014 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1700
     * @tc.name OH_UdmfOptions_SetVisibility015
     * @tc.desc OH_UdmfOptions_SetVisibility015
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility015');
      let data = testNapi.OH_UdmfOptions_SetVisibility015(null);
      console.info(TAG + 'OH_UdmfOptions_SetVisibility015 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1800
     * @tc.name OH_UdmfOptions_SetVisibility016
     * @tc.desc OH_UdmfOptions_SetVisibility016
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility016');
      let data = testNapi.OH_UdmfOptions_SetVisibility016();
      console.info(TAG + 'OH_UdmfOptions_SetVisibility016 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });

        /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkAddUpTest_1900
     * @tc.name OH_UdmfOptions_SetVisibility017
     * @tc.desc OH_UdmfOptions_SetVisibility017
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdmfOptions_SetVisibility017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + 'OH_UdmfOptions_SetVisibility017');
      let data = testNapi.OH_UdmfOptions_SetVisibility017(undefined);
      console.info(TAG + 'OH_UdmfOptions_SetVisibility017 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    });
  })
}