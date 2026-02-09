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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function listShadowTest() {

  describe('ListShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListShadow001
     * @tc.number SUB_ARKUI_CAPI_LIST_SHADOW_0100
     * @tc.desc   testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListShadow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListShadow001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListShadow002
     * @tc.number SUB_ARKUI_CAPI_LIST_SHADOW_0200
     * @tc.desc   testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListShadow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListShadow002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListShadow003
     * @tc.number SUB_ARKUI_CAPI_LIST_SHADOW_0300
     * @tc.desc   testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListShadow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListShadow003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListShadow004
     * @tc.number SUB_ARKUI_CAPI_LIST_SHADOW_0400
     * @tc.desc   testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListShadow004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListShadow004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListShadow005
     * @tc.number SUB_ARKUI_CAPI_LIST_SHADOW_0500
     * @tc.desc   testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListShadow005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListShadow005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListShadow006
     * @tc.number SUB_ARKUI_CAPI_LIST_SHADOW_0600
     * @tc.desc   testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListShadow006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListShadow006()).assertEqual(0)
      done()
    })
  })
}
