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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function listShadowTest() {

  describe('ListShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SHADOW_0100
     * @tc.name       : testListShadow001
     * @tc.desc       : testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListShadow001', 0, async (done: Function) => {
      expect(nativeFunc.testListShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SHADOW_0200
     * @tc.name       : testListShadow002
     * @tc.desc       : testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListShadow002', 0, async (done: Function) => {
      expect(nativeFunc.testListShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SHADOW_0300
     * @tc.name       : testListShadow003
     * @tc.desc       : testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListShadow003', 0, async (done: Function) => {
      expect(nativeFunc.testListShadow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SHADOW_0400
     * @tc.name       : testListShadow004
     * @tc.desc       : testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListShadow004', 0, async (done: Function) => {
      expect(nativeFunc.testListShadow004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SHADOW_0500
     * @tc.name       : testListShadow005
     * @tc.desc       : testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListShadow005', 0, async (done: Function) => {
      expect(nativeFunc.testListShadow005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SHADOW_0600
     * @tc.name       : testListShadow006
     * @tc.desc       : testing shadow for list with ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListShadow006', 0, async (done: Function) => {
      expect(nativeFunc.testListShadow006()).assertEqual(0)
      done()
    })
  })
}
