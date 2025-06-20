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

export default function listItemScaleTest() {

  describe('ListItemScaleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SCALE_0100
     * @tc.name       : testListItemScale001
     * @tc.desc       : testing scale for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemScale001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemScale001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SCALE_0200
     * @tc.name       : testListItemScale002
     * @tc.desc       : testing scale for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemScale002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemScale002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SCALE_0300
     * @tc.name       : testListItemScale003
     * @tc.desc       : testing scale for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemScale003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemScale003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SCALE_0400
     * @tc.name       : testListItemScale004
     * @tc.desc       : testing scale for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemScale004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemScale004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SCALE_0500
     * @tc.name       : testListItemScale005
     * @tc.desc       : testing scale for listItem with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemScale005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemScale005()).assertEqual(0)
      done()
    })
  })
}
