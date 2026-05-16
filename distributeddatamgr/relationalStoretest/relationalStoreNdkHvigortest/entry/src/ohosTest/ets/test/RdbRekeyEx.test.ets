/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import testndk from 'librekeyextest.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let TAG = '[testLog-rekeyexets]';
export default function rdbRekeyExNdkTest() {
  describe('rdbRekeyExNdkTest', async (done: Function) => {
    beforeAll(() => {
      console.info(TAG + "beforeAll");
    })
    beforeEach(() => {
      console.info(TAG + "beforeEach");
    })
    afterEach(() => {
      console.info(TAG + "afterEach");
    })
    afterAll(() => {
      console.info(TAG + "afterAll");
    })

    /**
     * @tc.name   OH_Rdb_RekeyEx0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0100
     * @tc.desc   OH_Rdb_RekeyEx0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0100();
      console.info(TAG + "OH_Rdb_RekeyEx0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0200
     * @tc.desc   OH_Rdb_RekeyEx0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0200();
      console.info(TAG + "OH_Rdb_RekeyEx0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0300
     * @tc.desc   OH_Rdb_RekeyEx0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0300();
      console.info(TAG + "OH_Rdb_RekeyEx0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0400
     * @tc.desc   OH_Rdb_RekeyEx0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0400();
      console.info(TAG + "OH_Rdb_RekeyEx0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0500
     * @tc.desc   OH_Rdb_RekeyEx0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0500();
      console.info(TAG + "OH_Rdb_RekeyEx0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0600
     * @tc.desc   OH_Rdb_RekeyEx0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0600();
      console.info(TAG + "OH_Rdb_RekeyEx0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0700
     * @tc.desc   OH_Rdb_RekeyEx0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0700();
      console.info(TAG + "OH_Rdb_RekeyEx0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx0900
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_0900
     * @tc.desc   OH_Rdb_RekeyEx0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx0900();
      console.info(TAG + "OH_Rdb_RekeyEx0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx1000
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_1000
     * @tc.desc   OH_Rdb_RekeyEx1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx1000();
      console.info(TAG + "OH_Rdb_RekeyEx1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_RekeyEx1100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RekeyExTest_1100
     * @tc.desc   OH_Rdb_RekeyEx1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RekeyEx1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RekeyEx1100();
      console.info(TAG + "OH_Rdb_RekeyEx1100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}