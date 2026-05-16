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

export default function spanFontWeightTest() {

  describe('SpanFontWeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSpanFontWeight001
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0100
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight002
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0200
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight003
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0300
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight004
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0400
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight005
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0500
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight006
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0600
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight007
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0700
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight008
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0800
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight009
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_0900
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight010
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1000
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight011
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1100
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight012
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1200
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight013
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1300
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight014
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1400
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight015
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1500
     * @tc.desc   testing fontWeight for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanFontWeight016
     * @tc.number SUB_ARKUI_CAPI_SPAN_FONTWEIGHT_1600
     * @tc.desc   testing fontWeight for span with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanFontWeight016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontWeight016()).assertEqual(0)
      done()
    })

  })
}
