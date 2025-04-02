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
import testNapi from 'libUdsNdkex.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const TAG = "[ UdsNdkTest ] ------ ";

export default function UdsNdkexTest() {
  describe('UdsNdkexTest', async function () {
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
     * @tc.name OH_UdsPlainText_GetType_0100
     * @tc.desc OH_UdsPlainText_GetType_0100
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0200
     * @tc.name OH_UdsPlainText_SetContent_001
     * @tc.desc OH_UdsPlainText_SetContent_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0300
     * @tc.name OH_UdsPlainText_SetContent_002
     * @tc.desc OH_UdsPlainText_SetContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetContent_002',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetContent_002' );
       let data = testNapi.OH_UdsPlainText_SetContent_002();
       console.info( TAG + 'OH_UdsPlainText_SetContent_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0400
     * @tc.name OH_UdsPlainText_SetContent_003
     * @tc.desc OH_UdsPlainText_SetContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetContent_003',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetContent_003' );
       let data = testNapi.OH_UdsPlainText_SetContent_003();
       console.info( TAG + 'OH_UdsPlainText_SetContent_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0500
     * @tc.name OH_UdsPlainText_SetContent_004
     * @tc.desc OH_UdsPlainText_SetContent_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetContent_004',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetContent_004' );
       let data = testNapi.OH_UdsPlainText_SetContent_004();
       console.info( TAG + 'OH_UdsPlainText_SetContent_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0600
     * @tc.name OH_UdsPlainText_SetContent_005
     * @tc.desc OH_UdsPlainText_SetContent_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetContent_005',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetContent_005' );
       let data = testNapi.OH_UdsPlainText_SetContent_005();
       console.info( TAG + 'OH_UdsPlainText_SetContent_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0700
     * @tc.name OH_UdsPlainText_GetContent_001
     * @tc.desc OH_UdsPlainText_Create
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0800
     * @tc.name OH_UdsPlainText_GetContent_002
     * @tc.desc OH_UdsPlainText_GetContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetContent_002',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_GetContent_002' );
       let data = testNapi.OH_UdsPlainText_GetContent_002();
       console.info( TAG + 'OH_UdsPlainText_GetContent_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_0900
     * @tc.name OH_UdsPlainText_GetContent_003
     * @tc.desc OH_UdsPlainText_GetContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetContent_003',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_GetContent_003' );
       let data = testNapi.OH_UdsPlainText_GetContent_003();
       console.info( TAG + 'OH_UdsPlainText_GetContent_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1000
     * @tc.name OH_UdsPlainText_SetAbstract_001
     * @tc.desc OH_UdsPlainText_Create
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1100
     * @tc.name OH_UdsPlainText_SetAbstract_002
     * @tc.desc OH_UdsPlainText_SetAbstract_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetAbstract_002',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_002' );
       let data = testNapi.OH_UdsPlainText_SetAbstract_002();
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1200
     * @tc.name OH_UdsPlainText_SetAbstract_003
     * @tc.desc OH_UdsPlainText_Create
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetAbstract_003',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_003' );
       let data = testNapi.OH_UdsPlainText_SetAbstract_003();
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1300
     * @tc.name OH_UdsPlainText_Create_0100
     * @tc.desc OH_UdsPlainText_SetAbstract_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetAbstract_004',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_004' );
       let data = testNapi.OH_UdsPlainText_SetAbstract_004();
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsPlainText_SetAbstract_005
     * @tc.desc OH_UdsPlainText_SetAbstract_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_SetAbstract_005',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_005' );
       let data = testNapi.OH_UdsPlainText_SetAbstract_005();
       console.info( TAG + 'OH_UdsPlainText_SetAbstract_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })


    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetType_001
     * @tc.desc OH_UdsHyperlink_GetType_001
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
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsPlainText_GetAbstract_002
     * @tc.desc OH_UdsPlainText_GetAbstract_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetAbstract_002',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_GetAbstract_002' );
       let data = testNapi.OH_UdsPlainText_GetAbstract_002();
       console.info( TAG + 'OH_UdsPlainText_GetAbstract_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsPlainText_GetAbstract_003
     * @tc.desc OH_UdsPlainText_GetAbstract_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsPlainText_GetAbstract_003',0, async function () {
       console.info( TAG + 'OH_UdsPlainText_GetAbstract_003' );
       let data = testNapi.OH_UdsPlainText_GetAbstract_003();
       console.info( TAG + 'OH_UdsPlainText_GetAbstract_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetType_001
     * @tc.desc OH_UdsHyperlink_GetType_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetUrl_001
     * @tc.desc OH_UdsHyperlink_SetUrl_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetUrl_002
     * @tc.desc OH_UdsHyperlink_SetUrl_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetUrl_002',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_002' );
       let data = testNapi.OH_UdsHyperlink_SetUrl_002();
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
      /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetUrl_003
     * @tc.desc OH_UdsHyperlink_SetUrl_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetUrl_003',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_003' );
       let data = testNapi.OH_UdsHyperlink_SetUrl_003();
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
      /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetUrl_004
     * @tc.desc OH_UdsHyperlink_SetUrl_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetUrl_004',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_004' );
       let data = testNapi.OH_UdsHyperlink_SetUrl_004();
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetUrl_005
     * @tc.desc OH_UdsHyperlink_SetUrl_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetUrl_005',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_005' );
       let data = testNapi.OH_UdsHyperlink_SetUrl_005();
       console.info( TAG + 'OH_UdsHyperlink_SetUrl_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetUrl_001
     * @tc.desc OH_UdsHyperlink_GetUrl_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetUrl_002
     * @tc.desc OH_UdsHyperlink_GetUrl_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetUrl_002',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_GetUrl_002' );
       let data = testNapi.OH_UdsHyperlink_GetUrl_002();
       console.info( TAG + 'OH_UdsHyperlink_GetUrl_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetUrl_003
     * @tc.desc OH_UdsHyperlink_GetUrl_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetUrl_003',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_GetUrl_003' );
       let data = testNapi.OH_UdsHyperlink_GetUrl_003();
       console.info( TAG + 'OH_UdsHyperlink_GetUrl_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetDescription_001
     * @tc.desc OH_UdsHyperlink_SetDescription_001
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
     * @tc.name OH_UdsHyperlink_SetDescription_002
     * @tc.desc OH_UdsHyperlink_SetDescription_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetDescription_002',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_002' );
       let data = testNapi.OH_UdsHyperlink_SetDescription_002();
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })


    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetDescription_003
     * @tc.desc OH_UdsHyperlink_SetDescription_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetDescription_003',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_003' );
       let data = testNapi.OH_UdsHyperlink_SetDescription_003();
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetDescription_003
     * @tc.desc OH_UdsHyperlink_SetDescription_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetDescription_003',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_003' );
       let data = testNapi.OH_UdsHyperlink_SetDescription_003();
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_SetDescription_004
     * @tc.desc OH_UdsHyperlink_SetDescription_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_SetDescription_004',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_004' );
       let data = testNapi.OH_UdsHyperlink_SetDescription_004();
       console.info( TAG + 'OH_UdsHyperlink_SetDescription_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetDescription_005
     * @tc.desc OH_UdsHyperlink_GetDescription_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetDescription_005',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_GetDescription_005' );
       let data = testNapi.OH_UdsHyperlink_GetDescription_005();
       console.info( TAG + 'OH_UdsHyperlink_GetDescription_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
      /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetDescription_001
     * @tc.desc OH_UdsHyperlink_GetDescription_001
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
      /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetContent_005
     * @tc.desc OH_UdsHtml_SetContent_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetDescription_002',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_GetDescription_002' );
       let data = testNapi.OH_UdsHyperlink_GetDescription_002();
       console.info( TAG + 'OH_UdsHyperlink_GetDescription_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
      /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHyperlink_GetDescription_003
     * @tc.desc OH_UdsHyperlink_GetDescription_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHyperlink_GetDescription_003',0, async function () {
       console.info( TAG + 'OH_UdsHyperlink_GetDescription_003' );
       let data = testNapi.OH_UdsHyperlink_GetDescription_003();
       console.info( TAG + 'OH_UdsHyperlink_GetDescription_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
      /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetType_001
     * @tc.desc OH_UdsHtml_GetType_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetContent_001
     * @tc.desc OH_UdsHtml_SetContent_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetContent_002
     * @tc.desc OH_UdsHtml_SetContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetContent_002',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetContent_002' );
       let data = testNapi.OH_UdsHtml_SetContent_002();
       console.info( TAG + 'OH_UdsHtml_SetContent_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetContent_003
     * @tc.desc OH_UdsHtml_SetContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetContent_003',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetContent_003' );
       let data = testNapi.OH_UdsHtml_SetContent_003();
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetContent_004
     * @tc.desc OH_UdsHtml_SetContent_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetContent_004',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetContent_004' );
       let data = testNapi.OH_UdsHtml_SetContent_004();
       console.info( TAG + 'OH_UdsHtml_SetContent_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetContent_005
     * @tc.desc OH_UdsHtml_SetContent_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetContent_005',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetContent_005' );
       let data = testNapi.OH_UdsHtml_SetContent_005();
       console.info( TAG + 'OH_UdsHtml_SetContent_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetContent_001
     * @tc.desc OH_UdsHtml_GetContent_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetContent_002
     * @tc.desc OH_UdsHtml_GetContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_GetContent_002',0, async function () {
       console.info( TAG + 'OH_UdsHtml_GetContent_002' );
       let data = testNapi.OH_UdsHtml_GetContent_002();
       console.info( TAG + 'OH_UdsHtml_GetContent_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetContent_003
     * @tc.desc OH_UdsHtml_GetContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_GetContent_003',0, async function () {
       console.info( TAG + 'OH_UdsHtml_GetContent_003' );
       let data = testNapi.OH_UdsHtml_GetContent_003();
       console.info( TAG + 'OH_UdsHtml_GetContent_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetPlainContent_001
     * @tc.desc OH_UdsHtml_SetPlainContent_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetPlainContent_002
     * @tc.desc OH_UdsHtml_SetPlainContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetPlainContent_002',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_002' );
       let data = testNapi.OH_UdsHtml_SetPlainContent_002();
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetPlainContent_003
     * @tc.desc OH_UdsHtml_SetPlainContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetPlainContent_003',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_003' );
       let data = testNapi.OH_UdsHtml_SetPlainContent_003();
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetPlainContent_004
     * @tc.desc OH_UdsHtml_SetPlainContent_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetPlainContent_004',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_004' );
       let data = testNapi.OH_UdsHtml_SetPlainContent_004();
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_SetPlainContent_005
     * @tc.desc OH_UdsHtml_SetPlainContent_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_SetPlainContent_005',0, async function () {
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_005' );
       let data = testNapi.OH_UdsHtml_SetPlainContent_005();
       console.info( TAG + 'OH_UdsHtml_SetPlainContent_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })

         /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetPlainContent_001
     * @tc.desc OH_UdsHtml_GetPlainContent_001
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
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetPlainContent_002
     * @tc.desc OH_UdsHtml_GetPlainContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_GetPlainContent_002',0, async function () {
       console.info( TAG + 'OH_UdsHtml_GetPlainContent_002' );
       let data = testNapi.OH_UdsHtml_GetPlainContent_002();
       console.info( TAG + 'OH_UdsHtml_GetPlainContent_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetPlainContent_003
     * @tc.desc OH_UdsHtml_GetPlainContent_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsHtml_GetPlainContent_003',0, async function () {
       console.info( TAG + 'OH_UdsHtml_GetPlainContent_003' );
       let data = testNapi.OH_UdsHtml_GetPlainContent_003();
       console.info( TAG + 'OH_UdsHtml_GetPlainContent_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })

    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetType_001
     * @tc.desc OH_UdsAppItem_GetType_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetId_001
     * @tc.desc OH_UdsAppItem_SetId_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetId_002
     * @tc.desc OH_UdsAppItem_SetId_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetId_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetId_002' );
       let data = testNapi.OH_UdsAppItem_SetId_002();
       console.info( TAG + 'OH_UdsAppItem_SetId_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetId_003
     * @tc.desc OH_UdsAppItem_SetId_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetId_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetId_003' );
       let data = testNapi.OH_UdsAppItem_SetId_003();
       console.info( TAG + 'OH_UdsAppItem_SetId_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetId_004
     * @tc.desc OH_UdsAppItem_SetId_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetId_004',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetId_004' );
       let data = testNapi.OH_UdsAppItem_SetId_004();
       console.info( TAG + 'OH_UdsAppItem_SetId_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetId_005
     * @tc.desc OH_UdsAppItem_SetId_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetId_005',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetId_005' );
       let data = testNapi.OH_UdsAppItem_SetId_005();
       console.info( TAG + 'OH_UdsAppItem_SetId_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetId_001
     * @tc.desc OH_UdsAppItem_GetId_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetId_002
     * @tc.desc OH_UdsAppItem_GetId_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetId_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetId_002' );
       let data = testNapi.OH_UdsAppItem_GetId_002();
       console.info( TAG + 'OH_UdsAppItem_GetId_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetId_003
     * @tc.desc OH_UdsAppItem_GetId_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetId_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetId_003' );
       let data = testNapi.OH_UdsAppItem_GetId_003();
       console.info( TAG + 'OH_UdsAppItem_GetId_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetName_001
     * @tc.desc OH_UdsAppItem_SetName_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetName_002
     * @tc.desc OH_UdsAppItem_SetName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetName_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetName_002' );
       let data = testNapi.OH_UdsAppItem_SetName_002();
       console.info( TAG + 'OH_UdsAppItem_SetName_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetName_003
     * @tc.desc OH_UdsAppItem_SetName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetName_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetName_003' );
       let data = testNapi.OH_UdsAppItem_SetName_003();
       console.info( TAG + 'OH_UdsAppItem_SetName_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetName_004
     * @tc.desc OH_UdsAppItem_SetName_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetName_004',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetName_004' );
       let data = testNapi.OH_UdsAppItem_SetName_004();
       console.info( TAG + 'OH_UdsAppItem_SetName_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetName_005
     * @tc.desc OH_UdsAppItem_SetName_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetName_005',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetName_005' );
       let data = testNapi.OH_UdsAppItem_SetName_005();
       console.info( TAG + 'OH_UdsAppItem_SetName_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetName_001
     * @tc.desc OH_UdsAppItem_GetName_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetName_002
     * @tc.desc OH_UdsAppItem_GetName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetName_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetName_002' );
       let data = testNapi.OH_UdsAppItem_GetName_002();
       console.info( TAG + 'OH_UdsAppItem_GetName_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetName_003
     * @tc.desc OH_UdsAppItem_GetName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetName_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetName_003' );
       let data = testNapi.OH_UdsAppItem_GetName_003();
       console.info( TAG + 'OH_UdsAppItem_GetName_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetIconId_001
     * @tc.desc OH_UdsAppItem_SetIconId_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsHtml_GetPlainContent_002
     * @tc.desc OH_UdsHtml_GetPlainContent_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetIconId_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetIconId_002' );
       let data = testNapi.OH_UdsAppItem_SetIconId_002();
       console.info( TAG + 'OH_UdsAppItem_SetIconId_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetIconId_003
     * @tc.desc OH_UdsAppItem_SetIconId_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetIconId_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetIconId_003' );
       let data = testNapi.OH_UdsAppItem_SetIconId_003();
       console.info( TAG + 'OH_UdsAppItem_SetIconId_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetIconId_004
     * @tc.desc OH_UdsAppItem_SetIconId_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetIconId_004',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetIconId_004' );
       let data = testNapi.OH_UdsAppItem_SetIconId_004();
       console.info( TAG + 'OH_UdsAppItem_SetIconId_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetIconId_005
     * @tc.desc OH_UdsAppItem_SetIconId_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetIconId_005',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetIconId_005' );
       let data = testNapi.OH_UdsAppItem_SetIconId_005();
       console.info( TAG + 'OH_UdsAppItem_SetIconId_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetIconId_001
     * @tc.desc OH_UdsAppItem_GetIconId_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetIconId_002
     * @tc.desc OH_UdsAppItem_GetIconId_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetIconId_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetIconId_002' );
       let data = testNapi.OH_UdsAppItem_GetIconId_002();
       console.info( TAG + 'OH_UdsAppItem_GetIconId_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetIconId_003
     * @tc.desc OH_UdsAppItem_GetIconId_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetIconId_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetIconId_003' );
       let data = testNapi.OH_UdsAppItem_GetIconId_003();
       console.info( TAG + 'OH_UdsAppItem_GetIconId_001 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetLabelId_001
     * @tc.desc OH_UdsAppItem_SetLabelId_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetLabelId_002
     * @tc.desc OH_UdsAppItem_SetLabelId_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetLabelId_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_002' );
       let data = testNapi.OH_UdsAppItem_SetLabelId_002();
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetLabelId_003
     * @tc.desc OH_UdsAppItem_SetLabelId_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetLabelId_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_003' );
       let data = testNapi.OH_UdsAppItem_SetLabelId_003();
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetLabelId_004
     * @tc.desc OH_UdsAppItem_SetLabelId_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetLabelId_004',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_004' );
       let data = testNapi.OH_UdsAppItem_SetLabelId_004();
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetLabelId_005
     * @tc.desc OH_UdsAppItem_SetLabelId_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetLabelId_005',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_005' );
       let data = testNapi.OH_UdsAppItem_SetLabelId_005();
       console.info( TAG + 'OH_UdsAppItem_SetLabelId_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetLabelId_001
     * @tc.desc OH_UdsAppItem_GetLabelId_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetLabelId_002
     * @tc.desc OH_UdsAppItem_GetLabelId_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetLabelId_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetLabelId_002' );
       let data = testNapi.OH_UdsAppItem_GetLabelId_002();
       console.info( TAG + 'OH_UdsAppItem_GetLabelId_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetLabelId_003
     * @tc.desc OH_UdsAppItem_GetLabelId_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetLabelId_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetLabelId_003' );
       let data = testNapi.OH_UdsAppItem_GetLabelId_003();
       console.info( TAG + 'OH_UdsAppItem_GetLabelId_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetBundleName_001
     * @tc.desc OH_UdsAppItem_SetBundleName_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetBundleName_002
     * @tc.desc OH_UdsAppItem_SetBundleName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetBundleName_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_002' );
       let data = testNapi.OH_UdsAppItem_SetBundleName_002();
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetBundleName_003
     * @tc.desc OH_UdsAppItem_SetBundleName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetBundleName_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_003' );
       let data = testNapi.OH_UdsAppItem_SetBundleName_003();
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetBundleName_004
     * @tc.desc OH_UdsAppItem_SetBundleName_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetBundleName_004',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_004' );
       let data = testNapi.OH_UdsAppItem_SetBundleName_004();
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetBundleName_005
     * @tc.desc OH_UdsAppItem_SetBundleName_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetBundleName_005',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_005' );
       let data = testNapi.OH_UdsAppItem_SetBundleName_005();
       console.info( TAG + 'OH_UdsAppItem_SetBundleName_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetBundleName_001
     * @tc.desc OH_UdsAppItem_GetBundleName_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetBundleName_002
     * @tc.desc OH_UdsAppItem_GetBundleName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetBundleName_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetBundleName_002' );
       let data = testNapi.OH_UdsAppItem_GetBundleName_002();
       console.info( TAG + 'OH_UdsAppItem_GetBundleName_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetBundleName_003
     * @tc.desc OH_UdsAppItem_GetBundleName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetBundleName_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetBundleName_003' );
       let data = testNapi.OH_UdsAppItem_GetBundleName_003();
       console.info( TAG + 'OH_UdsAppItem_GetBundleName_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetAbilityName_001
     * @tc.desc OH_UdsAppItem_SetAbilityName_001
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
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetAbilityName_002
     * @tc.desc OH_UdsAppItem_SetAbilityName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetAbilityName_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_002' );
       let data = testNapi.OH_UdsAppItem_SetAbilityName_002();
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetAbilityName_003
     * @tc.desc OH_UdsAppItem_SetAbilityName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetAbilityName_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_003' );
       let data = testNapi.OH_UdsAppItem_SetAbilityName_003();
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetAbilityName_004
     * @tc.desc OH_UdsAppItem_SetAbilityName_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetAbilityName_004',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_004' );
       let data = testNapi.OH_UdsAppItem_SetAbilityName_004();
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_004 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_SetAbilityName_005
     * @tc.desc OH_UdsAppItem_SetAbilityName_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_SetAbilityName_005',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_005' );
       let data = testNapi.OH_UdsAppItem_SetAbilityName_005();
       console.info( TAG + 'OH_UdsAppItem_SetAbilityName_005 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetAbilityName_001
     * @tc.desc OH_UdsAppItem_GetAbilityName_001
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
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetAbilityName_002
     * @tc.desc OH_UdsAppItem_GetAbilityName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetAbilityName_002',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetAbilityName_002' );
       let data = testNapi.OH_UdsAppItem_GetAbilityName_002();
       console.info( TAG + 'OH_UdsAppItem_GetAbilityName_002 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
    /**
     * @tc.number SUB_DistributedData_UDS_SDK_NdkApiTest_1400
     * @tc.name OH_UdsAppItem_GetAbilityName_003
     * @tc.desc OH_UdsAppItem_GetAbilityName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_UdsAppItem_GetAbilityName_003',0, async function () {
       console.info( TAG + 'OH_UdsAppItem_GetAbilityName_003' );
       let data = testNapi.OH_UdsAppItem_GetAbilityName_003();
       console.info( TAG + 'OH_UdsAppItem_GetAbilityName_003 data= ' + JSON.stringify(data));
       expect(data).assertEqual(1);
     })
  })
}