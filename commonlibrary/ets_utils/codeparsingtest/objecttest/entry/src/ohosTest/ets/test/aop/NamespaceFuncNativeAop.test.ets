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
import * as NativeAopInit from "./utils/native/NativeAopInit"
import TestNativeAopAdd from "./utils/native/TestNativeAopAdd"

export default function namespaceFuncNativeAopTest() {
  describe('namespaceFuncNativeAopTest', () => {
    /**
     * @tc.name   TestNativeAopAddBefore001
     * @tc.number SUB_NATIVE_ASPECT_001
     * @tc.desc   TestNativeAopAddBefore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNativeAopAddBefore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      NativeAopInit.testAddBeforeInit()
      let res = TestNativeAopAdd.addForAddBefore(1, 2);
      expect(NativeAopInit.addBeforeArgA).assertEqual(1)
      expect(NativeAopInit.addBeforeArgB).assertEqual(2)
      expect(res).assertEqual(3)
    });

    /**
     * @tc.name   TestNativeAopAddAfter001
     * @tc.number SUB_NATIVE_ASPECT_002
     * @tc.desc   TestNativeAopAddAfter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNativeAopAddAfter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      NativeAopInit.testAddAfterInit()
      let res = TestNativeAopAdd.addForAddAfter(1, 2);
      expect(NativeAopInit.addAfterArgA).assertEqual(1)
      expect(NativeAopInit.addAfterArgB).assertEqual(2)
      expect(NativeAopInit.addAfterOriRet).assertEqual(3)
      expect(res).assertEqual(4)
    });

    /**
     * @tc.name   testNativeAopReplace001
     * @tc.number SUB_NATIVE_ASPECT_003
     * @tc.desc   testNativeAopReplace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeAopReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      NativeAopInit.testReplaceInit()
      let res = TestNativeAopAdd.addForReplace(3, 4);
      expect(NativeAopInit.replaceArgA).assertEqual(3)
      expect(NativeAopInit.replaceArgB).assertEqual(4)
      expect(res).assertEqual(12)
    });

    /**
     * @tc.name   testNativeAopReplaceKit001
     * @tc.number SUB_NATIVE_ASPECT_004
     * @tc.desc   testNativeAopReplace sdk use NAPI_DECLARE_FUNCTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeAopReplaceKit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      NativeAopInit.testReplaceKitUseDeclareNapiStaticFunction()
      let res = NativeAopInit.testUseCameraPicker();
      expect(res).assertEqual('args native: mediaTypes:["photo","video"],pickerProfile:{"cameraPosition":1}')
    });

    /**
     * @tc.name   testNativeAopReplaceKit002
     * @tc.number SUB_NATIVE_ASPECT_005
     * @tc.desc   testNativeAopReplace sdk use NAPI_DECLARE_FUNCTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeAopReplaceKit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      NativeAopInit.testReplaceKitUseDeclareNapiFunction()
      NativeAopInit.testUseBle();
      expect(NativeAopInit.startBLEScanCalled).assertEqual(true)
    });


    /**
     * @tc.name   testNativeAopReplaceKit003
     * @tc.number SUB_NATIVE_ASPECT_006
     * @tc.desc   testNativeAopReplace sdk use NAPI_DECLARE_FUNCTION_WITH_DATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeAopReplaceKit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      NativeAopInit.testReplaceKitUseDeclareNapiFunctionWithData()
      NativeAopInit.testUseRelationalStore();
      expect(NativeAopInit.getRdbStoreArgs).assertEqual('args native: config:{"name":"RdbTest.db","securityLevel":3}}')
    });
  });
}