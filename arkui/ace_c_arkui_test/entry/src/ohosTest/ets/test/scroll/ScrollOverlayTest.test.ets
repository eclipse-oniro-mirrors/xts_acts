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

export default function scrollOverlayTest() {

  describe('ScrollOverlayTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollOverlay001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0100
     * @tc.desc   testing overlay for scroll with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0200
     * @tc.desc   testing overlay for scroll with top value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay002()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0300
     * @tc.desc   testing overlay for scroll with topEnd value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0400
     * @tc.desc   testing overlay for scroll with start value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay005
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0500
     * @tc.desc   testing overlay for scroll with center value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay005()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay006
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0600
     * @tc.desc   testing overlay for scroll with end value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay006()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay007
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0700
     * @tc.desc   testing overlay for scroll with bottomStart value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay007()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay008
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0800
     * @tc.desc   testing overlay for scroll with bottom value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay008()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testScrollOverlay009
     * @tc.number SUB_ARKUI_CAPI_SCROLL_OVERLAY_0900
     * @tc.desc   testing overlay for scroll with bottomEnd value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOverlay009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollOverlay009()).assertEqual(0)
      done();
    });
  })
}
