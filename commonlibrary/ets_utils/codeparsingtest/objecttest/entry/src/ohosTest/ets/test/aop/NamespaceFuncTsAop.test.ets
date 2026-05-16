/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as TsAopInit from "./utils/ts/TsAopInit"
import TestTsAopAdd from "./utils/ts/TestTsAopAdd"

export default function namespaceFuncTsAopTest() {
  describe('namespaceFuncTsAopTest', () => {
    /**
     * @tc.name   testTsAopAddBefore001
     * @tc.number SUB_TS_ASPECT_001
     * @tc.desc   testTsAopAddBefore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTsAopAddBefore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TsAopInit.testAddBeforeInit()
      let res = TestTsAopAdd.addForAddBefore(1, 2);
      expect(TsAopInit.addBeforeArgA).assertEqual(1)
      expect(TsAopInit.addBeforeArgB).assertEqual(2)
      expect(res).assertEqual(3)
    });

    /**
     * @tc.name   testTsAopAddAfter001
     * @tc.number SUB_TS_ASPECT_002
     * @tc.desc   testTsAopAddAfter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTsAopAddAfter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TsAopInit.testAddAfterInit()
      let res = TestTsAopAdd.addForAddAfter(1, 2);
      expect(TsAopInit.addAfterArgA).assertEqual(1)
      expect(TsAopInit.addAfterArgB).assertEqual(2)
      expect(TsAopInit.addAfterOriRet).assertEqual(3)
      expect(res).assertEqual(4)
    });

    /**
     * @tc.name   testTsAopReplace001
     * @tc.number SUB_TS_ASPECT_003
     * @tc.desc   testTsAopReplace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTsAopReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TsAopInit.testReplaceInit()
      let res = TestTsAopAdd.addForReplace(3, 4);
      expect(TsAopInit.replaceArgA).assertEqual(3)
      expect(TsAopInit.replaceArgB).assertEqual(4)
      expect(res).assertEqual(12)
    });

    /**
     * @tc.name   testTsAopReplaceKit001
     * @tc.number SUB_TS_ASPECT_004
     * @tc.desc   testTsAopReplace sdk use NAPI_DECLARE_STATIC_FUNCTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTsAopReplaceKit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TsAopInit.testReplaceKitUseDeclareNapiStaticFunction()
      let res = TsAopInit.testUseCameraPicker();
      expect(res).assertEqual('args: mediaTypes:["photo","video"],pickerProfile:{"cameraPosition":1}')
    });

    /**
     * @tc.name   testTsAopReplaceKit002
     * @tc.number SUB_TS_ASPECT_005
     * @tc.desc   testTsAopReplace sdk use NAPI_DECLARE_FUNCTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTsAopReplaceKit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TsAopInit.testReplaceKitUseDeclareNapiFunction()
      TsAopInit.testUseBle();
      expect(TsAopInit.startBLEScanCalled).assertEqual(true)
    });

    /**
     * @tc.name   testTsAopReplaceKit003
     * @tc.number SUB_TS_ASPECT_006
     * @tc.desc   testTsAopReplace sdk use NAPI_DECLARE_FUNCTION_WITH_DATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTsAopReplaceKit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TsAopInit.testReplaceKitUseDeclareNapiFunctionWithData()
      TsAopInit.testUseRelationalStore();
      expect(TsAopInit.getRdbStoreArgs).assertEqual('args: config:{"name":"RdbTest.db","securityLevel":3}}')
    });
  });
}