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

export default function spanDecorationTest() {

  describe('SpanDecorationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSpanDecoration001
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0100
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration002
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0200
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration003
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0300
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration004
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0400
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration005
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0500
     * @tc.desc   testing decoration for span with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration006
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0600
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration007
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0700
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration008
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0800
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration009
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_0900
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration010
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_1000
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration011
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_1100
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanDecoration012
     * @tc.number SUB_ARKUI_CAPI_SPAN_DECORATION_1200
     * @tc.desc   testing decoration for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanDecoration012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration012()).assertEqual(0)
      done()
    })
  })
}
