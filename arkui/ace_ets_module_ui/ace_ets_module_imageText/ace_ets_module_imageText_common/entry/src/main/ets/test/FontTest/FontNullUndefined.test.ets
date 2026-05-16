/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { font } from '@kit.ArkUI';

export default function FontNullUndefinedTest() {
  describe('FontNullUndefinedTest', () => {
    beforeAll(() => {
      console.log('FontNullUndefinedTest', 'beforeAll: start test')
    });

    /**
     * @tc.name   fontRegisterFontNull_0100
     * @tc.number SUB_ARKUI_FONT_REGISTERFONT_NULL_0100
     * @tc.desc   测试 font.registerFont 方法，options 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('fontRegisterFontNull_0100', Level.LEVEL2, async () => {
      console.log('fontRegisterFontNull_0100 START')
      try {
        font.registerFont(null);
        let fontInfo: font.FontInfo = font.getFontByName(null);
        console.log('fontRegisterFontNull_0100 fontInfo.path: ' + fontInfo.path)
        expect(fontInfo.path).assertEqual('');
      } catch (err) {
        expect(err).not().assertNull();
      }
      console.log('fontRegisterFontNull_0100 END')
    });

    /**
     * @tc.name   fontRegisterFontUndefined_0100
     * @tc.number SUB_ARKUI_FONT_REGISTERFONT_UNDEFINED_0100
     * @tc.desc   测试 font.registerFont 方法，options 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('fontRegisterFontUndefined_0100', Level.LEVEL2, async () => {
      console.log('fontRegisterFontUndefined_0100 START')
      try {
        font.registerFont(undefined);
        let fontInfo: font.FontInfo = font.getFontByName(undefined);
        console.log('fontRegisterFontUndefined_0100 fontInfo.path: ' + fontInfo.path)
        expect(fontInfo.path).assertEqual('');
      } catch (err) {
        expect(err).not().assertNull();
      }
      console.log('fontRegisterFontUndefined_0100 END')
    });

    /**
     * @tc.name   fontGetFontByNameEmptyString_0100
     * @tc.number SUB_ARKUI_FONT_GETFONTBYNAME_EMPTYSTRING_0100
     * @tc.desc   测试 font.getFontByName 方法，fontName 参数为空字符串 ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('fontGetFontByNameEmptyString_0100', Level.LEVEL2, async () => {
      console.log('fontGetFontByNameEmptyString_0100 START')
      try {
        let fontInfo: font.FontInfo = font.getFontByName('');
        console.log('fontGetFontByNameEmptyString_0100 fontInfo: ' + fontInfo)
        expect(fontInfo).assertUndefined();
      } catch (err) {
        console.error('fontGetFontByNameEmptyString_0100 error: ' + err.toString())
      }
      console.log('fontGetFontByNameEmptyString_0100 END')
    });
  });
}
