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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollScrollSnapTest() {

  describe('ScrollScrollSnapTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLSNAP_0100
     * @tc.name       : testScrollScrollSnap001
     * @tc.desc       : testing scroll snap for scroll with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollSnap001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollSnap001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLSNAP_0200
     * @tc.name       : testScrollScrollSnap002
     * @tc.desc       : testing scroll snap for scroll with start value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollSnap002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollSnap002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLSNAP_0300
     * @tc.name       : testScrollScrollSnap003
     * @tc.desc       : testing scroll snap for scroll with center value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollSnap003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollSnap003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLSNAP_0400
     * @tc.name       : testScrollScrollSnap004
     * @tc.desc       : testing scroll snap for scroll with end value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollSnap004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollSnap004()).assertEqual(0)
      done();
    });
  })
}
