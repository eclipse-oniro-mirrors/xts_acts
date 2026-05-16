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

export default function textVisibilityTest() {

  describe('TextVisibilityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextVisibility001
     * @tc.number SUB_ARKUI_CAPI_TEXT_VISIBILITY_0100
     * @tc.desc   testing visibility for text with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextVisibility001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextVisibility001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextVisibility002
     * @tc.number SUB_ARKUI_CAPI_TEXT_VISIBILITY_0200
     * @tc.desc   testing visibility for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextVisibility002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextVisibility002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextVisibility003
     * @tc.number SUB_ARKUI_CAPI_TEXT_VISIBILITY_0300
     * @tc.desc   testing visibility for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextVisibility003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextVisibility003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextVisibility004
     * @tc.number SUB_ARKUI_CAPI_TEXT_VISIBILITY_0400
     * @tc.desc   testing visibility for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextVisibility004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextVisibility004()).assertEqual(0)
      done()
    })
  })
}
