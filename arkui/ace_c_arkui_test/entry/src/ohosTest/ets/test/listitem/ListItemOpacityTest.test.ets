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

export default function listItemOpacityTest() {

  describe('ListItemOpacityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_OPACITY_0100
     * @tc.name       : testListItemOpacity001
     * @tc.desc       : testing opacity for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemOpacity001', 0, async (done: Function) => {
      expect(nativeFunc.testListItemOpacity001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_OPACITY_0200
     * @tc.name       : testListItemOpacity002
     * @tc.desc       : testing opacity for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemOpacity002', 0, async (done: Function) => {
      expect(nativeFunc.testListItemOpacity002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_OPACITY_0300
     * @tc.name       : testListItemOpacity003
     * @tc.desc       : testing opacity for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemOpacity003', 0, async (done: Function) => {
      expect(nativeFunc.testListItemOpacity003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_OPACITY_0400
     * @tc.name       : testListItemOpacity004
     * @tc.desc       : testing opacity for listItem with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListItemOpacity004', 0, async (done: Function) => {
      expect(nativeFunc.testListItemOpacity004()).assertEqual(0)
      done()
    })
  })
}
