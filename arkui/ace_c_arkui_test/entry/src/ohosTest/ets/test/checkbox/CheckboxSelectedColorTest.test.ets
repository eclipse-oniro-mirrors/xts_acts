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

export default function checkboxSelectedColorTest() {

  describe('CheckboxSelectedColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_SELECTEDCOLOR_0100
    * @tc.name       : testCheckboxSelectedColor001
    * @tc.desc       : testing selectedColor for checkbox with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCheckboxSelectedColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxSelectedColor001()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_SELECTEDCOLOR_0200
    * @tc.name       : testCheckboxSelectedColor002
    * @tc.desc       : testing selectedColor for checkbox with boundary value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCheckboxSelectedColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxSelectedColor002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_SELECTEDCOLOR_0300
    * @tc.name       : testCheckboxSelectedColor003
    * @tc.desc       : testing selectedColor for checkbox with boundary value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCheckboxSelectedColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCheckboxSelectedColor003()).assertEqual(0)
      done()
    })

  })
}
