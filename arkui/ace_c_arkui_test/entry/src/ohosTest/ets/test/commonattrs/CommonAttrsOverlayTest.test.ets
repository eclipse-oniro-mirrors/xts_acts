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

export default function commonAttrsOverlayTest() {

  describe('CommonAttrsOverlayTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0100
     * @tc.name       : testCommonAttrsOverlay001
     * @tc.desc       : testing overlay for column with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0200
     * @tc.name       : testCommonAttrsOverlay002
     * @tc.desc       : testing overlay for column with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0300
     * @tc.name       : testCommonAttrsOverlay003
     * @tc.desc       : testing overlay for column with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0400
     * @tc.name       : testCommonAttrsOverlay004
     * @tc.desc       : testing overlay for column with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0500
     * @tc.name       : testCommonAttrsOverlay005
     * @tc.desc       : testing overlay for column with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0600
     * @tc.name       : testCommonAttrsOverlay006
     * @tc.desc       : testing overlay for column with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_OVERLAY_0700
     * @tc.name       : testCommonAttrsOverlay007
     * @tc.desc       : testing resetAttribute overlay for column
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsOverlay007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsOverlay007()).assertEqual(0)
      done()
    })
  })
}

