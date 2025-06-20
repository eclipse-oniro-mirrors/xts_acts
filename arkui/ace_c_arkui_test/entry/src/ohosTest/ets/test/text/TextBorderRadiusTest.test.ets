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

export default function textBorderRadiusTest() {

  describe('TextBorderRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERRADIUS_0100
     * @tc.name       : testTextBorderRadius001
     * @tc.desc       : testing borderradius for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBorderRadius001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERRADIUS_0200
     * @tc.name       : testTextBorderRadius002
     * @tc.desc       : testing borderradius for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBorderRadius002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERRADIUS_0300
     * @tc.name       : testTextBorderRadius003
     * @tc.desc       : testing borderradius for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBorderRadius003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERRADIUS_0400
     * @tc.name       : testTextBorderRadius004
     * @tc.desc       : testing borderradius for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBorderRadius004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBorderRadius004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BORDERRADIUS_0500
     * @tc.name       : testTextBorderRadius005
     * @tc.desc       : testing borderradius for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextBorderRadius005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBorderRadius005()).assertEqual(0)
      done()
    })

  })
}
