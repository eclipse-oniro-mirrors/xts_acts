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

export default function commonAttrsOutlineColorTest() {

  describe('CommonAttrsOutlineColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_OUTLINECOLOR_0100
     * @tc.name       : testCommonAttrsOutlineColor001
     * @tc.desc       : testing outline color for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineColor001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_OUTLINECOLOR_0200
     * @tc.name       : testCommonAttrsOutlineColor002
     * @tc.desc       : testing outline color for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineColor002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_OUTLINECOLOR_0300
     * @tc.name       : testCommonAttrsOutlineColor003
     * @tc.desc       : testing outline color for commonattrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineColor003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_OUTLINECOLOR_0400
     * @tc.name       : testCommonAttrsOutlineColor004
     * @tc.desc       : testing resetAttribute outline color for commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineColor004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineColor004()).assertEqual(0)
      done()
    })
  })
}