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

export default function textOverlayTest() {

  describe('TextOverlayTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextOverlay001
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0100
     * @tc.desc   testing overlay for text with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay002
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0200
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay003
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0300
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay004
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0400
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay005
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0500
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay006
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0600
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay007
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0700
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay008
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0800
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay009
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_0900
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay010
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_1000
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay011
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_1100
     * @tc.desc   testing overlay for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay012
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_1200
     * @tc.desc   testing overlay for text with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextOverlay013
     * @tc.number SUB_ARKUI_CAPI_TEXT_OVERLAY_1300
     * @tc.desc   testing overlay for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextOverlay013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextOverlay013()).assertEqual(0)
      done()
    })
  })
}
