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

export default function commonAttrsOutlineWidthTest() {

  describe('CommonAttrsOutlineWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OUTLINEWIDTH_0100
     * @tc.name       : testCommonAttrsOutlineWidth001
     * @tc.desc       : testing outline width for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineWidth001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OUTLINEWIDTH_0200
     * @tc.name       : testCommonAttrsOutlineWidth002
     * @tc.desc       : testing outline width for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineWidth002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OUTLINEWIDTH_0300
     * @tc.name       : testCommonAttrsOutlineWidth003
     * @tc.desc       : testing outline width for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOutlineWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOutlineWidth003()).assertEqual(0)
      done()
    })
  })
}