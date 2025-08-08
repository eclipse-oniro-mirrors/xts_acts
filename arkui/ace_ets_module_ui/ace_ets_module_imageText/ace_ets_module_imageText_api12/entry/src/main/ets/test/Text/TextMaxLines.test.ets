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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextMaxLines() {
  describe('TextMaxLines', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMaxLines beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMaxLines',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMaxLines state pages:" + JSON.stringify(pages));
        if (!("TextMaxLines" == pages.name)) {
          console.info("get TextMaxLines pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMaxLines page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMaxLines page error:" + err);
      }
      console.info("TextMaxLines beforeEach end");
      done();
    });

    /**
     * @tc.number: TextMaxLines_0010
     * @tc.name  : TextMaxLines_0010
     * @tc.desc  : set Text: TextMaxLines
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextMaxLines_0010', 0, async (done: Function) => {
      console.info('TextMaxLines_0010 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(TextMaxLines_1).$attrs.maxLines).assertEqual('4');
      console.info('TextMaxLines_0010 END');
      done();
    });
	
	/**
     * @tc.number: TextLineHeight_0020
     * @tc.name  : TextLineHeight_0020
     * @tc.desc  : set Text: TextLineHeight
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextLineHeight_0020', 0, async (done: Function) => {
      console.info('TextLineHeight_0020 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(TextMaxLines_1).$attrs.lineHeight).assertEqual('10.00fp');
      console.info('TextLineHeight_0020 END');
      done();
    });
	
	/**
     * @tc.number: TextBaselineOffset_0030
     * @tc.name  : TextBaselineOffset_0030
     * @tc.desc  : set Text: TextBaselineOffset
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextBaselineOffset_0030', 0, async (done: Function) => {
      console.info('TextBaselineOffset_0030 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(TextMaxLines_1).$attrs.baselineOffset).assertEqual('10');
      console.info('TextBaselineOffset_0030 END');
      done();
    });
	
	/**
     * @tc.number: TextFontStyle_0040
     * @tc.name  : TextFontStyle_0040
     * @tc.desc  : set Text: TextFontStyle
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextFontStyle_0040', 0, async (done: Function) => {
      console.info('TextFontStyle_0040 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(TextMaxLines_1).$attrs.fontStyle).assertEqual('FontStyle.Italic');
      console.info('TextFontStyle_0040 END');
      done();
    });

    /**
     * @tc.number: TextLetterSpacing_0050
     * @tc.name  : TextLetterSpacing_0050
     * @tc.desc  : set Text: TextLetterSpacing
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextLetterSpacing_0050', 0, async (done: Function) => {
      console.info('TextLetterSpacing_0050 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(TextMaxLines_1).$attrs.letterSpacing).assertEqual('5.00fp');
      console.info('TextLetterSpacing_0050 END');
      done();
    });

    /**
     * @tc.number: TextTextAlign_0060
     * @tc.name  : TextTextAlign_0060
     * @tc.desc  : set Text: TextTextAlign
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextTextAlign_0060', 0, async (done: Function) => {
      console.info('TextTextAlign_0060 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(TextMaxLines_1).$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('TextTextAlign_0060 END');
      done();
    });

    /**
     * @tc.number: TextConstraintSize_0070
     * @tc.name  : TextConstraintSize_0070
     * @tc.desc  : set Text: TextConstraintSize
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextConstraintSize_0070', 0, async (done: Function) => {
      console.info('TextConstraintSize_0070 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(JSON.parse(TextMaxLines_1).$attrs.constraintSize).minWidth).assertEqual('100.00vp');
      console.info('TextConstraintSize_0070 END');
      done();
    });

    /**
     * @tc.number: TextConstraintSize_0080
     * @tc.name  : TextConstraintSize_0080
     * @tc.desc  : set Text: TextConstraintSize
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextConstraintSize_0080', 0, async (done: Function) => {
      console.info('TextConstraintSize_0080 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(JSON.parse(TextMaxLines_1).$attrs.constraintSize).maxWidth).assertEqual('200.00vp');
      console.info('TextConstraintSize_0080 END');
      done();
    });

    /**
     * @tc.number: TextConstraintSize_0090
     * @tc.name  : TextConstraintSize_0090
     * @tc.desc  : set Text: TextConstraintSize
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextConstraintSize_0090', 0, async (done: Function) => {
      console.info('TextConstraintSize_0090 START');
      let TextMaxLines_1 = getInspectorByKey('textMaxLines1');
      expect(''+JSON.parse(JSON.parse(TextMaxLines_1).$attrs.constraintSize).minHeight).assertEqual('100.00vp');
      console.info('TextConstraintSize_0090 END');
      done();
    });
  })
}