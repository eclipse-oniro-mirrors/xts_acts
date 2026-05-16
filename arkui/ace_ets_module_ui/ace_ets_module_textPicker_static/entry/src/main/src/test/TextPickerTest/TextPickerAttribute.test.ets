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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import {
  Color,
  BlurStyle,
  DialogAlignment,
  HoverModeAreaType,
  PickerBackgroundStyle,
  TextPickerTextStyle,
  TextPickerDialogOptionsExt,
  ShadowOptions,
  ShadowStyle,
  BackgroundEffectOptions,
  BorderRadiuses,
  LocalizedBorderRadiuses,
  Rectangle,
  Offset
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

const SLEEP_TIME = 1000;

export default function TextPickerAttributeTest() {
  describe('TextPickerAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextPickerAttributeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textPicker.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextPickerAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/TextPickerAttributeIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('TextPickerAttributeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'TextPickerAttributeIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('TextPickerAttributeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(200);
    });

    // ============================================================
    // PickerBackgroundStyle.color
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_001
     * @tc.name pickerBackgroundStyleColor
     * @tc.desc Test PickerBackgroundStyle.color stores the assigned Color value
     */
    it('pickerBackgroundStyleColor', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleColor START');
      let style: PickerBackgroundStyle = { color: Color.Blue };
      expect(style.color).assertEqual(Color.Blue);
      done();
    });

    // ============================================================
    // PickerBackgroundStyle.borderRadius
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_002
     * @tc.name pickerBackgroundStyleBorderRadiusLengthMetrics
     * @tc.desc Test PickerBackgroundStyle.borderRadius with LengthMetrics - value readable
     */
    it('pickerBackgroundStyleBorderRadiusLengthMetrics', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleBorderRadiusLengthMetrics START');
      let style: PickerBackgroundStyle = { borderRadius: LengthMetrics.vp(8) };
      let br = style.borderRadius as LengthMetrics;
      expect(br.value).assertEqual(8);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_003
     * @tc.name pickerBackgroundStyleBorderRadiusBorderRadiuses
     * @tc.desc Test PickerBackgroundStyle.borderRadius with BorderRadiuses interface
     */
    it('pickerBackgroundStyleBorderRadiusBorderRadiuses', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleBorderRadiusBorderRadiuses START');
      let br: BorderRadiuses = { topLeft: '8vp', topRight: '8vp', bottomLeft: '4vp', bottomRight: '4vp' };
      let style: PickerBackgroundStyle = { borderRadius: br };
      let actualBr = style.borderRadius as BorderRadiuses;
      expect(actualBr.topLeft).assertEqual('8vp');
      expect(actualBr.bottomLeft).assertEqual('4vp');
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_004
     * @tc.name pickerBackgroundStyleBorderRadiusLocalized
     * @tc.desc Test PickerBackgroundStyle.borderRadius with LocalizedBorderRadiuses
     */
    it('pickerBackgroundStyleBorderRadiusLocalized', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleBorderRadiusLocalized START');
      let lbr: LocalizedBorderRadiuses = { topStart: LengthMetrics.vp(8), topEnd: LengthMetrics.vp(6) };
      let style: PickerBackgroundStyle = { borderRadius: lbr };
      let actualBr = style.borderRadius as LocalizedBorderRadiuses;
      let ts = actualBr.topStart as LengthMetrics;
      expect(ts.value).assertEqual(8);
      done();
    });

    // ============================================================
    // TextPickerAttribute.selectedBackgroundStyle (UI tests)
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_005
     * @tc.name textPickerSelectedBgStyleBlue
     * @tc.desc Test TextPickerAttribute.selectedBackgroundStyle with color - renders via inspector
     */
    it('textPickerSelectedBgStyleBlue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerAttributeTest execute: textPickerSelectedBgStyleBlue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textPickerSelectedBgStyleBlue'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextPickerAttributeTest execute: textPickerSelectedBgStyleBlue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextPickerAttributeTest_006
     * @tc.name textPickerSelectedBgStyleUndefined
     * @tc.desc Test TextPickerAttribute.selectedBackgroundStyle with undefined - renders via inspector
     */
    it('textPickerSelectedBgStyleUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerAttributeTest execute: textPickerSelectedBgStyleUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textPickerSelectedBgStyleUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextPickerAttributeTest execute: textPickerSelectedBgStyleUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextPickerDialogOptionsExt properties
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_007
     * @tc.name textPickerDialogDefaultPickerItemHeight
     * @tc.desc Test TextPickerDialogOptionsExt.defaultPickerItemHeight stores the assigned value
     */
    it('textPickerDialogDefaultPickerItemHeight', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDefaultPickerItemHeight START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], defaultPickerItemHeight: 44 };
      expect(opts.defaultPickerItemHeight).assertEqual(44);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_008
     * @tc.name textPickerDialogCanLoop
     * @tc.desc Test TextPickerDialogOptionsExt.canLoop property stores true
     */
    it('textPickerDialogCanLoop', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogCanLoop START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], canLoop: true };
      expect(opts.canLoop).assertEqual(true);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_009
     * @tc.name textPickerDialogDisappearTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.disappearTextStyle.color stores Color.Gray
     */
    it('textPickerDialogDisappearTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDisappearTextStyle START');
      let style: TextPickerTextStyle = { color: Color.Gray };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], disappearTextStyle: style };
      expect((opts.disappearTextStyle as TextPickerTextStyle).color).assertEqual(Color.Gray);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_010
     * @tc.name textPickerDialogTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.textStyle.color stores Color.Black
     */
    it('textPickerDialogTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogTextStyle START');
      let style: TextPickerTextStyle = { color: Color.Black };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], textStyle: style };
      expect((opts.textStyle as TextPickerTextStyle).color).assertEqual(Color.Black);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_011
     * @tc.name textPickerDialogSelectedTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.selectedTextStyle.color stores Color.Blue
     */
    it('textPickerDialogSelectedTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogSelectedTextStyle START');
      let style: TextPickerTextStyle = { color: Color.Blue };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], selectedTextStyle: style };
      expect((opts.selectedTextStyle as TextPickerTextStyle).color).assertEqual(Color.Blue);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_012
     * @tc.name textPickerDialogDisableTextStyleAnimation
     * @tc.desc Test TextPickerDialogOptionsExt.disableTextStyleAnimation stores false
     */
    it('textPickerDialogDisableTextStyleAnimation', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDisableTextStyleAnimation START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], disableTextStyleAnimation: false };
      expect(opts.disableTextStyleAnimation).assertEqual(false);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_013
     * @tc.name textPickerDialogDefaultTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.defaultTextStyle.color stores Color.White
     */
    it('textPickerDialogDefaultTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDefaultTextStyle START');
      let style: TextPickerTextStyle = { color: Color.White };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], defaultTextStyle: style };
      expect((opts.defaultTextStyle as TextPickerTextStyle).color).assertEqual(Color.White);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_014
     * @tc.name textPickerDialogMaskRect
     * @tc.desc Test TextPickerDialogOptionsExt.maskRect.width stores 300
     */
    it('textPickerDialogMaskRect', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogMaskRect START');
      let rect: Rectangle = { x: 0, y: 0, width: 300, height: 200 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], maskRect: rect };
      expect((opts.maskRect as Rectangle).width).assertEqual(300);
      expect((opts.maskRect as Rectangle).height).assertEqual(200);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_015
     * @tc.name textPickerDialogAlignment
     * @tc.desc Test TextPickerDialogOptionsExt.alignment stores DialogAlignment.Center
     */
    it('textPickerDialogAlignment', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogAlignment START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], alignment: DialogAlignment.Center };
      expect(opts.alignment).assertEqual(DialogAlignment.Center);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_016
     * @tc.name textPickerDialogOffset
     * @tc.desc Test TextPickerDialogOptionsExt.offset.dx stores 10
     */
    it('textPickerDialogOffset', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogOffset START');
      let offset: Offset = { dx: 10, dy: 20 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], offset: offset };
      expect((opts.offset as Offset).dx).assertEqual(10);
      expect((opts.offset as Offset).dy).assertEqual(20);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_017
     * @tc.name textPickerDialogBackgroundColor
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundColor stores Color.White
     */
    it('textPickerDialogBackgroundColor', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundColor START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundColor: Color.White };
      expect(opts.backgroundColor).assertEqual(Color.White);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_018
     * @tc.name textPickerDialogBackgroundBlurStyle
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundBlurStyle stores BlurStyle.Regular
     */
    it('textPickerDialogBackgroundBlurStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundBlurStyle START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundBlurStyle: BlurStyle.Regular };
      expect(opts.backgroundBlurStyle).assertEqual(BlurStyle.Regular);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_019
     * @tc.name textPickerDialogBackgroundEffect
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundEffect.radius stores 10
     */
    it('textPickerDialogBackgroundEffect', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundEffect START');
      let effect: BackgroundEffectOptions = { radius: 10, saturation: 1, brightness: 1 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundEffect: effect };
      expect((opts.backgroundEffect as BackgroundEffectOptions).radius).assertEqual(10);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_020
     * @tc.name textPickerDialogShadowOptions
     * @tc.desc Test TextPickerDialogOptionsExt.shadow with ShadowOptions - offsetX stores 5
     */
    it('textPickerDialogShadowOptions', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogShadowOptions START');
      let shadow: ShadowOptions = { radius: 20, offsetX: 5, offsetY: 5 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], shadow: shadow };
      expect((opts.shadow as ShadowOptions).offsetX).assertEqual(5);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_021
     * @tc.name textPickerDialogEnableHoverMode
     * @tc.desc Test TextPickerDialogOptionsExt.enableHoverMode stores true
     */
    it('textPickerDialogEnableHoverMode', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogEnableHoverMode START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], enableHoverMode: true };
      expect(opts.enableHoverMode).assertEqual(true);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_022
     * @tc.name textPickerDialogHoverModeAreaTop
     * @tc.desc Test TextPickerDialogOptionsExt.hoverModeArea stores HoverModeAreaType.TOP_SCREEN
     */
    it('textPickerDialogHoverModeAreaTop', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogHoverModeAreaTop START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], hoverModeArea: HoverModeAreaType.TOP_SCREEN };
      expect(opts.hoverModeArea).assertEqual(HoverModeAreaType.TOP_SCREEN);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_023
     * @tc.name textPickerDialogHoverModeAreaBottom
     * @tc.desc Test TextPickerDialogOptionsExt.hoverModeArea with HoverModeAreaType.BOTTOM_SCREEN
     */
    it('textPickerDialogHoverModeAreaBottom', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogHoverModeAreaBottom START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], hoverModeArea: HoverModeAreaType.BOTTOM_SCREEN };
      expect(opts.hoverModeArea).assertEqual(HoverModeAreaType.BOTTOM_SCREEN);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_024
     * @tc.name textPickerDialogEnableHapticFeedback
     * @tc.desc Test TextPickerDialogOptionsExt.enableHapticFeedback stores false
     */
    it('textPickerDialogEnableHapticFeedback', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogEnableHapticFeedback START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], enableHapticFeedback: false };
      expect(opts.enableHapticFeedback).assertEqual(false);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_025
     * @tc.name textPickerDialogSelectedBackgroundStyle
     * @tc.desc Test TextPickerDialogOptionsExt.selectedBackgroundStyle.color stores Color.Blue
     */
    it('textPickerDialogSelectedBackgroundStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogSelectedBackgroundStyle START');
      let bgStyle: PickerBackgroundStyle = { color: Color.Blue, borderRadius: LengthMetrics.vp(4) };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], selectedBackgroundStyle: bgStyle };
      expect((opts.selectedBackgroundStyle as PickerBackgroundStyle).color).assertEqual(Color.Blue);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_026
     * @tc.name textPickerDialogShadowStyle
     * @tc.desc Test TextPickerDialogOptionsExt.shadow with ShadowStyle enum stores the enum value
     */
    it('textPickerDialogShadowStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogShadowStyle START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], shadow: ShadowStyle.OUTER_DEFAULT_MD };
      expect(opts.shadow).assertEqual(ShadowStyle.OUTER_DEFAULT_MD);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_027
     * @tc.name textPickerDialogDialogAlignmentTopStart
     * @tc.desc Test DialogAlignment enum values coverage - TopStart
     */
    it('textPickerDialogDialogAlignmentTopStart', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDialogAlignmentTopStart START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], alignment: DialogAlignment.TopStart };
      expect(opts.alignment).assertEqual(DialogAlignment.TopStart);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_028
     * @tc.name textPickerDialogDialogAlignmentBottom
     * @tc.desc Test DialogAlignment.Bottom enum value coverage
     */
    it('textPickerDialogDialogAlignmentBottom', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDialogAlignmentBottom START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], alignment: DialogAlignment.Bottom };
      expect(opts.alignment).assertEqual(DialogAlignment.Bottom);
      done();
    });
  });
}
