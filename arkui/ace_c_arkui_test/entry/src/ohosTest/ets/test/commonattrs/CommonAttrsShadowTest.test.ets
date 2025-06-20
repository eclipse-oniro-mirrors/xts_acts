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

export default function commonAttrsShadowTest() {

  describe('CommonAttrsShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SHADOW_0100
     * @tc.name       : testCommonAttrsShadow001
     * @tc.desc       : testing shadow for flex with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsShadow001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SHADOW_0200
     * @tc.name       : testCommonAttrsShadow002
     * @tc.desc       : testing shadow for flex with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsShadow002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SHADOW_0300
     * @tc.name       : testCommonAttrsShadow003
     * @tc.desc       : testing shadow for flex with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsShadow003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsShadow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SHADOW_0400
     * @tc.name       : testCommonAttrsShadow004
     * @tc.desc       : testing shadow for flex with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsShadow004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsShadow004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SHADOW_0500
     * @tc.name       : testCommonAttrsShadow005
     * @tc.desc       : testing shadow for flex with ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsShadow005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsShadow005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_SHADOW_0600
     * @tc.name       : testCommonAttrsShadow006
     * @tc.desc       : testing shadow for flex with ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsShadow006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsShadow006()).assertEqual(0)
      done()
    })
  })
}
