'use static';
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';

export default function common9Jsunit() {
  describe('common_static_part2Test', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("common_static_Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common_9',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get common_static_Jsunit state pages: " + JSON.stringify(pages));
        if (!("common_9" == pages.name)) {
          console.info("get common_static_Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push common_static_Jsunit page error: " + err);
      }
    });

    beforeEach(async () => {
     await UtilsTest.msSleep(100);
      console.info("common_static_Jsunit before each called");
    })

    
    
    /**
     * @tc.number   common_static_focusable
     * @tc.name     common_static_focusable
     * @tc.desc     common_static_focusable
     * @tc.level    Level.LEVEL0
     */
it('common_static_focusable', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_focusable] START');
      let strJson = inspector.getInspectorByKey('buttonModifier');
      console.info("[common_static_focusable] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('focusable')).assertEqual(false);
      console.info('[common_static_focusable] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_tabIndex
     * @tc.name     common_static_tabIndex
     * @tc.desc     common_static_tabIndex
     * @tc.level    Level.LEVEL0
     */
it('common_static_tabIndex', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_tabIndex] START');
      let strJson = inspector.getInspectorByKey('buttonModifier');

      console.info("[common_static_tabIndex] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('tabIndex')).assertEqual(3);
      console.info('[common_static_tabIndex] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_defaultFocus
     * @tc.name     common_static_defaultFocus
     * @tc.desc     common_static_defaultFocus
     * @tc.level    Level.LEVEL0
     */
it('common_static_defaultFocus', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_defaultFocus] START');
      let strJson = inspector.getInspectorByKey('buttonModifier');

      console.info("[common_static_defaultFocus] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('defaultFocus')).assertEqual(true);
      console.info('[common_static_defaultFocus] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_groupDefaultFocus
     * @tc.name     common_static_groupDefaultFocus
     * @tc.desc     common_static_groupDefaultFocus
     * @tc.level    Level.LEVEL0
     */
it('common_static_groupDefaultFocus', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_groupDefaultFocus] START');
      let strJson = inspector.getInspectorByKey('buttonModifier');

      console.info("[common_static_groupDefaultFocus] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('groupDefaultFocus')).assertEqual(false);
      console.info('[common_static_groupDefaultFocus] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_focusOnTouch
     * @tc.name     common_static_focusOnTouch
     * @tc.desc     common_static_focusOnTouch
     * @tc.level    Level.LEVEL0
     */
it('common_static_focusOnTouch', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_focusOnTouch] START');
      let strJson = inspector.getInspectorByKey('buttonModifier');

      console.info("[common_static_focusOnTouch] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('focusOnTouch')).assertEqual(true);
      console.info('[common_static_focusOnTouch] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_brightness
     * @tc.name     common_static_brightness
     * @tc.desc     common_static_brightness
     * @tc.level    Level.LEVEL0
     */
it('common_static_brightness', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_brightness] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_brightness] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('brightness')).assertEqual(1);
      console.info('[common_static_brightness] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_contrast
     * @tc.name     common_static_contrast
     * @tc.desc     common_static_contrast
     * @tc.level    Level.LEVEL0
     */
it('common_static_contrast', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_contrast] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_contrast] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('contrast')).assertEqual(1);
      console.info('[common_static_contrast] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_grayscale
     * @tc.name     common_static_grayscale
     * @tc.desc     common_static_grayscale
     * @tc.level    Level.LEVEL0
     */
it('common_static_grayscale', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_grayscale] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_grayscale] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('grayscale')).assertEqual(1);
      console.info('[common_static_grayscale] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_colorBlend
     * @tc.name     common_static_colorBlend
     * @tc.desc     common_static_colorBlend
     * @tc.level    Level.LEVEL0
     */
it('common_static_colorBlend', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_colorBlend] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_colorBlend] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colorBlend')).assertEqual('#FFFFA500');
      console.info('[common_static_colorBlend] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_saturate
     * @tc.name     common_static_saturate
     * @tc.desc     common_static_saturate
     * @tc.level    Level.LEVEL0
     */
it('common_static_saturate', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_saturate] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_saturate] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('saturate')).assertEqual(2);
      console.info('[common_static_saturate] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_foregroundColor
     * @tc.name     common_static_foregroundColor
     * @tc.desc     common_static_foregroundColor
     * @tc.level    Level.LEVEL0
     */
it('common_static_foregroundColor', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_foregroundColor] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_foregroundColor] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('foregroundColor')).assertEqual('#FF0000FF');
      console.info('[common_static_foregroundColor] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_borderImage
     * @tc.name     common_static_borderImage
     * @tc.desc     common_static_borderImage
     * @tc.level    Level.LEVEL0
     */
it('common_static_borderImage', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_borderImage] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_borderImage] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'))
        .assertEqual('{\"source\":\"\",\"slice\":\"0.00px\",\"width\":\"0.00px\",\"outset\":\"0.00px\",\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}');
      console.info('[common_static_borderImage] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_borderWidth
     * @tc.name     common_static_borderWidth
     * @tc.desc     common_static_borderWidth
     * @tc.level    Level.LEVEL0
     */
it('common_static_borderWidth', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_borderWidth] START');
      let strJson = inspector.getInspectorByKey('textModifier2');

      console.info("[common_static_borderWidth] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderWidth').getString('left')).assertEqual('3.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderWidth').getString('top')).assertEqual('3.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderWidth').getString('bottom')).assertEqual('3.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderWidth').getString('right')).assertEqual('3.00vp');
      console.info('[common_static_borderWidth] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_borderColor
     * @tc.name     common_static_borderColor
     * @tc.desc     common_static_borderColor
     * @tc.level    Level.LEVEL0
     */
it('common_static_borderColor', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_borderColor] START');
      let strJson = inspector.getInspectorByKey('textModifier2');

      console.info("[common_static_borderColor] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderColor').getString('left')).assertEqual('#FFFF0000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderColor').getString('right')).assertEqual('#FFFF0000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderColor').getString('top')).assertEqual('#FFFF0000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderColor').getString('bottom')).assertEqual('#FFFF0000');
      console.info('[common_static_borderColor] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_borderStyle
     * @tc.name     common_static_borderStyle
     * @tc.desc     common_static_borderStyle
     * @tc.level    Level.LEVEL0
     */
it('common_static_borderStyle', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_borderStyle] START');
      let strJson = inspector.getInspectorByKey('textModifier2');

      console.info("[common_static_borderStyle] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderStyle')).assertEqual('BorderStyle.Dotted');
      console.info('[common_static_borderStyle] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_borderRadius
     * @tc.name     common_static_borderRadius
     * @tc.desc     common_static_borderRadius
     * @tc.level    Level.LEVEL0
     */
it('common_static_borderRadius', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_borderRadius] START');
      let strJson = inspector.getInspectorByKey('textModifier2');

      console.info("[common_static_borderRadius] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius').getString('topLeft')).assertEqual('30.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius').getString('topRight')).assertEqual('30.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius').getString('bottomLeft')).assertEqual('30.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('borderRadius').getString('bottomRight')).assertEqual('30.00vp');
      console.info('[common_static_borderRadius] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_border
     * @tc.name     common_static_border
     * @tc.desc     common_static_border
     * @tc.level    Level.LEVEL0
     */
it('common_static_border', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_border] START');
      let strJson = inspector.getInspectorByKey('textModifier3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[common_static_border] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let border_obj =  JSON.parseJsonElement(obj.getElement('$attrs').getString('border'));
      console.info("[common_static_border] border_obj is : " + obj.getElement('$attrs').getString('border'));

      expect(border_obj.getElement('style').getString('left')).assertEqual("BorderStyle.Dashed");
      expect(border_obj.getElement('style').getString('right')).assertEqual("BorderStyle.Dotted");
      expect(border_obj.getElement('style').getString('top')).assertEqual("BorderStyle.Solid");
      expect(border_obj.getElement('style').getString('bottom')).assertEqual("BorderStyle.Dashed");

      expect(border_obj.getElement('width').getString('left')).assertEqual("3.00vp");
      expect(border_obj.getElement('width').getString('right')).assertEqual("6.00vp");
      expect(border_obj.getElement('width').getString('top')).assertEqual("10.00vp");
      expect(border_obj.getElement('width').getString('bottom')).assertEqual("15.00vp");
      expect(border_obj.getElement('width').getString('start')).assertEqual("0.00vp");
      expect(border_obj.getElement('width').getString('end')).assertEqual("0.00vp");

      expect(border_obj.getElement('color').getString('left')).assertEqual('#FF000000');
      expect(border_obj.getElement('color').getString('right')).assertEqual('#FF000000');
      expect(border_obj.getElement('color').getString('top')).assertEqual('#FF0F0F0F');
      expect(border_obj.getElement('color').getString('bottom')).assertEqual('#FFF0F0F0');

      expect(border_obj.getElement('radius').getString('topLeft')).assertEqual("10.00vp");
      expect(border_obj.getElement('radius').getString('topRight')).assertEqual("20.00vp");
      expect(border_obj.getElement('radius').getString('bottomLeft')).assertEqual("40.00vp");
      expect(border_obj.getElement('radius').getString('bottomRight')).assertEqual("80.00vp");

      expect(border_obj.getString('dashGap')).assertEqual("-1.00px");
      expect(border_obj.getString('dashWidth')).assertEqual("-1.00px");

      console.info('[common_static_border] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_backgroundBlurStyle
     * @tc.name     common_static_backgroundBlurStyle
     * @tc.desc     common_static_backgroundBlurStyle
     * @tc.level    Level.LEVEL0
     */
it('common_static_backgroundBlurStyle', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_backgroundBlurStyle] START');
      let strJson = inspector.getInspectorByKey('textModifier3');

      console.info("[common_static_backgroundBlurStyle] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundBlurStyle').getString('value')).assertEqual("BlurStyle.Thin");
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getElement('options')
        .getString('colorMode')).assertEqual("ThemeColorMode.System");
      console.info('[common_static_backgroundBlurStyle] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_monopolizeEvents
     * @tc.name     common_static_monopolizeEvents
     * @tc.desc     common_static_monopolizeEvents
     * @tc.level    Level.LEVEL0
     */
it('common_static_monopolizeEvents', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_monopolizeEvents] START');
      let strJson = inspector.getInspectorByKey('imageModifier');

      console.info("[common_static_monopolizeEvents] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('monopolizeEvents')).assertEqual(false);
      console.info('[common_static_monopolizeEvents] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_backgroundImage
     * @tc.name     common_static_backgroundImage
     * @tc.desc     common_static_backgroundImage
     * @tc.level    Level.LEVEL0
     */
it('common_static_backgroundImage', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_backgroundImage] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_backgroundImage] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundImage')).assertEqual("resource:///16777255.png, ImageRepeat.X");
      console.info('[common_static_backgroundImage] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_backgroundImageSize
     * @tc.name     common_static_backgroundImageSize
     * @tc.desc     common_static_backgroundImageSize
     * @tc.level    Level.LEVEL0
     */
it('common_static_backgroundImageSize', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_backgroundImageSize] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_backgroundImageSize] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundImageSize'))
        .assertEqual('{\"width\":\"150.00px\",\"height\":\"150.00px\"}');
      console.info('[common_static_backgroundImageSize] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_backgroundImagePosition
     * @tc.name     common_static_backgroundImagePosition
     * @tc.desc     common_static_backgroundImagePosition
     * @tc.level    Level.LEVEL0
     */
it('common_static_backgroundImagePosition', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_backgroundImagePosition] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_backgroundImagePosition] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundImagePosition')).assertEqual("{\"x\":144,\"y\":144}");
      console.info('[common_static_backgroundImagePosition] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_size
     * @tc.name     common_static_size
     * @tc.desc     common_static_size
     * @tc.level    Level.LEVEL0
     */
it('common_static_size', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_size] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_size] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size').getString('width')).assertEqual("144.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size').getString('height')).assertEqual("144.00vp");
      console.info('[common_static_size] END');
      done();
    });


    
    
    /**
     * @tc.number   common_static_pixelStretchEffect
     * @tc.name     common_static_pixelStretchEffect
     * @tc.desc     common_static_pixelStretchEffect
     * @tc.level    Level.LEVEL0
     */
it('common_static_pixelStretchEffect', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_pixelStretchEffect] START');
      let strJson = inspector.getInspectorByKey('textModifier');

      console.info("[common_static_pixelStretchEffect] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pixelStretchEffect').getString('left')).assertEqual("5.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pixelStretchEffect').getString('right')).assertEqual("5.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pixelStretchEffect').getString('top')).assertEqual("5.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pixelStretchEffect').getString('bottom')).assertEqual("5.00vp");
      console.info('[common_static_pixelStretchEffect] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_backgroundBrightness
     * @tc.name     common_static_backgroundBrightness
     * @tc.desc     common_static_backgroundBrightness
     * @tc.level    Level.LEVEL0
     */
it('common_static_backgroundBrightness', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_backgroundBrightness] START');
      let strJson = inspector.getInspectorByKey('textModifier2');

      console.info("[common_static_backgroundBrightness] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('backgroundBrightness')).assertEqual(undefined);
      console.info('[common_static_backgroundBrightness] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_dragPreviewOptions
     * @tc.name     common_static_dragPreviewOptions
     * @tc.desc     common_static_dragPreviewOptions
     * @tc.level    Level.LEVEL0
     */
it('common_static_dragPreviewOptions', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_dragPreviewOptions] START');
      let strJson = inspector.getInspectorByKey('textModifier2');

      console.info("[common_static_dragPreviewOptions] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('dragPreviewOptions')).assertEqual(undefined);
      console.info('[common_static_dragPreviewOptions] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_layoutWeight
     * @tc.name     common_static_layoutWeight
     * @tc.desc     common_static_layoutWeight
     * @tc.level    Level.LEVEL0
     */
it('common_static_layoutWeight', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_layoutWeight] START');
      let strJson = inspector.getInspectorByKey('textModifier3');

      console.info("[common_static_layoutWeight] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('layoutWeight')).assertEqual(2);
      console.info('[common_static_layoutWeight] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_constraintSize
     * @tc.name     common_static_constraintSize
     * @tc.desc     common_static_constraintSize
     * @tc.level    Level.LEVEL0
     */
it('common_static_constraintSize', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_constraintSize] START');
      let strJson = inspector.getInspectorByKey('textModifier3');

      console.info("[common_static_constraintSize] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('constraintSize'))
        .assertEqual("{\"minWidth\":\"10.00vp\",\"minHeight\":\"15.00vp\",\"maxWidth\":\"20.00vp\",\"maxHeight\":\"30.00vp\"}");
      console.info('[common_static_constraintSize] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_useEffect
     * @tc.name     common_static_useEffect
     * @tc.desc     common_static_useEffect
     * @tc.level    Level.LEVEL0
     */
it('common_static_useEffect', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_useEffect] START');
      let strJson = inspector.getInspectorByKey('textModifier3');

      console.info("[common_static_useEffect] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('useEffect')).assertEqual('true');
      console.info('[common_static_useEffect] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_sphericalEffect
     * @tc.name     common_static_sphericalEffect
     * @tc.desc     common_static_sphericalEffect
     * @tc.level    Level.LEVEL0
     */
it('common_static_sphericalEffect', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_sphericalEffect] START');
      let strJson = inspector.getInspectorByKey('textModifier3');

      console.info("[common_static_sphericalEffect] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('sphericalEffect')).assertEqual(1);
      console.info('[common_static_sphericalEffect] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_hitTestBehavior
     * @tc.name     common_static_hitTestBehavior
     * @tc.desc     common_static_hitTestBehavior
     * @tc.level    Level.LEVEL0
     */
it('common_static_hitTestBehavior', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_hitTestBehavior] START');
      let strJson = inspector.getInspectorByKey('buttonModifier2');

      console.info("[common_static_hitTestBehavior] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('hitTestBehavior')).assertEqual('HitTestMode.Default');
      console.info('[common_static_hitTestBehavior] END');
      done();
    });


    
    
    /**
     * @tc.number   common_static_lightUpEffect
     * @tc.name     common_static_lightUpEffect
     * @tc.desc     common_static_lightUpEffect
     * @tc.level    Level.LEVEL0
     */
it('common_static_lightUpEffect', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_lightUpEffect] START');
      let strJson = inspector.getInspectorByKey('textModifier3');

      console.info("[common_static_lightUpEffect] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('lightUpEffect')).assertEqual(1);
      console.info('[common_static_lightUpEffect] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_width
     * @tc.name     common_static_width
     * @tc.desc     common_static_width
     * @tc.level    Level.LEVEL0
     */
it('common_static_width', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_width] START');
      let strJson = inspector.getInspectorByKey('imageModifier');

      console.info("[common_static_width] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("144.00vp");
      console.info('[common_static_width] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_height
     * @tc.name     common_static_height
     * @tc.desc     common_static_height
     * @tc.level    Level.LEVEL0
     */
it('common_static_height', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_height] START');
      let strJson = inspector.getInspectorByKey('imageModifier');

      console.info("[common_static_height] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("144.00vp");
      console.info('[common_static_height] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_expandSafeArea
     * @tc.name     common_static_expandSafeArea
     * @tc.desc     common_static_expandSafeArea
     * @tc.level    Level.LEVEL0
     */
it('common_static_expandSafeArea', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_expandSafeArea] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_expandSafeArea] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('expandSafeArea')).assertEqual(undefined);
      console.info('[common_static_expandSafeArea] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_responseRegion
     * @tc.name     common_static_responseRegion
     * @tc.desc     common_static_responseRegion
     * @tc.level    Level.LEVEL0
     */
it('common_static_responseRegion', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_responseRegion] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_responseRegion] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('responseRegion')[0]))
        .assertEqual(  '"{\\"x\\":\\"0.00vp\\",\\"y\\":\\"0.00vp\\",\\"width\\":\\"50.00%\\",\\"height\\":\\"100.00%\\"}"');
      console.info('[common_static_responseRegion] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_visibility
     * @tc.name     common_static_visibility
     * @tc.desc     common_static_visibility
     * @tc.level    Level.LEVEL0
     */
it('common_static_visibility', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_visibility] START');
      let strJson = inspector.getInspectorByKey('buttonModifier2');

      console.info("[common_static_visibility] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      console.info('[common_static_visibility] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_opacity
     * @tc.name     common_static_opacity
     * @tc.desc     common_static_opacity
     * @tc.level    Level.LEVEL0
     */
it('common_static_opacity', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_opacity] START');
      let strJson = inspector.getInspectorByKey('buttonModifier2');

      console.info("[common_static_opacity] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('[common_static_opacity] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_margin
     * @tc.name     common_static_margin
     * @tc.desc     common_static_margin
     * @tc.level    Level.LEVEL0
     */
it('common_static_margin', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_margin] START');
      let strJson = inspector.getInspectorByKey('buttonModifier2');

      console.info("[common_static_margin] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('margin')).assertEqual("20.00vp");
      console.info('[common_static_margin] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_padding
     * @tc.name     common_static_padding
     * @tc.desc     common_static_padding
     * @tc.level    Level.LEVEL0
     */
it('common_static_padding', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_padding] START');
      let strJson = inspector.getInspectorByKey('buttonModifier2');

      console.info("[common_static_padding] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("1.00vp");
      console.info('[common_static_padding] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_backgroundColor
     * @tc.name     common_static_backgroundColor
     * @tc.desc     common_static_backgroundColor
     * @tc.level    Level.LEVEL0
     */
it('common_static_backgroundColor', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_backgroundColor] START');
      let strJson = inspector.getInspectorByKey('buttonModifier2');

      console.info("[common_static_backgroundColor] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual("#FFFF0000");
      console.info('[common_static_backgroundColor] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_linearGradient
     * @tc.name     common_static_linearGradient
     * @tc.desc     common_static_linearGradient
     * @tc.level    Level.LEVEL0
     */
it('common_static_linearGradient', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_linearGradient] START');
      let strJson = inspector.getInspectorByKey('imageModifier');

      console.info("[common_static_linearGradient] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual("GradientDirection.Left");
      console.info('[common_static_linearGradient] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_linearGradientBlur
     * @tc.name     common_static_linearGradientBlur
     * @tc.desc     common_static_linearGradientBlur
     * @tc.level    Level.LEVEL0
     */
it('common_static_linearGradientBlur', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_linearGradientBlur] START');
      let strJson = inspector.getInspectorByKey('imageModifier');

      console.info("[common_static_linearGradientBlur] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('linearGradientBlur').getString('value')).assertEqual('60.00px');
      console.info('[common_static_linearGradientBlur] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_blendMode
     * @tc.name     common_static_blendMode
     * @tc.desc     common_static_blendMode
     * @tc.level    Level.LEVEL0
     */
it('common_static_blendMode', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_blendMode] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_blendMode] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('blendMode')).assertEqual(16);
      console.info('[common_static_blendMode] END');
      done();
    });
    
    
    /**
     * @tc.number   common_static_accessibilityLevel
     * @tc.name     common_static_accessibilityLevel
     * @tc.desc     common_static_accessibilityLevel
     * @tc.level    Level.LEVEL0
     */
it('common_static_accessibilityLevel', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_accessibilityLevel] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_accessibilityLevel] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('accessibilityLevel')).assertEqual("auto");
      console.info('[common_static_accessibilityLevel] END');
      done();
    });
    
    
    /**
     * @tc.number   common_static_accessibilityDescription
     * @tc.name     common_static_accessibilityDescription
     * @tc.desc     common_static_accessibilityDescription
     * @tc.level    Level.LEVEL0
     */
it('common_static_accessibilityDescription', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_accessibilityDescription] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_accessibilityDescription] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('accessibilityDescription')).assertEqual("");
      console.info('[common_static_accessibilityDescription] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_accessibilityText
     * @tc.name     common_static_accessibilityText
     * @tc.desc     common_static_accessibilityText
     * @tc.level    Level.LEVEL0
     */
it('common_static_accessibilityText', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_accessibilityText] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_accessibilityText] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('accessibilityText')).assertEqual("");
      console.info('[common_static_accessibilityText] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_accessibilityGroup
     * @tc.name     common_static_accessibilityGroup
     * @tc.desc     common_static_accessibilityGroup
     * @tc.level    Level.LEVEL0
     */
it('common_static_accessibilityGroup', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_accessibilityGroup] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_accessibilityGroup] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('accessibilityGroup')).assertEqual(false);
      console.info('[common_static_accessibilityGroup] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_restoreId
     * @tc.name     common_static_restoreId
     * @tc.desc     common_static_restoreId
     * @tc.level    Level.LEVEL0
     */
it('common_static_restoreId', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_restoreId] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_restoreId] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('restoreId')).assertEqual(undefined);
      console.info('[common_static_restoreId] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_allowDrop
     * @tc.name     common_static_allowDrop
     * @tc.desc     common_static_allowDrop
     * @tc.level    Level.LEVEL0
     */
it('common_static_allowDrop', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_allowDrop] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_allowDrop] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('allowDrop')).assertEqual(undefined);
      console.info('[common_static_allowDrop] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_alignRules
     * @tc.name     common_static_alignRules
     * @tc.desc     common_static_alignRules
     * @tc.level    Level.LEVEL0
     */
it('common_static_alignRules', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_alignRules] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_alignRules] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('alignRules')).assertEqual(undefined);
      console.info('[common_static_alignRules] END');
      done();
    });

    
    
    /**
     * @tc.number   common_static_foregroundBlurStyle
     * @tc.name     common_static_foregroundBlurStyle
     * @tc.desc     common_static_foregroundBlurStyle
     * @tc.level    Level.LEVEL0
     */
it('common_static_foregroundBlurStyle', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[common_static_foregroundBlurStyle] START');
      let strJson = inspector.getInspectorByKey('rowModifier');

      console.info("[common_static_foregroundBlurStyle] JSON.parseJsonElement(strJson) is : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('foregroundBlurStyle')).assertEqual(undefined);
      console.info('[common_static_foregroundBlurStyle] END');
      done();
    });
  })
}
