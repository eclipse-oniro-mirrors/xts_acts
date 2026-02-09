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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollBorderRadiusTest() {

  describe('ScrollBorderRadiusTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollBorderRadius001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BORDERRADIUS_0100
     * @tc.desc   testing border radius for scroll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBorderRadius001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBorderRadius002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BORDERRADIUS_0200
     * @tc.desc   testing border radius for scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBorderRadius002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBorderRadius003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BORDERRADIUS_0300
     * @tc.desc   testing border radius for scroll with all param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBorderRadius003()).assertEqual(0)
      done();
    });
  })
}
