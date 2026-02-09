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

export default function listClipTest() {

  describe('ListClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListClip001
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0100
     * @tc.desc   testing clip for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListClip002
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0200
     * @tc.desc   testing clip for list with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListClip003
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0300
     * @tc.desc   testing clip for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListClip004
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0400
     * @tc.desc   testing clip for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListClip005
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0500
     * @tc.desc   testing clip for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListClip006
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0600
     * @tc.desc   testing clip for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListClip007
     * @tc.number SUB_ARKUI_CAPI_LIST_CLIP_0700
     * @tc.desc   testing clip for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListClip007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListClip007()).assertEqual(0)
      done()
    })
  })
}
