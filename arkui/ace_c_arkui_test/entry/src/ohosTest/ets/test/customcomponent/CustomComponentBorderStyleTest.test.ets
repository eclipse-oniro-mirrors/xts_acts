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

export default function customComponentBorderStyleTest() {
  customComponentBorderStyleTest
  describe('CustomComponentBorderStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0100
     * @tc.name       : testCustomComponentBorderStyle001
     * @tc.desc       : testing borderStyle for customComponent with ARKUI_BORDER_STYLE_SOLID value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0200
     * @tc.name       : testCustomComponentBorderStyle002
     * @tc.desc       : testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DASHED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0300
     * @tc.name       : testCustomComponentBorderStyle003
     * @tc.desc       : testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DOTTED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0400
     * @tc.name       : testCustomComponentBorderStyle004
     * @tc.desc       : testing borderStyle for customComponent with ARKUI_BORDER_STYLE_SOLID value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0500
     * @tc.name       : testCustomComponentBorderStyle005
     * @tc.desc       : testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DASHED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0600
     * @tc.name       : testCustomComponentBorderStyle006
     * @tc.desc       : testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DOTTED value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle006()).assertEqual(0)
      done()
    })
  })
}
