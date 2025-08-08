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

export default function toggleSelectedColorTest() {

  describe('ToggleSelectedColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SELECTEDCOLOR_0100
     * @tc.name       : testToggleSelectedColor001
     * @tc.desc       : testing selectedColor for toggle with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleSelectedColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSelectedColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SELECTEDCOLOR_0200
     * @tc.name       : testToggleSelectedColor002
     * @tc.desc       : testing selectedColor for toggle with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleSelectedColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSelectedColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SELECTEDCOLOR_0300
     * @tc.name       : testToggleSelectedColor003
     * @tc.desc       : testing selectedColor for toggle with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleSelectedColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSelectedColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SELECTEDCOLOR_0400
     * @tc.name       : testToggleSelectedColor004
     * @tc.desc       : testing selectedColor for toggle with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleSelectedColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSelectedColor004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SELECTEDCOLOR_0500
     * @tc.name       : testToggleSelectedColor005
     * @tc.desc       : testing selectedColor for toggle with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleSelectedColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSelectedColor005()).assertEqual(0)
      done()
    })
  })
}
