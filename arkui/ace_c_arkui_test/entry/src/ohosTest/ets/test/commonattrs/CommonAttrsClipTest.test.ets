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

export default function commonAttrsClipTest() {

  describe('CommonAttrsClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0100
     * @tc.name       : testCommonAttrsClip001
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsClip001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0200
     * @tc.name       : testCommonAttrsClip002
     * @tc.desc       : testing clip for imageSpan with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsClip002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0300
     * @tc.name       : testCommonAttrsClip003
     * @tc.desc       : testing clip for imageSpan with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsClip003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0400
     * @tc.name       : testCommonAttrsClip004
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsClip004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0500
     * @tc.name       : testCommonAttrsClip005
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsClip005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0600
     * @tc.name       : testCommonAttrsClip006
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsClip006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CLIP_0700
     * @tc.name       : testCommonAttrsClip007
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsClip007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsClip007()).assertEqual(0)
      done()
    })
  })
}
