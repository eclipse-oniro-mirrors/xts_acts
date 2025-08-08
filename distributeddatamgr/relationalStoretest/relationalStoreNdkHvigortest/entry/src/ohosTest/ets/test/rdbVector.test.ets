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

import testrdb from 'libtransaction.so';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let TAG = '[transaction_test]';

export default function rdbVectorNdktest() {
  describe('rdbVectorNdktest', () => {

    beforeAll(() => {
      console.info(TAG + "beforeAll");
      let res = testrdb.RdbstoreSetUpTestCase();
    })
    beforeEach(() => {
      console.info(TAG + "beforeEach");
    })
    afterEach(() => {
      console.info(TAG + "afterEach");
    })
    afterAll(() => {
      console.info(TAG + "afterAll");
      let res = testrdb.RdbstoreTearDownTestCase();
    })


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Cursor_GetFloatVectorCount0100
     * @tc.name OH_Cursor_GetFloatVectorCount0100
     * @tc.desc OH_Cursor_GetFloatVectorCount0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Cursor_GetFloatVectorCount0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Cursor_GetFloatVectorCount0100();
      console.info(TAG + "OH_Cursor_GetFloatVectorCount0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}

