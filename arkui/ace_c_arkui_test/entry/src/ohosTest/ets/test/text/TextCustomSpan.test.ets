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


export default function textCustomSpanTest() {
  describe('textCustomSpanTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   textCustomSpanTest001
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0100
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest002
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0200
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest003
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0300
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest004
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0400
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest005
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0500
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest006
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0600
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest007
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0700
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest008
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0800
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   textCustomSpanTest009
     * @tc.number SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0900
     * @tc.desc   testing customSpan for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textCustomSpanTest009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest009()).assertEqual(0)
      done()
    })
  })
}
