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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'


export default function textCustomSpanTest() {
  describe('textCustomSpanTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0100
     * @tc.name       : textCustomSpanTest001
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest001', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0200
     * @tc.name       : textCustomSpanTest002
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest002', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0300
     * @tc.name       : textCustomSpanTest003
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest003', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0400
     * @tc.name       : textCustomSpanTest004
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest004', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0500
     * @tc.name       : textCustomSpanTest005
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest005', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0600
     * @tc.name       : textCustomSpanTest006
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest006', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0700
     * @tc.name       : textCustomSpanTest007
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest007', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0800
     * @tc.name       : textCustomSpanTest008
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest008', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CUSTOM_SPAN_0900
     * @tc.name       : textCustomSpanTest009
     * @tc.desc       : testing customSpan for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textCustomSpanTest009', 0, async (done: Function) => {
      expect(nativeFunc.textCustomSpanTest009()).assertEqual(0)
      done()
    })
  })
}
