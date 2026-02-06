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

export default function commonAttrsWidthTest() {

  describe('CommonAttrsWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_WIDTH_0100
     * @tc.name       : testCommonAttrsWidth001
     * @tc.desc       : testing width for commonAttrs with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsWidth001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_WIDTH_0200
     * @tc.name       : testCommonAttrsWidth002
     * @tc.desc       : testing width for commonAttrs with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsWidth002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_WIDTH_0300
     * @tc.name       : testCommonAttrsWidth003
     * @tc.desc       : testing width for commonAttrs with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level2
     */
    it('testCommonAttrsWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsWidth003()).assertEqual(0)
      done()
    })
  })
}
