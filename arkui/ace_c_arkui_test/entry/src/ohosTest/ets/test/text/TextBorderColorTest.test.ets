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

export default function textBorderColorTest() {

  describe('TextBorderColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERCOLOR_0100
     * @tc.name       : testTextBorderColor001
     * @tc.desc       : testing bordercolor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderColor001', 0, async (done: Function) => {
      expect(nativeFunc.testTextBorderColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERCOLOR_0200
     * @tc.name       : testTextBorderColor002
     * @tc.desc       : testing bordercolor for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderColor002', 0, async (done: Function) => {
      expect(nativeFunc.testTextBorderColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERCOLOR_0300
     * @tc.name       : testTextBorderColor003
     * @tc.desc       : testing bordercolor for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderColor003', 0, async (done: Function) => {
      expect(nativeFunc.testTextBorderColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERCOLOR_0400
     * @tc.name       : testTextBorderColor004
     * @tc.desc       : testing bordercolor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderColor004', 0, async (done: Function) => {
      expect(nativeFunc.testTextBorderColor004()).assertEqual(0)
      done()
    })


  })
}
