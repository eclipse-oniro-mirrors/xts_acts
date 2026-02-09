/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function NodeUtilsMethodTest(){

  describe('NodeUtilsMethodTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   TestMethodReturnValue_001
     * @tc.number SUB_ARKUI_CAPI_TestMethodReturnValue_001
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestMethodReturnValue_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestMethodReturnValue001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestMethodReturnValue_002
     * @tc.number SUB_ARKUI_CAPI_TestMethodReturnValue_002
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestMethodReturnValue_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestMethodReturnValue002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestMethodReturnValue_003
     * @tc.number SUB_ARKUI_CAPI_TestMethodReturnValue_003
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestMethodReturnValue_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestMethodReturnValue003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestMethodReturnValue_004
     * @tc.number SUB_ARKUI_CAPI_TestMethodReturnValue_004
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestMethodReturnValue_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestMethodReturnValue004()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestMethodReturnValue_005
     * @tc.number SUB_ARKUI_CAPI_TestMethodReturnValue_005
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestMethodReturnValue_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestMethodReturnValue005()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestMethodReturnValue_006
     * @tc.number SUB_ARKUI_CAPI_TestMethodReturnValue_006
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestMethodReturnValue_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestMethodReturnValue006()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_001
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_001
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_002
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_002
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_003
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_003
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_004
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_004
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode004()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_005
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_005
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode005()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_006
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_006
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode006()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_007
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_007
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode007()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_008
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_008
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode008()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_009
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_009
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode009()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_010
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_010
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode010()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestNodeErrorCode_011
     * @tc.number SUB_ARKUI_CAPI_TestNodeErrorCode_011
     * @tc.desc   Test nodeUtils method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestNodeErrorCode_011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeErrorCode011()).assertEqual(0)
      done();
    })

  })
}