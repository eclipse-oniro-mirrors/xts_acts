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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaFontFamilyTest() {

  describe('TextAreaFontFamilyTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTAREA_FONTFAMILY_0100
     * @tc.name       : testTextAreaFontFamily001
     * @tc.desc       : testing fontFamily for TextArea with HarmonyOS Sans value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAreaFontFamily001', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontFamily001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTAREA_FONTFAMILY_0200
     * @tc.name       : testTextAreaFontFamily002
     * @tc.desc       : testing fontFamily for TextArea with HarmonyOS Sans STR_AREA value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextAreaFontFamily002', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontFamily002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTAREA_FONTFAMILY_0300
     * @tc.name       : testTextAreaFontFamily003
     * @tc.desc       : testing fontFamily for TextArea with "" value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextAreaFontFamily003', 0, async (done: Function) => {
      expect(nativeFunc.testTextAreaFontFamily003()).assertEqual(0)
      done();
    });
  })
}
