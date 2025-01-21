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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';

const TAG = "[ UdsNdkTest ] ------ ";

export default function UdsNdkTest() {
  describe('UdsNdkTest', async function () {
    beforeAll(async function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {     
    })
    afterAll(function () {
    })

    // PlainText =======================================================
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0100
     * @tc.name OH_UdsPlainText_Create_0100
     * @tc.desc OH_UdsPlainText_Create
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_Create_0100',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_Create_0100' );
      let data = testNapi.OH_UdsPlainText_Create_0100();
      console.info( TAG + 'OH_UdsPlainText_Create_0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0200
     * @tc.name OH_UdsPlainText_Destroy_0100
     * @tc.desc OH_UdsPlainText_Destroy
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_UdsPlainText_Destroy_0100',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_Destroy_0100' );
      let data = testNapi.OH_UdsPlainText_Destroy_0100();
      console.info( TAG + 'OH_UdsPlainText_Destroy_0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0300
     * @tc.name OH_UdsPlainText_GetType_0100
     * @tc.desc OH_UdsPlainText_GetType
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetType_0100',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_GetType_0100' );
      let data = testNapi.OH_UdsPlainText_GetType_0100();
      console.info( TAG + 'OH_UdsPlainText_GetType_0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0400
     * @tc.name OH_UdsPlainText_SetContent_001
     * @tc.desc OH_UdsPlainText_SetContent
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetContent_001',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_SetContent_001' );
      let data = testNapi.OH_UdsPlainText_SetContent_001();
      console.info( TAG + 'OH_UdsPlainText_SetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0500
     * @tc.name OH_UdsPlainText_GetContent_001
     * @tc.desc OH_UdsPlainText_GetContent
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetContent_001',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_GetContent_001' );
      let data = testNapi.OH_UdsPlainText_GetContent_001();
      console.info( TAG + 'OH_UdsPlainText_GetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0600
     * @tc.name OH_UdsPlainText_SetAbstract_001
     * @tc.desc OH_UdsPlainText_SetAbstract
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetAbstract_001',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_SetAbstract_001' );
      let data = testNapi.OH_UdsPlainText_SetAbstract_001();
      console.info( TAG + 'OH_UdsPlainText_SetAbstract_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0700
     * @tc.name OH_UdsPlainText_GetAbstract_001
     * @tc.desc OH_UdsPlainText_GetAbstract
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetAbstract_001',0, async function () {
      console.info( TAG + 'OH_UdsPlainText_GetAbstract_001' );
      let data = testNapi.OH_UdsPlainText_GetAbstract_001();
      console.info( TAG + 'OH_UdsPlainText_GetAbstract_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    // 2. Hyperlink ========================================================
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0800
     * @tc.name OH_UdsHyperlink_Create_001
     * @tc.desc OH_UdsHyperlink_Create
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_Create_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_Create_001' );
      let data = testNapi.OH_UdsHyperlink_Create_001();
      console.info( TAG + 'OH_UdsHyperlink_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0900
     * @tc.name OH_UdsHyperlink_Destroy_001
     * @tc.desc OH_UdsHyperlink_Destroy
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */   
    it('OH_UdsHyperlink_Destroy_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_Destroy_001' );
      let data = testNapi.OH_UdsHyperlink_Destroy_001();
      console.info( TAG + 'OH_UdsHyperlink_Destroy_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1000
     * @tc.name OH_UdsHyperlink_GetType_001
     * @tc.desc OH_UdsHyperlink_GetType
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetType_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_GetType_001' );
      let data = testNapi.OH_UdsHyperlink_GetType_001();
      console.info( TAG + 'OH_UdsHyperlink_GetType_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1100
     * @tc.name OH_UdsHyperlink_SetUrl_001
     * @tc.desc OH_UdsHyperlink_SetUrl
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetUrl_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_SetUrl_001' );
      let data = testNapi.OH_UdsHyperlink_SetUrl_001();
      console.info( TAG + 'OH_UdsHyperlink_SetUrl_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1200
     * @tc.name OH_UdsHyperlink_GetUrl_001
     * @tc.desc OH_UdsHyperlink_GetUrl
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetUrl_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_GetUrl_001' );
      let data = testNapi.OH_UdsHyperlink_GetUrl_001();
      console.info( TAG + 'OH_UdsHyperlink_GetUrl_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1300
     * @tc.name OH_UdsHyperlink_SetDescription_001
     * @tc.desc OH_UdsHyperlink_SetDescription
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetDescription_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_SetDescription_001' );
      let data = testNapi.OH_UdsHyperlink_SetDescription_001();
      console.info( TAG + 'OH_UdsHyperlink_SetDescription_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetDescription_001
     * @tc.desc OH_UdsHyperlink_GetDescription
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetDescription_001',0, async function () {
      console.info( TAG + 'OH_UdsHyperlink_GetDescription_001' );
      let data = testNapi.OH_UdsHyperlink_GetDescription_001();
      console.info( TAG + 'OH_UdsHyperlink_GetDescription_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    // 3.html ========================================================
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1500
     * @tc.name OH_UdsHtml_Create_001
     * @tc.desc OH_UdsHtml_Create
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_UdsHtml_Create_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_Create_001' );
      let data = testNapi.OH_UdsHtml_Create_001();
      console.info( TAG + 'OH_UdsHtml_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1600
     * @tc.name OH_UdsHtml_Destroy_001
     * @tc.desc OH_UdsHtml_Destroy
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_Destroy_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_Destroy_001' );
      let data = testNapi.OH_UdsHtml_Destroy_001();
      console.info( TAG + 'OH_UdsHtml_Destroy_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1700
     * @tc.name OH_UdsHtml_GetType_001
     * @tc.desc OH_UdsHtml_GetType
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */   
    it('OH_UdsHtml_GetType_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_GetType_001' );
      let data = testNapi.OH_UdsHtml_GetType_001();
      console.info( TAG + 'OH_UdsHtml_GetType_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1800
     * @tc.name OH_UdsHtml_SetContent_001
     * @tc.desc OH_UdsHtml_SetContent
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetContent_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_SetContent_001' );
      let data = testNapi.OH_UdsHtml_SetContent_001();
      console.info( TAG + 'OH_UdsHtml_SetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1900
     * @tc.name OH_UdsHtml_GetContent_001
     * @tc.desc OH_UdsHtml_GetContent
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_GetContent_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_GetContent_001' );
      let data = testNapi.OH_UdsHtml_GetContent_001();
      console.info( TAG + 'OH_UdsHtml_GetContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2000
     * @tc.name OH_UdsHtml_SetPlainContent_001
     * @tc.desc OH_UdsHtml_SetPlainContent
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetPlainContent_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_SetPlainContent_001' );
      let data = testNapi.OH_UdsHtml_SetPlainContent_001();
      console.info( TAG + 'OH_UdsHtml_SetPlainContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2100
     * @tc.name OH_UdsHtml_GetPlainContent_001
     * @tc.desc OH_UdsHtml_GetPlainContent
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_GetPlainContent_001',0, async function () {
      console.info( TAG + 'OH_UdsHtml_GetPlainContent_001' );
      let data = testNapi.OH_UdsHtml_GetPlainContent_001();
      console.info( TAG + 'OH_UdsHtml_GetPlainContent_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    // 4. AppItem ========================================================
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2200
     * @tc.name OH_UdsAppItem_Create_001
     * @tc.desc OH_UdsAppItem_Create
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_UdsAppItem_Create_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_Create_001' );
      let data = testNapi.OH_UdsAppItem_Create_001();
      console.info( TAG + 'OH_UdsAppItem_Create_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2300
     * @tc.name OH_UdsAppItem_Destroy_001
     * @tc.desc OH_UdsAppItem_Destroy
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_Destroy_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_Destroy_001' );
      let data = testNapi.OH_UdsAppItem_Destroy_001();
      console.info( TAG + 'OH_UdsAppItem_Destroy_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2400
     * @tc.name OH_UdsAppItem_GetType_001
     * @tc.desc OH_UdsAppItem_GetType
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetType_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetType_001' );
      let data = testNapi.OH_UdsAppItem_GetType_001();
      console.info( TAG + 'OH_UdsAppItem_GetType_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2500
     * @tc.name OH_UdsAppItem_SetId_001
     * @tc.desc OH_UdsAppItem_SetId
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetId_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_SetId_001' );
      let data = testNapi.OH_UdsAppItem_SetId_001();
      console.info( TAG + 'OH_UdsAppItem_SetId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2600
     * @tc.name OH_UdsAppItem_GetId_001
     * @tc.desc OH_UdsAppItem_GetId
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetId_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetId_001' );
      let data = testNapi.OH_UdsAppItem_GetId_001();
      console.info( TAG + 'OH_UdsAppItem_GetId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2700
     * @tc.name OH_UdsAppItem_SetName_001
     * @tc.desc OH_UdsAppItem_SetName
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetName_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_SetName_001' );
      let data = testNapi.OH_UdsAppItem_SetName_001();
      console.info( TAG + 'OH_UdsAppItem_SetName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2800
     * @tc.name OH_UdsAppItem_GetName_001
     * @tc.desc OH_UdsAppItem_GetName
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetName_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetName_001' );
      let data = testNapi.OH_UdsAppItem_GetName_001();
      console.info( TAG + 'OH_UdsAppItem_GetName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_2900
     * @tc.name OH_UdsAppItem_SetIconId_001
     * @tc.desc OH_UdsAppItem_SetIconId
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetIconId_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_SetIconId_001' );
      let data = testNapi.OH_UdsAppItem_SetIconId_001();
      console.info( TAG + 'OH_UdsAppItem_SetIconId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3000
     * @tc.name OH_UdsAppItem_GetIconId_001
     * @tc.desc OH_UdsAppItem_GetIconId
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetIconId_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetIconId_001' );
      let data = testNapi.OH_UdsAppItem_GetIconId_001();
      console.info( TAG + 'OH_UdsAppItem_GetIconId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })   
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3100
     * @tc.name OH_UdsAppItem_SetLabelId_001
     * @tc.desc OH_UdsAppItem_SetLabelId
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */    
    it('OH_UdsAppItem_SetLabelId_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_SetLabelId_001' );
      let data = testNapi.OH_UdsAppItem_SetLabelId_001();
      console.info( TAG + 'OH_UdsAppItem_SetLabelId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3200
     * @tc.name OH_UdsAppItem_GetLabelId_001
     * @tc.desc OH_UdsAppItem_GetLabelId
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetLabelId_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetLabelId_001' );
      let data = testNapi.OH_UdsAppItem_GetLabelId_001();
      console.info( TAG + 'OH_UdsAppItem_GetLabelId_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })  
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3300
     * @tc.name OH_UdsAppItem_SetBundleName_001
     * @tc.desc OH_UdsAppItem_SetBundleName
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetBundleName_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_SetBundleName_001' );
      let data = testNapi.OH_UdsAppItem_SetBundleName_001();
      console.info( TAG + 'OH_UdsAppItem_SetBundleName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3400
     * @tc.name OH_UdsAppItem_GetBundleName_001
     * @tc.desc OH_UdsAppItem_GetBundleName
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetBundleName_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetBundleName_001' );
      let data = testNapi.OH_UdsAppItem_GetBundleName_001();
      console.info( TAG + 'OH_UdsAppItem_GetBundleName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3500
     * @tc.name OH_UdsAppItem_SetAbilityName_001
     * @tc.desc OH_UdsAppItem_SetAbilityName
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetAbilityName_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_SetAbilityName_001' );
      let data = testNapi.OH_UdsAppItem_SetAbilityName_001();
      console.info( TAG + 'OH_UdsAppItem_SetAbilityName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    }) 
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_3600
     * @tc.name OH_UdsAppItem_GetAbilityName_001
     * @tc.desc OH_UdsAppItem_GetAbilityName
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetAbilityName_001',0, async function () {
      console.info( TAG + 'OH_UdsAppItem_GetAbilityName_001' );
      let data = testNapi.OH_UdsAppItem_GetAbilityName_001();
      console.info( TAG + 'OH_UdsAppItem_GetAbilityName_001 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })    


  })
}