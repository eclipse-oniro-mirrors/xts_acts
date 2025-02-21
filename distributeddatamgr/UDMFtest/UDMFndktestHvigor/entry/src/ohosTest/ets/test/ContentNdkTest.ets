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
import testNapi from 'libUdsConetformNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const TAG = "[ ContentNdkTest ] ------ ";

export default function ContentNdkTest() {
  describe('ContentNdkTest', async function () {
    beforeAll(async function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {     
    })
    afterAll(function () {
    })

    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0100
     * @tc.name OH_UdsContentForm_Create_001
     * @tc.desc OH_UdsContentForm_Create_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0100' , ' begin');
      let result = testNapi.OH_UdsContentForm_Create_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0200
     * @tc.name OH_UdsContentForm_GetType_001
     * @tc.desc OH_UdsContentForm_GetType_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0200' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetType_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0200 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0300
     * @tc.name OH_UdsContentForm_GetType_002
     * @tc.desc OH_UdsContentForm_GetType_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0300' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetType_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0400
     * @tc.name OH_UdsContentForm_SetThumbData_001
     * @tc.desc OH_UdsContentForm_SetThumbData_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0400' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetThumbData_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0500
     * @tc.name OH_UdsContentForm_SetThumbData_002
     * @tc.desc OH_UdsContentForm_SetThumbData_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0500' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetThumbData_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0600
     * @tc.name OH_UdsContentForm_SetThumbData_003
     * @tc.desc OH_UdsContentForm_SetThumbData_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0600' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetThumbData_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0700
     * @tc.name OH_UdsContentForm_SetThumbData_004
     * @tc.desc OH_UdsContentForm_SetThumbData_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0700' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetThumbData_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0700 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0800
     * @tc.name OH_UdsContentForm_SetThumbData_005
     * @tc.desc OH_UdsContentForm_SetThumbData_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0800' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetThumbData_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0800 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0900
     * @tc.name OH_UdsContentForm_GetThumbData_001
     * @tc.desc OH_UdsContentForm_GetThumbData_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0900',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0900' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetThumbData_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_0900 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1000
     * @tc.name OH_UdsContentForm_GetThumbData_002
     * @tc.desc OH_UdsContentForm_GetThumbData_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1000',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1000' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetThumbData_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1000 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1100
     * @tc.name OH_UdsContentForm_GetThumbData_003
     * @tc.desc OH_UdsContentForm_GetThumbData_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1100' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetThumbData_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1200
     * @tc.name OH_UdsContentForm_GetThumbData_004
     * @tc.desc OH_UdsContentForm_GetThumbData_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1200' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetThumbData_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1200 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1300
     * @tc.name OH_UdsContentForm_SetDescription_001
     * @tc.desc OH_UdsContentForm_SetDescription_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1300' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetDescription_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1400
     * @tc.name OH_UdsHyperlink_GetDescription_001
     * @tc.desc OH_UdsHyperlink_GetDescription_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1400' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetDescription_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1500
     * @tc.name OH_UdsContentForm_SetDescription_003
     * @tc.desc OH_UdsContentForm_SetDescription_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1500' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetDescription_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1600
     * @tc.name OH_UdsContentForm_SetDescription_004
     * @tc.desc OH_UdsContentForm_SetDescription_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1600' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetDescription_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1700
     * @tc.name OH_UdsContentForm_SetDescription_005
     * @tc.desc OH_UdsContentForm_SetDescription_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1700' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetDescription_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1700 key is : '+ result , 'aa');
    })

    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1800
     * @tc.name OH_UdsContentForm_SetDescription_006
     * @tc.desc OH_UdsContentForm_SetDescription_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1800' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetDescription_006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1800 key is : '+ result , 'aa');
    })

    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1900
     * @tc.name OH_UdsContentForm_GetDescription_001
     * @tc.desc OH_UdsContentForm_GetDescription_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1900',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1900' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetDescription_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_1900 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2000
     * @tc.name OH_UdsContentForm_GetDescription_002
     * @tc.desc OH_UdsContentForm_GetDescription_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2000',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2000' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetDescription_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2000 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2100
     * @tc.name OH_UdsContentForm_SetTitle_001
     * @tc.desc OH_UdsContentForm_SetTitle_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2100' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetTitle_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2200
     * @tc.name OH_UdsContentForm_SetTitle_002
     * @tc.desc OH_UdsContentForm_SetTitle_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2200' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetTitle_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2200 key is : '+ result , 'aa');
    })

    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2300
     * @tc.name OH_UdsContentForm_SetTitle_003
     * @tc.desc OH_UdsContentForm_SetTitle_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2300' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetTitle_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2400
     * @tc.name OH_UdsContentForm_SetTitle_004
     * @tc.desc OH_UdsContentForm_SetTitle_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2400' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetTitle_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2500
     * @tc.name OH_UdsContentForm_SetTitle_005
     * @tc.desc OH_UdsContentForm_SetTitle_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2500' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetTitle_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2600
     * @tc.name OH_UdsContentForm_SetTitle_006
     * @tc.desc OH_UdsContentForm_SetTitle_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2600' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetTitle_006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2700
     * @tc.name OH_UdsContentForm_GetTitle_001
     * @tc.desc OH_UdsContentForm_GetTitle_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2700' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetTitle_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2700 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2800
     * @tc.name OH_UdsContentForm_GetTitle_002
     * @tc.desc OH_UdsContentForm_GetTitle_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2800' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetTitle_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2800 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2900
     * @tc.name OH_UdsContentForm_SetAppIcon_001
     * @tc.desc OH_UdsContentForm_SetAppIcon_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2900',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2900' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppIcon_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_2900 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3000
     * @tc.name OH_UdsContentForm_SetAppIcon_002
     * @tc.desc OH_UdsContentForm_SetAppIcon_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3000',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3000' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppIcon_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3000 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3100
     * @tc.name OH_UdsContentForm_SetAppIcon_003
     * @tc.desc OH_UdsContentForm_SetAppIcon_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3100' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppIcon_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3200
     * @tc.name OH_UdsContentForm_SetAppIcon_004
     * @tc.desc OH_UdsContentForm_SetAppIcon_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3200' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppIcon_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3200 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3300
     * @tc.name OH_UdsContentForm_SetAppIcon_005
     * @tc.desc OH_UdsContentForm_SetAppIcon_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3300' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppIcon_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3400
     * @tc.name OH_UdsContentForm_GetAppIcon_001
     * @tc.desc OH_UdsContentForm_GetAppIcon_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3400' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetAppIcon_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3500
     * @tc.name OH_UdsContentForm_GetAppIcon_002
     * @tc.desc OH_UdsContentForm_GetAppIcon_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3500' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetAppIcon_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3600
     * @tc.name OH_UdsContentForm_GetAppIcon_003
     * @tc.desc OH_UdsContentForm_GetAppIcon_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3600' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetAppIcon_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3700
     * @tc.name OH_UdsContentForm_GetAppIcon_004
     * @tc.desc OH_UdsContentForm_GetAppIcon_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3700' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetAppIcon_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3700 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5800
     * @tc.name OH_UdsContentForm_SetAppName_001
     * @tc.desc OH_UdsContentForm_SetAppName_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5800' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppName_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5800 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3800
     * @tc.name OH_UdsContentForm_SetAppName_002
     * @tc.desc OH_UdsContentForm_SetAppName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3800' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppName_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3800 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3900
     * @tc.name OH_UdsContentForm_SetAppName_003
     * @tc.desc OH_UdsContentForm_SetAppName_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3900',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3900' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppName_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_3900 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4000
     * @tc.name OH_UdsContentForm_SetAppName_004
     * @tc.desc OH_UdsContentForm_SetAppName_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4000',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4000' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetAppName_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4000 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4100
     * @tc.name OH_UdsContentForm_GetAppName_001
     * @tc.desc OH_UdsContentForm_GetAppName_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4100' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetAppName_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4200
     * @tc.name OH_UdsContentForm_GetAppName_002
     * @tc.desc OH_UdsContentForm_GetAppName_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4200' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetAppName_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4200 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4300
     * @tc.name OH_UdsContentForm_SetLinkUri_001
     * @tc.desc OH_UdsContentForm_SetLinkUri_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4300' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetLinkUri_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4400
     * @tc.name OH_UdsContentForm_SetLinkUri_002
     * @tc.desc OH_UdsContentForm_SetLinkUri_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4400' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetLinkUri_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4500
     * @tc.name OH_UdsContentForm_SetLinkUri_003
     * @tc.desc OH_UdsContentForm_SetLinkUri_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4500' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetLinkUri_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4600
     * @tc.name OH_UdsContentForm_SetLinkUri_004
     * @tc.desc OH_UdsContentForm_SetLinkUri_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4600' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetLinkUri_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4700
     * @tc.name OH_UdsContentForm_SetLinkUri_005
     * @tc.desc OH_UdsContentForm_SetLinkUri_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4700' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetLinkUri_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4700 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4800
     * @tc.name OH_UdsContentForm_SetLinkUri_006
     * @tc.desc OH_UdsContentForm_SetLinkUri_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4800',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4800' , ' begin');
      let result = testNapi.OH_UdsContentForm_SetLinkUri_006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4800 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4900
     * @tc.name OH_UdsContentForm_GetLinkUri_003
     * @tc.desc OH_UdsContentForm_GetLinkUri_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4900',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4900' , ' begin');
      let result = testNapi.OH_UdsContentForm_GetLinkUri_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_4900 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5000
     * @tc.name OH_Udmf_AddAndContentForm_001
     * @tc.desc OH_Udmf_AddAndContentForm_001
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5000',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5000' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5000 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5100
     * @tc.name OH_Udmf_AddAndContentForm_007
     * @tc.desc OH_Udmf_AddAndContentForm_007
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5100',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5100' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5100 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5200
     * @tc.name OH_Udmf_AddAndContentForm_002
     * @tc.desc OH_Udmf_AddAndContentForm_002
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5200',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5200' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5200 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5300
     * @tc.name OH_Udmf_AddAndContentForm_003
     * @tc.desc OH_Udmf_AddAndContentForm_003
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5300',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5300' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5300 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5400
     * @tc.name OH_Udmf_AddAndContentForm_004
     * @tc.desc OH_Udmf_AddAndContentForm_004
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5400',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5400' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5400 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5500
     * @tc.name OH_Udmf_AddAndContentForm_005
     * @tc.desc OH_Udmf_AddAndContentForm_005
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5500',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5500' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5500 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5600
     * @tc.name OH_Udmf_AddAndContentForm_006
     * @tc.desc OH_Udmf_AddAndContentForm_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5600',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5600' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5600 key is : '+ result , 'aa');
    })
    /**
     * @tc.number: SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5700
     * @tc.name OH_Udmf_AddAndContentForm_006
     * @tc.desc OH_Udmf_AddAndContentForm_006
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5700',0, async function () {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5700' , ' begin');
      let result = testNapi.OH_Udmf_AddAndContentForm_008();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_contentNdkAPITest_5700 key is : '+ result , 'aa');
    })
  })
}