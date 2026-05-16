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

export default function scrollBarWidthTest() {

  describe('ScrollBarWidthTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollBarWidth001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BARWIDTH_0100
     * @tc.desc   testing BarWidth for Scroll with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBarWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBarWidth001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBarWidth002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BARWIDTH_0200
     * @tc.desc   testing BarWidth for Scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBarWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBarWidth002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBarWidth003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BARWIDTH_0300
     * @tc.desc   testing BarWidth for Scroll with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBarWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBarWidth003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBarWidth004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BARWIDTH_0400
     * @tc.desc   testing BarWidth for Scroll with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBarWidth004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBarWidth004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBarWidth005
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BARWIDTH_0500
     * @tc.desc   testing BarWidth for Scroll with NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBarWidth005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBarWidth005()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollBarWidth006
     * @tc.number SUB_ARKUI_CAPI_SCROLL_BARWIDTH_0600
     * @tc.desc   testing BarWidth for Scroll with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBarWidth006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollBarWidth006()).assertEqual(0)
      done();
    });

  })
}
