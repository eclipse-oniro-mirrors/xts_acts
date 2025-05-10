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

export default function buttonFontSizeTest() {

  describe('ButtonFontSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FONTSIZE_0100
     * @tc.name       : testButtonFontSize001
     * @tc.desc       : testing fontSize for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testButtonFontSize001', 0, async (done: Function) => {
      expect(nativeFunc.testButtonFontSize001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FONTSIZE_0200
     * @tc.name       : testButtonFontSize002
     * @tc.desc       : testing fontSize for button with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testButtonFontSize002', 0, async (done: Function) => {
      expect(nativeFunc.testButtonFontSize002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FONTSIZE_0300
     * @tc.name       : testButtonFontSize003
     * @tc.desc       : testing fontSize for button with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testButtonFontSize003', 0, async (done: Function) => {
      expect(nativeFunc.testButtonFontSize003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_BUTTON_FONTSIZE_0400
     * @tc.name       : testButtonFontSize004
     * @tc.desc       : testing fontSize for button with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level2
     */
    it('testButtonFontSize004', 0, async (done: Function) => {
      expect(nativeFunc.testButtonFontSize004()).assertEqual(0)
      done();
    })
  })
}
