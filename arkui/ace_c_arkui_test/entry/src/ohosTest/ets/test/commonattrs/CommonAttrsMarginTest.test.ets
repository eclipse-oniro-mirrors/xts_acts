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

export default function commonAttrsMarginTest() {

  describe('CommonAttrsMarginTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MARGIN_0100
     * @tc.name       : testCommonAttrsMargin001
     * @tc.desc       : testing margin for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMargin001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMargin001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MARGIN_0200
     * @tc.name       : testCommonAttrsMargin002
     * @tc.desc       : testing margin for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMargin002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMargin002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MARGIN_0300
     * @tc.name       : testCommonAttrsMargin003
     * @tc.desc       : testing margin for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMargin003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMargin003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_MARGIN_0400
     * @tc.name       : testCommonAttrsMargin004
     * @tc.desc       : testing margin for flex with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMargin004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMargin004()).assertEqual(0)
      done()
    })

  })
}
