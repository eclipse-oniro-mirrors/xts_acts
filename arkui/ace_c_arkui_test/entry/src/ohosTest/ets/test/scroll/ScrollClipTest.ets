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

export default function scrollClipTest() {

  describe('ScrollClipTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CLIP_0100
     * @tc.name       : testScrollClip001
     * @tc.desc       : testing clip for scroll with true value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollClip001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CLIP_0200
     * @tc.name       : testScrollClip002
     * @tc.desc       : testing clip for scroll with false value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollClip002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CLIP_0300
     * @tc.name       : testScrollClip003
     * @tc.desc       : testing clip for scroll with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testScrollClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollClip003()).assertEqual(0)
      done();
    });
  })
}
