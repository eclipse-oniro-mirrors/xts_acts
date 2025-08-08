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

export default function textSelectedBackgroundColorTest() {

  describe('TextSelectedBackgroundColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SELECTED_BACKGROUND_COLOR_0100
     * @tc.name       : testTextSelectedBackgroundColor001
     * @tc.desc       : testing selectedBackgroundColor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSelectedBackgroundColor001', 0, async (done: Function) => {
      expect(nativeFunc.testTextSelectedBackgroundColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SELECTED_BACKGROUND_COLOR_0200
     * @tc.name       : testTextSelectedBackgroundColor002
     * @tc.desc       : testing selectedBackgroundColor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSelectedBackgroundColor002', 0, async (done: Function) => {
      expect(nativeFunc.testTextSelectedBackgroundColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SELECTED_BACKGROUND_COLOR_0400
     * @tc.name       : testTextSelectedBackgroundColor003
     * @tc.desc       : testing selectedBackgroundColor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSelectedBackgroundColor003', 0, async (done: Function) => {
      expect(nativeFunc.testTextSelectedBackgroundColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SELECTED_BACKGROUND_COLOR_0400
     * @tc.name       : testTextSelectedBackgroundColor004
     * @tc.desc       : testing selectedBackgroundColor for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSelectedBackgroundColor004', 0, async (done: Function) => {
      expect(nativeFunc.testTextSelectedBackgroundColor004()).assertEqual(0)
      done()
    })

  })
}
