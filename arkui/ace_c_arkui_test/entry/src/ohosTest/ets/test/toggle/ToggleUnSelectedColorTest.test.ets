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

export default function toggleUnSelectedColorTest() {

  describe('ToggleUnSelectedColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_UNSELECTED_COLOR_0100
     * @tc.name       : testToggleUnSelectedColor001
     * @tc.desc       : testing unSelectedColor for toggle with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleUnSelectedColor001', 0, async (done: Function) => {
      expect(nativeFunc.testToggleUnSelectedColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_UNSELECTED_COLOR_0200
     * @tc.name       : testToggleUnSelectedColor002
     * @tc.desc       : testing unSelectedColor for toggle with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleUnSelectedColor002', 0, async (done: Function) => {
      expect(nativeFunc.testToggleUnSelectedColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_UNSELECTED_COLOR_0300
     * @tc.name       : testToggleUnSelectedColor003
     * @tc.desc       : testing unSelectedColor for toggle with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleUnSelectedColor003', 0, async (done: Function) => {
      expect(nativeFunc.testToggleUnSelectedColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_UNSELECTED_COLOR_0400
     * @tc.name       : testToggleUnSelectedColor004
     * @tc.desc       : testing unSelectedColor for toggle with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleUnSelectedColor004', 0, async (done: Function) => {
      expect(nativeFunc.testToggleUnSelectedColor004()).assertEqual(0)
      done()
    })

  })
}
