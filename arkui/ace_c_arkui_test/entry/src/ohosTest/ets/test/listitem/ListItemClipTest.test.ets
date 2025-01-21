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

export default function listItemClipTest() {

  describe('ListItemClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0100
     * @tc.name       : testListItemClip001
     * @tc.desc       : testing clip for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemClip001', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0200
     * @tc.name       : testListItemClip002
     * @tc.desc       : testing clip for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemClip002', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0300
     * @tc.name       : testListItemClip003
     * @tc.desc       : testing clip for listItem with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListItemClip003', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0400
     * @tc.name       : testListItemClip004
     * @tc.desc       : testing clip for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemClip004', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0500
     * @tc.name       : testListItemClip005
     * @tc.desc       : testing clip for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemClip005', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0600
     * @tc.name       : testListItemClip006
     * @tc.desc       : testing clip for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemClip006', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_CLIP_0700
     * @tc.name       : testListItemClip007
     * @tc.desc       : testing clip for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemClip007', 0, async (done: Function) => {
      expect(nativeFunc.testListItemClip007()).assertEqual(0)
      done()
    })
  })
}
