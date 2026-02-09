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

export default function scrollScrollBarTest() {

  describe('ScrollScrollBarTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollScrollBar001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLBAR_0100
     * @tc.desc   testing scroll bar for scroll with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollBar001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollBar001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollBar002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLBAR_0200
     * @tc.desc   testing scroll bar for scroll with off value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollBar002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollBar002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollBar003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLBAR_0300
     * @tc.desc   testing scroll bar for scroll with enum of on value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollBar003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollBar003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollScrollBar004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLBAR_0400
     * @tc.desc   testing scroll bar for scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollBar004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollScrollBar004()).assertEqual(0)
      done();
    });
  })
}
