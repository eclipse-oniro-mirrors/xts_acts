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

export default function listItemSaturateTest() {

  describe('ListItemSaturateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0100
     * @tc.name       : testListItemSaturate001
     * @tc.desc       : testing saturate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSaturate001', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0200
     * @tc.name       : testListItemSaturate002
     * @tc.desc       : testing saturate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSaturate002', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0300
     * @tc.name       : testListItemSaturate003
     * @tc.desc       : testing saturate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSaturate003', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0400
     * @tc.name       : testListItemSaturate004
     * @tc.desc       : testing saturate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSaturate004', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0500
     * @tc.name       : testListItemSaturate005
     * @tc.desc       : testing saturate for listItem with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListItemSaturate005', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0600
     * @tc.name       : testListItemSaturate006
     * @tc.desc       : testing saturate for listItem with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListItemSaturate006', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0700
     * @tc.name       : testListItemSaturate007
     * @tc.desc       : testing saturate for listItem with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemSaturate007', 0, async (done: Function) => {
      expect(nativeFunc.testListItemSaturate007()).assertEqual(0)
      done()
    })
  })
}
