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

export default function scrollOpacityTest() {

  describe('ScrollOpacityTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollOpacity001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OPACITY_0100
     * @tc.desc   testing opacity for scroll with min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOpacity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOpacity001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOpacity002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OPACITY_0200
     * @tc.desc   testing opacity for scroll with middle value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOpacity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOpacity002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOpacity003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OPACITY_0300
     * @tc.desc   testing opacity for scroll with max value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOpacity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOpacity003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOpacity004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OPACITY_0400
     * @tc.desc   testing opacity for scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOpacity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOpacity004()).assertEqual(0)
      done();
    });
  })
}
