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

export default function scrollScrollAbleTest() {

  describe('ScrollScrollAbleTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollScrollable001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLABLE_0100
     * @tc.desc   testing scroll able for scroll with vertical value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollable001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollAble001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollable002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLABLE_0200
     * @tc.desc   testing scroll able for scroll with horizontal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollable002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollAble002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollable003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLABLE_0300
     * @tc.desc   testing scroll able for scroll with none value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollable003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollAble003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollable004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLABLE_0400
     * @tc.desc   testing scroll able for scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollable004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollAble004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollable005
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLABLE_0500
     * @tc.desc   testing scroll able for scroll with ARKUI_SCROLL_DIRECTION_FREE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollable005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollAble005()).assertEqual(0)
      done();
    });
  })
}
