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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const TAG = "[ UdmfNdkTest ] ------ ";

export default function UdmfNdkTest() {
  describe('UdmfNdkTest', async function () {
    beforeAll(async function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {     
    })
    afterAll(function () {
    })

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0100
     * @tc.name OH_Udmf_CreatePropertiesFromUnifiedData001
     * @tc.desc OH_Udmf_CreatePropertiesFromUnifiedData
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_CreatePropertiesFromUnifiedData001',0, async function () {
      console.info( TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001' );
      let data = testNapi.OH_Udmf_CreatePropertiesFromUnifiedData001();
      console.info( TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0200
     * @tc.name OH_Udmf_SetPropertiesTag001
     * @tc.desc OH_Udmf_SetPropertiesTag
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_SetPropertiesTag001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesTag001' );
      let data = testNapi.OH_Udmf_SetPropertiesTag001();
      console.info( TAG + 'OH_Udmf_SetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**======================================*/

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0300
     * @tc.name OH_Udmf_CreateUnifiedData001
     * @tc.desc OH_Udmf_CreateUnifiedData001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_CreateUnifiedData001',0, async function () {
      console.info( TAG + 'OH_Udmf_CreateUnifiedData001' );
      let data = testNapi.OH_Udmf_CreateUnifiedData001();
      console.info( TAG + 'OH_Udmf_CreateUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0400
     * @tc.name OH_Udmf_AddRecordToUnifiedData001
     * @tc.desc OH_Udmf_AddRecordToUnifiedData001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_AddRecordToUnifiedData001',0, async function () {
      console.info( TAG + 'OH_Udmf_AddRecordToUnifiedData001' );
      let data = testNapi.OH_Udmf_AddRecordToUnifiedData001();
      console.info( TAG + 'OH_Udmf_AddRecordToUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0500
     * @tc.name OH_Udmf_HasUnifiedDataType001
     * @tc.desc OH_Udmf_HasUnifiedDataType001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_HasUnifiedDataType001',0, async function () {
      console.info( TAG + 'OH_Udmf_HasUnifiedDataType001' );
      let data = testNapi.OH_Udmf_HasUnifiedDataType001();
      console.info( TAG + 'OH_Udmf_HasUnifiedDataType001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0600
     * @tc.name OH_Udmf_GetUnifiedDataTypes001
     * @tc.desc OH_Udmf_GetUnifiedDataTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_GetUnifiedDataTypes001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetUnifiedDataTypes001' );
      let data = testNapi.OH_Udmf_GetUnifiedDataTypes001();
      console.info( TAG + 'OH_Udmf_GetUnifiedDataTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0700
     * @tc.name OH_Udmf_GetUnifiedRecordTypes001
     * @tc.desc OH_Udmf_GetUnifiedRecordTypes001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_GetUnifiedRecordTypes001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetUnifiedRecordTypes001' );
      let data = testNapi.OH_Udmf_GetUnifiedRecordTypes001();
      console.info( TAG + 'OH_Udmf_GetUnifiedRecordTypes001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0800
     * @tc.name OH_Udmf_GetRecords001
     * @tc.desc OH_Udmf_GetRecords001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_GetRecords001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetRecords001' );
      let data = testNapi.OH_Udmf_GetRecords001();
      console.info( TAG + 'OH_Udmf_GetRecords001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_0900
     * @tc.name OH_Udmf_SetAndGetUnifiedData001
     * @tc.desc OH_Udmf_SetAndGetUnifiedData001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_SetAndGetUnifiedData001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetAndGetUnifiedData001' );
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData001();
      console.info( TAG + 'OH_Udmf_SetAndGetUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1000
     * @tc.name OH_Udmf_SetAndGetUnifiedData002
     * @tc.desc OH_Udmf_SetAndGetUnifiedData002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_SetAndGetUnifiedData002',0, async function () {
      console.info( TAG + 'OH_Udmf_SetAndGetUnifiedData002' );
      let data = testNapi.OH_Udmf_SetAndGetUnifiedData002();
      console.info( TAG + 'OH_Udmf_SetAndGetUnifiedData002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1100
     * @tc.name OH_Udmf_GetRecords002
     * @tc.desc OH_Udmf_GetRecords002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_GetRecords002',0, async function () {
      console.info( TAG + 'OH_Udmf_GetRecords002' );
      let data = testNapi.OH_Udmf_GetRecords002();
      console.info( TAG + 'OH_Udmf_GetRecords002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1200
     * @tc.name OH_Udmf_AddAndGetGeneralEntry001
     * @tc.desc OH_Udmf_AddAndGetGeneralEntry001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_AddAndGetGeneralEntry001',0, async function () {
      console.info( TAG + 'OH_Udmf_AddAndGetGeneralEntry001' );
      let data = testNapi.OH_Udmf_AddAndGetGeneralEntry001();
      console.info( TAG + 'OH_Udmf_AddAndGetGeneralEntry001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    // 2. BuildAndGet NAPI_ASSERT==================================
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1300
     * @tc.name OH_Udmf_BuildAndGetPlainTextFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetPlainTextFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */      
    it('OH_Udmf_BuildAndGetPlainTextFromRecord001',0, async function () {
      console.info( TAG + 'OH_Udmf_BuildAndGetPlainTextFromRecord001' );
      let data = testNapi.OH_Udmf_BuildAndGetPlainTextFromRecord001();
      console.info( TAG + 'OH_Udmf_BuildAndGetPlainTextFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1400
     * @tc.name OH_Udmf_BuildAndGetHyperlinkFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetHyperlinkFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */   
    it('OH_Udmf_BuildAndGetHyperlinkFromRecord001',0, async function () {
      console.info( TAG + 'OH_Udmf_BuildAndGetHyperlinkFromRecord001' );
      let data = testNapi.OH_Udmf_BuildAndGetHyperlinkFromRecord001();
      console.info( TAG + 'OH_Udmf_BuildAndGetHyperlinkFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1500
     * @tc.name OH_Udmf_BuildAndGetHtmlFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetHtmlFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */   
    it('OH_Udmf_BuildAndGetHtmlFromRecord001',0, async function () {
      console.info( TAG + 'OH_Udmf_BuildAndGetHtmlFromRecord001' );
      let data = testNapi.OH_Udmf_BuildAndGetHtmlFromRecord001();
      console.info( TAG + 'OH_Udmf_BuildAndGetHtmlFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1600
     * @tc.name OH_Udmf_BuildAndGetAppItemFromRecord001
     * @tc.desc OH_Udmf_BuildAndGetAppItemFromRecord001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */   
    it('OH_Udmf_BuildAndGetAppItemFromRecord001',0, async function () {
      console.info( TAG + 'OH_Udmf_BuildAndGetAppItemFromRecord001' );
      let data = testNapi.OH_Udmf_BuildAndGetAppItemFromRecord001();
      console.info( TAG + 'OH_Udmf_BuildAndGetAppItemFromRecord001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(0);
    })
    // 3. OH_UdmfProperty  napi_create_int32 =====================    

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1700
     * @tc.name OH_Udmf_CreatePropertiesFromUnifiedData001
     * @tc.desc OH_Udmf_CreatePropertiesFromUnifiedData
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Udmf_CreatePropertiesFromUnifiedData001',0, async function () {
      console.info( TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001' );
      let data = testNapi.OH_Udmf_CreatePropertiesFromUnifiedData001();
      console.info( TAG + 'OH_Udmf_CreatePropertiesFromUnifiedData001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 

    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1800
     * @tc.name OH_Udmf_SetPropertiesTag001
     * @tc.desc OH_Udmf_SetPropertiesTag001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_Udmf_SetPropertiesTag001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesTag001' );
      let data = testNapi.OH_Udmf_SetPropertiesTag001();
      console.info( TAG + 'OH_Udmf_SetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_1900
     * @tc.name OH_Udmf_GetPropertiesTag001
     * @tc.desc OH_Udmf_GetPropertiesTag001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_GetPropertiesTag001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetPropertiesTag001' );
      let data = testNapi.OH_Udmf_GetPropertiesTag001();
      console.info( TAG + 'OH_Udmf_GetPropertiesTag001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2000
     * @tc.name OH_Udmf_SetPropertiesShareOption001
     * @tc.desc OH_Udmf_SetPropertiesShareOption001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_SetPropertiesShareOption001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesShareOption001' );
      let data = testNapi.OH_Udmf_SetPropertiesShareOption001();
      console.info( TAG + 'OH_Udmf_SetPropertiesShareOption001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2100
     * @tc.name OH_Udmf_GetPropertiesShareOption001
     * @tc.desc OH_Udmf_GetPropertiesShareOption001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_GetPropertiesShareOption001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetPropertiesShareOption001' );
      let data = testNapi.OH_Udmf_GetPropertiesShareOption001();
      console.info( TAG + 'OH_Udmf_GetPropertiesShareOption001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2200
     * @tc.name OH_Udmf_SetPropertiesShareOption002
     * @tc.desc OH_Udmf_SetPropertiesShareOption002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_SetPropertiesShareOption002',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesShareOption002' );
      let data = testNapi.OH_Udmf_SetPropertiesShareOption002();
      console.info( TAG + 'OH_Udmf_SetPropertiesShareOption002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2300
     * @tc.name OH_Udmf_GetPropertiesShareOption002
     * @tc.desc OH_Udmf_GetPropertiesShareOption002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_GetPropertiesShareOption002',0, async function () {
      console.info( TAG + 'OH_Udmf_GetPropertiesShareOption002' );
      let data = testNapi.OH_Udmf_GetPropertiesShareOption002();
      console.info( TAG + 'OH_Udmf_GetPropertiesShareOption002 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2400
     * @tc.name OH_Udmf_SetPropertiesShareOption003
     * @tc.desc OH_Udmf_SetPropertiesShareOption003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_SetPropertiesShareOption003',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesShareOption003' );
      let data = testNapi.OH_Udmf_SetPropertiesShareOption003();
      console.info( TAG + 'OH_Udmf_SetPropertiesShareOption003 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2500
     * @tc.name OH_Udmf_SetPropertiesExtrasIntParam001
     * @tc.desc OH_Udmf_SetPropertiesExtrasIntParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_SetPropertiesExtrasIntParam001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesExtrasIntParam001' );
      let data = testNapi.OH_Udmf_SetPropertiesExtrasIntParam001();
      console.info( TAG + 'OH_Udmf_SetPropertiesExtrasIntParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2600
     * @tc.name OH_Udmf_GetPropertiesExtrasIntParam001
     * @tc.desc OH_Udmf_GetPropertiesExtrasIntParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_GetPropertiesExtrasIntParam001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetPropertiesExtrasIntParam001' );
      let data = testNapi.OH_Udmf_GetPropertiesExtrasIntParam001();
      console.info( TAG + 'OH_Udmf_GetPropertiesExtrasIntParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2700
     * @tc.name OH_Udmf_SetPropertiesExtrasStringParam001
     * @tc.desc OH_Udmf_SetPropertiesExtrasStringParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_SetPropertiesExtrasStringParam001',0, async function () {
      console.info( TAG + 'OH_Udmf_SetPropertiesExtrasStringParam001' );
      let data = testNapi.OH_Udmf_SetPropertiesExtrasStringParam001();
      console.info( TAG + 'OH_Udmf_SetPropertiesExtrasStringParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDMF_SDK_NdkApiTest_2800
     * @tc.name OH_Udmf_GetPropertiesExtrasStringParam001
     * @tc.desc OH_Udmf_GetPropertiesExtrasStringParam001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */ 
    it('OH_Udmf_GetPropertiesExtrasStringParam001',0, async function () {
      console.info( TAG + 'OH_Udmf_GetPropertiesExtrasStringParam001' );
      let data = testNapi.OH_Udmf_GetPropertiesExtrasStringParam001();
      console.info( TAG + 'OH_Udmf_GetPropertiesExtrasStringParam001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    
  })
}