/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, Level } from '../../../../hypium/index';
import {
  TextMenuItemId,
  TextDirection,
  MaxLinesMode,
  Color,
  SelectedDragPreviewStyle,
  AccessibilitySpanOptions,
  LineSpacingOptions,
  MaxLinesOptions
} from '@ohos.arkui.component';

export default function TextCommonTest() {
  describe('TextCommonTest', () => {

    // ============================================================
    // TextMenuItemId - singleton reference tests
    // ============================================================

    /**
     * @tc.number TextCommonTest_001
     * @tc.name textMenuItemIdSameReference
     * @tc.desc Test TextMenuItemId.autoFill returns the same singleton reference each time
     */
    it('textMenuItemIdSameReference', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: textMenuItemIdSameReference START');
      let a = TextMenuItemId.autoFill;
      let b = TextMenuItemId.autoFill;
      expect(a === b).assertTrue();
      done();
    });

    /**
     * @tc.number TextCommonTest_002
     * @tc.name textMenuItemIdDistinct
     * @tc.desc Test TextMenuItemId.autoFill and passwordVault are different instances
     */
    it('textMenuItemIdDistinct', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: textMenuItemIdDistinct START');
      let a = TextMenuItemId.autoFill;
      let b = TextMenuItemId.passwordVault;
      expect(a !== b).assertTrue();
      done();
    });

    // ============================================================
    // AccessibilitySpanOptions properties
    // ============================================================

    /**
     * @tc.number TextCommonTest_003
     * @tc.name accessibilitySpanOptionsText
     * @tc.desc Test AccessibilitySpanOptions.accessibilityText property
     */
    it('accessibilitySpanOptionsText', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: accessibilitySpanOptionsText START');
      let opts: AccessibilitySpanOptions = { accessibilityText: 'test text' };
      expect(opts.accessibilityText).assertEqual('test text');
      done();
    });

    /**
     * @tc.number TextCommonTest_004
     * @tc.name accessibilitySpanOptionsDescription
     * @tc.desc Test AccessibilitySpanOptions.accessibilityDescription property
     */
    it('accessibilitySpanOptionsDescription', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: accessibilitySpanOptionsDescription START');
      let opts: AccessibilitySpanOptions = { accessibilityDescription: 'description text' };
      expect(opts.accessibilityDescription).assertEqual('description text');
      done();
    });

    /**
     * @tc.number TextCommonTest_005
     * @tc.name accessibilitySpanOptionsLevel
     * @tc.desc Test AccessibilitySpanOptions.accessibilityLevel property
     */
    it('accessibilitySpanOptionsLevel', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: accessibilitySpanOptionsLevel START');
      let opts: AccessibilitySpanOptions = { accessibilityLevel: 'yes' };
      expect(opts.accessibilityLevel).assertEqual('yes');
      done();
    });

    /**
     * @tc.number TextCommonTest_006
     * @tc.name accessibilitySpanOptionsAllProps
     * @tc.desc Test all AccessibilitySpanOptions properties together with specific values
     */
    it('accessibilitySpanOptionsAllProps', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: accessibilitySpanOptionsAllProps START');
      let opts: AccessibilitySpanOptions = {
        accessibilityText: 'text',
        accessibilityDescription: 'desc',
        accessibilityLevel: 'yes'
      };
      expect(opts.accessibilityText).assertEqual('text');
      expect(opts.accessibilityDescription).assertEqual('desc');
      expect(opts.accessibilityLevel).assertEqual('yes');
      done();
    });

    // ============================================================
    // SelectedDragPreviewStyle.color
    // ============================================================

    /**
     * @tc.number TextCommonTest_008
     * @tc.name selectedDragPreviewStyleColor
     * @tc.desc Test SelectedDragPreviewStyle.color stores and returns the set value
     */
    it('selectedDragPreviewStyleColor', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: selectedDragPreviewStyleColor START');
      let style: SelectedDragPreviewStyle = { color: Color.Blue };
      expect(style.color).assertEqual(Color.Blue);
      done();
    });

    // ============================================================
    // TextDirection enum values (from textCommon.d.ets)
    // ============================================================

    /**
     * @tc.number TextCommonTest_010
     * @tc.name textDirectionLTR
     * @tc.desc Test TextDirection.LTR = 0
     */
    it('textDirectionLTR', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: textDirectionLTR START');
      expect(TextDirection.LTR).assertEqual(0);
      done();
    });

    /**
     * @tc.number TextCommonTest_011
     * @tc.name textDirectionRTL
     * @tc.desc Test TextDirection.RTL = 1
     */
    it('textDirectionRTL', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: textDirectionRTL START');
      expect(TextDirection.RTL).assertEqual(1);
      done();
    });

    /**
     * @tc.number TextCommonTest_012
     * @tc.name textDirectionDEFAULT
     * @tc.desc Test TextDirection.DEFAULT = 2
     */
    it('textDirectionDEFAULT', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: textDirectionDEFAULT START');
      expect(TextDirection.DEFAULT).assertEqual(2);
      done();
    });

    /**
     * @tc.number TextCommonTest_013
     * @tc.name textDirectionAUTO
     * @tc.desc Test TextDirection.AUTO = 3
     */
    it('textDirectionAUTO', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: textDirectionAUTO START');
      expect(TextDirection.AUTO).assertEqual(3);
      done();
    });

    // ============================================================
    // MaxLinesMode enum values (from textCommon.d.ets)
    // ============================================================

    /**
     * @tc.number TextCommonTest_014
     * @tc.name maxLinesModeClip
     * @tc.desc Test MaxLinesMode.CLIP = 0
     */
    it('maxLinesModeClip', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: maxLinesModeClip START');
      expect(MaxLinesMode.CLIP).assertEqual(0);
      done();
    });

    /**
     * @tc.number TextCommonTest_015
     * @tc.name maxLinesModeScroll
     * @tc.desc Test MaxLinesMode.SCROLL = 1
     */
    it('maxLinesModeScroll', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: maxLinesModeScroll START');
      expect(MaxLinesMode.SCROLL).assertEqual(1);
      done();
    });

    /**
     * @tc.number TextCommonTest_016
     * @tc.name lineSpacingOptionsOnlyBetweenLinesTrue
     * @tc.desc Test LineSpacingOptions.onlyBetweenLines = true
     */
    it('lineSpacingOptionsOnlyBetweenLinesTrue', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: lineSpacingOptionsOnlyBetweenLinesTrue START');
      let opts: LineSpacingOptions = { onlyBetweenLines: true };
      expect(opts.onlyBetweenLines).assertEqual(true);
      done();
    });

    /**
     * @tc.number TextCommonTest_017
     * @tc.name lineSpacingOptionsOnlyBetweenLinesFalse
     * @tc.desc Test LineSpacingOptions.onlyBetweenLines = false
     */
    it('lineSpacingOptionsOnlyBetweenLinesFalse', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: lineSpacingOptionsOnlyBetweenLinesFalse START');
      let opts: LineSpacingOptions = { onlyBetweenLines: false };
      expect(opts.onlyBetweenLines).assertEqual(false);
      done();
    });

    /**
     * @tc.number TextCommonTest_018
     * @tc.name maxLinesOptionsOverflowModeClip
     * @tc.desc Test MaxLinesOptions.overflowMode with MaxLinesMode.CLIP
     */
    it('maxLinesOptionsOverflowModeClip', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: maxLinesOptionsOverflowModeClip START');
      let opts: MaxLinesOptions = { overflowMode: MaxLinesMode.CLIP };
      expect(opts.overflowMode).assertEqual(0);
      done();
    });

    /**
     * @tc.number TextCommonTest_019
     * @tc.name maxLinesOptionsOverflowModeScroll
     * @tc.desc Test MaxLinesOptions.overflowMode with MaxLinesMode.SCROLL
     */
    it('maxLinesOptionsOverflowModeScroll', Level.LEVEL1, (done: () => void): void => {
      console.info('TextCommonTest execute: maxLinesOptionsOverflowModeScroll START');
      let opts: MaxLinesOptions = { overflowMode: MaxLinesMode.SCROLL };
      expect(opts.overflowMode).assertEqual(1);
      done();
    });
  });
}
