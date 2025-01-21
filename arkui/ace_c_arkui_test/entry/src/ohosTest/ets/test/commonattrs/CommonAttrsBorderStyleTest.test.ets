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

export default function commonAttrsBorderStyleTest() {
  commonAttrsBorderStyleTest
  describe('CommonAttrsBorderStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BORDERSTYLE_0100
     * @tc.name       : testCommonAttrsBorderStyle001
     * @tc.desc       : testing borderStyle for commonAttrs with ARKUI_BORDER_STYLE_SOLID value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBorderStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBorderStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BORDERSTYLE_0200
     * @tc.name       : testCommonAttrsBorderStyle002
     * @tc.desc       : testing borderStyle for commonAttrs with ARKUI_BORDER_STYLE_DASHED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBorderStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBorderStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BORDERSTYLE_0300
     * @tc.name       : testCommonAttrsBorderStyle003
     * @tc.desc       : testing borderStyle for commonAttrs with ARKUI_BORDER_STYLE_DOTTED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBorderStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBorderStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BORDERSTYLE_0400
     * @tc.name       : testCommonAttrsBorderStyle004
     * @tc.desc       : testing borderStyle for commonAttrs with ARKUI_BORDER_STYLE_SOLID value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBorderStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBorderStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BORDERSTYLE_0500
     * @tc.name       : testCommonAttrsBorderStyle005
     * @tc.desc       : testing borderStyle for commonAttrs with ARKUI_BORDER_STYLE_DASHED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBorderStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBorderStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BORDERSTYLE_0600
     * @tc.name       : testCommonAttrsBorderStyle006
     * @tc.desc       : testing borderStyle for commonAttrs with ARKUI_BORDER_STYLE_DOTTED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBorderStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBorderStyle006()).assertEqual(0)
      done()
    })
  })
}
