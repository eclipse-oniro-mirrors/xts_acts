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
import testNapi from 'libUtdNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';

const TAG = "[ UdsNdkTest ] ------ ";

export default function UtdNdkTest() {
  describe('UtdNdkTest', async () => {
    beforeAll(async () => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000
     * @tc.desc   OH_Utd_Create_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000', ' begin');
      let result = testNapi.OH_Utd_Create_0001();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4000 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010
     * @tc.desc   OH_Utd_Create_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010', ' begin');
      let result = testNapi.OH_Utd_Create_0002();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4010 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020
     * @tc.desc   OH_Utd_Create_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020', ' begin');
      let result = testNapi.OH_Utd_Create_0003();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4020 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030
     * @tc.desc   OH_Utd_Create_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030', ' begin');
      let result = testNapi.OH_Utd_Create_0004();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4030 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040
     * @tc.desc   OH_Utd_Create_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040', ' begin');
      let result = testNapi.OH_Utd_Create_0005();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4040 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050
     * @tc.desc   OH_Utd_Create_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050', ' begin');
      let result = testNapi.OH_Utd_Create_0006();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4050 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060
     * @tc.desc   OH_Utd_Create_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060', ' begin');
      let result = testNapi.OH_Utd_Create_0007();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4060 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070
     * @tc.desc   OH_Utd_Create_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070', ' begin');
      let result = testNapi.OH_Utd_Create_0008();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4070 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080
     * @tc.desc   OH_Utd_Create_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080', ' begin');
      let result = testNapi.OH_Utd_Create_0009();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4080 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090
     * @tc.desc   OH_Utd_Create_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090', ' begin');
      let result = testNapi.OH_Utd_Create_0010();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4090 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100
     * @tc.desc   OH_Utd_Create_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100', ' begin');
      let result = testNapi.OH_Utd_Create_0011();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4100 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110
     * @tc.desc   OH_Utd_Create_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110', ' begin');
      let result = testNapi.OH_Utd_Create_0012();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4110 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120
     * @tc.desc   OH_Utd_Create_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120', ' begin');
      let result = testNapi.OH_Utd_Create_0013();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4120 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130
     * @tc.desc   OH_Utd_Create_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130', ' begin');
      let result = testNapi.OH_Utd_Create_0014();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4130 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140
     * @tc.desc   OH_Utd_Create_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140', ' begin');
      let result = testNapi.OH_Utd_Create_0015();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4140 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160
     * @tc.desc   OH_Utd_Create_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160', ' begin');
      let result = testNapi.OH_Utd_Create_0017();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4160 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170
     * @tc.desc   OH_Utd_Create_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170', ' begin');
      let result = testNapi.OH_Utd_Create_0018();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4170 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180
     * @tc.desc   OH_Utd_Create_0019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180', ' begin');
      let result = testNapi.OH_Utd_Create_0019();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4180 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190
     * @tc.desc   OH_Utd_Create_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190', ' begin');
      let result = testNapi.OH_Utd_Create_0020();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4190 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200
     * @tc.desc   OH_Utd_Create_0021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200', ' begin');
      let result = testNapi.OH_Utd_Create_0021();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4200 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210
     * @tc.desc   OH_Utd_Create_0022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210', ' begin');
      let result = testNapi.OH_Utd_Create_0022();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4210 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220
     * @tc.desc   OH_Utd_Create_0023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220', ' begin');
      let result = testNapi.OH_Utd_Create_0023();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4220 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230
     * @tc.desc   OH_Utd_Create_0024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230', ' begin');
      let result = testNapi.OH_Utd_Create_0024();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4230 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240
     * @tc.desc   OH_Utd_Create_0025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240', ' begin');
      let result = testNapi.OH_Utd_Create_0025();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4240 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250
     * @tc.desc   OH_Utd_Create_0026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250', ' begin');
      let result = testNapi.OH_Utd_Create_0026();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4250 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260
     * @tc.desc   OH_Utd_Create_0027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260', ' begin');
      let result = testNapi.OH_Utd_Create_0027();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4260 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290
     * @tc.desc   OH_Utd_Create_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290', ' begin');
      let result = testNapi.OH_Utd_Create_0030();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4290 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300
     * @tc.desc   OH_Utd_Create_0031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300', ' begin');
      let result = testNapi.OH_Utd_Create_0031();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4300 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310
     * @tc.desc   OH_Utd_Create_0032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310', ' begin');
      let result = testNapi.OH_Utd_Create_0032();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4310 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320
     * @tc.desc   OH_Utd_Create_0033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320', ' begin');
      let result = testNapi.OH_Utd_Create_0033();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4320 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330
     * @tc.desc   OH_Utd_Create_0034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330', ' begin');
      let result = testNapi.OH_Utd_Create_0034();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4330 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340
     * @tc.desc   OH_Utd_Create_0035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340', ' begin');
      let result = testNapi.OH_Utd_Create_0035();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4340 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350
     * @tc.desc   OH_Utd_Create_0036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350', ' begin');
      let result = testNapi.OH_Utd_Create_0036();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4350 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360
     * @tc.desc   OH_Utd_Create_0037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360', ' begin');
      let result = testNapi.OH_Utd_Create_0037();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4360 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370
     * @tc.desc   OH_Utd_Create_0038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370', ' begin');
      let result = testNapi.OH_Utd_Create_0038();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4370 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380
     * @tc.desc   OH_Utd_Create_0039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380', ' begin');
      let result = testNapi.OH_Utd_Create_0039();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4380 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390
     * @tc.desc   OH_Utd_Create_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390', ' begin');
      let result = testNapi.OH_Utd_Create_0040();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4390 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400
     * @tc.desc   OH_Utd_Create_0041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400', ' begin');
      let result = testNapi.OH_Utd_Create_0041();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4400 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410
     * @tc.desc   OH_Utd_Create_0042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410', ' begin');
      let result = testNapi.OH_Utd_Create_0042();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4410 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420
     * @tc.desc   OH_Utd_Create_0043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420', ' begin');
      let result = testNapi.OH_Utd_Create_0043();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4420 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430
     * @tc.desc   OH_Utd_Create_0044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430', ' begin');
      let result = testNapi.OH_Utd_Create_0044();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4430 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440
     * @tc.desc   OH_Utd_Create_0045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440', ' begin');
      let result = testNapi.OH_Utd_Create_0045();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4440 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450
     * @tc.desc   OH_Utd_Create_0046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450', ' begin');
      let result = testNapi.OH_Utd_Create_0046();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4450 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460
     * @tc.desc   OH_Utd_Create_0047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460', ' begin');
      let result = testNapi.OH_Utd_Create_0047();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4460 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470
     * @tc.desc   OH_Utd_Create_0048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470', ' begin');
      let result = testNapi.OH_Utd_Create_0048();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4470 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480
     * @tc.desc   OH_Utd_Create_0049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480', ' begin');
      let result = testNapi.OH_Utd_Create_0049();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4480 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490
     * @tc.desc   OH_Utd_Create_0050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490', ' begin');
      let result = testNapi.OH_Utd_Create_0050();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4490 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500
     * @tc.desc   OH_Utd_Create_0051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500', ' begin');
      let result = testNapi.OH_Utd_Create_0051();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4500 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510
     * @tc.desc   OH_Utd_Create_0052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510', ' begin');
      let result = testNapi.OH_Utd_Create_0052();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4510 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520
     * @tc.desc   OH_Utd_Create_0053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520', ' begin');
      let result = testNapi.OH_Utd_Create_0053();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4520 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540
     * @tc.desc   OH_Utd_Create_0055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540', ' begin');
      let result = testNapi.OH_Utd_Create_0055();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4540 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560
     * @tc.desc   OH_Utd_Create_0056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560', ' begin');
      let result = testNapi.OH_Utd_Create_0056();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4560 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570
     * @tc.desc   OH_Utd_Create_0058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570', ' begin');
      let result = testNapi.OH_Utd_Create_0058();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4570 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580
     * @tc.desc   OH_Utd_Create_0059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580', ' begin');
      let result = testNapi.OH_Utd_Create_0059();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4580 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590
     * @tc.desc   OH_Utd_Create_0060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590', ' begin');
      let result = testNapi.OH_Utd_Create_0060();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4590 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600
     * @tc.desc   OH_Utd_Create_0061
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600', ' begin');
      let result = testNapi.OH_Utd_Create_0061();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4600 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610
     * @tc.desc   OH_Utd_Create_0062
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610', ' begin');
      let result = testNapi.OH_Utd_Create_0062();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4610 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620
     * @tc.desc   OH_Utd_Create_0063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620', ' begin');
      let result = testNapi.OH_Utd_Create_0063();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4620 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630
     * @tc.desc   OH_Utd_Create_0064
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630', ' begin');
      let result = testNapi.OH_Utd_Create_0064();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4630 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640
     * @tc.desc   OH_Utd_Create_0065
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640', ' begin');
      let result = testNapi.OH_Utd_Create_0065();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4640 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650
     * @tc.desc   OH_Utd_Create_0066
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650', ' begin');
      let result = testNapi.OH_Utd_Create_0066();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4650 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660
     * @tc.desc   OH_Utd_Create_0067
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660', ' begin');
      let result = testNapi.OH_Utd_Create_0067();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4660 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670
     * @tc.desc   OH_Utd_Create_0068
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670', ' begin');
      let result = testNapi.OH_Utd_Create_0068();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4670 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680
     * @tc.desc   OH_Utd_Create_0069
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680', ' begin');
      let result = testNapi.OH_Utd_Create_0069();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4680 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690
     * @tc.desc   OH_Utd_Create_0070
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690', ' begin');
      let result = testNapi.OH_Utd_Create_0070();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4690 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700
     * @tc.desc   OH_Utd_Create_0071
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700', ' begin');
      let result = testNapi.OH_Utd_Create_0071();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4700 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710
     * @tc.desc   OH_Utd_Create_0072
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710', ' begin');
      let result = testNapi.OH_Utd_Create_0072();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4710 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720
     * @tc.desc   OH_Utd_Create_0073
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720', ' begin');
      let result = testNapi.OH_Utd_Create_0073();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4720 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730
     * @tc.desc   OH_Utd_Create_0074
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730', ' begin');
      let result = testNapi.OH_Utd_Create_0074();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4730 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740
     * @tc.desc   OH_Utd_Create_0075
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740', ' begin');
      let result = testNapi.OH_Utd_Create_0075();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4740 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750
     * @tc.desc   OH_Utd_Create_0076
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750', ' begin');
      let result = testNapi.OH_Utd_Create_0076();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4750 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760
     * @tc.desc   OH_Utd_Create_0077
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760', ' begin');
      let result = testNapi.OH_Utd_Create_0077();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4760 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770
     * @tc.desc   OH_Utd_Create_0078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770', ' begin');
      let result = testNapi.OH_Utd_Create_0078();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4770 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780
     * @tc.desc   OH_Utd_Create_0079
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780', ' begin');
      let result = testNapi.OH_Utd_Create_0079();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4780 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790
     * @tc.desc   OH_Utd_Create_0080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790', ' begin');
      let result = testNapi.OH_Utd_Create_0080();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4790 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800
     * @tc.desc   OH_Utd_Create_0081
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800', ' begin');
      let result = testNapi.OH_Utd_Create_0081();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4800 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810
     * @tc.desc   OH_Utd_Create_0082
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810', ' begin');
      let result = testNapi.OH_Utd_Create_0082();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4810 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820
     * @tc.desc   OH_Utd_Create_0083
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820', ' begin');
      let result = testNapi.OH_Utd_Create_0083();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4820 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830
     * @tc.desc   OH_Utd_Create_0084
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830', ' begin');
      let result = testNapi.OH_Utd_Create_0084();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4830 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840
     * @tc.desc   OH_Utd_Create_0085
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840', ' begin');
      let result = testNapi.OH_Utd_Create_0085();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4840 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4850
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4850
     * @tc.desc   OH_Utd_Create_0086
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4850', ' begin');
      let result = testNapi.OH_Utd_Create_0086();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4850 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4860
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4860
     * @tc.desc   OH_Utd_Create_0087
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4860', ' begin');
      let result = testNapi.OH_Utd_Create_0087();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4860 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4880
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4880
     * @tc.desc   OH_Utd_Create_0089
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4880', ' begin');
      let result = testNapi.OH_Utd_Create_0089();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4880 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4890
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4890
     * @tc.desc   OH_Utd_Create_0090
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4890', ' begin');
      let result = testNapi.OH_Utd_Create_0090();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4890 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4900
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4900
     * @tc.desc   OH_Utd_Create_0091
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4900', ' begin');
      let result = testNapi.OH_Utd_Create_0091();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4900 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4910
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4910
     * @tc.desc   OH_Utd_Create_0092
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4910', ' begin');
      let result = testNapi.OH_Utd_Create_0092();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4910 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4920
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4920
     * @tc.desc   OH_Utd_Create_0093
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4920', ' begin');
      let result = testNapi.OH_Utd_Create_0093();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4920 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4930
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4930
     * @tc.desc   OH_Utd_Create_0094
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4930', ' begin');
      let result = testNapi.OH_Utd_Create_0094();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4930 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4940
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4940
     * @tc.desc   OH_Utd_Create_0095
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4940', ' begin');
      let result = testNapi.OH_Utd_Create_0095();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4940 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4950
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4950
     * @tc.desc   OH_Utd_Create_0096
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4950', ' begin');
      let result = testNapi.OH_Utd_Create_0096();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4950 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4960
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4960
     * @tc.desc   OH_Utd_Create_0097
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4960', ' begin');
      let result = testNapi.OH_Utd_Create_0097();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4960 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4970
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4970
     * @tc.desc   OH_Utd_Create_0098
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4970', ' begin');
      let result = testNapi.OH_Utd_Create_0098();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4970 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4980
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4980
     * @tc.desc   OH_Utd_Create_0099
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4980', ' begin');
      let result = testNapi.OH_Utd_Create_0099();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4980 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4990
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4990
     * @tc.desc   OH_Utd_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4990', ' begin');
      let result = testNapi.OH_Utd_Create_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_4990 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5000
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5000
     * @tc.desc   OH_Utd_Create_0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5000', ' begin');
      let result = testNapi.OH_Utd_Create_0101();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5000 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5010
     * @tc.desc   OH_Utd_Create_0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5010', ' begin');
      let result = testNapi.OH_Utd_Create_0102();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5010 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5020
     * @tc.desc   OH_Utd_Create_0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5020', ' begin');
      let result = testNapi.OH_Utd_Create_0103();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5020 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5030
     * @tc.desc   OH_Utd_Create_0104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5030', ' begin');
      let result = testNapi.OH_Utd_Create_0104();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5030 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5040
     * @tc.desc   OH_Utd_Create_0105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5040', ' begin');
      let result = testNapi.OH_Utd_Create_0105();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5040 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5050
     * @tc.desc   OH_Utd_Create_0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5050', ' begin');
      let result = testNapi.OH_Utd_Create_0106();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5050 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5060
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5060
     * @tc.desc   OH_Utd_Create_0107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5060', ' begin');
      let result = testNapi.OH_Utd_Create_0107();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5060 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5070
     * @tc.desc   OH_Utd_Create_0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5070', ' begin');
      let result = testNapi.OH_Utd_Create_0108();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5070 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5080
     * @tc.desc   OH_Utd_Create_0109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5080', ' begin');
      let result = testNapi.OH_Utd_Create_0109();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5080 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5090
     * @tc.desc   OH_Utd_Create_0110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5090', ' begin');
      let result = testNapi.OH_Utd_Create_0110();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5090 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5100
     * @tc.desc   OH_Utd_Create_0111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5100', ' begin');
      let result = testNapi.OH_Utd_Create_0111();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5100 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5110
     * @tc.desc   OH_Utd_Create_0112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5110', ' begin');
      let result = testNapi.OH_Utd_Create_0112();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5110 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5120
     * @tc.desc   OH_Utd_Create_0113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5120', ' begin');
      let result = testNapi.OH_Utd_Create_0113();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5120 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5130
     * @tc.desc   OH_Utd_Create_0114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5130', ' begin');
      let result = testNapi.OH_Utd_Create_0114();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5130 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5140
     * @tc.desc   OH_Utd_Create_0115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5140', ' begin');
      let result = testNapi.OH_Utd_Create_0115();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5140 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5150
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5150
     * @tc.desc   OH_Utd_Create_0116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5150', ' begin');
      let result = testNapi.OH_Utd_Create_0116();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5150 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5160
     * @tc.desc   OH_Utd_Create_0117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5160', ' begin');
      let result = testNapi.OH_Utd_Create_0117();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5160 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5170
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5170
     * @tc.desc   OH_Utd_Create_0118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5170', ' begin');
      let result = testNapi.OH_Utd_Create_0118();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5170 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5180
     * @tc.desc   OH_Utd_Create_0119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5180', ' begin');
      let result = testNapi.OH_Utd_Create_0119();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5180 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5190
     * @tc.desc   OH_Utd_Create_0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5190', ' begin');
      let result = testNapi.OH_Utd_Create_0120();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5190 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5200
     * @tc.desc   OH_Utd_Create_0121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5200', ' begin');
      let result = testNapi.OH_Utd_Create_0121();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5200 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5210
     * @tc.desc   OH_Utd_Create_0122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5210', ' begin');
      let result = testNapi.OH_Utd_Create_0122();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5210 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5220
     * @tc.desc   OH_Utd_Create_0123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5220', ' begin');
      let result = testNapi.OH_Utd_Create_0123();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5220 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5230
     * @tc.desc   OH_Utd_Create_0124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5230', ' begin');
      let result = testNapi.OH_Utd_Create_0124();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5230 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5240
     * @tc.desc   OH_Utd_Create_0125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5240', ' begin');
      let result = testNapi.OH_Utd_Create_0125();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5240 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5250
     * @tc.desc   OH_Utd_Create_0126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5250', ' begin');
      let result = testNapi.OH_Utd_Create_0126();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5250 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5260
     * @tc.desc   OH_Utd_Create_0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5260', ' begin');
      let result = testNapi.OH_Utd_Create_0127();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5260 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5270
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5270
     * @tc.desc   OH_Utd_Create_0128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5270', ' begin');
      let result = testNapi.OH_Utd_Create_0128();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5270 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5280
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5280
     * @tc.desc   OH_Utd_Create_0129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5280', ' begin');
      let result = testNapi.OH_Utd_Create_0129();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5280 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5290
     * @tc.desc   OH_Utd_Create_0130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5290', ' begin');
      let result = testNapi.OH_Utd_Create_0130();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5290 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5300
     * @tc.desc   OH_Utd_Create_0131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5300', ' begin');
      let result = testNapi.OH_Utd_Create_0131();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5300 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5310
     * @tc.desc   OH_Utd_Create_0132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5310', ' begin');
      let result = testNapi.OH_Utd_Create_0132();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5310 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5320
     * @tc.desc   OH_Utd_Create_0133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5320', ' begin');
      let result = testNapi.OH_Utd_Create_0133();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5320 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5330
     * @tc.desc   OH_Utd_Create_0134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5330', ' begin');
      let result = testNapi.OH_Utd_Create_0134();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5330 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5340
     * @tc.desc   OH_Utd_Create_0135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5340', ' begin');
      let result = testNapi.OH_Utd_Create_0135();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5340 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5350
     * @tc.desc   OH_Utd_Create_0136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5350', ' begin');
      let result = testNapi.OH_Utd_Create_0136();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5350 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5360
     * @tc.desc   OH_Utd_Create_0137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5360', ' begin');
      let result = testNapi.OH_Utd_Create_0137();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5360 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5370
     * @tc.desc   OH_Utd_Create_0138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5370', ' begin');
      let result = testNapi.OH_Utd_Create_0138();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5370 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5380
     * @tc.desc   OH_Utd_Create_0139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5380', ' begin');
      let result = testNapi.OH_Utd_Create_0139();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5380 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5390
     * @tc.desc   OH_Utd_Create_0140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5390', ' begin');
      let result = testNapi.OH_Utd_Create_0140();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UtdNdkAPITest_5390 key is : ' + result, 'aa');
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0100
     * @tc.desc   OH_Utd_Create_Test0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0100', ' begin');
      let result = testNapi.OH_Utd_Create_Test0100();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0100 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0200
     * @tc.desc   OH_Utd_Create_Test0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0200', ' begin');
      let result = testNapi.OH_Utd_Create_Test0200();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0200 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0300
     * @tc.desc   OH_Utd_Create_Test0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0300', ' begin');
      let result = testNapi.OH_Utd_Create_Test0300();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0300 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0400
     * @tc.desc   OH_Utd_GetTypeId0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0400', ' begin');
      let result = testNapi.OH_Utd_GetTypeId0100();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0400 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0500
     * @tc.desc   OH_Utd_GetTypeId0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0500', ' begin');
      let result = testNapi.OH_Utd_GetTypeId0200();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0500 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0600
     * @tc.desc   OH_Utd_GetDescription0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0600', ' begin');
      let result = testNapi.OH_Utd_GetDescription0100();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0600 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0700
     * @tc.desc   OH_Utd_GetDescription0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0700', ' begin');
      let result = testNapi.OH_Utd_GetDescription0200();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0700 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0800
     * @tc.desc   OH_Utd_GetReferenceUrl_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0800', ' begin');
      let result = testNapi.OH_Utd_GetReferenceUrl_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0800 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0900
     * @tc.desc   OH_Utd_GetReferenceUrl_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0900', ' begin');
      let result = testNapi.OH_Utd_GetReferenceUrl_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_0900 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1000
     * @tc.desc   OH_Utd_GetIconFile_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1000', ' begin');
      let result = testNapi.OH_Utd_GetIconFile_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1000 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1100
     * @tc.desc   OH_Utd_GetIconFile_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1100', ' begin');
      let result = testNapi.OH_Utd_GetIconFile_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1100 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1200
     * @tc.desc   OH_Utd_GetBelongingToTypes_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1200', ' begin');
      let result = testNapi.OH_Utd_GetBelongingToTypes_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1200 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1300
     * @tc.desc   OH_Utd_GetBelongingToTypes_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1300', ' begin');
      let result = testNapi.OH_Utd_GetBelongingToTypes_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1300 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1400
     * @tc.desc   OH_Utd_GetFilenameExtensions_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1400', ' begin');
      let result = testNapi.OH_Utd_GetFilenameExtensions_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1400 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1500
     * @tc.desc   OH_Utd_GetFilenameExtensions_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1500', ' begin');
      let result = testNapi.OH_Utd_GetFilenameExtensions_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1500 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1600
     * @tc.desc   OH_Utd_GetFilenameExtensions_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1600', ' begin');
      let result = testNapi.OH_Utd_GetFilenameExtensions_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1600 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1700
     * @tc.desc   OH_Utd_GetMimeTypes_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1700', ' begin');
      let result = testNapi.OH_Utd_GetMimeTypes_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1700 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1800
     * @tc.desc   OH_Utd_GetMimeTypes_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1800', ' begin');
      let result = testNapi.OH_Utd_GetMimeTypes_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1800 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1900
     * @tc.desc   OH_Utd_GetMimeTypes_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1900', ' begin');
      let result = testNapi.OH_Utd_GetMimeTypes_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_1900 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2000
     * @tc.desc   OH_Utd_GetMimeTypes_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2000', ' begin');
      let result = testNapi.OH_Utd_GetTypesByFilenameExtension_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2000 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2100
     * @tc.desc   OH_Utd_GetTypesByFilenameExtension_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2100', ' begin');
      let result = testNapi.OH_Utd_GetTypesByFilenameExtension_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2100 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2200
     * @tc.desc   OH_Utd_GetTypesByFilenameExtension_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2200', ' begin');
      let result = testNapi.OH_Utd_GetTypesByFilenameExtension_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2200 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2300
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2300
     * @tc.desc   OH_Utd_GetTypesByMimeType_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2300', ' begin');
      let result = testNapi.OH_Utd_GetTypesByMimeType_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2300 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2400
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2400
     * @tc.desc   OH_Utd_GetTypesByMimeType_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2400', ' begin');
      let result = testNapi.OH_Utd_GetTypesByMimeType_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2400 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2500
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2500
     * @tc.desc   OH_Utd_GetTypesByMimeType_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2500', ' begin');
      let result = testNapi.OH_Utd_GetTypesByMimeType_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2500 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2600
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2600
     * @tc.desc   OH_Utd_BelongsTo_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2600', ' begin');
      let result = testNapi.OH_Utd_BelongsTo_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2600 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2700
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2700
     * @tc.desc   OH_Utd_BelongsTo_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2700', ' begin');
      let result = testNapi.OH_Utd_BelongsTo_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2700 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2800
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2800
     * @tc.desc   OH_Utd_BelongsTo_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2800', ' begin');
      let result = testNapi.OH_Utd_BelongsTo_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2800 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2900
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2900
     * @tc.desc   OH_Utd_BelongsTo_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2900', ' begin');
      let result = testNapi.OH_Utd_BelongsTo_004();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_2900 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3000
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3000
     * @tc.desc   OH_Utd_BelongsTo_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3000', ' begin');
      let result = testNapi.OH_Utd_BelongsTo_005();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3000 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3100
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3100
     * @tc.desc   OH_Utd_IsLower_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3100', ' begin');
      let result = testNapi.OH_Utd_IsLower_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3100 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3200
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3200
     * @tc.desc   OH_Utd_IsLower_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3200', ' begin');
      let result = testNapi.OH_Utd_IsLower_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3200 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3300
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3300
     * @tc.desc   OH_Utd_IsLower_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3300', ' begin');
      let result = testNapi.OH_Utd_IsLower_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3300 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3400
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3400
     * @tc.desc   OH_Utd_IsLower_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3400', ' begin');
      let result = testNapi.OH_Utd_IsLower_004();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3400 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3500
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3500
     * @tc.desc   OH_Utd_IsLower_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3500', ' begin');
      let result = testNapi.OH_Utd_IsLower_005();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3500 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3600
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3600
     * @tc.desc   OH_Utd_IsLower_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3600', ' begin');
      let result = testNapi.OH_Utd_IsLower_006();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3600 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3700
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3700
     * @tc.desc   OH_Utd_Equals_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3700', ' begin');
      let result = testNapi.OH_Utd_Equals_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3700 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3800
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3800
     * @tc.desc   OH_Utd_Equals_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3800', ' begin');
      let result = testNapi.OH_Utd_Equals_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3800 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3900
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3900
     * @tc.desc   OH_Utd_Equals_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3900', ' begin');
      let result = testNapi.OH_Utd_Equals_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_3900 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6200
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6200
     * @tc.desc   OH_Utd_Equals_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6200', ' begin');
      let result = testNapi.OH_Utd_Equals_005();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6200 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5500
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5500
     * @tc.desc   OH_Utd_IsHigher_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5500', ' begin');
      let result = testNapi.OH_Utd_IsHigher_001();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5500 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5600
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5600
     * @tc.desc   OH_Utd_IsHigher_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5600', ' begin');
      let result = testNapi.OH_Utd_IsHigher_002();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5600 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5700
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5700
     * @tc.desc   OH_Utd_IsHigher_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5700', ' begin');
      let result = testNapi.OH_Utd_IsHigher_003();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5700 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5900
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5900
     * @tc.desc   OH_Utd_IsHigher_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5900', ' begin');
      let result = testNapi.OH_Utd_IsHigher_004();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_5900 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6000
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6000
     * @tc.desc   OH_Utd_IsHigher_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6000', ' begin');
      let result = testNapi.OH_Utd_IsHigher_005();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6000 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6100
     * @tc.number SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6100
     * @tc.desc   OH_Utd_IsHigher_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6100', ' begin');
      let result = testNapi.OH_Utd_IsHigher_006();
      hilog.info(0x0000, TAG, TAG + 'SUB_DistributedData_UDMF_SDK_UTDNdkAPITest_6100 result is : ' + result, 'aa');
      expect(1).assertEqual(result);
    });
  })
}