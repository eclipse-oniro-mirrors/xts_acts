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

export default function customComponentBorderStyleTest() {
  customComponentBorderStyleTest
  describe('CustomComponentBorderStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentBorderStyle001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0100
     * @tc.desc   testing borderStyle for customComponent with ARKUI_BORDER_STYLE_SOLID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBorderStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBorderStyle002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0200
     * @tc.desc   testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DASHED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBorderStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBorderStyle003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0300
     * @tc.desc   testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DOTTED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBorderStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBorderStyle004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0400
     * @tc.desc   testing borderStyle for customComponent with ARKUI_BORDER_STYLE_SOLID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBorderStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBorderStyle005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0500
     * @tc.desc   testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DASHED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBorderStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBorderStyle006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERSTYLE_0600
     * @tc.desc   testing borderStyle for customComponent with ARKUI_BORDER_STYLE_DOTTED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBorderStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderStyle006()).assertEqual(0)
      done()
    })
  })
}
