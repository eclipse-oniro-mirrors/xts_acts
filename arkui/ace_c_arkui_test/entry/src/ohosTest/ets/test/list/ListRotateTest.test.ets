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

export default function listRotateTest() {

  describe('ListRotateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ROTATE_0100
     * @tc.name       : testListRotate001
     * @tc.desc       : testing rotate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListRotate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListRotate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ROTATE_0200
     * @tc.name       : testListRotate002
     * @tc.desc       : testing rotate for list with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListRotate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListRotate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ROTATE_0300
     * @tc.name       : testListRotate003
     * @tc.desc       : testing rotate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListRotate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListRotate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ROTATE_0400
     * @tc.name       : testListRotate004
     * @tc.desc       : testing rotate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListRotate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListRotate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ROTATE_0500
     * @tc.name       : testListRotate005
     * @tc.desc       : testing rotate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListRotate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListRotate005()).assertEqual(0)
      done()
    })
  })
}
