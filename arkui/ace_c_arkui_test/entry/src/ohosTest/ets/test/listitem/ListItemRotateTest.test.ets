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

export default function listItemRotateTest() {

  describe('ListItemRotateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_ROTATE_0100
     * @tc.name       : testListItemRotate001
     * @tc.desc       : testing rotate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemRotate001', 0, async (done: Function) => {
      expect(nativeFunc.testListItemRotate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_ROTATE_0200
     * @tc.name       : testListItemRotate002
     * @tc.desc       : testing rotate for listItem with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemRotate002', 0, async (done: Function) => {
      expect(nativeFunc.testListItemRotate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_ROTATE_0300
     * @tc.name       : testListItemRotate003
     * @tc.desc       : testing rotate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemRotate003', 0, async (done: Function) => {
      expect(nativeFunc.testListItemRotate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_ROTATE_0400
     * @tc.name       : testListItemRotate004
     * @tc.desc       : testing rotate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemRotate004', 0, async (done: Function) => {
      expect(nativeFunc.testListItemRotate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_ROTATE_0500
     * @tc.name       : testListItemRotate005
     * @tc.desc       : testing rotate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemRotate005', 0, async (done: Function) => {
      expect(nativeFunc.testListItemRotate005()).assertEqual(0)
      done()
    })
  })
}
