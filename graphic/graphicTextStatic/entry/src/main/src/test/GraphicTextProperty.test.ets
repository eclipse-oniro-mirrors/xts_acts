/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import text from "@ohos.graphics.text"
import image from '@ohos.multimedia.image';
import type drawing from '@ohos.graphics.drawing';
import type common2D from '@ohos.graphics.common2D';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function GraphicTextProperty() {
  describe("GraphicTextProperty", (): void => {
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
    })
    /**
     * @tc.name   testPlaceholderSpanPropertyStatic
     * @tc.number testPlaceholderSpanPropertyStatic
     * @tc.desc   To test the enum value of PlaceholderSpan.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPlaceholderSpanPropertyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testPlaceholderSpanPropertyStatic"
        console.info(msg + 'begin');
        try {
          let placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: text.TextBaseline.IDEOGRAPHIC,
            baselineOffset: 100
          };
          expect('100').assertEqual(placeholderSpan.width + '');
          expect('100').assertEqual(placeholderSpan.height + '');
          expect('0').assertEqual(text.PlaceholderAlignment.OFFSET_AT_BASELINE + '');
          expect('1').assertEqual(text.TextBaseline.IDEOGRAPHIC + '');
          expect('100').assertEqual(placeholderSpan.baselineOffset + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testPlaceholderSpanPropertyStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTextBoxStatic
     * @tc.number testTextBoxStatic
     * @tc.desc   To test the enum value of TextBox.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextBoxStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testTextBoxStatic"
        console.info(msg + 'begin');
        try {
          let textBox: text.TextBox = {
            rect: {
              left: 200,
              right: 500,
              top: 300,
              bottom: 900
            },
            direction: text.TextDirection.LTR
          };
          expect('200').assertEqual(textBox.rect.left + '');
          expect('500').assertEqual(textBox.rect.right + '');
          expect('300').assertEqual(textBox.rect.top + '');
          expect('900').assertEqual(textBox.rect.bottom + '');
          expect('1').assertEqual(text.TextDirection.LTR + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testTextBoxStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPositionWithAffinityStatic
     * @tc.number testPositionWithAffinityStatic
     * @tc.desc   To test the enum value of PositionWithAffinity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPositionWithAffinityStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "testPositionWithAffinityStatic"
        console.info(msg + 'begin');
        try {
          let positionWithAffinity: text.PositionWithAffinity = {
            position: 20,
            affinity: text.Affinity.DOWNSTREAM
          };
          expect('20').assertEqual(positionWithAffinity.position + '');
          expect('1').assertEqual(text.Affinity.DOWNSTREAM + '');
          done();
        } catch (err) {
          console.info(msg + 'test enum value of testPositionWithAffinityStatic error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}