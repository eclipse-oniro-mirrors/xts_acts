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

export default function scrollPageEnableTest() {

  describe('ScrollPageEnableTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollPageEnable001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_PAGEENABLE_0100
     * @tc.desc   testing pageEnable for scroll with false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollPageEnable001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollPageEnable001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollPageEnable002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_PAGEENABLE_0200
     * @tc.desc   testing pageEnable for scroll with true value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollPageEnable002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollPageEnable002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollPageEnable003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_PAGEENABLE_0300
     * @tc.desc   testing pageEnable for scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollPageEnable003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollPageEnable003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollPageEnable004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_PAGEENABLE_0400
     * @tc.desc   testing pageEnable for scroll with NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollPageEnable004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollPageEnable004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollPageEnable005
     * @tc.number SUB_ARKUI_CAPI_SCROLL_PAGEENABLE_0500
     * @tc.desc   testing pageEnable for scroll with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollPageEnable005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollPageEnable005()).assertEqual(0)
      done();
    });
  })
}
